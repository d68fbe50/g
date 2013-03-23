
@sys00	; 처음 서버 Setting하는 함수.

	MaxNPC( 50 )
	
	MapName( "Nation3" )
	
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
	EventMsg("북쪽 섬 지역으로 올라갑니다.")
	QuestTeleport(1,101,53)	
end
@Event00002	
	EventMsg("비밀 동굴 지역으로 이동합니다.")
	QuestTeleport(1,157,420)	
end
@Event00003	
	EventMsg("남쪽 섬 지역으로 올라갑니다.")
	QuestTeleport(1,302,347)
end
@Event00004	
	EventMsg("비밀 동굴 지역으로 이동합니다.")
	QuestTeleport(1,177,441)
end
@Event00005
	CheckDefence()
	if(yes==1)
	{	
		EventMsg("성 안으로 올라갑니다.")
		QuestTeleport(1,191,114)
	}	
	else
	{
		EventMsg("침입자는 성 안으로 들어갈 수 없습니다.")
	}

end
@Event00006	
	EventMsg("남쪽 탄광 지역으로 이동합니다.")
	QuestTeleport(1,112,391)
end
@Event00007	
	EventMsg("북쪽 탄광 지역으로 이동합니다.")
	QuestTeleport(1,56,228)
end
@Event00008
	CheckDefence()
	if(yes==1)
	{
		EventMsg("성 안의 비밀 지하 동굴 지역으로 내려갑니다.")
		QuestTeleport(1,184,395)
	}
	else
	{
		EventMsg("침입자는 비밀 지하 동굴로 내려갈 수 없습니다.")
	}
end
@Event00009	
	CanGoBonus()  ; 보너스 맵으로 갈 수 있는가?
	if(yes==1)
	{
		FameCheck(1050)  ; Fame x 이상이면(x 포함)
		if(yes==1)
		{
			EventMsg("Horizon 비밀 지역을 통과하는 조건에 맞습니다. 비밀 지역으로 이동합니다.")
			QuestTeleport(1,217,23)
		}
		else
		{
			EventMsg("명성(Fame)이 1050 이 되야 통과할 수 있습니다.")
			QuestTeleport(1,129,230)
		}
	}
	else
	{
		EventMsg("Horizon 비밀 지역이 닫혀 있어 이동할 수가 없습니다.")
		QuestTeleport(1,129,230)
	}

end
@Event00010	
	EventMsg("남쪽 지하 탄광 지역으로 내려갑니다.")
	QuestTeleport(1,151,352)
end
@Event00011
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
@Event00012	
	EventMsg("북쪽 지하 탄광 지역으로 내려갑니다.")
	QuestTeleport(1,39,217)
end
@Event00013	
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
@Event00014
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
	}
			
	
end
@Event00015	
	EventMsg("성 안으로 이동합니다.")
	QuestTeleport(1,129,230)
end
@Event00016
	FameCheck(1100)   ; Fame x 이상이면
	if(yes==1)
	{
		FameDown(100)
		EventMsg("비밀 지역 3층으로 이동합니다. 명성(Fame) 100이 내려갑니다.")
		QuestTeleport(1,317,132)
	}
	else
	{
		EventMsg("명성(Fame)이 1100 이 되야 통과할 수 있습니다. 2층부터는 통과할 때마다 명성이 깎이게 됩니다.")
	}
	

end
@Event00017	
	EventMsg("성 안으로 이동합니다.")
	QuestTeleport(1,129,230)
end
@Event00018
	FameCheck(1050)   ; Fame x 이상이면
	if(yes==1)
	{
		FameDown(50)
		EventMsg("비밀 지역 2층으로 이동합니다. 명성(Fame) 50이 내려갑니다")
		QuestTeleport(1,287,62)
	}
	else
	{
		EventMsg("명성(Fame)이 1050 이 되야 통과할 수 있습니다. 2층부터는 통과할 때마다 명성이 깎이게 됩니다.")
	}

end
@Event00019	

end
