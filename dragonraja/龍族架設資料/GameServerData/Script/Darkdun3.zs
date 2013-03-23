
@sys00	; 처음 서버 Setting하는 함수.

	MaxNPC( 50 )
	
	MapName( "DarkDun3" )
	
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
;; 포탈 (170,75)
	random(1,7)
	if(ran == 1)
	{		
		MapMove( "Darkdun2", 196,66 )	
	}
	if(ran == 2)
	{		
		MapMove( "Darkdun3", 139,121 )	
	}
	if(ran == 3)
	{		
		MapMove( "Darkdun3", 92,151 )	
	}
	if(ran == 4)
	{		
		MapMove( "Darkdun3", 204,110 )	
	}
	if(ran == 5)
	{		
		MapMove( "Darkdun3", 183,154 )	
	}
	if(ran == 6)
	{		
		MapMove( "Darkdun3", 128,184 )	
	}
	if(ran == 7)
	{		
		MapMove( "Darkdun2", 196,66 )	
	}	
	if( yes == 1)
	{
		EventMsg("어둠의 던전 3층으로 이동합니다.")
	}
	else
	{
		EventMsg("맵 이동에 실패했습니다.")
	}
end

@Event00002
;; 포탈 (135,119)
	random(1,7)
	if(ran == 1)
	{		
		MapMove( "Darkdun3", 174,76 )	
	}
	if(ran == 2)
	{		
		MapMove( "Darkdun2", 196,66 )	
	}
	if(ran == 3)
	{		
		MapMove( "Darkdun3", 92,151 )	
	}
	if(ran == 4)
	{		
		MapMove( "Darkdun3", 204,110 )	
	}
	if(ran == 5)
	{		
		MapMove( "Darkdun3", 183,154 )	
	}
	if(ran == 6)
	{		
		MapMove( "Darkdun3", 128,184 )	
	}
	if(ran == 7)
	{		
		MapMove( "Darkdun2", 196,66 )	
	}		
	if( yes == 1)
	{
		EventMsg("어둠의 던전 3층으로 이동합니다.")
	}
	else
	{
		EventMsg("맵 이동에 실패했습니다.")
	}
end


@Event00003	
;; 포탈 (89,150)
	random(1,7)
	if(ran == 1)
	{		
	MapMove( "Darkdun3", 174,76 )	
	}
	if(ran == 2)
	{		
	MapMove( "Darkdun3", 139,121 )	
	}
	if(ran == 3)
	{		
	MapMove( "Darkdun2", 196,66 )	
	}
	if(ran == 4)
	{		
	MapMove( "Darkdun3", 204,110 )	
	}
	if(ran == 5)
	{		
	MapMove( "Darkdun3", 183,154 )	
	}
	if(ran == 6)
	{		
	MapMove( "Darkdun3", 128,184 )	
	}
	if(ran == 7)
	{		
	MapMove( "Darkdun2", 196,66 )	
	}
	if( yes == 1)
	{
		EventMsg("어둠의 던전 3층으로 이동합니다.")
	}
	else
	{
		EventMsg("맵 이동에 실패했습니다.")
	}
end


@Event00004		
;; 포탈 (201,109)
	random(1,7)
	if(ran == 1)
	{		
	MapMove( "Darkdun3", 174,76 )	
	}
	if(ran == 2)
	{		
	MapMove( "Darkdun3", 139,121 )	
	}
	if(ran == 3)
	{		
	MapMove( "Darkdun3", 92,151 )	
	}
	if(ran == 4)
	{		
	MapMove( "Darkdun2", 196,66 )	
	}
	if(ran == 5)
	{		
	MapMove( "Darkdun3", 183,154 )	
	}
	if(ran == 6)
	{		
	MapMove( "Darkdun3", 128,184 )	
	}
	if(ran == 7)
	{		
	MapMove( "Darkdun2", 196,66 )	
	}
	if( yes == 1)
	{
		EventMsg("어둠의 던전 3층으로 이동합니다.")
	}
	else
	{
		EventMsg("맵 이동에 실패했습니다.")
	}
end
@Event00005		
;; 포탈 (180,153)
	random(1,7)
	if(ran == 1)
	{		
	MapMove( "Darkdun3", 174,76 )	
	}
	if(ran == 2)
	{		
	MapMove( "Darkdun3", 139,121 )	
	}
	if(ran == 3)
	{		
	MapMove( "Darkdun3", 92,151 )	
	}
	if(ran == 4)
	{		
	MapMove( "Darkdun3", 204,110 )	
	}
	if(ran == 5 )
	{		
	MapMove( "Darkdun2", 196,66 )	
	}
	if(ran == 6)
	{		
	MapMove( "Darkdun3", 128,184 )	
	}
	if(ran == 7 )
	{		
	MapMove( "Darkdun2", 196,66 )	
	}
	if( yes == 1)
	{
		EventMsg("어둠의 던전 3층으로 이동합니다.")
	}
	else
	{
		EventMsg("맵 이동에 실패했습니다.")
	}
end
@Event00006		
;; 포탈 (124,182)
	random(1,7)
	if(ran == 1)
	{		
	MapMove( "Darkdun3", 174,76 )	
	}
	if(ran == 2)
	{		
	MapMove( "Darkdun3", 139,121 )	
	}
	if(ran == 3)
	{		
	MapMove( "Darkdun3", 92,151 )	
	}
	if(ran == 4)
	{		
	MapMove( "Darkdun3", 204,110 )	
	}
	if(ran == 5)
	{		
	MapMove( "Darkdun3", 183,154 )	
	}
	if(ran == 6)
	{		
	MapMove( "Darkdun2", 196,66 )	
	}
	if(ran == 7)
	{		
	MapMove( "Darkdun2", 196,66 )	
	}
	if( yes == 1)
	{
		EventMsg("어둠의 던전 3층으로 이동합니다.")
	}
	else
	{
		EventMsg("맵 이동에 실패했습니다.")
	}
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








