
@sys00	; 처음 서버 Setting하는 함수.

	MaxNPC( 50 )
	
	MapName( "castle2" )
	
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
@Npc00002	;경기참여
	IsPlayArenaGame(4)
	if(yes==1)
	{
		D(" 아직 한참 싸우고 있는 중이야. 조금만 기다려. ")
		EventMsg(" 경기가 끝나지 않아 참가하실 수 없습니다. ")
	}
	else 
	{
	IsLevel(10)
	if( yes == 1) 
	{
		CmpQuestNumStep(49,1)
		if(yes==0) {
			D("  경기에 참가하려고? 자네 겜블 스톤이라고 들어봤나? 많은 인원이 참여해서 승리하게 되면 겜블 스톤이 주어지지..  ")
			SetQuestNumStep(49,1)
			goto END2_
		}
		if(yes==1) 
		{
			D("  겜블 스톤을 가지고 겜블을 하게 되면 다양한 아이템을 얻을 수 있다는군.. 혹시 아나 자네에게 최강의 무기가 주어질지...  ")
			SetQuestNumStep(49,2)
			goto END2_
		}
		if(yes==2) 
		{
			D("겜블을 하려면 콜로서스 아레나 집 안에 (117,110) (87,81) 좌표로 가보게나.. 거기서 겜블하는 방법을 알려줄 것이네..")
			SetQuestNumStep(49,0)
			CallSmallMenu(4,80)
			goto END2_
		}
	}
	else 
	{
		random( 0 , 2 )
		if( ran == 0 ) 
		{
			D("   길드전이 오픈되었습니다.. 어? 아직 실력이 부족하군.. 레벨 10이상은 되어야 참가할 수 있다네.   ")
		}
		if( ran == 1 ) 
		{
			D("   당신은 길드전 참가가 안됩니다.. 레벨 10이상이 되어야 합니다...   ")
		}
	}
	}
:END2_	
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
	MapMove("G_battle",178,88)
	if( yes == 1) {
	EventMsg("<<콜로서스 아레나>>로 이동합니다.")
	goto ENDEVENT2_
	}
	else {
	EventMsg("맵 이동에 실패했습니다.")
	goto ENDEVENT2_
}
:ENDEVENT2_
end
@Event00002
end
@Event00003	
end
@Event00004		
end
@Event00005		
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








