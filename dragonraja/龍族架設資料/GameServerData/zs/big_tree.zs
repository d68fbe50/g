
@sys00	; 처음 서버 Setting하는 함수.

	MaxNPC( 50 )
	MapName( "big_tree" )
	
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

	CheckNation(6)
	if(yes==1)
	{
		goto END1020_
	}
	else
	{
		goto END1002_
	}
	

:END1002_

	LocalWarMode()
	if(yes==1) ; 전쟁모드인 경우
	{
		EventMsg("침입자는 일스 공국 <붉은 산맥>으로 이동할 수 없습니다.")
		goto END1099_
	}
	else
	{
		goto END1003_
	}

:END1003_

	CompFriendShip(6,5)
	if( yes >= 0 )
	{
		EventMsg("당신은 일스 적대수치(NK)가 높아 일스지역을 이동할 수 없습니다.")
		goto END1099_
	}
	if( yes < 0 )
	{
		goto END1020_
	}
	

:END1020_

	MapMove( "west", 707, 278 )
	if( yes == 1 )
	{
		EventMsg("붉은 산맥으로 이동합니다. ")
	}
	else
	{
		EventMsg("맵 이동에 실패했습니다.")
	}	
	goto END1099_
	

:END1099_

end

@Event00002	; 엠포리아 캐슬 안
	EventMsg("이동합니다.")
	QuestTeleport(1,645,51)
end
@Event00003	
	QuestTeleport(1,372,367)
end
@Event00004
	QuestTeleport(1,372,367)
end
@Event00005
	QuestTeleport(1,372,367)
end
@Event00006	
	CheckNation(6)
	if(yes==1)
	{
		goto END1620_
	}
	else
	{
		goto END1602_
	}
	
:END1602_

	LocalWarMode()
	if(yes==1) ; 전쟁모드인 경우
	{
		goto END1603_
	}
	else
	{
		goto END1605_
	}

:END1603_

	CheckAllSealStoneBroked(6)
	if(yes==1)
	{
		goto END1620_
	}
	else
	{
		EventMsg("결계석의 보호로 들어갈 수가 없습니다.")
		goto END1699_
	}



:END1604_



:END1605_ ; 일스 적대 수치 체크


	CompFriendShip(6,5)
	if( yes >= 0 )
	{
		EventMsg("당신은 일스 공국의 적대수치(NK)가 높아 일스 공국으로 이동하실 수가 없습니다.")
		goto END1699_
	}
	if( yes < 0 )
	{
		goto END1620_
	}


:END1620_

	MapMove( "Sedless", 2, 18 )
	if( yes==1)
	{
		EventMsg("일스공국의 <세들레스>로 이동합니다.")
	}
	else
	{
		EventMsg("맵 이동에 실패했습니다.")		
	}	
	goto END1699_
	
:END1699_


end


@Event00007	; 대초원
	MapMove( "big_g", 714, 156 )
	if( yes == 1 )
	{
		EventMsg("대초원으로 이동합니다.")
	}
	else
	{
		EventMsg("맵 이동에 실패했습니다.")
	}
end
@Event00008	; 엠포리아 하우스
	IsMyGuildHouse(8)
	if(yes == 1)
	{
		EventMsg(" 환영합니다. 이 곳은  길드 엠포리아 입니다...")
		goto ENDemp08_
	}
	else
	{
		EventMsg("이 곳은  길드의 엠포리아입니다.  길드원만이 들어갈 수 있습니다.")
		SendSound(0,0161)
		goto ENDemp08_
	}
:ENDemp08_

end


@Event00009	; 엠포리아 하우스
	IsMyGuildHouse(9)
	if(yes == 1)
	{
		EventMsg(" 환영합니다. 이 곳은  길드 엠포리아 입니다...")
		goto ENDemp09_
	}
	else
	{
		EventMsg("이 곳은  길드의 엠포리아입니다.  길드원만이 들어갈 수 있습니다.")
		SendSound(0,0161)
		goto ENDemp09_
	}
:ENDemp09_

end

@Event00010	; 엠포리아 하우스
	IsMyGuildHouse(10)
	if(yes == 1)
	{
		EventMsg(" 환영합니다. 이 곳은  길드 엠포리아 입니다...")
		goto ENDemp10_
	}
	else
	{
		EventMsg("이 곳은  길드의 엠포리아입니다.  길드원만이 들어갈 수 있습니다.")
		SendSound(0,0161)
		goto ENDemp10_
	}
:ENDemp10_

end
@Event00011	; 엠포리아 하우스
	IsMyGuildHouse(11)
	if(yes == 1)
	{
		EventMsg(" 환영합니다. 이 곳은  길드 엠포리아 입니다...")
		goto ENDemp11_
	}
	else
	{
		EventMsg("이 곳은  길드의 엠포리아입니다.  길드원만이 들어갈 수 있습니다.")
		SendSound(0,0161)
		goto ENDemp11_
	}
:ENDemp11_

end
@Event00012	; 엠포리아 하우스
	IsMyGuildHouse(12)
	if(yes == 1)
	{
		EventMsg(" 환영합니다. 이 곳은  길드 엠포리아 입니다...")
		goto ENDemp12_
	}
	else
	{
		EventMsg("이 곳은  길드의 엠포리아입니다.  길드원만이 들어갈 수 있습니다.")
		SendSound(0,0161)
		goto ENDemp12_
	}
:ENDemp12_

end
@Event00013	; 엠포리아 하우스
	IsMyGuildHouse(13)
	if(yes == 1)
	{
		EventMsg(" 환영합니다. 이 곳은  길드 엠포리아 입니다...")
		goto ENDemp13_
	}
	else
	{
		EventMsg("이 곳은  길드의 엠포리아입니다.  길드원만이 들어갈 수 있습니다.")
		SendSound(0,0161)
		goto ENDemp13_
	}
:ENDemp13_

end
@Event00014	; 엠포리아 하우스
	IsMyGuildHouse(14)
	if(yes == 1)
	{
		EventMsg(" 환영합니다. 이 곳은  길드 엠포리아 입니다...")
		goto ENDemp14_
	}
	else
	{
		EventMsg("이 곳은  길드의 엠포리아입니다.  길드원만이 들어갈 수 있습니다.")
		SendSound(0,0161)
		goto ENDemp14_
	}
:ENDemp14_

end
@Event00015	; 엠포리아 하우스
	IsMyGuildHouse(15)
	if(yes == 1)
	{
		EventMsg(" 환영합니다. 이 곳은  길드 엠포리아 입니다...")
		goto ENDemp15_
	}
	else
	{
		EventMsg("이 곳은  길드의 엠포리아입니다.  길드원만이 들어갈 수 있습니다.")
		SendSound(0,0161)
		goto ENDemp15_
	}
:ENDemp15_

end
@Event00016	; 엠포리아 하우스
	IsMyGuildHouse(16)
	if(yes == 1)
	{
		EventMsg(" 환영합니다. 이 곳은  길드 엠포리아 입니다...")
		goto ENDemp16_
	}
	else
	{
		EventMsg("이 곳은  길드의 엠포리아입니다.  길드원만이 들어갈 수 있습니다.")
		SendSound(0,0161)
		goto ENDemp16_
	}
:ENDemp16_

end
@Event00017	; 엠포리아 하우스
	IsMyGuildHouse(17)
	if(yes == 1)
	{
		EventMsg(" 환영합니다. 이 곳은  길드 엠포리아 입니다...")
		goto ENDemp17_
	}
	else
	{
		EventMsg("이 곳은  길드의 엠포리아입니다.  길드원만이 들어갈 수 있습니다.")
		SendSound(0,0161)
		goto ENDemp17_
	}
:ENDemp17_

end
@Event00018	; 엠포리아 하우스
	IsMyGuildHouse(18)
	if(yes == 1)
	{
		EventMsg(" 환영합니다. 이 곳은  길드 엠포리아 입니다...")
		goto ENDemp18_
	}
	else
	{
		EventMsg("이 곳은  길드의 엠포리아입니다.  길드원만이 들어갈 수 있습니다.")
		SendSound(0,0161)
		goto ENDemp18_
	}
:ENDemp18_

end
@Event00019	; 엠포리아 캐슬 안
	EventMsg("이동합니다.")
	QuestTeleport(1,695,65)	
end








