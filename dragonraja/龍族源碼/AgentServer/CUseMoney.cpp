
//#include "stdafx.h"
#include "CUseMoney.h"
//#include <winsock2.h>

const char CAsyncClient::dvHeader	= '\035';
const char CAsyncClient::dvWord	= '\t'	;
const char* CAsyncClient::dvNull	= "\0";

const char* CAsyncClient::SERVER_NAME = "DR";
const char* CAsyncClient::GAME_ID	= "2";
const char* CAsyncClient::USER_TYPE	= "1";

CAsyncClient g_cAsyncPay;
void RecvReponseGUMP( SOCKET socket );
void LeaveLogInText( const char* szMsg );
extern void SendCMD_CONNECT_AGENT_SERVER_CONFORM(const DWORD dwUserID, const char* szUserName, const int nResult);
extern HWND m_hProcWnd;
extern void KickOffUser( char* szUserID );	// 030716 kyo
BOOL DumpException(LPEXCEPTION_POINTERS lpExcep,char* szOutMsg, void *pData=0, int nSize=0 );
// FindUser
struct IsUserHere : binary_function<USERINFOPAY, char*, bool>
{
public:
	bool operator()(const USERINFOPAY& rUserInfo, const char* szName) const 
	{
		return ( strcmp( rUserInfo.szUserId, szName) == 0) ? true:false;
	}
};


#define	WM_SOCKET_EVENT	 WM_USER+100

#define KEEP_ALIVE_TIME	60*1000
LRESULT CALLBACK MessageProc( HWND hwnd, UINT uMessage, WPARAM wParam, LPARAM lParam )
{

	if( WM_CREATE == uMessage )
	{
		SetTimer( hwnd, 1, KEEP_ALIVE_TIME, NULL );
		return 0;
	}
	if( WM_TIMER == uMessage )
	{
		g_cAsyncPay.SendKeepaliveMsg();

		return 0;
	}
	if( WM_USER_ALIVE_PAY == uMessage )
	{ // 030630 kyo
		MyLog( 0, "@-----------------ALive PayThread-----------------@");		
		MyLog( 0, "@-----------------ALive PayThread-----------------@");		
		MyLog( 0, "@-----------------ALive PayThread-----------------@");		
		return 0;
	}
	if( WM_SOCKET_EVENT == uMessage )
	{
		//switch( LOWORD(lParam) )
		if( WSAGETSELECTERROR(lParam) )
		{
			MyLog( 0, "/////////////////////////////////////");
			MyLog( 0, "ERROR ::: Receive Error Msg = %d ",WSAGetLastError());	// 030630 kyo
			MyLog( 0, "/////////////////////////////////////");
			//closesocket( (SOCKET) wParam); // 030701
			return 0;
		}

		switch( WSAGETSELECTEVENT(lParam) )
		{
		case FD_ACCEPT:
			{
				break;
			}

		case FD_READ:
			{
				RecvReponseGUMP( (SOCKET)wParam);
				break;
			}

		case FD_WRITE:
			{

				//int nRet = send( (SOCKET) wParam, "client", 3,0);
				break;
			}

		case FD_CLOSE:
			{
				//cout << "close " << wParam <<endl; //서버가 끝어진것은 확인된다. 
				break;
			}

		case FD_CONNECT:
			{
				//g_bConnect = true;
				//cout << "connect " << endl;
				break;
			}

		default:
			{
				break;
			}
		}
		
	}

	return	1;

}


void RecvReponseGUMP( SOCKET socket )
{//메시지를 메시지 상자에 넣는다. 
 //받은 메시지를 분석한다.
	char szMsg[100];	
	g_cAsyncPay.RecvResponsMessage( socket, szMsg ) ;	
	if( !szMsg) return;

	
	if( 0 >= strlen( szMsg ) )
	{
		return;
	}

	g_cAsyncPay.AnalysysMessage( szMsg );
	//LeaveLogInText( szMsg ); 
	MyLog( 0, "%s", szMsg );
}

void LeaveLogInText( const char* szMsg )
{
	//그날 날짜랑 시간이랑 
	time_t nowTime;	
	//static int log_year = 0, log_mon = 0, log_day = 0;
	time( &nowTime );
	struct tm *now;
	now = localtime(&nowTime);
	int year, mon, day, hour, min, sec;
	year = now->tm_year + 1900;
	mon  = now->tm_mon + 1;
	day  = now->tm_mday;
	hour = now->tm_hour;
	min  = now->tm_min;
	sec  = now->tm_sec;
	
	char szFilename[0xff];
	sprintf( szFilename, "./Paylog/%d_%d_%d.log", year,mon, day );
	FILE *fp;
	if( NULL ==(fp= fopen( szFilename, "a")) ) 
	{
		return;
	}
	
	//char msg[0xff];
	//sprintf( msg, "%d:%d:%d\t%s\n", hour, min, sec, szMsg );	
	//fprintf( fp, msg ); 
	fprintf( fp, "%d:%d:%d\t%s\n", hour, min, sec, szMsg );	

	fclose( fp );
}


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//CAsyncClient

CAsyncClient::CAsyncClient()
{
	strcpy( m_strServerName, "DR" );		//서버이름
	m_nServerGroupNum	= 1;			//서버그룹번호
	strcpy( m_szServerNum, "000.000.000.000");		//서버번호
	m_nZoneNum			= 1;			//존 번호
	InitializeCriticalSection( &m_cs );
}

CAsyncClient::CAsyncClient( const char* strName, const int nGrup, const char* szServerNum, const int nZone)
{
	strcpy( m_strServerName, strName );		//서버이름
	m_nServerGroupNum	= nGrup;			//서버그룹번호
	strcpy( m_szServerNum, szServerNum );	//서버번호
	m_nZoneNum			= nZone;			//존 번호
	InitializeCriticalSection( &m_cs );
}

CAsyncClient::~CAsyncClient()
{
	//LogoutAllUser();
	CloseConnection();
	DeleteCriticalSection( &m_cs );
}

void CAsyncClient::SetAgentInfo( const char* szName, const int nGroup, const char* szServerNum, const int nZone )
{
	strcpy( m_strServerName, szName );		//서버이름
	m_nServerGroupNum	= nGroup;			//서버그룹번호
	strcpy( m_szServerNum, szServerNum );	//서버번호
	m_nZoneNum			= nZone;			//존 번호
}

SOCKET	CAsyncClient::InitSocket( const char* szIP, const int nPort )
{

	WSADATA wsaData = {0,};
	if(::WSAStartup(WINSOCK_VERSION, &wsaData))//스타트업
	{
		const int nError = ::WSAGetLastError();		
		ShowError( nError );
		return -1;
	}

	//get Ip and port Number	
	m_sSocket = ::WSASocket(AF_INET, SOCK_STREAM, IPPROTO_TCP, NULL,//TCP/IP 인터넷 소켓
										SG_UNCONSTRAINED_GROUP, WSA_FLAG_OVERLAPPED);

	if (m_sSocket== INVALID_SOCKET)
	{	
		const int nError = ::WSAGetLastError();		
		ShowError( nError );
		return -1;
	}

	sockaddr_in	addr;
	addr.sin_family		= AF_INET;
	addr.sin_port		= htons( nPort );
	addr.sin_addr.s_addr= inet_addr( szIP );
	
	if(connect( m_sSocket, (LPSOCKADDR)&addr, sizeof(addr)) < 0)
	{
		const int nError = ::WSAGetLastError();		
		ShowError( nError );
		return -1;
	}


	return m_sSocket;
}

const char* INI_PATH ="./AgentServer.ini";
int CAsyncClient::InitConnectPayServer()
{// 과금서버에게 Initialized Message를 보낸다.
//61.251.171.11이구요 포트는 1071입니다.

//ini에서 값을 받아온다.
	char szIP[50];		
	char szServerNum[50];	
	char szHeader[50];
	char szVer[50];
	if( !::GetPrivateProfileString( "PayInfo", "GumServerIp", "" , szIP, 50, INI_PATH ) )
		return -1;
	const  int nPort = ::GetPrivateProfileInt( "PayInfo", "GumServerPort", 0, INI_PATH );
	::GetPrivateProfileString( "PayInfo", "Header", "" , szHeader, 50, INI_PATH );
	::GetPrivateProfileString( "PayInfo", "Version", "" , szVer, 50, INI_PATH );
	const int nGroupNum = ::GetPrivateProfileInt( "PayInfo", "ServerSetNum", 0 , INI_PATH );

	::GetPrivateProfileString( "Server_info", "own_server_ip_for_server", "" , szServerNum, 50, INI_PATH );
	const int nZoneNum = ::GetPrivateProfileInt( "Server_info", "own_server_port_for_server", 0 , INI_PATH );	

	//Set
	m_sSocket = InitSocket( szIP, nPort );
	SetCurrentState( GUM_STATE_INIT );
	SetGumHeader( szHeader, szVer );
	SetAgentInfo( SERVER_NAME, nGroupNum, szServerNum, nZoneNum );
	
	//m_szGumHeader = "GUMP/1.2";
	m_hProcWnd = CreateMsgWindow( (WNDPROC)MessageProc );
	if( NULL == m_hProcWnd )
	{
		return -1;
	}

	int nRet = WSAAsyncSelect( m_sSocket, m_hProcWnd, WM_SOCKET_EVENT, FD_READ| FD_CLOSE );
	if( SOCKET_ERROR == nRet)
	{
		const int nError = ::WSAGetLastError();		
		ShowError( nError );
		return -2;
	}

	return SendInitialMsg2PayServer();

}

int CAsyncClient::SendInitialMsg2PayServer()
{
	char szInitMsg[0xff];
	//sprintf( szInitMsg, "%s\t0\0351\t%s\t%d\t%s\t%d\t\0", m_szGumHeader, m_strServerName, m_nServerGroupNum, m_szServerNum, m_nZoneNum);
	sprintf( szInitMsg, "%s\t0\0351\t%s\t%d\t%d\t%d\t\0", m_szGumHeader, m_strServerName, m_nServerGroupNum, m_nZoneNum, m_nZoneNum);
	int nLen = strlen( szInitMsg );
	
	int nRet = SendPayFormatMessage( szInitMsg );
	if( SOCKET_ERROR == nRet)
	{
		const int nError = ::WSAGetLastError();		
		ShowError( nError );
		return -1;
	}
	return nRet;
}

int CAsyncClient::AnalysysMessage( char* szMsg )
{// 받은 메시지를 분석해서 리턴한다.
// 받은 사이즈보다 넘어가면 안된다. 나중에 확인

	char szNull[2] = {'\t','\0'};
	if( NULL == strstr( szMsg, szNull ) )
	{
		return -1;	//잘못된 문자
	}

	//Analy Header
	int nSeqNum=0;
	char *pMsgBody = AnalysysMsgHeader( szMsg, nSeqNum );
	if( NULL == pMsgBody )
	{//지정된 Seq번호가 아니거나 헤더가 틀리면
		return -1;
	}
	
	//Analy Body	
	int nRestTime=0;
	USERINFOPAY userInfo;
	int nMsgType = AnalysysMsgBody( pMsgBody, userInfo, nRestTime );
	if( !IsRightType( nMsgType ) )
	{
		return -1;
	}	
	
	switch( nMsgType )
	{
	
	case GUM_MSG_INIT_FAIL:
		{
			SetCurrentState( GUM_STATE_INIT );
			//leave Log
			//Exit Program
		}break;
	case GUM_MSG_MESSAGEFORM_WRONG:
		{//잘못된 형식의 메시지
			break;
		}
	case GUM_MSG_RESPONS_INITALIZED:	
		{
			SetCurrentState( GUM_STATE_RUNNING );
			break;
		}	
	case GUM_MSG_LOGIN_SUCCESS:
		{
			RecvUserLogin( userInfo );
			break;
		}
	case GUM_MSG_WRONG_PASS:		
	case GUM_MSG_HAVENO_AUTHORITY:
	case GUM_MSG_END_OF_DATE	:		
	case GUM_MSG_ALREADY_LOGIN	:	
	case GUM_MSG_ALL_SPEND_IP	:	
	case GUM_MSG_DISCONNECT_USER:
	case GUM_MSG_END_OF_DATE_1DAY:	
	case GUM_MSG_END_OF_DATE_1DAY2:	
		{
			RecvUserLoginFail( userInfo, nMsgType );
			break;
		}
	case GUM_MSG_LOGOUT_SUCCESS	:
		{
			RecvUserLogout( userInfo );
			break;
		}
	case GUM_MSG_LOGOUT_FAIL:
		{
			RecvUserLogoutFail( userInfo );
		}
	case GUM_MSG_USER_TIMEOVER	:	
	case GUM_MSG_USER_TIMEOVER_1DAY	:
	case GUM_MSG_USER_TIMEOVER_1DAY2:
		{
			RecvUserAlert( userInfo, nRestTime );
			break;
		}
	case GUM_MSG_USER_DIS_TIMEOVER	:
	case GUM_MSG_USER_DIS_TIMEOV_1D	:
	case GUM_MSG_USER_DIS_TIMEOV_1D2:
	case GUM_MSG_USER_DIS_OUSER_REQ	:
		{
			RecvUserDisconnect( userInfo, nMsgType);
		}
	
	default:
		{
			//Leave Log
			break;
		}
	}
	
	return 0;
}

int CAsyncClient::AnalysysMsgHeader( char* szMsg )
{// analysys Header

	int i=0;
	while( 0x09 != *szMsg )//1.
	{
		if( m_szGumHeader[i++] != *szMsg++ )
		{//잘못된 해더
			return -10; 
		}
		if( NULL == *(szMsg+1) ) 
		{//받은 사이즈를 넘어가는거 
			return -20;
		}
	}
	*szMsg++;
	char *pSeqNum = new char[4];	//pSeqNum은 보기에 필요가 없다.
	char *pCurrentPos = pSeqNum;
	while (0x1D != *szMsg)//2.
	{
		*pSeqNum++ = *szMsg++;
		if( NULL == *(szMsg+1) ) 
		{//받은 사이즈를 넘어가는거 
			return -20;
		}
		//디버그모드일땐 검사를 더 정밀하게
	}
	*pSeqNum = '\0';
	int nSeq = atoi( pCurrentPos);
	delete pCurrentPos;
	//delete [] pCurrentPos;

	return nSeq;
}

char* CAsyncClient::AnalysysMsgHeader( char* szMsg, int& nSeq )
{// analysys Header

	int i=0;
	while( 0x09 != *szMsg )
	{
		if( m_szGumHeader[i++] != *szMsg++ )
		{//잘못된 해더
			return NULL; 
		}
		if( NULL == *(szMsg+1) ) 
		{//받은 사이즈를 넘어가는거 
			return NULL;
		}
	}
	*szMsg++;

	char *pSeqNum = new char[4];	//pSeqNum은 보기에 필요가 없다.
	char *pCurrentPos = pSeqNum;
	while (0x1D != *szMsg)//2.
	{
		*pSeqNum++ = *szMsg++;
		if( NULL == *(szMsg+1) ) 
		{//받은 사이즈를 넘어가는거 
			return NULL;
		}
		//디버그모드일땐 검사를 더 정밀하게
	}
	*pSeqNum = '\0';
	nSeq = atoi( pCurrentPos);
	//delete [] pCurrentPos;
	delete pCurrentPos;

	*szMsg++;
	return szMsg;
}

char* CAsyncClient::AnalysysMsgType( char* szMsgBody, int& nType )
{
	char *pMsgType = new char[4];
	char *pCurrentPos = pMsgType;
	while( 0x09 != *szMsgBody )	//3.
	{
		if( 0x00 == *szMsgBody)
		{
			return NULL;
		}
		*pMsgType++ = *szMsgBody++;
	}

	*pMsgType = '\0';
	nType = atoi( pCurrentPos );
	delete pCurrentPos;
	//delete [] pCurrentPos;
	*szMsgBody++;

	return szMsgBody;
}


int CAsyncClient::AnalysysMsgBody( char* szMsgBody , USERINFOPAY& userInfo, int& nRestTime)
{
	
	char *pMsgType = new char[4];
	char *pCurrentPos = pMsgType;
	while( 0x09 != *szMsgBody )	//3.
	{
		if( 0x00 == *szMsgBody)
		{
			return NULL;
		}
		*pMsgType++ = *szMsgBody++;
	}

	*pMsgType = '\0';
	int nType = atoi( pCurrentPos );
	//delete [] pCurrentPos;
	delete pCurrentPos;
	*szMsgBody++;
	if( 0x00 == *szMsgBody)
	{
		return nType;
	}
	

	static int nIdx = 0;
	nIdx =0;
	char *pToken = new char[0xff];
	char *pCurrentPos2 = pToken;	
	
	while( 4 > nIdx )
	{
		*pToken++ = *szMsgBody++;
		if( 0x00 == *szMsgBody)
		{
			break;
		}

		if( 0x09 == *szMsgBody)
		{
			switch( nIdx )
			{
			case 0:
				{
					*pToken = '\0';
					strcpy( userInfo.szGameId, pCurrentPos2 );
					break;
				}
			case 1:
				{
					*pToken = '\0';
					strcpy( userInfo.szUserId, pCurrentPos2 );		
					break;
				}
			case 2:
				{
					*pToken = '\0';
					strcpy( userInfo.szUserType, pCurrentPos2 );		
					break;
				}
			case 3:
				{
					*pToken = '\0';
					nRestTime = atoi( pCurrentPos2 );
					//strcpy( userInfo.szUserType, pCurrentPos );		
					break;
				}
			default:
				{
					break;
				}
			}
			//strcpy( userInfo.szGumUser[nIdx], szToken );
			pToken = pCurrentPos2;
			nIdx++;
			*szMsgBody++;
		}				
	}

	if( 1<strlen(pCurrentPos2) )
	{
		delete [] pCurrentPos2;
	}
	else
		delete pCurrentPos2;

	//if( 0x00 == *++szMsgBody)
	//{
		//return 0;
	//}
	return nType;
}

HWND CAsyncClient::CreateMsgWindow( WNDPROC messageproc)
{
	WNDCLASS	wndClass;
	ZeroMemory( &wndClass, sizeof(wndClass) );

	HINSTANCE hInst  = (HINSTANCE)GetModuleHandle(NULL);

	wndClass.style			= CS_HREDRAW | CS_VREDRAW;
	wndClass.lpfnWndProc	= messageproc;	
	wndClass.hInstance		= hInst;
	wndClass.lpszClassName	= m_strServerName;

	if(RegisterClass(&wndClass) == 0)
	{
		return NULL;
	}

	HWND hWnd = CreateWindowEx(WS_EX_TOPMOST, m_strServerName, m_strServerName, WS_POPUP|WS_OVERLAPPED, 0, 0, 100, 100, NULL, NULL, hInst, NULL);
	
	return hWnd;

}

int CAsyncClient::AddPayUser( USERINFOPAY& stUser )
{
	LISTUSERIT it = FindUserIterator( stUser.szUserId );
	if( it != NULL )
	{
		return 1;
	}	

	m_vtUser.push_back( stUser );
	return 1;//모두 중복 접속시 있는유저 로그아웃하게
}

void CAsyncClient::DisconnectUser( USERINFOPAY& stUser )
{
	//경우
	//1.정상적인 유저종료
	//2.서버다운(정상)
	//3.서버다운(크래쉬)
	//4.서버다운(컴퓨터에러)
	//5.계정완료 -> 1,2번으로 처리

	//SendMsgToPayServer( int nType , USERINFO& stUser );
}


list<USERINFOPAY>::iterator CAsyncClient::FindUserIterator( const char* szUserName )
{
	LISTUSERIT itFind = find_if(m_vtUser.begin(), m_vtUser.end(), bind2nd( IsUserHere(), szUserName ) );
	if( itFind != m_vtUser.end() )
	{
		return itFind;
	}

	return NULL;
}

//030703 YGI
void CAsyncClient::CheckAliveUser()
{
	for( LISTUSERIT it = m_vtUser.begin(); it != m_vtUser.end(); it++ )
	{
		it->nAliveTime++;
		if( it->nAliveTime >= 10 )
		{
			it->nAliveTime = 0;
			SendAliveMessage( *it );
		}
	}
}

void CAsyncClient::SendAliveMessage( USERINFOPAY& userInfo )
{
	char szMsgLogOut[128];
	sprintf( szMsgLogOut, "%s\t1\035%d\t%s\t%s\t%s\t\0", m_szGumHeader, GUM_MSG_ALIVE_USER, 
			userInfo.szGameId, userInfo.szUserId, userInfo.szUserType);
	SendPayFormatMessage( szMsgLogOut );
}
//

USERINFO* CAsyncClient::FindPayUser( const char* szUserId)
{
	USERINFO *pUser = g_pUserTable->GetUserInfo( szUserId );	
	return pUser;
}

bool CAsyncClient::DeletePayUser( USERINFOPAY& stUser )
{	
	//해당유저를 찾아 삭제한다.
	LISTUSERIT it = FindUserIterator( stUser.szUserId );
	if( it == NULL )
	{
		return false;
				
	}

	//EnterCriticalSection( &this->m_cs);
	m_vtUser.erase( it );
	//LeaveCriticalSection( &this->m_cs);

	return true;
}

void CAsyncClient::SendMsgToPayServer( int nType , USERINFOPAY& stUser)
{
	//Ser
}

int CAsyncClient::SendPayFormatMessage( char* strMsg )
{

	int nLen = strlen( strMsg );
	if( 0 >= nLen ) 
	{
		return 0;
	}
	//MyLog( 0, strMsg );

	nLen++;
	int nRet, nIdx=0;
__try{ // 030502  임계영역 및  try 문 삽입
	//EnterCriticalSection( &this->m_cs);
	while( nLen > 0 )
	{
		nRet = send( m_sSocket, &strMsg[nIdx], nLen, 0 );
		if( SOCKET_ERROR == nRet )
		{
			
			if( 1 == ::GetPrivateProfileInt( "PayInfo", "LOG_SendPayFormatMessage", 0, "./agentserver.ini" ) )
			{
				MyLog( 0, "ERROR IN CAsyncClient::SendPayFormatMessage = %d ", WSAGetLastError()); // 030701 kyo 
			}
			break;
			//Error
		}
		nLen -= nRet;
		nIdx += nRet;
	}
	//	LeaveCriticalSection( &this->m_cs); 
}__except( EXCEPTION_EXECUTE_HANDLER )
{
	MyLog( 0, "ERROR IN RecvResponsMessage" );
}


	return nIdx;
	//send( m_sSocket, "test", 5, 0);
}

void CAsyncClient::SendKeepaliveMsg()
{
	if( IsRunning() )
	{
		if( NULL != m_szKeepaliveMsg )
		{
			SendPayFormatMessage( m_szKeepaliveMsg );
			CheckAliveUser();	//030703 YGI
		}
	}
}

void CAsyncClient::RecvResponsMessage( SOCKET socket , char* szBuf)
{
	int	nRet=0;
	int nIdx=0;
	
	while( nIdx < MAX_RECV_BUF_SIZE )
	{
		if( nRet > 100|| nIdx > 100 ) 
		{
			nIdx = 0;
			break;
		}
		nRet = recv( socket, (char*)(&szBuf[nIdx]), 1, 0 );
		if( SOCKET_ERROR == nRet || 0 > nRet)
		{
			if( 1 == ::GetPrivateProfileInt( "PayInfo", "LOG_RecvResponsMessage", 0, "./agentserver.ini" ) )
			{
				MyLog( 0, "ERROR IN CAsyncClient::RecvResponsMessage = %d ", WSAGetLastError()); // 030701 kyo 
			}
			break;
		}
		if( szBuf[nIdx] == '\0')
		{
			break;
		}
		nIdx+=nRet;			
	}	

	if( nIdx < 0)
	{
		nIdx = 0;
	}
	szBuf[nIdx] = '\0';

	return;
}

void CAsyncClient::LoginUser( const int nCn, const char* szUserId, const char* szUserPass , const char* szGameId, const char* szUserType, const char* szUserRealIp, const char* szUserVrIp)
{
	USERINFOPAY userInfo;
	SetUserInfo( userInfo, nCn, szUserId, szUserPass, szGameId, szUserType );//GAME_ID, USER_TYPE );
	//기존테이블에 유저가 있으면 그 유저를 삭제하고 현제 유저를 삽입한다.
	int nReConnect = AddPayUser( userInfo );	//유저를 해당 테이블에 저장한다.
	/* 030502 kyo
	int nReConnect = 0;
	USERINFO *pUser = g_pUserTable->GetUserInfo( szUserId );
	( NULL == pUser)
	{
		nReConnect = 0;
	}
	else
		nReConnect = 1;
*/
	SendUserLogin( userInfo, szUserRealIp, szUserVrIp, nReConnect );
	
	//SendUserLogin( userInfo, szUserRealIp, szUserVrIp, 0);
}

void CAsyncClient::LogoutUser( const int nCn, const char* szUserName )
{
/*
	USERINFO *pUser = FindPayUser( szUserName );
	if( pUser == NULL )
	{
		return;
	}

	if( nCn != pUser->dwConnectionIndex )
	{
		return;
	}
*/
	if( NULL == szUserName ) // 030701 kyo
	{
		return;
	}

	LISTUSERIT it = FindUserIterator( szUserName );
	if( it == NULL ) 
	{
		return;
	}

	USERINFOPAY userinfo;
	SetUserInfo( userinfo, (*it).dwConnectionIndex, (*it).szUserId, "", CAsyncClient::GAME_ID, CAsyncClient::USER_TYPE);
	
	SendUserLogout( userinfo);
}

void CAsyncClient::LogoutUser( USERINFO *pUser )
{
	if( pUser == NULL )
	{
		return;
	}

	USERINFOPAY userinfo;
	SetUserInfo( userinfo, pUser->dwConnectionIndex, pUser->szName, "", CAsyncClient::GAME_ID, CAsyncClient::USER_TYPE);
	//MyLog( 0, "[PayClient] UserLogout    cn: %d, name = %s" , pUser->dwConnectionIndex, pUser->szName );
	SendUserLogout( userinfo);
}

void CAsyncClient::LogoutAllUser()
{
	
	if( m_vtUser.empty() )
	{
		return;
	}
	//copy( m_vtUser.begin(), m_vtUser.end(), SendUserLogout );	//클래스함수 쓰기 물어볼껏.
	
	for( LISTUSERIT it = m_vtUser.begin() ; it != m_vtUser.end(); it++ )
	{
		SendUserLogout( (*it) );
		KickOffUser( (*it).szUserId ); // 030716 kyo kickoff all user
	}
	
	MyLog(LOG_NORMAL, "~CAsyncClient :: LogoutAllUser" ); // 030619 kyo
}

void CAsyncClient::SetUserInfo( USERINFOPAY& info, const int nCn, const char* szUserId, const char* szUserPass, const char* szGameId, const char* szUserType ) 
{
	info.dwConnectionIndex	= nCn;
	
	//strupr( info.szUserId ); // 030430 모든 유저이름을 대문자로 처리한다.
	
	//strcpy( info.szUserId, szUserId );
	//strcpy( info.szUserPass, szUserPass ); 
	//strcpy( info.szGameId, szGameId );
	//strcpy( info.szUserType, szUserType );

	strncpy( info.szUserPass, szUserPass,32 ); 
	strncpy( info.szGameId, szGameId ,32 );	
	strncpy( info.szUserType, szUserType ,32 );
	strncpy( info.szUserId, szUserId, 32 ); 
	CharUpper(info.szUserId);
	info.nAliveTime = 0;	// 030703 YGI
}

void CAsyncClient::SendUserLogin( USERINFOPAY& userInfo, const char* szRIP, const char* szVIP , const int nReConnect)
{
	char szMsgLogin[0xff];
	sprintf( szMsgLogin, "%s\t1\035%d\t%d\t%s\t%s\t%s\t%s\t%s\t%s\t\0", m_szGumHeader, GUM_MSG_LOGIN_ACCESS, nReConnect,
			userInfo.szGameId, userInfo.szUserId, userInfo.szUserType, userInfo.szUserPass, szRIP, szVIP );
	LeaveLogInText( szMsgLogin ); // 030701 kyo // leave log "send to GUMP"
	SendPayFormatMessage( szMsgLogin );
}

void CAsyncClient::SendUserLogout( USERINFOPAY& userInfo )
{
	char szMsgLogOut[0xff];
	sprintf( szMsgLogOut, "%s\t1\035%d\t%s\t%s\t%s\t\0", m_szGumHeader, GUM_MSG_LOGOUT_ACCESS, 
			userInfo.szGameId, userInfo.szUserId, userInfo.szUserType);
	LeaveLogInText( szMsgLogOut ); // 030701 kyo // leave log "send to GUMP"
	SendPayFormatMessage( szMsgLogOut );
}

void CAsyncClient::RecvUserLogin( USERINFOPAY& userInfo)
{ //나의 유저리스트에서 찾는다. 
	LISTUSERIT it = FindUserIterator( userInfo.szUserId );
	if( it == NULL ) 
	{
		return;
	}
	SendUser2Client( (*it).dwConnectionIndex, (*it).szUserId, 100);

	/*
	USERINFO *pUser = FindPayUser( userInfo.szUserId );
	if( pUser == NULL )
	{
		return;
	}
	SendUser2Client( pUser->dwConnectionIndex, pUser->szName, 100);
	*/
	//::SendCMD_CONNECT_AGENT_SERVER_CONFORM( pUser->dwConnectionIndex, pUser->szName, 100);	
	//::SendCMD_CONNECT_AGENT_SERVER_CONFORM( (*it).dwConnectionIndex, (*it).szUserId, 100);

}

void CAsyncClient::RecvUserLogout( USERINFOPAY& userInfo)
{
	//유저가 아직남아  있는지 확인서 확실히 끊어 버린다. 
	// -> 030422 kyo 종료대기유저일지도몰르닉나 우선 대기한다. 
	// 030502 에이전트가 스스로 유저를 잘르게 놔두고 우리는 리스트에서만 삭제한다.

	
	//g_pINet->CompulsiveDisconnectUser( userInfo.dwConnectionIndex ); // 030422 kyo
	DeletePayUser( userInfo );
	/*
	USERINFO *pUser = FindPayUser( userInfo.szUserId );
	if( pUser == NULL )
	{
		return;
	}
	*/
	//::MyLog( 0, "AboutPAY :: User didn't LogOut!! userId = %s", userInfo.szUserId);
	
	//강제로그아웃
	//g_pINet->CompulsiveDisconnectUser( pUser->dwConnectionIndex ); // 030422 kyo
}

void CAsyncClient::RecvUserLoginFail( USERINFOPAY& userInfo, int nType)
{	
	LISTUSERIT it = FindUserIterator( userInfo.szUserId );
	if( it == NULL ) 
	{
		return;
	}
	SendUser2Client( (*it).dwConnectionIndex, (*it).szUserId, nType );
	DeletePayUser( userInfo );
	
	/*
	USERINFO *pUser = FindPayUser( userInfo.szUserId );
	if( pUser == NULL )
	{
		return;
	}
	
	SendUser2Client( pUser->dwConnectionIndex, pUser->szName, nType );
	*/
}

void CAsyncClient::RecvUserLogoutFail( USERINFOPAY& userInfo )
{// 과금서버에 로그인 한 적이 없는 유저를 로그아웃한 경우..
	DeletePayUser( userInfo);
	//Leave Log
	//::MyLog( 0, "AboutPAY :: FAIL LogOut    userId = %s", userInfo.szUserId);
}

void CAsyncClient::SendUserLoginSuccess2DB( const DWORD dwConnectionIndex, const char* szUserId )
{
	//db에게 해당 유저가 접속에 성공했음을 알린다. 
	//이곳 추가요망
}

void CAsyncClient::SendUser2Client( const DWORD dwConnectionIndex, const char* szUserId, const int nType)
{
	//client에게 해당 유저의 접속이 실패햇음을 알린다. 
	//이곳 추가요망	
	::SendCMD_CONNECT_AGENT_SERVER_CONFORM( dwConnectionIndex, szUserId, nType);
}

void CAsyncClient::RecvUserAlert( USERINFOPAY& userInfo, int nTime)
{
	//Cliet에게 유저 접속시간이 얼마 안 남았음을 알린다.
	//이곳 추가요망	

	LISTUSERIT it = FindUserIterator( userInfo.szUserId );
	if( it == NULL ) 
	{
		return;
	}
	SendUser2Client( (*it).dwConnectionIndex, (*it).szUserId, -nTime );
	/*
	USERINFO *pUser = FindPayUser( userInfo.szUserId );
	if( pUser == NULL )
	{
		return;
	}
	//시간은 음수로 보낸다. 
	SendUser2Client( pUser->dwConnectionIndex, pUser->szName, -nTime );
	*/
}

void CAsyncClient::RecvUserDisconnect( USERINFOPAY& userInfo, int nMsgType)
{
	//client의 접속을 해제한다. 
	LISTUSERIT it = FindUserIterator( userInfo.szUserId );
	if( it == NULL ) 
	{
		return;
	}
	SendUser2Client( (*it).dwConnectionIndex, (*it).szUserId, nMsgType);
/*
	USERINFO *pUser = FindPayUser( userInfo.szUserId );
	if( pUser == NULL )
	{
		return;
	}

	SendUser2Client( pUser->dwConnectionIndex, pUser->szName, nMsgType );
	*/

	g_pINet->CompulsiveDisconnectUser( (*it).dwConnectionIndex ); //우선 주석처리
}



void CAsyncClient::ShowError( int nError )
{
	nError;
}

bool CAsyncClient::IsRightType( int nType )
{
	
	switch( nType )
	{

	case GUM_MSG_INITALIZED:
	case GUM_MSG_INIT_FAIL:
	case GUM_MSG_MESSAGEFORM_WRONG:
	case GUM_MSG_RESPONS_INITALIZED:	
	case GUM_MSG_LOGIN_ACCESS:
	case GUM_MSG_LOGIN_SUCCESS:
	case GUM_MSG_WRONG_PASS:		
	case GUM_MSG_HAVENO_AUTHORITY:
	case GUM_MSG_END_OF_DATE	:		
	case GUM_MSG_ALREADY_LOGIN	:	
	case GUM_MSG_ALL_SPEND_IP	:	
	case GUM_MSG_DISCONNECT_USER:
	case GUM_MSG_END_OF_DATE_1DAY:	
	case GUM_MSG_END_OF_DATE_1DAY2:	
	case GUM_MSG_LOGOUT_ACCESS	:	
	case GUM_MSG_LOGOUT_SUCCESS	:	
	case GUM_MSG_LOGOUT_FAIL:
	case GUM_MSG_USER_TIMEOVER	:	
	case GUM_MSG_USER_TIMEOVER_1DAY	:
	case GUM_MSG_USER_TIMEOVER_1DAY2:	
	case GUM_MSG_USER_DIS_TIMEOVER	:
	case GUM_MSG_USER_DIS_TIMEOV_1D	:
	case GUM_MSG_USER_DIS_TIMEOV_1D2:
	case GUM_MSG_USER_DIS_OUSER_REQ	:
		return true;
		
	}
	return false;
	
}

void CAsyncClient::CloseConnection()
{
	closesocket( m_sSocket );
}
/*
int CAsyncClient::GetUserCN( USERINFO *pUser, const char* szName )
{
	return 0;

	DWORD index = info->dwID%m_wMaxBucketNum;
	
	if (!m_ppInfoTable[index])
	{
		m_ppInfoTable[index] = info;
		info->pNextUserInfo = NULL;
		info->pPrvUserInfo = NULL;
		return;
	}

	int nBucket = g_pUserTable->GetBucketNum();
	for( int i=0 ; i< nBucket; i++)
	{
		
	}
	USERINFO* cur = m_ppInfoTable[index];
	USERINFO* prv = NULL;

	while (cur)
	{
		prv = cur;
		cur = cur->pNextUserInfo;
	}

}
*/

BOOL DumpException(LPEXCEPTION_POINTERS lpExcep,char* szOutMsg, void *pData, int nSize )
{// 030620 thailand kyo _ copy dbdemon 
	if (!lpExcep)
		return FALSE;

	BOOL		result = TRUE;
	SYSTEMTIME time;
	FILE*		fp = NULL;

	const DWORD		dwExceptionAddress = (DWORD)lpExcep->ExceptionRecord->ExceptionAddress;
	const DWORD		dwExceptionCode = lpExcep->ExceptionRecord->ExceptionCode;
	const DWORD		dwExceptionFlags = lpExcep->ExceptionRecord->ExceptionFlags;
	const DWORD		dwNumberParameters = lpExcep->ExceptionRecord->NumberParameters;
	const DWORD		dwDr0 = lpExcep->ContextRecord->Dr0;
	const DWORD		dwDr1 = lpExcep->ContextRecord->Dr1;
	const DWORD		dwDr2 = lpExcep->ContextRecord->Dr2;
	const DWORD		dwDr3 = lpExcep->ContextRecord->Dr3;
	const DWORD		dwDr6 = lpExcep->ContextRecord->Dr6;
	const DWORD		dwDr7 = lpExcep->ContextRecord->Dr7;
	
	const DWORD		dwSegCs = lpExcep->ContextRecord->SegCs;
	const DWORD		dwSegGs = lpExcep->ContextRecord->SegGs;
	const DWORD		dwSegFs = lpExcep->ContextRecord->SegFs;
	const DWORD		dwSegEs = lpExcep->ContextRecord->SegEs;
	const DWORD		dwEFlags = lpExcep->ContextRecord->EFlags;

	const DWORD		dwEsi = lpExcep->ContextRecord->Esi;
	const DWORD		dwEdi = lpExcep->ContextRecord->Edi;
	const DWORD		dwEbp = lpExcep->ContextRecord->Ebp;
	const DWORD		dwEsp = lpExcep->ContextRecord->Esp;
	const DWORD		dwEip = lpExcep->ContextRecord->Eip;

	const DWORD		dwEax = lpExcep->ContextRecord->Eax;
	const DWORD		dwEbx = lpExcep->ContextRecord->Ebx;
	const DWORD		dwEcx = lpExcep->ContextRecord->Ecx;
	const DWORD		dwEdx = lpExcep->ContextRecord->Edx;
	
	__try
	{
		char szFileName[256+1];
		GetLocalTime(&time);

		sprintf( szFileName, "Agent_%d_%d_%d_%d_%d_%d.log", time.wYear,time.wMonth,time.wDay,time.wHour, time.wMinute,time.wSecond );
		fp = fopen( szFileName, "w");

		fprintf(fp,"%d year, %d month, %d day,%d hour, %d minute, %d second\n",
			time.wYear,time.wMonth,time.wDay,time.wHour, time.wMinute,time.wSecond); 
		
		fprintf(fp,"Crashed address %xh \n",dwExceptionAddress);
		fprintf(fp,"Crashed Map Address %04X:%08X",
			dwSegCs,
			dwExceptionAddress);


		fprintf(fp,"Exception Code %u \n",dwExceptionCode);
		fprintf(fp,"Exception Flag %xh \n",dwExceptionFlags);
		fprintf(fp,"NumberParameters %d \n",dwNumberParameters);
		fprintf(fp,"Dr0 %xh \n",dwDr0);
		fprintf(fp,"Dr1 %xh \n",dwDr1);
		fprintf(fp,"Dr2 %xh \n",dwDr2);
		fprintf(fp,"Dr3 %xh \n",dwDr3);
		fprintf(fp,"Dr6 %xh \n",dwDr6);
		fprintf(fp,"Dr7 %xh \n",dwDr7);
		
		fprintf(fp,"SegGs %xh \n",dwSegGs);
		fprintf(fp,"SegFs %xh \n",dwSegFs);
		fprintf(fp,"SegEs %xh \n",dwSegEs);
		fprintf(fp,"EFlags %xh \n",dwEFlags);
		
		fprintf(fp,"Esi %xh \n",dwEsi);
		fprintf(fp,"Edi %xh \n",dwEdi);
		fprintf(fp,"Ebp %xh \n",dwEbp);
		fprintf(fp,"Esp %xh \n",dwEsp);
		fprintf(fp,"Eip %xh \n",dwEip);
		

		fprintf(fp,"Eax %xh \n",dwEax);
		fprintf(fp,"Ebx %xh \n",dwEbx);
		fprintf(fp,"Ecx %xh \n",dwEcx);
		fprintf(fp,"Edx %xh \n",dwEdx);

		if( pData )	fprintf(fp,"info : packet_type(PTCL_) =  %d \n",*((char*)pData));
	
		fprintf(fp,"\n\n");

		fclose(fp);
		fp = NULL;

		if( pData )
		{
			sprintf( szFileName, "Agent_info_%d_%d_%d_%d_%d_%d.bin", time.wYear,time.wMonth,time.wDay,time.wMinute,time.wSecond );
			fp = fopen( szFileName, "w");
			fwrite( &nSize, 4, 1, fp );
			fwrite( pData, 1, nSize, fp );
			fclose( fp );
			fp = NULL;
		}
	}
	__except (GetExceptionCode())
	{
		MyLog(LOG_NORMAL, "ERROR :: Write in DumpException" ); 
		if (fp)
			fclose(fp);
	
		result = FALSE;
	}

	return result;
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////