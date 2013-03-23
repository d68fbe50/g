
@sys00	; 처음 서버 Setting하는 함수.

	MaxNPC( 50 )
	
	MapName( "Nation1" )
	
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
	CheckDefence() ; 방어 국가인가?
	if(yes==1)
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
	else
	{
		EventMsg("당신은 침입자입니다... 이동할 수가 없습니다..")
		QuestTeleport(1,127,120)
	}
	

end
@Event00002		
	CanGoBonus()  ; 보너스 맵으로 갈 수 있는가?
	if(yes==1)
	{
		FameCheck(1050)  ; Fame x 이상이면(x 포함)
		if(yes==1)
		{
			EventMsg("Moon 비밀 지역을 통과하는 조건에 맞습니다. 비밀 지역으로 이동합니다.")
			QuestTeleport(1,15,115)
		}
		else
		{
			EventMsg("명성(Fame)이 1050 이 되야 통과할 수 있습니다.")
		}

	}
	else
	{
		EventMsg("Moon 비밀 지역이 닫혀 있어 이동할 수가 없습니다.")
	}


end
@Event00003		
	EventMsg("성밖의 서쪽 지점으로 이동합니다.")
	QuestTeleport(1,240,298)		
end
@Event00004		
	EventMsg("성밖의 동쪽 지점으로 이동합니다.")
	QuestTeleport(1,320,254)		
end
@Event00005		
	EventMsg("성 안으로 이동합니다.")
	QuestTeleport(1,71,168)	
end
@Event00006		
	FameCheck(1050)   ; Fame x 이상이면
	if(yes==1)
	{
		FameDown(50)
		EventMsg("비밀 지역 2층으로 이동합니다. 명성(fame) 50이 내려갑니다.")
		QuestTeleport(1,69,47)
	}
	else
	{
		EventMsg("명성(Fame)이 1050 이 되야 통과할 수 있습니다. 2층부터는 통과할 때마다 명성이 깎이게 됩니다.")
	}

end
@Event00007
	FameCheck(1100)   ; Fame x 이상이면
	if(yes==1)
	{
		FameDown(100)
		EventMsg("비밀 지역 3층으로 이동합니다. 명성(fame) 100이 내려갑니다")
		QuestTeleport(1,12,19)
	}
	else
	{
		EventMsg("명성(Fame)이 1100 이 되야 통과할 수 있습니다. 2층부터는 통과할 때마다 명성이 깎이게 됩니다.")
	}
	
end
@Event00008
	CheckDefence() ; 방어 국가인가?
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
@Event00009
	CheckDefence() ; 방어 국가인가?
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

@Event00010
	CheckDefence() ; 방어 국가인가?
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
@Event00011	
	EventMsg("성 안으로 이동합니다.")
	QuestTeleport(1,71,168)	
end
@Event00012
	EventMsg("비밀 지역 1층으로 이동합니다.")
	QuestTeleport(1,47,71)	
end
@Event00013
	EventMsg("비밀 지역 2층으로 이동합니다.")
	QuestTeleport(1,127,19)	
end
@Event00014
	CheckDefence()  ; 방어 국가인가?
	if(yes==1)
	{
		EventMsg("성 안으로 들어갑니다.")
		QuestTeleport(1,155,218)
	}
	else
	{
		EventMsg("적국의 사람은 포탈을 이용할 수 없습니다.")
	}
end
@Event00015
	CheckDefence()  ; 방어 국가인가?
	if(yes==1)
	{
		EventMsg("성 안으로 들어갑니다.")
		QuestTeleport(1,215,159)
	}
	else
	{
		EventMsg("적국의 사람은 포탈을 이용할 수 없습니다.")
	}
end
@Event00016
end
@Event00017
	QuestTeleport(1,130,125)
	EventMsg("갈 수 없는 지역으로 이동할려고 했습니다.")

end
@Event00018
	CheckDefence()
	if(yes==1)
	{
		EventMsg("이 길은 침입자는 통과할 수 없는 곳입니다. 성밖으로 나가실 때 적군을 조심하시기 바랍니다.")
	} 
	else
	{
		QuestTeleport(1,47,272)
		EventMsg("침입자는 이 길을 통과할 수 없습니다.")
	}

end
@Event00019		
	CheckDefence()
	if(yes==1)
	{
		EventMsg("이 길은 침입자는 통과할 수 없는 곳입니다. 성밖으로 나가실 때 적군을 조심하시기 바랍니다.")
	}
	else
	{
		QuestTeleport(1,290,43)
		EventMsg("침입자는 이길을 통과할 수 없습니다.")
	}

end








