
@sys00	; 처음 서버 Setting하는 함수.

	MaxNPC( 50 )
	
	MapName( "b_desert" )
	
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
@Event00001	; 칼라일 외부

	MapMove( "Kal_os", 369,343 )
	if( yes == 1 )
	{
		EventMsg("칼라일 외부로 이동합니다.")
		SendSound(0,2061)
	}
	else
	{
		EventMsg("맵 이동에 실패했습니다.")
	}

end
@Event00002	; 타이넨
	CheckNation(6)
	if( yes==1 )
	{
		IsInvHavePC(10158)
		if(yes==1)
		{
			EventMsg("자이펀의 마을입니다. 자이펀 출입증을 회수하겠습니다.")
			goto END121_
		}
		else
		{
			EventMsg("일스인이 자이펀로 들어가기 위해서는 자이펀 출입증이 필요합니다.")
			goto END12_
		}
	}
:END121_		
	IsLevel(31)		; 31레벨 제한
	if( yes == 1)
	{
		MapMove( "tynen", 700,12 )
		if( yes == 1 )
		{
			SetItemInvPC(10158,0,0)
			EventMsg("타이넨으로 이동합니다.")
			SendSound(0,2061)
		}
		else
		{
			EventMsg("맵 이동에 실패했습니다.")
		}
	}
	else
	{
		EventMsg("이곳은 자이펀의 도시 타이넨입니다. 타이넨은 Lv. 31부터 들어갈 수 있습니다.")
		SendSound(0,2061)
	}	
:END12_
end
@Event00003	; 엠포리아 하우스
	IsMyGuildHouse(3)
	if(yes == 9292)
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
	if(yes == 9292)
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
	if(yes == 9292)
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
	if(yes == 9292)
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
	if(yes == 9292)
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
@Event00008		
end
@Event00009		
end

@Event00010		
end
@Event00011		
end
@Event00012		
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








