
@sys00	; 처음 서버 Setting하는 함수.

	MaxNPC( 50 )
	
	MapName( "GRAY" )
	
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
	random(0,2)
	if(ran == 0)
	{ 
		D( "돈만준다면  철을 이용해서 만들수 있는 것은 뭐든지 팔지. 또한 그 기술도 가르쳐 주지." );
	}
	if(ran == 1)
	{ 
		D( "이곳 가까이에는 인공던젼이 있소. 인공던젼은 이 근쳐의 던젼중에서 가장 위험한 곳이죠." );
	}
	if(ran == 0)
	{ 
		D( "인공 던젼은 드워프의 귀신들이 지키고 있어서 들어가기도 힘들고 들어간다해도 다시 돌아나올수가 없어." );
	}
	CallSmallMenu( 0, 18 )

end
@Npc00003	
	random( 0, 2 )
	if( ran == 0 )
	{
	D( "여기는 술을 마시며 이야기를 나눌 수 있는 곳이지." );
	}
	if( ran == 1 )
	{
	D( "전장에 임하기 전에 술 한잔 어때요. 맨정신에 던젼을 들어가는건 미친짓이야. " );
	}

	CallSmallMenu( 0, 57 )	
end
@Npc00004	

	D("병에 걸렸다면 이곳에서 치료를 해줄수 있습니다.")
	CallSmallMenu( 0, 63 ) ;

		
end
@Npc00005	

D("가까스로 집을 마련했는데 이게 뭐람 몬스터가 우글 거리니 살수가 없군.")

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
	CallSmallMenu( 0, 71 )	
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
end
@Npc00027	
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
;; 푸줏간

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
;; 빵집
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
; 주점
	CallSmallMenu( 0, 57 )
end

@Npc00032	
; 목공소
	CallSmallMenu( 0, 26 )	
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
; 약초점
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
@Npc00041
; hint

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
	D("코스모스와 대폭풍의 에델브로이 이름이 당신에게 축복을 내려줄것입니다.")
	CallSmallMenu( 0, 73 )	
end





@Event00000
end
@Event00001		
end


@Event00002
;; 불의던전 1층
	MapMove( "Firedun2", 204,198 )
	if( yes == 1 )
	{
		EventMsg("<불의던전>으로 이동합니다.")
	}
	else
	{
		EventMsg("맵 이동에 실패했습니다.")
	}
end


@Event00003
	CheckNation(4); 자이펀이면.
	if( yes==1)
	{
		IsInvHavePC(10071)
		if(yes == 1)
		{
		IsInvHavePC(10065)
		if(yes == 1)
		{
		IsInvHavePC(10068)
		if(yes == 1)
		{
			SetItemInvPC(10071,0,0)
			SetItemInvPC(10065,0,0)
			SetItemInvPC(10068,0,0)
			MapMove( "MA-IN", 197,9 )
	        	EventMsg("바이서스 헬턴트 마을을 침입합니다..")
		        SendSound(0,2061)
		}
		else
		{
			EventMsg("3종류의 수호석 <바이서스 빛>(노랑,초록, 빨강)이 필요합니다.")
		}
		}
		else
		{
			EventMsg("3종류의 수호석 <바이서스 빛>(노랑,초록, 빨강)이 필요합니다.")
		}
		}
		else
		{
			EventMsg("3종류의 수호석 <바이서스 빛>(노랑,초록, 빨강)이 필요합니다.")
		}
		goto END12_           
	}
		
	MapMove( "MA-IN", 197,9 )
:END12_
end


@Event00004	

end


@Event00005		
	MapMove( "K_SUNG2", 8,241 )
	if( yes == 1 )
	{
		EventMsg("헬턴트성으로 이동합니다. ")
	}
	else
	{
		EventMsg("맵 이동에 실패했습니다.")
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








