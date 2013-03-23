
@sys00	; 처음 서버 Setting하는 함수.

	MaxNPC( 50 )
	MapName( "big_valley" )
	
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

@Event00001	; 세들레스
	MapMove( "sedless", 355,270 )
	if( yes == 1 )
	{
		EventMsg("세들레스로 이동합니다. ")
	}
	else
	{
		EventMsg("맵 이동에 실패했습니다.")
	}
end

@Event00002	; 엠포리아 캐슬
	IsMyGuildHouse(2)
	if(yes == 1)
	{
		EventMsg(" 환영합니다. 이 곳은  길드의 엠포리아 입니다...")
		goto ENDemp02_
	}
	else
	{
		EventMsg("이 곳은  길드의 엠포리아입니다.  길드원만이 들어갈 수 있습니다.")
		SendSound(0,0161)
		goto ENDemp02_
	}
:ENDemp02_

end
@Event00003	; 엠포리아 하우스
	IsMyGuildHouse(3)
	if(yes == 1)
	{
		EventMsg(" 환영합니다. 이 곳은  길드 엠포리아 입니다...")
		goto ENDemp03_
	}
	else
	{
		EventMsg("이 곳은  길드의 엠포리아입니다.  길드원만이 들어갈 수 있습니다.")
		SendSound(0,0161)
		goto ENDemp03_
	}
:ENDemp03_

end
@Event00004	; 엠포리아 하우스
	IsMyGuildHouse(4)
	if(yes == 1)
	{
		EventMsg(" 환영합니다. 이 곳은  길드 엠포리아 입니다...")
		goto ENDemp04_
	}
	else
	{
		EventMsg("이 곳은  길드의 엠포리아입니다.  길드원만이 들어갈 수 있습니다.")
		SendSound(0,0161)
		goto ENDemp04_
	}
:ENDemp04_

end
@Event00005	; 엠포리아 하우스
	IsMyGuildHouse(5)
	if(yes == 1)
	{
		EventMsg(" 환영합니다. 이 곳은  길드 엠포리아 입니다...")
		goto ENDemp05_
	}
	else
	{
		EventMsg("이 곳은  길드의 엠포리아입니다.  길드원만이 들어갈 수 있습니다.")
		SendSound(0,0161)
		goto ENDemp05_
	}
:ENDemp05_

end
@Event00006	; 엠포리아 하우스
	IsMyGuildHouse(6)
	if(yes == 1)
	{
		EventMsg(" 환영합니다. 이 곳은  길드 엠포리아 입니다...")
		goto ENDemp06_
	}
	else
	{
		EventMsg("이 곳은  길드의 엠포리아입니다.  길드원만이 들어갈 수 있습니다.")
		SendSound(0,0161)
		goto ENDemp06_
	}
:ENDemp06_

end
@Event00007	; 엠포리아 하우스
	IsMyGuildHouse(7)
	if(yes == 1)
	{
		EventMsg(" 환영합니다. 이 곳은  길드 엠포리아 입니다...")
		goto ENDemp07_
	}
	else
	{
		EventMsg("이 곳은  길드의 엠포리아입니다.  길드원만이 들어갈 수 있습니다.")
		SendSound(0,0161)
		goto ENDemp07_
	}
:ENDemp07_

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
@Event00013	; 엠포리아 캐슬 안
	EventMsg("이동합니다.")
	QuestTeleport(1,414,546)
end
@Event00014	; 엠포리아 캐슬 안
	EventMsg("이동합니다.")
	QuestTeleport(1,364,529)
end
@Event00015
;; 대계곡 --> 나우르첸
	MapMove( "Naurchen", 360,9 )
	if( yes == 1 )
	{
		EventMsg("나우르첸으로 이동합니다. ")
	}
	else
	{
		EventMsg("맵 이동에 실패했습니다.")
	}
end
@Event00016		
end
@Event00017		
end
@Event00018		
end
@Event00019		
end








