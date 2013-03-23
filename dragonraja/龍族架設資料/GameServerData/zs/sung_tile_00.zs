
@sys00	; 처음 서버 Setting하는 함수.

	MaxNPC( 20 )


	MapName( "Sung_Tile_00" )
	
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


	if( RECALL_SCRIPT_COUNT == 0 )
	{
		D( "뭐 .. 물건사게?" )
		RecallScrpStart( 1, 10 )
		goto END_
	}
	if( RECALL_SCRIPT_COUNT == 1 )
	{
		D( "뭐 .. 물건사게? 2 " )
		RecallScrpStart( 2, 10 )
		goto END_
	}
	if( RECALL_SCRIPT_COUNT == 2 )
	{
		D( "한번 골라봐.. " )
		CallSmallMenu( 3, 60 )
		RecallScrpEnd();
		goto END_
	}
	


;	MapMove( "ice-w01", 45, 145 );

	

	CallSmallMenu( 0, 60 )
	

;	IsLevel( 5 )
;	if( yes == 1 )
;	{
;		D( "음.. 당신의 Level이 5가 념는군.." )
;		goto END
;	}
;	else
;	{
;		D(" 뭐야.. 렙이 5도 안되는 병신같은 놈이군..." );
;
;	}




:END_

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





@Event00000
	MapMove( "K_Sung2", 317, 10 )
end


@Event00001		
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








