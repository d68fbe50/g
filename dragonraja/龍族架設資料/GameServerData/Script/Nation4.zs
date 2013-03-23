
@sys00	; 처음 서버 Setting하는 함수.

	MaxNPC( 50 )
	
	MapName( "Nation4" )
	
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
;; 마을이동
NationBelong(); 1성 소속?
	if(yes==2)
	{
		EventMsg("당신은 적국에 침입할려고 합니다.. 이동할 수가 없습니다..")
	}
	else
	{
		CheckNation(3); 바이서스이면.
		if( yes==1)
		{
			EventMsg("헬턴트 마을로 이동합니다.")
			MapMove("Ma-in",245,115)
        		}
		else
		{
			CheckNation(4); 자이펀이면
			if( yes==1)
			{
	        			EventMsg("레너스시로 이동합니다.")
				MapMove("Renes_c",210,175)
			}
			else
			{
				CheckNation(6); 일스이면
				if( yes==1)
				{
		               		EventMsg("바란탄으로 이동합니다.")
					MapMove("Barantan",325,98)
				}
			}
		}
	}
		
end
@Event00002
;; 1성 --> 성외부
EventMsg("성외부로 나갑니다.")
QuestTeleport( 1,97,175 )
end
@Event00003	
;; 1성 --> 성외부
EventMsg("성외부로 나갑니다.")
QuestTeleport( 1,184,99 )
end
@Event00004	
;; 성외부 --> 1성내부
NationBelong()
	if(yes==1)
	{	
    		QuestTeleport( 1,53,133 )
  		EventMsg("성 안으로 들어갑니다.")
	}	
	else
	{
		EventMsg("침입자는 성 안으로 들어갈 수 없습니다.")
	}

end
@Event00005
;; 성외부 --> 1성내부
NationBelong()
	if(yes==1)
	{	
    		QuestTeleport( 1,124,51 )
  		EventMsg("성 안으로 들어갑니다.")
	}	
	else
	{
		EventMsg("침입자는 성 안으로 들어갈 수 없습니다.")
	}

end
@Event00006	
;; 마을이동
NationBelong(); 2성 소속?
	if(yes==1)
	{
		EventMsg("당신은 적국에 침입할려고 합니다.. 이동할 수가 없습니다..")
	}
	else
	{
		CheckNation(3); 바이서스이면.
		if( yes==1)
		{
			EventMsg("헬턴트 마을로 이동합니다.")
			MapMove("Ma-in",245,115)
        		}
		else
		{
			CheckNation(4); 자이펀이면
			if( yes==1)
			{
	        			EventMsg("레너스시로 이동합니다.")
				MapMove("Renes_c",210,175)
			}
			else
			{
				CheckNation(6); 일스이면
				if( yes==1)
				{
		               		EventMsg("바란탄으로 이동합니다.")
					MapMove("Barantan",325,98)
				}
			}
		}
	}
		
end
@Event00007
;; 2성 --> 성외부
EventMsg("성외부로 나갑니다.")
QuestTeleport(1,309,182 )
end
@Event00008
;; 2성 --> 성외부
EventMsg("성외부로 나갑니다.")
QuestTeleport(1,399,94 )
end
@Event00009
;; 성외부 --> 2성내부
NationBelong()
	if(yes==2)
	{	
    		QuestTeleport( 1,266,134 )
  		EventMsg("성 안으로 들어갑니다.")
	}	
	else
	{
		EventMsg("침입자는 성 안으로 들어갈 수 없습니다.")
	}

end
@Event00010
;; 성외부 --> 2성내부
NationBelong()
	if(yes==2)
	{	
    		QuestTeleport( 1,336,51 )
  		EventMsg("성 안으로 들어갑니다.")
	}	
	else
	{
		EventMsg("침입자는 성 안으로 들어갈 수 없습니다.")
	}

end
@Event00011
;; 비밀지역1 지역으로 이동
CanGoBonus()  ; 보너스 맵으로 갈 수 있는가?
	if(yes==1)
	{
		QuestTeleport( 1,129,235 )
 		EventMsg("<비밀지역1>으로 이동합니다.")
	}
	else
	{
		EventMsg("이동에 실패했습니다.")
	}
	
end
@Event00012
;; 설원전쟁터로 이동
QuestTeleport( 1,254,129 )
	if( yes == 1)
	{
		EventMsg("<설원전쟁터>로 이동합니다.")
	}
	else
	{
		EventMsg("맵 이동에 실패했습니다.")
	}
	
end
@Event00013
;; 비밀지역2 지역으로 이동
QuestTeleport( 1,311,302 )
	if( yes == 1)
	{
		EventMsg("비밀지역2으로 이동합니다.")
	}
	else
	{
		EventMsg("맵 이동에 실패했습니다.")
	}
	
end
@Event00014
;; 비밀지역1 지역으로 이동
QuestTeleport( 1,129,235 )
	if( yes == 1)
	{
		EventMsg("비밀지역1으로 이동합니다.")
	}
	else
	{
		EventMsg("맵 이동에 실패했습니다.")
	}
	
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
