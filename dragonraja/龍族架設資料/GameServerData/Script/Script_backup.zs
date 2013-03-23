
@sys00	; 처음 서버 Setting하는 함수.

	MaxNPC( 50 )

	MapName( "Ma-In" )

	
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



;	D( " 내가 누구냐교 묻지 마세요..." )

;:*사람일 경우 다음 대사 랜덤 

	random(0,13) ; 두수 사이의 랜덤수 받아 오기 

	if( ran == 0 ) 
	{
	D( "코스모스와 대폭풍의 에델브로이 이름으로" )
	}
	if( ran == 1 ) 
	{
	D( "인간의 생명력은 매우 짧아... 그러나 에델브로이라면 이것이 가능할지도" )
	}
	if( ran == 2 ) 
	{
	D( "자신이 두 개중 한 개를 선택해야할 입장이라면 테페리 신전으로 가보세요." )
	}
	if( ran == 3 ) 
	{
	D( "부활하려면 '코스모스와 대폭풍의 에델브로이 이름으로'라고 외치면 된데.." )
	}
	if( ran == 4 ) 
	{
	D( "자네 혹시 은행이 어디 있는지 아나?" )
	}
	if( ran == 5 ) 
	{
	D( "은행은 마을 분수대쯤 있었지 아마." )
	}
	if( ran == 6 ) 
	{
	D( "은행은 마을 중앙 분수대 근처에 있지 " )   
	}
	if( ran == 7 ) 
	{
	D( "이곳이 헬턴트 마을 입니다." )
	}
	if( ran == 8 ) 
	{
	D( "마을 밖으로 나가면 강한 몬스터들이 우굴거리지 당신이 용사라면 그들을 꼭 무찔러줘" )
	}
	if( ran == 9 ) 
	{
	D( "각 길드에서는 다른 물건을 사고 팔수도 있지." )
	}
	if( ran == 10 ) 
	{
	D( "북쪽으로 가면 성이 있지, 그곳은 경비병들이 쫙 깔려 있지.")
	}
	if( ran == 11 ) 
	{
	D( "마을 밖으로 나가면 던젼이 있는데 아무나 들어 갈수 있 는곳은 아니거든.")
	}	
	if( ran == 12 )
	{
	D( "죽은 사람은 에델브로이 신전에서 부활시켜준다는 전설이 있었지.." )		
	}
end

@Npc00001

	random( 0 , 3 )
	if( ran == 0 )
	{
	D( "코스모스와 대폭풍의 에델브로이 신전입니다. " );
	}
	if( ran == 1 )
	{
        D( "죽은자에게 부활의 권능을 행할수 있는 곳입니다." );
	}
	if( ran == 2 )
	{
        D( "코스모스와 대폭풍의 에델브로이 이름으로 ." );
	}
end
@Npc00002	

;	D( "테페리 신전." );

end
@Npc00003	

;	D( "레티 신전." );
	
end
@Npc00004	

; 학술원...
	
	if( RECALL_SCRIPT_COUNT == 0 )
	{
		D( "수준높은 지식을 알려 주길 원하나 ?" );
		RecallScrpStart( 1, 2 )
		goto END_
	}
	if( RECALL_SCRIPT_COUNT == 1 )	
	{
		RecallScrpEnd();
		CallSmallMenu( 3, 60 )
	}


:END_


		
end
@Npc00005	

;	D( "수준높은 지식을 알려 주길 원하나?" );
;	CallSmallMenu( 0, 13 )	 틀렸음
;의료원
	D("병에 걸렸다면 이곳에서 치료를 해줄수 있습니다.")
	CallSmallMenu( 0, 63 ) ;
; 의료원 인터페이스 호출
end

@Npc00006	
;	if( RECALL_SCRIPT_COUNT == 0 )
;	{
;		D( "수준높은 지식을 알려 주길 원하나 ?" );
;		RecallScrpStart( 1, 2 )
;		goto END_
;	}
;	if( RECALL_SCRIPT_COUNT == 1 )	
;	{
;		RecallScrpEnd();
;		CallSmallMenu( 3, 60 )
;	}

; 이곳은 마을 회관

	D("헬턴트에서 할 수 있는 일에 대해 알려드리죠")
;	마을 회관 인터페이스 호출
	CallSmallMenu( 0, 29 )	

end

@Npc00007	
	random( 0, 2 );
	if( ran == 0 )
	{
	D( "이곳은 마을 식량창고라구" );
	}
	if( ran == 1 )
	{
	D( "어이... 식량창고를 지키자구" );
	}
end
@Npc00008   
	D( "이곳은 마을 식량창고라구" );
	

end
@Npc00009	

; 은행
	D( "어서 오세요 이곳은 헬턴트 은행입니다. 예금,출금,대출, 경매가 가능하죠 " );
	CallSmallMenu( 0, 13 )

end

@Npc00010	

;	D( "에델브로이 기숙사 " );
	
end
@Npc00011	

;	D( "테페리 기숙사 " );
	
end
@Npc00012	

;	D( "레티 기숙사 " );

end
@Npc00013	
; 여관 다음 대사 랜덤
	
	random( 0, 2 )
	if( ran == 0 )
	{
	D( "편안한 휴식과 수면을 하면 Life와 Health가 올라 가지요." );
	}
	if( ran == 1 )
	{
	D( "마법사라면 메모라이즈를 위해서 수면이 꼭 필요합니다. " );
	}
	
	CallSmallMenu( 0, 67 )

end
@Npc00014	
; 빵집 식당 인터페이스 다음대사 랜덤
	random( 0, 3 )
	if( ran == 0 )
	{
	D("다양한 요리가 준비되어 있습니다.")
	}	
	if( ran == 1)
	{
	D("멀리 길을 떠나는 사람이 라면 미리 준비할 필요가 있지요.")
	}	
	if( ran == 2 )
	{
	D( "Health를 올려주는 음식과 그 음식을 만들 수 있는 기술을 가르쳐 줍니다. " );
	}
	CallSmallMenu( 0, 20 )
end
@Npc00015	
; 주점	인터페이스,  다음메뉴 랜덤 발생 
	random( 0, 2 )
	if( ran == 0 )
	{
	D( "여기는 술을 마시며 이야기를 나눌 수 있는 곳이지." );
	}
	if( ran == 1 )
	{
	D( "이 술집을 모르고 헬턴트를 말할순 없을걸. 자 어떤 메뉴를 주문하시 겠소" );
	}

	CallSmallMenu( 0, 57 )	
end
@Npc00016
; 방어구점	
	D( "여긴 전문적으로 방어구를 파는 곳이지만 철로 만든물건은 뭐든지 팔고 삽니다. " );
; 대장간 인터페이스 
	CallSmallMenu( 0, 18 )
		
end
@Npc00017	
; 대장간 인터페이스 
	D( "돈만준다면  철을 이용해서 만들수 있는 것은 뭐든지 팔지. 또한 그 기술도 가르쳐 주지." );
	CallSmallMenu( 0, 18 )
end
@Npc00018   
; 무기점 인터페이스 없음
	D( "팔물건도 없고 살도 돈도 없어서, 이 길드는 장사를 하지 않지, Mining 스킬이 있다면 철광석을 캐와서 대장간에 팔수도 있는데.." );
	CallSmallMenu( 0, 18 )	
end
@Npc00019
; 상점 	상점 인터페이스 
	D( "다른 길드에서 팔지 않는다면 이곳에 다있지 자 한번 골라 보시게" );
	CallSmallMenu( 0, 60 )	
	
end

@Npc00020	
; 양초 제작소 인터페이스 
; 다음 대사 랜덤 발생
	random( 0, 2 )
	if( ran == 0 )
	{
	D( "던젼에서 양초만큼 필요한 도구는 없음 겁니다.  " );
	}
	if( ran == 1 )
	{
        D( " 마을 외부로 나가면 던젼이 있는데 그곳에선 양초가 제몫을 하죠.")  
	}
	CallSmallMenu( 0, 23 )	

end
@Npc00021	
; 푸줏간 인터페이스 
	random( 0, 2 )
	if( ran == 0 )
	{
	D( "Butchering Skill이 있으면 죽은 동물에게서 고기와 가죽을 얻을 수 있습니다." );
	}
	if( ran == 0 )
	{
	D( "동물의 시체는 보기 흉해도, 인간에게 좋은 먹거리라오.")
	}
	CallSmallMenu( 0, 22 )	
end

@Npc00022	
; 목공소 목공소 인터페이스 
	D( "나무꾼들이 베어온 나무로 무기와 가구, 도구를 만들 수 있습니다." );
	CallSmallMenu( 0, 26 )	
end
@Npc00023	
; 마법사 길드 , 마법책 인터터페이스 
; 다음 대사 랜덤 발생
	D( "세상에는 보이지 않는 힘이 존재하는데 이를 대자연의 힘 이라고 부르지...  " );

end
@Npc00024	
; 농가1  다음 대사 랜덤
	random( 0, 2 )
	if( ran == 0 )
	{
	D( "땅에서 나는 모든 산물은 그랑엘베르의 영광이 깃들어 있지 " );
 	}
	if( ran == 1)
	{
	D( "남에 집에 함부로 들어 오는 법이 어디있소" );
	}     
	CallSmallMenu( 0, 19 )	
end
@Npc00025	
	random( 0, 2 )
	if( ran == 0 )
	{
	D( "이렇게 누추한곳을 와주다니 정말 반갑소" );
	}
	if( ran == 1 )
	{
	D( "돈이 좀 있으면 이곳보다 큰 집을 짓고 싶구려" );
	}

	CallSmallMenu( 0, 19 )	
end
@Npc00026
; 나무꾼집 나무꾼 인터페이스 다음 대사 랜덤
	random( 0, 2 )
	if( ran == 0 )
	{
	D( "헬턴트의 울창한 숲은 언제나 우리의 생계를 책임져 주는 곳이죠. " );
	}
	if( ran == 1 )
	{
        D( "비가 풍부하고 햇빛이 좋은 헬턴트는 언제나 숲이 울창합니다. " );
	}
	CallSmallMenu( 0, 21 )	
end
@Npc00027	
;	D( "농가3" );
;	CallSmallMenu( 0, 19 )	

; 인터페이스 없음 다음대사 랜덤
	random( 0, 2 )
	if( ran == 0 )
	{
	D( "땅에서 나는 모든 산물은 그랑엘베르의 영광이 깃들어 있지 " );
	}
	if( ran == 1 )
	{
	D( "남에 집에 함부로 들어 오는 법이 어디있소" );
	}
	CallSmallMenu( 0, 19 )	
      
end
@Npc00028   
; 
;	D( "푸줏간2" );

	random( 0, 2 )	
	if( ran == 0 )
	{
	D( " 동물의 시체는 보기 흉해도, 인간에게 좋은 먹거리라오.")
	}
	if( ran == 1 )
	{
	D( " 동물의 가죽은 가볍고 강한 Leather를 만드는 재료가 됩니다." )
	}
	CallSmallMenu( 0, 22 )	
end
@Npc00029	
;	D( "빵집2" ); 식당 인터페이스 다음 대사 랜덤
	random( 0, 2 )
	if( ran == 0 )
	{
	D("다양한 요리가 준비되어 있습니다.")
	}
	if( ran == 1 )
	{
	D("멀리 길을 떠나는 사람이 라면 미리 준비할 필요가 있지요.")
	}

	CallSmallMenu( 0, 20 )	
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
;@Npc00049	
;원래 50번은 zs화일에 없었음 
;
;
; D("코스모스와 대폭풍의 에델브로이 이름이 당신에게 축복을 내려줄것입니다.")
;end



@Event00000

	MapMove( "Source", 354,4 )


end
@Event00001		

	MapMove( "K_Sung2", 333,218 )


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








