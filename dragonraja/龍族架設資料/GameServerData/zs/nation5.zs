
@sys00	; 처음 서버 Setting하는 함수.

	MaxNPC( 50 )
	
	MapName( "nation5" )
	
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
@Event00002	;;nation5 boss area entrance_event box1
CanGoBonus()
if(yes==1)
{
	DualCheck(4)
	if(yes==1)
	{
			;;BossTimerCheck(87,501,510,11,3600,1200,3)	;;20040313 몬스터 그룹 97
			;;if(yes==0)
			;;{
			;;	EventMsg("현재 다른 유저가 전투 중입니다.")	
			;;	LogForScript(75,"dual 4_5 quest-nation5_boss area entrance_At personnel excess while waiting")
			;;}
			;;if(yes==1)
			;;{
			;;	EventMsg("현재 다른 유저가 전투 중입니다.")	
			;;	LogForScript(75,"dual 4_5 quest-nation5_boss area entrance_With hour limit while waiting")
			;;}
			;;if(yes>0)
			;;		{
						ScriptTimer(0,"hegmonia",517,496)	
						EventMsg("아무르타트가 기다리고 있는 방으로 들어갑니다.")
						QuestTeleport(1,565,544)
						LogForScript(75,"dual 4_5 quest-nation5-boss area enter")
			;;		}
	};;웅 20040520 수정
else
	{
		EventMsg("듀얼 클래스 4차만 들어갈 수 있습니다.")
		CheckNation(3)
		if(yes==1)
		{
			EventMsg("헬턴트 마을로 이동합니다.")
			MapMove("MA-IN", 245,115)
		}
		else
		{	
			CheckNation(4)
			if(yes==1)
			{
				EventMsg("레너스 마을로 이동합니다.")
				MapMove("RENES_C",210,175)
			}
			else
			{
				EventMsg("바란탄으로 이동합니다.")
				MapMove("BARANTAN",325,98)
			}
			}
	}
}
else
{
	EventMsg("아직 국가전이 끝나지 않았습니다.")
}
end
@Event00003	;;nation5 boss area
random(0,3)
if(ran==0)
{
	EventMsg("그깟 몬스터 몇 마리 쓰러뜨리고서 우쭐대지 마라!")
}
if(ran==1)
{
	EventMsg("스스로의 의지로 온 것인가? 아니면 드래곤 로드가 보낸 것인가?")
}
if(ran==2)
{
	EventMsg("내 검을 원한다고? 여기 있으니 가져가라. 단 나를 쓰러뜨려야 한다!")
}
end
@Event00004	;;nation5 boss item check
IsInvHavePC(10289)	;;20040303 10289 아무르타트의 검
if(yes==1)
{
	EventMsg("아무르타트의 검을 얻었습니다.")
	QuestTeleport(1,456,436)
	LogForScript(75,"dual 4_5 quest-get rita's long sword ")
}
end
@Event00005	;;nation5 boss area exit
IsInvHavePC(10289)
if(yes==1)
{
	MapMove("hegmonia",517,496)
	BossTimerCheck(87,501,510,7,0,0,2)	;;20040302 타임은 0,0 마지막 변수가 2면 모두 초기화
	EventMsg("아무르타트의 방에서 나갑니다.")
	ScriptTimer(0,"0",0,0)		
}
else
{
	EventMsg("아무르타트의 검을 얻지 못했습니다.")
	MapMove("hegmonia",517,496)
	BossTimerCheck(87,501,510,7,0,0,2)	;;20040302 타임은 0,0 마지막 변수가 2면 모두 초기화
	ScriptTimer(0,"0",0,0)
}
end
@Event00006		
end
@Event00007		
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

