// LocalizingMgr.h: interface for the CLocalizingMgr class.
//
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_LOCALIZINGMGR_H__F4B2DCF8_D77A_426D_8C68_DE978C3113E8__INCLUDED_)
#define AFX_LOCALIZINGMGR_H__F4B2DCF8_D77A_426D_8C68_DE978C3113E8__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#define PROXY_SERVER_INI_		".\\ProxyServer.ini"
#define SERVER_MANAGER_INI_		PROXY_SERVER_INI_
#define DB_DEMON_INI_			".\\DBDemon.ini"
#define AGENT_SERVER_INI_		".\\agentserver.ini"
#define MAP_SERVER_INI_			".\\MapServer.ini"

extern const char szKorea	[];
extern const char szChina	[];
extern const char szTaiwan	[];
extern const char szThai	[];
extern const char szHongKong[];
extern const char szUsa		[];
extern const char szJapan	[];

enum MY_CODE
{
	KOREA_MYCODE	= 1315,
	TAIWAN_MYCODE	= 3315,
	HONGKONG_MYCODE	= 4315,
	CHINA_MYCODE	= 5315,
	THAI_MYCODE		= 6315,
	USA_MYCODE		= 7315,	
	JAPAN_MYCODE	= 8315
};

enum NationCode
{
	NOTSET	= 0x00000000,//NOTSET일 경우는 무조건 에러처리합니다.
	KOREA	= 0x00000001,
	CHINA	= 0x00000002,
	TAIWAN	= 0x00000004,
	THAI	= 0x00000008,
	HONGKONG= 0x00000010,
	USA		= 0x00000020,	
	JAPAN	= 0x00000040
};

enum DBType//DB타입
{
	TOTAL_DB	= 1,
	DRAGON_DB	= 2,	
	CHRLOG_DB	
};

const int  ID	=	1;
const int  PASS	=	0;

class CLocalizingMgr  
{
private:
	int ConvertNameToCode(const char* szNationName);
	int m_iNationCode;//국가코드 저장소
	char *m_pszNationName;
	
	char *m_pszTotalDbID;
	char *m_pszTotalDbPW;
	char *m_pszDragonDbID;
	char *m_pszDragonDbPW;
	char *m_pszChrlogDbID;
	char *m_pszChrlogDbPW;

	int m_iMyCode;//마이코드 저장소
	int m_iIsFreeBeta;//마이코드 저장소
private:
	CLocalizingMgr operator=(const CLocalizingMgr &old);//대입연산자 사용 불가.
	CLocalizingMgr(const CLocalizingMgr &old);//복사생성자 사용 불가.

private:
	void SetNationName(const char* szNationName);
	int SetDBAccount(const int iType, const char* szId,const char* szPw);
public:
	CLocalizingMgr();
	virtual ~CLocalizingMgr();
public://SetNationCode 류의 함수는 만들지 않습니다. 게임 서비스 중에 쓸일이 없기 때문입니다.
	const int GetNationCode()const{return m_iNationCode;}//국가 코드를 받아옵니다.
	const char* GetNationName()const{return m_pszNationName;}//국가 이름을 받아 옵니다.
	const int IsFreeBeta()const{return (m_iIsFreeBeta)?1:0;}//이것이 프리베타인지 알아냅니다.

	int InitVersion(const int iNationCode,const int iIsFreeBeta = false);//단 한번만 호출 하도록 하십시요.
	int InitVersion(const char* szNationName,const int iIsFreeBeta = false);//단 한번만 호출 하도록 하십시요.
	
	void DisplayLocalizingSet()const;//현재 로컬라이징 셋팅을 보여줍니다.

	int IsChangeMoney(){return (IsAbleNation(TAIWAN|CHINA|HONGKONG))?0:1; }//대만 충국 홍콩은 옛날돈 쓴다
	
	int IsAbleMyCode(const int iMyCode)const;//불가능한 마이코드라면 0을 리턴 가능하면 1을 리턴
	int IsAbleNation(const int iNationCode)const;//불가능한 국가라면 0을 리턴 가능하면 1을 리턴
/*	
	void example()//IsAbleNation()의 샘플 코드
	{
		if(IsAbleNation(KOREA||TAIWAN)
		{//한국이거나 대만이면 실행 됩니다.
		}
		else
		{//나머지 국가에서 실행 됩니다.
		}
	}
*/
	const char *GetDBAccount(const int iType, bool bIsID);//iType TOTAL_DB,등의 타입입니다.bIsID ID, PASS 둘중에 하나를 쓸 수 있습니다. 결과는 const char*로 넘어옵니다. 스트링카피나 멤카피를 사용해 주십시요.
/*	
	void example()//GetDBAccount()의 샘플 코드
	{
		char id[30],pw[30];

		if( (Init_SQL("DragonRajaDB", GetDBAccount(TOTAL_DB,ID), GetDBAccount(TOTAL_DB,PASS)) ) == 0)
		{//
		}
	}
*/
};
extern CLocalizingMgr LocalMgr;
#endif // !defined(AFX_LOCALIZINGMGR_H__F4B2DCF8_D77A_426D_8C68_DE978C3113E8__INCLUDED_)
