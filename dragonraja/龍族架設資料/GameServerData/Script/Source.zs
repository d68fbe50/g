
@sys00 ; 처음 서버 Setting하는 함수.

        MaxNPC( 50 )
        
        MapName( "Source" )
        
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
	random(0,3)
        if( ran == 0 ) 
        {
        	D( "이곳은 강으로 둘러 쌓여 있기 때문에 물고기가 많지.")
       	}       
        if( ran == 1 )
        {
		D( "숲 깊은 곳까지 가면  온갖 몬스터 들이 우글거리니 조심하는게  좋아요. 특히 오크의 마을도 있으니까 더욱 그렇지 ." )          
	}
	if( ran == 2 )
	{
	        D( "얼음 던젼으로 가려면 다리를 여러번 건너야해 ." )             
	}
	CallSmallMenu( 0, 28 )

end

@Npc00002    
	random(0,3)
	if(ran == 0)
	{ 
 	       D( "돈만준다면  철을 이용해서 만들수 있는 것은 뭐든지 팔지. 또한 그 기술도 가르쳐 주지." );
	}
	if(ran == 1)
	{ 
        	D( "이곳 가까이에는 얼음 던젼이 있소. 용사들은 여기서  무기를 준비해서 그곳에 들어 가지 당신도 무기가 필요하지 않나요?." );
	}
	if(ran == 3)
	{ 
        	D( "얼음 던젼에 들어가서 많은 돈을 번 사람도 있지만,  대부분이 금새 죽어서 나오지 ." );
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
        	D( "전장에 임하기 전에 술 한잔 어때요. 맨정신에 던젼을 들어가는건 미친짓이야." );
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
; 오크마을 오크
end
@Npc00008   
; 오크마을 오크 

end
@Npc00009    
; 오크마을 오크
end

@Npc00010    
; 오크마을 오크
        
end
@Npc00011    

;       D( "테페리 기숙사 " );
        
end
@Npc00012    

;       D( "레티 기숙사 " );

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
        D( "Butchering Skill이 있으면 죽은 동물에게서 고기와 가죽을 얻을 수 있습니다." 
);
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
        D( "세상에는 보이지 않는 힘이 존재하는데 이를 대자연의 힘  이라고 부르지...  " 
);
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
;       CallSmallMenu( 0, 21 )  
end
@Npc00027    
;       D( "농가3" );
;       CallSmallMenu( 0, 19 )  

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
;       D( "푸줏간2" );

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
;       D( "빵집2" ); 식당 인터페이스 다음 대사 랜덤
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

	CheckNation(3)
	if(yes==1)
	{
		goto END1120_
	}
	else
	{
		goto END1102_
	}
	

:END1102_

	LocalWarMode()
	if(yes==1) ; 전쟁모드인 경우
	{
		EventMsg("침입자는 바이서스 얼음던전으로 이동할 수 없습니다.")
		goto END1199_
	}
	else
	{
		goto END1103_
	}

:END1103_

	CompFriendShip(3,5)
	if( yes >= 0 )
	{
		EventMsg("당신은 바이서스 적대수치(NK)가 높아 바이서스로 이동할 수 없습니다.")
		goto END1199_
	}
	if( yes < 0 )
	{
		goto END1120_
	}
	


:END1120_

;; 얼음던전 1층
;; 출입조건 Level 31~60
	sGetLevel()
	if( yes >= 31 )
	{
		if( yes <= 60 )
		{
			MapMove( "Ice-w02", 209,82 )
			if( yes == 1 )
			{
				EventMsg("<얼음던전>으로 이동합니다.")
			}
			else
			{
				EventMsg("맵 이동에 실패했습니다.")
			}
		}
		else	; 레벨 31 이상 61 이상
		{
			EventMsg("이 곳은 레벨 31 ~ 60 인 영웅들만 출입할 수 있는 곳입니다. 당신은 레벨이 높군요.")
		}
	}
	else	; 레벨 31 미만
	{
		EventMsg("이 곳은 레벨 31 ~ 60 인 영웅들만 출입할 수 있는 곳입니다. 당신은 아직 레벨이 낮군요.")
	}
	goto END1199_
	
:END1199_



end


@Event00002
	MapMove( "Hu_vm", 10,321 )
	if( yes==1 )
	{
		EventMsg( "휴다인 계곡으로 이동합니다." )
	}
	else
	{
		EventMsg( "맵 이동에 실패했습니다." )
	}
	
end


@Event00003

	CheckNation(3)
	if(yes==1)
	{
		goto END1320_
	}
	else
	{
		goto END1302_
	}
	

:END1302_

	LocalWarMode()
	if(yes==1) ; 전쟁모드인 경우
	{
		EventMsg("침입자는 바이서스 헬턴트 마을로 이동할 수 없습니다.")
		goto END1399_
	}
	else
	{
		goto END1303_
	}

:END1303_

	CompFriendShip(3,5)
	if( yes >= 0 )
	{
		EventMsg("당신은 바이서스 적대수치(NK)가 높아 바이서스로 이동할 수 없습니다.")
		goto END1399_
	}
	if( yes < 0 )
	{
		CheckNation(4)
		if(yes==1)
		{
			EventMsg("자이펀은 적대 국가 이므로 마을로 이동할 수 없습니다.")
			goto END1399_
		}
		goto END1320_
	}
	

:END1320_

        MapMove( "Ma-in", 43, 347 )
	if( yes==1)
	{
		EventMsg("바이서스 헬턴트 마을로 이동합니다.")
	}
	else
	{
		EventMsg("맵 이동에 실패했습니다.")		
	}	
	goto END1399_
	

:END1399_


end

@Event00004

	CheckNation(3)
	if(yes==1)
	{
		goto END1420_
	}
	else
	{
		goto END1402_
	}
	

:END1402_

	LocalWarMode()
	if(yes==1) ; 전쟁모드인 경우
	{
		EventMsg("침입자는 바이서스 황무지로 이동할 수 없습니다.")
		goto END1499_
	}
	else
	{
		goto END1403_
	}

:END1403_

	CompFriendShip(3,5)
	if( yes >= 0 )
	{
		EventMsg("당신은 바이서스 적대수치(NK)가 높아 바이서스 지역을 이동할 수 없습니다.")
		goto END1499_
	}
	if( yes < 0 )
	{
		CheckNation(4)
		if(yes==1)
		{
			EventMsg("자이펀은 적대 국가 이므로 황무지로 이동할 수 없습니다.")
			goto END1499_
		}
		goto END1420_
	}
	

:END1420_

	MapMove( "Desert2", 10, 12 )
	if( yes==1)
	{
		EventMsg("바이서스 황무지로 이동합니다.")
	}
	else
	{
		EventMsg("맵 이동에 실패했습니다.")		
	}	
	goto END1499_
	

:END1499_


end
@Event00005
	EventMsg("고대 비밀 지역으로 이동합니다.")
	QuestTeleport(1,40,297) ; 비밀지역 이동
end

@Event00006		
	EventMsg("비밀 지역에서 밖으로 이동합니다.")
	QuestTeleport(1,192,43) ; 비밀지역에서 밖으로 이동
end

@Event00007	; 엠포리아 하우스
	IsMyGuildHouse(7)
	if(yes == 1)
	{
		EventMsg(" 환영합니다. 이 곳은  길드 엠포리아 입니다...")
		goto ENDemp07_
	}
	else
	{
		EventMsg("이 곳은  길드의 엠포리아입니다.  길드원만이 들어갈 수 있습니다.")
		SendSound(0,0161)
		goto ENDemp07_
	}
:ENDemp07_ 
        
end
@Event00008	; 엠포리아 캐슬 안
	EventMsg("이동합니다.")
	QuestTeleport(1,79,40)
       
end
@Event00009	; 엠포리아 캐슬 안
	EventMsg("이동합니다.")
	QuestTeleport(1,28,27)
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








