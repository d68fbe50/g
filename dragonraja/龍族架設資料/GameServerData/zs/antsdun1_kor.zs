
@sys00	; 처음 서버 Setting하는 함수.

	MaxNPC( 50 )
	
	MapName( "antsdun1" )
	
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
@Npc00004	; 여관주인
	random( 0, 2 )
	if( ran == 0 )
	{
	D( "편안한 휴식과 수면을 하면 Life와 Health가 올라가지요." );
	}
	if( ran == 1 )
	{
	D( "마법사라면 메모라이즈를 위해서 수면이 꼭 필요합니다. " );
	}
        CallSmallMenu( 0, 67 )
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
@Npc00011	; 퀘스트를 준다.
	random( 0, 2 )
	if( ran == 0 )
	{
	D( "비밀통로를 알고있는 사람이 있을텐데..." );
	}
	if( ran == 1 )
	{
	D( "옛 보물이 숨겨져 있는 비밀의 장소가 있다는 전설이... " );
	}
end
@Npc00012	; 숨겨진 던전 입구의 힌트를 준다.
	random( 0, 2 )
	if( ran == 0 )
	{
	D( "여기 어딘가에 옛 비밀통로가 있을텐데..." );
	}
	if( ran == 1 )
	{
	D( "그 쪽 동굴 벽을 잘 더듬어보게나..." );
	}
end
@Npc00013	; 아저씨
	random( 0, 2 )
	if( ran == 0 )
	{
	D( "당신은 모험가인가? 무얼 찾아 여기까지 오셨소?" );
	}
	if( ran == 1 )
	{
	D( "여기를 함부로 지나다니면, 위험하네.. 부디 몸조심하기를.." );
	}
end
@Npc00014	; 남자애
	random( 0, 2 )
	if( ran == 0 )
	{
	D( "우리 마을은 대대로 이 곳을 지키며 살아왔대요..." );
	}
	if( ran == 1 )
	{
	D( "우리들은 항상 누군가를 기다리고 있어요... " );
	}
end
@Npc00015	; 여자애
	random( 0, 2 )
	if( ran == 0 )
	{
	D( "우리들은 항상 당신같은 영웅을 기다리고 있었어요..." );
	}
	if( ran == 1 )
	{
	D( "당신은 어디에서 온 모험가인가요?  " );
	}
end
@Npc00016	; 아줌마
	random( 0, 2 )
	if( ran == 0 )
	{
	D( "요즘 들어 외부인들이 많이 찾아오는데, 당신은 어디에서 왔나?" );
	}
	if( ran == 1 )
	{
	D( "당신은 마법을 할 줄 아나요? " );
	}
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
	if( yes == 1 )
	{
		IsLevel(50)		; 50레벨 제한
		if( yes == 1)
		{
			MapMove( "tynen", 401,223 )
			EventMsg("타이넨으로 이동합니다.")
			QuestSound(15007)
		}
		else
		{
			EventMsg("맵 이동에 실패했습니다.")
		}
	}
	else
	{
		EventMsg("이곳은 자이펀의 도시 타이넨입니다. 타이넨은 Lv. 50부터 들어갈 수 있습니다.")
		QuestSound(15007)
	}	
end
@Event00001
	if( yes == 1 )
	{
		IsLevel(70)		; 70레벨 제한
		if( yes == 1)
		{
			MapMove( "dep", 233,481 )
			EventMsg("디프유벤으로 이동합니다.")
			QuestSound(15007)
		}
		else
		{
			EventMsg("맵 이동에 실패했습니다.")
		}
	}
	else
	{
		EventMsg("이곳은 자이펀의 수도 디프유벤입니다. 디프유벤은 Lv. 70부터 들어갈 수 있습니다.")
		QuestSound(15007)
	}	

end
@Event00002	; 처음 시작지점
	QuestTeleport(1,144,531)
end
@Event00003		
	QuestTeleport(1,178,690)
end
@Event00004	; 마지막 도착지점

end
@Event00005	
	QuestTeleport(1,284,697)
end
@Event00006		
	QuestTeleport(1,446,709)
end
@Event00007		
	QuestTeleport(1,703,600)
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








