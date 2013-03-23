// LocalizingMgr.cpp: implementation of the CLocalizingMgr class.
//
//////////////////////////////////////////////////////////////////////

#include "stdafx.h"
#include "LocalizingMgr.h"
#include "Mylog.h"

//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////
const char szKorea	[]	= "KOREA";
const char szChina	[]	= "CHINA";
const char szTaiwan	[]	= "TAIWAN";
const char szThai	[]	= "THAI";
const char szHongKong[] = "HONGKONG";
const char szUsa	[]	= "USA";
const char szJapan	[]	= "JAPAN";
CLocalizingMgr LocalMgr;

CLocalizingMgr::CLocalizingMgr()
{
	m_iNationCode	= NOTSET;
	m_iMyCode		= 0;
	m_pszNationName	= NULL;
	m_pszTotalDbID	= NULL;
	m_pszTotalDbPW	= NULL;
	m_pszDragonDbID	= NULL;
	m_pszDragonDbPW	= NULL;
	m_pszChrlogDbID	= NULL;
	m_pszChrlogDbPW	= NULL;
}

CLocalizingMgr::~CLocalizingMgr()
{
	SAFE_DELETE(m_pszNationName);
	SAFE_DELETE(m_pszTotalDbID);
	SAFE_DELETE(m_pszTotalDbPW);
	SAFE_DELETE(m_pszDragonDbID);
	SAFE_DELETE(m_pszDragonDbPW);
	SAFE_DELETE(m_pszChrlogDbID);
	SAFE_DELETE(m_pszChrlogDbPW);
}

void CLocalizingMgr::SetNationName(const char* szNationName)
{
	SAFE_DELETE(m_pszNationName);
	m_pszNationName = new char [strlen(szNationName)+1];
	strcpy(m_pszNationName,szNationName);
}

int CLocalizingMgr::SetDBAccount(const int iType, const char* szId,const char* szPw)
{
	switch(iType)
	{
	case TOTAL_DB:
		{
			SAFE_DELETE(m_pszTotalDbID);
			SAFE_DELETE(m_pszTotalDbPW);
			m_pszTotalDbID = new char [strlen(szId)+1];
			m_pszTotalDbPW = new char [strlen(szPw)+1];
			strcpy(m_pszTotalDbID,szId);
			strcpy(m_pszTotalDbPW,szPw);
		}break;
	case DRAGON_DB:
		{
			SAFE_DELETE(m_pszDragonDbID);
			SAFE_DELETE(m_pszDragonDbPW);
			m_pszDragonDbID = new char [strlen(szId)+1];
			m_pszDragonDbPW = new char [strlen(szPw)+1];
			strcpy(m_pszDragonDbID,szId);
			strcpy(m_pszDragonDbPW,szPw);
		}break;
	case CHRLOG_DB:	
		{
			SAFE_DELETE(m_pszChrlogDbID);
			SAFE_DELETE(m_pszChrlogDbPW);
			m_pszChrlogDbID = new char [strlen(szId)+1];
			m_pszChrlogDbPW = new char [strlen(szPw)+1];
			strcpy(m_pszChrlogDbID,szId);
			strcpy(m_pszChrlogDbPW,szPw);
		}break;
	default:
		{
			return 0;
		}break;
	}
	return 1;
}

int CLocalizingMgr::InitVersion(const char* szNationName,const int iIsFreeBeta)//단 한번만 호출 하도록 하십시요.
{
	return InitVersion(ConvertNameToCode(szNationName),iIsFreeBeta);
}

int CLocalizingMgr::InitVersion(const int iNationCode,const int iIsFreeBeta)
{
	switch(iNationCode)
	{
	case KOREA	:
		{
			SetNationName("KOREA");
			SetDBAccount(TOTAL_DB ,"Rainbow7","ehdwjsqud");
			SetDBAccount(DRAGON_DB,"badaro","tkrhkaorwn");
			SetDBAccount(CHRLOG_DB,"pony","speakercoin");
			m_iMyCode		= KOREA_MYCODE;//마이코드 저장소
		}break;
	case CHINA	:
		{	
			SetNationName("CHINA");
			SetDBAccount(TOTAL_DB ,"tasha_gulian","hoskins");
			SetDBAccount(DRAGON_DB,"umbar_ector","shute");
			SetDBAccount(CHRLOG_DB,"golush_starr","voight");
			m_iMyCode		= CHINA_MYCODE;//마이코드 저장소
		}break;
	case TAIWAN	:
		{
			SetNationName("TAIWAN");
			SetDBAccount(TOTAL_DB ,"xera_cyrus","muller");
			SetDBAccount(DRAGON_DB,"adina_kyle","bragin");
			SetDBAccount(CHRLOG_DB,"newit_quix","hacket");
			m_iMyCode		= TAIWAN_MYCODE;//마이코드 저장소	
		}break;
	case THAI:
		{
			SetNationName("THAI");
			SetDBAccount(TOTAL_DB ,"Rainbow7","ehdwjsqud");
			SetDBAccount(DRAGON_DB,"badaro","tkrhkaorwn");
			SetDBAccount(CHRLOG_DB,"pony","speakercoin");			
			m_iMyCode		= THAI_MYCODE;//마이코드 저장소
		}break;
	case HONGKONG:
		{
			SetNationName("HONGKONG");
			SetDBAccount(TOTAL_DB ,"fargo_trion","swann");
			SetDBAccount(DRAGON_DB,"yali_brann","logan");			
			SetDBAccount(CHRLOG_DB,"wenck_daron","palmer");
			m_iMyCode		= HONGKONG_MYCODE;//마이코드 저장소
		}break;
	case USA:
		{
			SetNationName("USA");
			SetDBAccount(TOTAL_DB ,"Rainbow7","ehdwjsqud");
			SetDBAccount(DRAGON_DB,"badaro","tkrhkaorwn");
			SetDBAccount(CHRLOG_DB,"pony","speakercoin");
			m_iMyCode		= USA_MYCODE;//마이코드 저장소
		}break;
	case JAPAN	:
		{
			SetNationName("JAPAN");
			SetDBAccount(TOTAL_DB ,"Rainbow7","ehdwjsqud");
			SetDBAccount(DRAGON_DB,"badaro","tkrhkaorwn");
			SetDBAccount(CHRLOG_DB,"pony","speakercoin");
			m_iMyCode		= JAPAN_MYCODE;//마이코드 저장소
		}break;
	default:
	case NOTSET	:
		{
			MyLog( LOG_NORMAL, "Version Setting Fault!! Nation Code = ' %d '" ,m_iNationCode);		
			return 0;
		}break;
	}
	m_iNationCode	= iNationCode;//국가코드 저장소
	m_iIsFreeBeta	= iIsFreeBeta;//이게 프리베타인지 체크함
	return 1;
}

int CLocalizingMgr::ConvertNameToCode(const char* szNationName)
{
	if(!stricmp(szNationName,szKorea)){return KOREA;}
	if(!stricmp(szNationName,szChina)){return CHINA;}
	if(!stricmp(szNationName,szTaiwan)){return TAIWAN;}
	if(!stricmp(szNationName,szThai)){return THAI;}
	if(!stricmp(szNationName,szHongKong)){return HONGKONG;}
	if(!stricmp(szNationName,szUsa)){return USA;}
	if(!stricmp(szNationName,szJapan)){return JAPAN;}
	
	return NOTSET;	
}

void CLocalizingMgr::DisplayLocalizingSet()const//현재 로컬라이징 셋팅을 보여줍니다.
{
	switch(m_iNationCode)
	{
	case KOREA	:
	case CHINA	:
	case TAIWAN	:
	case THAI:	
	case USA:
	case JAPAN	:
		{
		}break;
	default:
	case NOTSET	:
		{
			MyLog( LOG_NORMAL, "Version Setting Fault!! Nation Code = ' %d '" ,m_iNationCode);		
		}break;
	}
	MyLog( LOG_NORMAL, "########---------------------------------------########" );
	MyLog( LOG_NORMAL, "        Running For ' %s ' MyCode ' %d '",m_pszNationName,m_iMyCode);
	if(IsFreeBeta())
	{
		MyLog( LOG_NORMAL, "########!!This is FreeBetaServer NO Pay Money!!########" );
	}
	MyLog( LOG_NORMAL, "########---------------------------------------########" );
}

int CLocalizingMgr::IsAbleNation(const int iNationCode)const//불가능한 국가라면 0을 리턴 가능하면 1을 리턴
{
	return (m_iNationCode & iNationCode)?1:0;
}

int CLocalizingMgr::IsAbleMyCode(const int iMyCode)const//불가능한 마이코드라면 0을 리턴 가능하면 1을 리턴
{
	return (m_iMyCode == iMyCode)?1:0;
}

const char *CLocalizingMgr::GetDBAccount(const int iType, bool bIsID)
{	
	switch(iType)
	{
	case TOTAL_DB:
		{
			return (bIsID)?m_pszTotalDbID:m_pszTotalDbPW;
		}break;
	case DRAGON_DB:
		{
			return (bIsID)?m_pszDragonDbID:m_pszDragonDbPW;
		}break;
	case CHRLOG_DB:	
		{
			return (bIsID)?m_pszChrlogDbID:m_pszChrlogDbPW;
		}break;
	default:
		{
			return "";
		}break;
	}
	return "";
}