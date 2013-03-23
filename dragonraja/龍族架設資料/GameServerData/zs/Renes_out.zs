
@sys00	; 처음 서버 Setting하는 함수.

	MaxNPC( 50 )
	
	MapName( "Renes_Out" )
	
end	


@sys01 
end
@sys02 
end
@sys03 
end
@sys04 
end
@sys05 
end
@sys06 
end
@sys07 
end
@sys08 
end
@sys09 
end




@Npc00000	
end
@Npc00001
end
@Npc00002	
end
@Npc00003	
end
@Npc00004	
end
@Npc00005	
end
@Npc00006	
end
@Npc00007	
end
@Npc00008   
end
@Npc00009	
end

@Npc00010	
end
@Npc00011	
end
@Npc00012	
end
@Npc00013	
end
@Npc00014	
end
@Npc00015	
end
@Npc00016	
end
@Npc00017	
end
@Npc00018   
end
@Npc00019	
end

@Npc00020	
end
@Npc00021	
end
@Npc00022	
end
@Npc00023	
end
@Npc00024	
end
@Npc00025	
end
@Npc00026	
end
@Npc00027	
end
@Npc00028   
end
@Npc00029	
end

@Npc00030	
end
@Npc00031	
end
@Npc00032	
end
@Npc00033	
end
@Npc00034	
end
@Npc00035	
end
@Npc00036	
end
@Npc00037	
end
@Npc00038   
end
@Npc00039	
end

@Npc00040	
end
@Npc00041	
end
@Npc00042	
end
@Npc00043	
end
@Npc00044	
end
@Npc00045	
end
@Npc00046	
end
@Npc00047	
end
@Npc00048   
end
@Npc00049	
end

@Event00000
end
@Event00001		
end


@Event00002	

	CheckNation(4)
	if(yes==1)
	{
		goto END1220_
	}
	else
	{
		goto END1202_
	}
	

:END1202_

	LocalWarMode()
	if(yes==1) ; 전쟁모드인 경우
	{
		EventMsg("침입자는 자이펀 점령지인 레너스시로 이동할 수 없습니다.")
		goto END1299_
	}
	else
	{
		goto END1203_
	}

:END1203_

	CompFriendShip(4,5)
	if( yes >= 0 )
	{
		EventMsg("당신은 자이펀의 적대수치(NK)가 높아 자이펀 지역을 이동할 수 없습니다.")
		goto END1299_
	}
	if( yes < 0 )
	{
		CheckNation(3)
		if(yes==1)
		{
			EventMsg("바이서스는 적대 국가 이므로 마을로 이동할 수 없습니다.")
			goto END1299_
		}
		goto END1220_
	}


:END1220_

	MapMove( "Renes_c", 9,440 )
	if( yes==1)
	{
		EventMsg("자이펀 점령지인 레너스시로 이동합니다.")
	}
	else
	{
		EventMsg("맵 이동에 실패했습니다.")		
	}	
	goto END1299_
	

:END1299_


end

@Event00003

	CheckNation(4)
	if(yes==1)
	{
		goto END1320_
	}
	else
	{
		goto END1302_
	}
	
:END1302_

	LocalWarMode()
	if(yes==1) ; 전쟁모드인 경우
	{
		goto END1303_
	}
	else
	{
		goto END1305_
	}

:END1303_

	CheckAllSealStoneBroked(4)
	if(yes==1)
	{
		goto END1320_
	}
	else
	{
		EventMsg("결계석의 보호로 들어갈 수가 없습니다.")
		goto END1399_
	}


:END1304_

:END1305_ ; 자이펀 적대 수치 체크


	CompFriendShip(4,5)
	if( yes >= 0 )
	{
		EventMsg("당신은 자이펀 적대수치(NK)가 높아 자이펀 지역을 이동할 수 없습니다.")
		goto END1399_
	}
	if( yes < 0 )
	{
		goto END1320_
	}


:END1320_

	MapMove( "Color",  104, 9 )
	if( yes==1)
	{
		EventMsg("자이펀 점령지인 칼라힐 마을로 이동합니다.")
	}
	else
	{
		EventMsg("맵 이동에 실패했습니다.")		
	}	
	goto END1399_
	
:END1399_


end

@Event00004	
	MapMove( "big_g",  561,715 )
	EventMsg( "대초원으로 이동합니다.")
end

@Event00005		
end
@Event00006		
end
@Event00007		
end
@Event00008	; 4등급 길드집

;	IsInvHavePC(10088) ; 열쇠 번호
;	GetGuild()
;	if(yes == 1)
;	{
;		goto ENDkey1_
;	}
;	else
;	{
		EventMsg("이 곳은 분배되지 않은 길드의 엠포리아입니다. 아직 아무도 들어갈 수 없습니다.")
		QuestTeleport(1,42,253) ; 집앞으로 이동
		SendSound(0,0161)
		goto ENDkey1_
;	}
:ENDkey1_
end

@Event00009	; 4등급 길드집

;	IsInvHavePC(10089) ; 열쇠 번호
;	GetGuild()
;	if(yes == 000)
;	{
;		goto ENDkey2_
;	}
;	else
;	{
		EventMsg("이 곳은 분배되지 않은 길드의 엠포리아입니다. 아직 아무도 들어갈 수 없습니다.")
		QuestTeleport(1,61,297) ; 집앞으로 이동
		SendSound(0,0161)
		goto ENDkey2_
;	}
:ENDkey2_
end


@Event00010	; 3등급 길드집
;	IsInvHavePC(10095) ; 열쇠 번호
	GetGuild()
	if(yes == 228)	; 테스트서버 버전
	{
		EventMsg(" 환영합니다. 이 곳은 <캇셀프라임> 길드 엠포리아 입니다...")
		goto ENDkey3_
	}
	else
	{
		EventMsg("이 곳은 <캇셀프라임> 길드의 엠포리아입니다. <캇셀프라임> 길드원만이 들어갈 수 있습니다.")
		QuestTeleport(1,234,341) ; 집앞으로 이동
		SendSound(0,0161)
		goto ENDkey3_
	}
:ENDkey3_
end

@Event00011
	IsInvHavePC(10062) ; 오크 심장 번호
	if(yes == 1)
	{
		EventMsg("고대 비밀 지역으로 이동합니다.")
		QuestTeleport(1,359,28) ; 비밀지역 이동
		SetItemInvPC(10062,0,0)
		goto ENDsecret1_
	}
	else
	{
		goto ENDsecret1_
	}
:ENDsecret1_
end

@Event00012		
	EventMsg("비밀 지역에서 밖으로 이동합니다.")
	QuestTeleport(1,327,83) ; 비밀지역에서 밖으로 이동
end

@Event00013		
end
@Event00014		
end
@Event00015		
end
@Event00016		
end
@Event00017		
end
@Event00018		
end
@Event00019		
end








