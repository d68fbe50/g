//
//
//

#pragma once
#include "stdafx.h"
#include "dr_agent_defines.h"

typedef struct server_connect_info
{
	char	ip[3][18];
	int		port;
} t_server_connect_info;

const int MAX_MY_STRING = 20;
typedef struct CLIENTACCESSLOGIN
{
	HSEL_INITIAL	init;
	char			id[ID_LENGTH];
	char			pw[PW_LENGTH];
	short int		version;
	short int		mycode;	
	char			mystring[MAX_MY_STRING];

	char			ip[40];		//Added by zoung
	WORD			wPort;		// Added by chan78 at 2000/12/17

	short int		Corp_Code;	//업체 코드
	char			User_ID[ID_LENGTH];	//종량제 업체용 ID
	char			GateWayIP[40];
	int				GateWayPORT;
}t_ClientAccessLogin, *LPCLIENTACCESSLOGIN;

#define CMD_CONNECT_AGENT_SERVER_CONFORM	6098
typedef struct CONNECTAGENTSERVERCONFORM
{
	char szUserID[ID_LENGTH];
	char szUserPASS[PW_LENGTH];
	int iKey;
}t_ConnectAgentServerConform,*LPCONNECTAGENTSERVERCONFORM;

#define CMD_ON_CONNECT	6099
typedef struct ONCONNECTHSELINIT
{
	HSEL_INITIAL	eninit;
	HSEL_INITIAL	deinit;
}t_OnConnectHselInit;



typedef struct agent_user_connection_lost
{
	char			id[ID_LENGTH];
} t_agent_user_connection_list;

// --------------------

typedef struct server_change_map
{
	char			mapname[ NM_LENGTH ];
	int				port;
	short int		x;
	short int		y;
	short int		server_id;
} t_server_change_map;


typedef struct server_accept_login
{	
	short int		server_id;						
	char			name[ MAX_CHARACTEROFID][NM_LENGTH];
	unsigned char	level[ MAX_CHARACTEROFID];		
	unsigned char	job[ MAX_CHARACTEROFID];		
	unsigned char	cla[ MAX_CHARACTEROFID];		
	unsigned char	gender[ MAX_CHARACTEROFID];		
		
	unsigned char   bodyr[ MAX_CHARACTEROFID];		
	unsigned char   bodyg[ MAX_CHARACTEROFID];		
	unsigned char   bodyb[ MAX_CHARACTEROFID];		
	
	unsigned char   clothr[ MAX_CHARACTEROFID];		
	unsigned char   clothg[ MAX_CHARACTEROFID];		
	unsigned char   clothb[ MAX_CHARACTEROFID];		
	
	short int		age[ MAX_CHARACTEROFID];		
	unsigned int	money[ MAX_CHARACTEROFID];		
	unsigned char	acc_equip1[ MAX_CHARACTEROFID];	
	unsigned char	acc_equip2[ MAX_CHARACTEROFID];	
	unsigned char	acc_equip3[ MAX_CHARACTEROFID];	
	unsigned char	acc_equip4[ MAX_CHARACTEROFID];	
	
	char			nation;							
	short int		remained_day;					
	
	char			id[ ID_LENGTH];
	
} t_server_accept_login;

typedef struct ACCESSJOIN
{	
	char			id[ID_LENGTH];
	char			pw[PW_LENGTH];
	char			name[NM_LENGTH];
	char			startposition;		// 99이면 맨 마지막에 LogOut한자리에서 나타난다. 
	short			nBillingType;
	char			ip[40];
}t_AccessJoin,*LPACCESSJOIN;
	
// Added by chan78 at 2000/11/28
typedef struct server_port
{
	short int count;
	short int port[100];
}k_server_port;


#pragma pack (push, 1 )

typedef struct dragon_header
{					
	short int		type;
	short int		size;
	char			crc;//010707 lsw filter
} t_header;			
					
typedef union kein_imsi
{
	k_server_port				server_port;
	char						default_char;
} t_kein;

typedef struct login_close_login_id 
{
	char id[ NM_LENGTH];
}t_login_close_login_id;

// 010109 KHS
typedef struct login_bbs		// 010110 YGI
{
	char	bbs[ MAX_PATH];
}t_login_bbs;


#define CMD_HACKING_USER			9007
typedef struct hacking_user
{
	char	id[ 20];
	char	name[20];
	short	type;
	char	ip[20];
	char	cause[100];
}t_hacking_user;



//--------------------------------------------------------
typedef struct packet
{					
	union			
	{				
		char					data[sizeof(t_header)];
		t_header				header;
	} h;			
						
	union			
	{				
		char								data[RAJA_MAX_PACKET_SIZE];
		CLIENTACCESSLOGIN					ClientAccessLogin;

		t_server_accept_login				server_accept_login;
		t_server_connect_info				server_connect_info;
		ACCESSJOIN							AccessJoin;
		t_server_change_map					server_change_map;
		t_login_close_login_id				login_close_login_id;

		t_OnConnectHselInit					OnConnectHselInit;
		t_ConnectAgentServerConform			ConnectAgentServerConform; //030204 lsw

		// 010109 KHS
		char								default_msg[200];		// 010110 YGI
		t_login_bbs							login_bbs;

		t_hacking_user						hacking_user;


		t_kein					kein;
	} u;

	struct packet *next;

} t_packet;


#pragma pack (pop)

//--------------------------------------------------------


//--------------------------------------------------------
/*
typedef struct connection 
{
	SOCKET			socket;
	struct			sockaddr_in addr;
	int				state;
	t_packet		*inbuf;
	t_packet		*outbuf;
	int				receive;
	int				receive_count;
    DWORD			connect_time;
	DWORD			monitor_time;
	DWORD			send_bytes;
	DWORD			receive_bytes;
	int				send_try;		// 보내기 횟수...

	int				send_addlen;

	char			ip_address[128];

	int				last_year;
	int				last_mon;
	int				last_day;
	int				last_hour;
	int				last_min;

	int				login_year;
	int				login_mon;
	int				login_day;
	int				login_hour;
	int				login_min;
	int				login_sec;

	t_packet		packet;
	int				packet_pnt;
	int				packet_size;
	int				packet_status;
	int				packet_count[2];

	int				kick_out;
	DWORD			kick_out_time;

	int				save_db;
	DWORD			save_db_time;

	char			id[ID_LENGTH];
	char			pw[PW_LENGTH];
	char			name[NM_LENGTH];
	char			mapname[NM_LENGTH];

	int				server_check;
	char			*SendBuf;				// send()로 보낼 내용을 다음에 담아 놓는다. 
	int				SendBufSize;			// send()로 보낼 내용의 크기. 
	int				SendErr;				// send()로 보낼 내용의 크기. 

} t_connection;
*/

typedef struct im_game_server
{		
	int port;
}t_im_game_server;

typedef struct char_info_magic{	
	unsigned char magic[ 200 ];
}t_char_info_magic;

typedef struct char_info_skill{	
	unsigned char skill[ 200 ];
}t_char_info_skill;

typedef struct char_info_tac_skillexp
{
	unsigned int tac_skillEXP[ 13];

}t_char_info_tac_skillexp;

typedef struct client_isthere_charname
{		
	char name[ NM_LENGTH];
}t_client_isthere_charname;

typedef struct how_many_in_map
{
	char		map[ NM_LENGTH ];
	short int	how;
}t_how_many_in_map;

typedef struct update_very_important_status
{
	char            name[ NM_LENGTH];
	
	short int		Level;

	short int		Str  ;	
	short int		Con  ;	
	short int		Dex  ;	
	short int		Wis  ;	
	short int		Int  ;	
	short int		MoveP;	  
	short int		Char ;	 
	short int		Endu ;	 
	short int		Moral;	  
	short int		Luck ;	 
	short int		wsps ;	 

	int				HpMax ;
	int				ManaMax;
	int				HungryMax;

	short int		reserved_point;

	DWORD			Exp;

}t_update_very_important_status;

typedef struct update_very_important_tactics
{
	char name[NM_LENGTH];
	char tac_skillEXP[SIZE_OF_TAC_SKILL_EXP];
}t_update_very_important_tactics;

typedef struct item_duration_change
{
	BYTE pos;
	WORD dur;
}t_item_duration_change;

typedef struct tactics_parrying_exp
{
	DWORD exp;
}t_tactics_parrying_exp;

typedef struct t_POS
{
	char type ; 
	short int p1, p2, p3 ;
} POS ;

typedef struct itemAttr
{
		short int		item_no;
		unsigned int	attr[6];
} ItemAttr;

typedef struct tag_K_ITEM
{
	ItemAttr	item_attr;
	POS			item_pos;
}K_ITEM, *lpITEM;

typedef struct tag_CharRank
{
//public :
	DWORD	nation		: 4 ;		// 속한나라	0 : 없음, 1, 2, 3: 바이서스 4: 자이펀 5:헤게모니아 6: 일스
	DWORD	counselor	: 2 ;		// 0 : 없음, 1: 회사 운영자, 2: 게임내 운영자
	DWORD	king		: 1 ;		// 나라 왕
	DWORD	guild_code	: 9 ;		// 길드 코드 ( 512개 )
	DWORD	guild_master: 3 ;		// 길드 마스터

//public :
//	CCharRank() { memset( this, 0, sizeof( CCharRank) ); }
}CCharRank;
////////////////////////////////////////////////////////////////////////////

typedef enum enumDIRECTION
{

	DIRECTION_SAME  			=   0,
	DIRECTION_UP				=   4,
	DIRECTION_RIGHTUP			=   5,
	DIRECTION_RIGHT				=   6,
	DIRECTION_RIGHTDOWN			=   7,
	DIRECTION_DOWN				=   0,
	DIRECTION_LEFTDOWN			=   1,
	DIRECTION_LEFT				=   2,
	DIRECTION_LEFTUP			=   3

} DIRECTION;

typedef struct tagCharacterParty
{
	short int	On;
	int			Server_id;
	char		Name[ 31];
	int			Face;
	int			Level;
	int			Gender;
	int			Str;
	int			Class;
}CharacterParty, *LpCharacterParty;

