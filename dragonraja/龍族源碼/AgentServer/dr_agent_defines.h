//
// 2000/10/23, chan78
//
// Definations for Agent Server
//
#pragma once

#define MAX_CHARACTEROFID						4

// 8bytes ordered
//#define SIZE_OF_T_HEADER						8
// 1byte ordered
#define SIZE_OF_T_HEADER						5

#define RAJA_MAX_PACKET_SIZE					3000

#define ID_LENGTH								20
#define PW_LENGTH								20
#define NM_LENGTH								20

#define TEXT_LENGTH								255
#define SIZE_OF_TAC_SKILL_EXP					(13  * sizeof( unsigned int	 ))	

// ....
#define CONNECT_OK								1

// Agent 에서 쓰이는 패킷만 골라냈음.
#define CMD_NONE								0
#define CMD_PING								5
#define CMD_ACCESS_LOGIN						6066	//010707 lsw 수정

//010925 lsw
#define CMD_INVALID_ID					1
#define CMD_INVALID_PW					2
#define CMD_INVALID_DB					3
#define CMD_INVALID_PAY					4
#define CMD_INVALID_VERSION				16
#define CMD_INVALID_AGE					17	// 030923 kyo


//   Clinet->MapServer
#define CMD_ACCESS_JOIN							30





//   Clinet->MapServer
#define CMD_ACCESS_JOIN							30

#define CMD_REQ_INSERT_USERID					34
#define CMD_REQ_DELETE_USERID					35
#define CMD_CREATE_CHAR							50
#define CMD_DELETE_CHAR							52
#define CMD_CHAT_DATA							6250	//010707 lsw 수정
#define CMD_CHANGE_MAP_DETECTED					109	
#define CMD_CHANGE_MAP							110
#define CMD_LOST_CONNECTION						127
#define CMD_CONNECT_INFO						200
#define CMD_LEVELUP_POINT						410

// Added by chan78 at 2000/12/07 :: 과금
#define CMD_ACCESS_PAY_PER_MIN					710

#define	CMD_CHR_ITEM_INFO_0						5000	// Inventory
#define	CMD_CHR_ITEM_INFO_1						5001	// Equip
#define	CMD_CHR_ITEM_INFO_2						5002	// quick.
#define CMD_CHAR_INFO_MAGIC						5004
#define CMD_CHAR_INFO_SKILL						5005
#define CMD_CHAR_INFO_TAC_SKILL_EXP				5008
#define CMD_ISTHERE_CHARNAME					7540

#define CMD_HOW_MANY_IN_MAP						8413
#define CMD_UPDATE_VERY_IMPORTANT_STATUS		8465
// Login Server -> Game Server
// id를 가진 놈을 끊어라...
#define CMD_CLOSE_LOGIN_ID						8462

#define CMD_UPDATE_VERY_IMPORTANT_TACTICS		8466
#define CMD_ITEM_DURATION_CHANGE				8426
#define CMD_TACTICS_PARRYING_EXP				8470
#define CMD_UPDATE_CHAR_DB						8500
#define CMD_UPDATE_BINARY_DATA0					8501
#define CMD_UPDATE_BINARY_DATA1					8502
#define CMD_UPDATE_SCRIPT_DATA					8503
#define CMD_UPDATE_INV_DATA						8504	
#define CMD_UPDATE_ITEM_DATA					8505
#define CMD_UPDATE_BANKITEM_DATA				8506	
#define CMD_IM_GAME_SERVER         				9011
#define CMD_GLOBAL_CHAT_DATA					9001
#define CMD_ACCESS_CHAR_DB						9021
#define CMD_CONNECT_INFO1						10000		// 1218 YGI
#define CMD_DELETE_ITEM							10011		// 아이템 부서짐
#define CMD_REQ_PARTY_MEMBER					10036
#define	CMD_CHECK_BETA_TEST						10068
#define	CMD_PARTY_ACCESS						10082
#define CMD_REQ_PARTY_TOGETHER					10083		// 서로 동맹을 맺고 있는지 알아보기 위해 로그인 서버로 디비를 요청한다.
#define CMD_THROW_DICE							10088		// 주사위 던지기...
#define CMD_CREATE_ABILITY						10089		// 기본수치 랜덤 생성
#define CMD_CHECK_NEW_CHAR						10120

// 001205 KHS 
#define CMD_RESET_JOB							10213	// JOB를 새로 선택
#define CMD_SELECT_NATION						10215	// 나라 선택 

#define MAX_LEARN_ITEM						1000			//1220
#define MAX_DIR_TABLE						 256
#define	MAX_SHORTPATH						  50
#define MAX_BIX_ITEM						  15
#define	MAX_PC_CONTROL_NPC					   8

// Added by chan78 at 2000/11/28
#define CMD_SV_CONNECT_SERVER_COUNT			12001	// 서버 카운트 가져오기
#define CMD_SV_GET_CONNECT_SERVER_PORT		12002	// 연결된 게임서버 가져오기

#define CMD_ACCEPT_LOGIN				6067			//010707 lsw 수정

// Added by chan78 at 2001/01/09
#define CMD_CLOSE_CONNECTION_NORMAL					13001
#define CMD_CLOSE_CONNECTION_ABNORMAL				13002
#define CMD_CLOSE_CONNECTION_SAME_ID_LOGON			13003
#define CMD_CLOSE_CONNECTION_SLEPT_TOO_LONG_TIME	13004

#define CMD_SO_MUCH_LOGINUSER_WAIT_FOR_A_MIN		13005
#define CMD_LOGIN_FAIL_MASSAGE						13006

// 010109 KHS
#define	CMD_SV_SEND_MESSAGE_ALL				12003	// 게임 서버에 메시지를 뿌려준다.		// 010110 YGI
#define	CMD_LOGIN_BBS						8450	// 010110 YGI

#define CMD_ALL_READY					33

const int CMD_SELECTED_CHAR_RESULT_CLIENT_BOTH_DB_DEMON	= 16103;//021230 lsw