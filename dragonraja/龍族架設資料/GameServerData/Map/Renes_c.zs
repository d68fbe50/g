@sys00 ; 처음 서버 Setting하는 함수.

        MaxNPC( 50 )
        MapName( "Renes_c" )

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
;; 경비대원들
 	sGetNat(); 바이서스면.
        if( yes==3)
        {
                D( " 이제 이 곳은 바이서스가 아냐..." )
                goto ENDnation_
        }
        random( 0, 2 )
        if( ran == 0 )
        {
		D("누군가 당신에게 해를 끼친다면 우리에게 신고 하시오.")
        }
        if( ran == 1 )
        {
		D("레너스시는 너무 넓어서 치안이 힘들죠.")
        }
end

@Npc00001
;; 마을회관
 	sGetNat(); 바이서스면.
        if( yes==3)
        {
                D( " 이제 이 곳은 바이서스가 아냐..." )
                goto ENDnation_
        }
        random( 0, 3 )
        if( ran == 0 )
        {
        D("부귀와 영화의 도시 레너스에 온 것을 환영하오.")
        }
        if( ran == 1 )
        {
        D("이제 레너스시는 우리 자이펀의 도시야...")
        }
        if( ran == 2 )
        {
        D("우리 시는 정말로 재정이 튼튼했는데, 지금은 전쟁때문에 군비로 다나가버려...")
        }
        CallSmallMenu( 0, 29 ); 마을회관
end

@Npc00002
 	sGetNat(); 바이서스면.
        if( yes==3)
        {
                D( " 이제 이 곳은 바이서스가 아냐..." )
                goto ENDnation_
        }
; 점성술사
        random( 0, 3 );
        if( ran == 0 )
        {
        D( "세상에는 보이지 않는 힘이 존재하는데 이를 마나라고 부르지...  " );
        }
        if( ran == 1 )
        {
        D("마법사의 마법을 배울수 있는 사람은 여기서 마법을 배워야 한다오.")
        }
        if( ran == 2 )
        {
        D("이제 cell은 더 이상 받지 않는다네. 은행에서 crit으로 바꿀 수 있다네..")
        }
        CallSmallMenu( 0, 71 ) ; 마법사 길드 , 마법책 인터터페이스 
end

@Npc00003
; 레티신전
        D( "당신은 지금 레티 신전에 오셨습니다. 예배에 참석하면 신앙심이 많이 올라갈꺼요." );
        CallSmallMenu( 0, 75 ); 레티신전
end

@Npc00004
 	sGetNat(); 바이서스면.
        if( yes==3)
        {
                D( " 이제 이 곳은 바이서스가 아냐..." )
                goto ENDnation_
        }
	random( 0, 2 ) 
	if( ran == 0 ) 
	{
		D( "이젠 더 편리하게 포탈이동을 할 수 있지만, 전쟁 중 국가 자원을 유지하기 위해 작은 사용료를 지불하셔야합니다." ) 
	}
	if( ran == 1 ) 
	{
		D( "언제든 찾아오시면 원하시는 곳으로 이동해 드리겠습니다. 작은 사용료가 있지만, 예전보다는 훨씬 편할 것입니다." ) 
	}
        IsLevel(11)
        if( yes == 1)
        {
		CallMenu( 39 )
        }
        else
        {
        	EventMsg("이 포탈은 레벨 11부터 사용할 수 있습니다..")
        	SendSound(0,2061)
	}
end
@Npc00005
;; 연금술소
 	sGetNat(); 바이서스면.
        if( yes==3 )
        {
                D( " 이제 이 곳은 바이서스가 아냐..." )
                goto ENDnation_
        }
        random( 0, 3 )
        if( ran == 0 )
        {
        D(" 어떤 미친 연금술사는 철로 금을 만들려고 시도했었다더군...  히히히히 그게 바로 나야.")
        }
        if( ran == 1 )
        {
        D(" 포션의 재료는 약초라구. 약초만 있으면 포션을 얼마든지 만들수 있지.")
        }
        if( ran == 2 )
        {
        D("후세사람들에게 말해주게. 세상은 4가지 원소로 이루어져 있지...")
        }       
        CallSmallMenu( 0, 25 ) ; 연금술소
end

@Npc00006
;; 무기점
 	sGetNat(); 바이서스면.
        if( yes==3)
        {
                D( " 이제 이 곳은 바이서스가 아냐..." )
                goto ENDnation_
        }
        random( 0, 2 )
        if( ran == 0 )
        {
        D( "난 대장장이라오. 요즘은 전쟁중이라 무기를 많이 만들어야 한다네..." );
        }
        if( ran == 1 )
        {
        D( "전쟁물자때문에 더 이상 고급 물건들은 팔 것이 없네..." );
        }
        CallSmallMenu( 0, 18 ); 대장간
end

@Npc00007    ;길드원리스트 열기
 	sGetNat(); 바이서스면.
        if( yes==3)
        {
                D( " 이제 이 곳은 바이서스가 아냐..." )
                goto ENDnation_
        }
	D("길드에 소속되어 계시다면, 제가 길드원 리스트를 보여드리지요.")
	CallMenu(24)
end

@Npc00008
;자이펀 지도보기
 	sGetNat()
	if(yes==4)
	{
		CmpQuestNumStep(49,123)
		if(yes==2)
		{
			D("나는 당신의 몬스터 사냥을 도와주려고 지도를 준비했네..")
			SetQuestNumStep(49,121)
			goto ENDmonmap_
		}
		CmpQuestNumStep(49,121)
		if(yes==0)
		{
			D("나는 당신의 몬스터 사냥을 도와주려고 지도를 준비했네..")
			SetQuestNumStep(49,121)
			goto ENDmonmap_
		}
		CmpQuestNumStep(49,121)
		if(yes==1)
		{
			D("레너스시에서 몬스터가 나타나는 곳이네..")
			sCallCustomSmallMenu(280,8,436,437,900)	;레너스시 몬스터 지도
			EventMsg("이것은 레너스시의 주요 사냥터입니다. 다음은 칼라일마을의 주요 사냥터를 볼 수 있습니다.")
			SetQuestNumStep(49,122)
			goto ENDmonmap_
		}
		CmpQuestNumStep(49,122)
		if(yes==1)
		{
			D("칼라일마을에서 주요 몬스터 사냥터 지역입니다.")
			sCallCustomSmallMenu(280,5,436,428,900)	;칼라일 몬스터 지도
			EventMsg("이것은 칼라일마을의 주요 사냥터입니다. 다음은 레너스 외부의 주요 사냥터를 볼 수 있습니다.")
			SetQuestNumStep(49,123)
			goto ENDmonmap_
		}
		CmpQuestNumStep(49,123)
		if(yes==1)
		{
			D("레너스 외부의 오크마을은 사람들이 자주 찾는 사냥터입니다.")
			sCallCustomSmallMenu(280,9,436,423,900)	;레너스외부 몬스터 지도
			EventMsg("이것은 레너스 외부의 주요 사냥터입니다. 처음부터 다시 보고 싶다면, 다시 클릭해주세요..")
			SetQuestNumStep(49,124)
			goto ENDmonmap_
		}
	}
	else
	{
		random(0,2)
		if(ran==0)
		{
			D("당신은 다른 나라에서 오신 분이군요..")
			goto ENDmonmap_
		}
		if(ran==1)
		{
			D("타국인에게는 말할 수 없는 기밀이 있습니다.")
			goto ENDmonmap_
		}
	}
:ENDmonmap_

end

@Npc00009
;; 대장간
 	sGetNat(); 바이서스면.
        if( yes==3)
        {
                D( " 이제 이 곳은 바이서스가 아냐..." )
                goto ENDnation_
        }
        random(0,3)
        if( ran == 0 )
        {
        D( "돈만준다면  철을 이용해서 만들수 있는 것은 뭐든지 팔지. 또한 그 기술도 가르쳐 주지." );
        }
        if( ran == 1 )
        {
        D( "철광석을 얻기 위해서는 곡괭이와 mining 스킬이 있어야만 해. 이곳에서 그 기술을 가르쳐주지.")
        }
        if( ran == 2 )
        {
        D( "전쟁때문에 여기저기에서 암살이나 범죄가 끊이지 않아. 조심하게나...")  
        }
        CallSmallMenu( 0, 18 ); 대장간
end

@Npc00010
;; 농장
 	sGetNat(); 바이서스면.
        if( yes==3)
        {
                D( " 이제 이 곳은 바이서스가 아냐..." )
                goto ENDnation_
        }
        random( 0, 3 )
        if( ran == 0 )
        {
	        D( "땅에서 나는 모든 산물은 시무니안의 영광이 깃들어 있지 " );
        }
        if( ran == 1)
        {
	        D( "가축을 길러보고 싶지는 않은가? 아님 밭을 일구어 작물을 기를수도 있고..." );
        }     
        if( ran == 2)
        {
	        D( "이제 cell은 더 이상 받지 않는다네. 은행에서 crit으로 바꿀 수 있다네.." );
        }     
        CallSmallMenu( 0, 19 ); 농장
end

@Npc00011
;; 낚시점
 	sGetNat(); 바이서스면.
        if( yes==3)
        {
                D( " 이제 이 곳은 바이서스가 아냐..." )
                goto ENDnation_
        }
        random( 0, 2 )
        if( ran == 0 )
        {
	        D( "호랑이를 잡으려면 호랑이굴로 들어가라는 말이 있지. 고래를 잡기위해선 깊은 바다로 가야해" );
        }
        if( ran == 1 )
        {
	        D( "세월을 낚는게 무슨 뜻인줄 아나?" );
        }
        CallSmallMenu( 0, 28 ); 조선소
end

@Npc00012
;; 목공소
 	sGetNat(); 바이서스면.
        if( yes==3)
        {
                D( " 이제 이 곳은 바이서스가 아냐..." )
                goto ENDnation_
        }
        random( 0, 2 )
        if( ran == 0 )
        {
        D( "나무꾼들이 베어온 나무로 무기와 가구, 도구를 만들 수 있습니다." );
        }
        if( ran == 1 )
        {
        D( "나무는 어딜가나 흔하기 때문에 굶어 죽을이는 없을꺼요. Cutting 기술을 배우는 것은 어떻소?")
        }
        CallSmallMenu( 0, 26 ); 목공소
end

@Npc00013
;; 약초점
 	sGetNat(); 바이서스면.
        if( yes==3)
        {
                D( " 이제 이 곳은 바이서스가 아냐..." )
                goto ENDnation_
        }
        D( "이 약초 냄새가 어떤가? 우린 항상 최고의 약초만을 취급한다네.." );
	CallSmallMenu( 0, 21 );약초점
end

@Npc00014
; 테페리 신전
        D( "필요한 때를 위한 작은 행운을..." );
        CallSmallMenu( 0, 74 ); 테페리 신전
end

@Npc00015
;; 푸줏간
 	sGetNat(); 바이서스면.
        if( yes==3)
        {
                D( " 이제 이 곳은 바이서스가 아냐..." )
                goto ENDnation_
        }
        random( 0, 3 )
        if( ran == 0 )
        {
	        D( "Butchering Skill이 있으면 죽은 동물에게서 고기와 가죽을 얻을 수 있습니다." );
        }
        if( ran == 1 )
        {
	        D( "요즘 자이펀 군대에 소고기를 보내느라 정신이 없다네...")
        }
        if( ran == 2 )
        {
	        D( "이제 cell은 더 이상 받지 않는다네. 은행에서 crit으로 바꿀 수 있다네.. ")
        }
        CallSmallMenu( 0, 22 ) ; 푸줏간
end

@Npc00016
;; 농장
 	sGetNat(); 바이서스면.
        if( yes==3)
        {
                D( " 이제 이 곳은 바이서스가 아냐..." )
                goto ENDnation_
        }
        random( 0, 3 )
        if( ran == 0 )
        {
	        D( "오늘은 별로 장사가 않되는군 돈만 좀 있었다면 건물을 사서 상점을 하나 차릴텐데." );
        }
        if( ran == 1 )
        {
	        D( "다른 사람도 여기서 물건을 사고 팔면 괜찮을 텐데.")
        }
        if( ran == 2 )
        {
	        D( "다른 플레이어와 아이템을 거래해 본적 있소? 그게 더 저렴한 가격에 아이템을 얻을수 있지")
        }
        CallSmallMenu( 0, 19 ); 농장
end

@Npc00017
;; 잡화점
 	sGetNat(); 바이서스면.
        if( yes==3)
        {
                D( " 이제 이 곳은 바이서스가 아냐..." )
                goto ENDnation_
        }
        D( "자 골라 보세요 없는게 없습니다. 다른데서 못 찾은 건 여기서 고르세요." )
        CallSmallMenu( 0, 60 ) ; 상점
end

@Npc00018
;길드 엠포리아 구입
 	sGetNat(); 바이서스면.
        if( yes==3)
        {
                D( " 이제 이 곳은 바이서스가 아냐..." )
                goto ENDnation_
        }
	D("길드 엠포리아를 구입하시려구요?")
	CallMenu(68)
end

@Npc00019
;; 초쟁이
 	sGetNat(); 바이서스면.
        if( yes==3)
        {
                D( " 이제 이 곳은 바이서스가 아냐..." )
                goto ENDnation_
        }
        random( 0, 3 )
        if( ran == 0 )
        {
	        D( " 던젼에서 양초만큼 필요한 도구는 없을 겁니다... " );
        }
        if( ran == 1 )
        {
	        D( " 마을 외부로 나가면 던젼이 있는데 그곳에선 양초가 제몫을 하죠. ")  
        }
        if( ran == 2 )
        {
	        D( "자이펀 군대에 보낼 양초가 아직도 모잘라...")  
        }
        CallSmallMenu( 0, 23 ) ; 양초 제작소 
end

@Npc00020
;; 여관
 	sGetNat(); 바이서스면.
        if( yes==3)
        {
                D( " 이제 이 곳은 바이서스가 아냐..." )
                goto ENDnation_
        }
        random( 0, 2 )
        if( ran == 0 )
        {
	        D( "이제 cell은 더 이상 받지 않는다네. 은행에서 crit으로 바꿀 수 있다네.." );
        }
        if( ran == 1 )
        {
	        D( "마법사라면 메모라이즈를 위해서 수면이 꼭 필요합니다. " );
        }
        CallSmallMenu( 0, 67 ); 여관
end

@Npc00021
;; 화폐개혁(은행)
 	sGetNat(); 바이서스면.
        if( yes==3)
        {
                D( " 이제 이 곳은 바이서스가 아냐..." )
                goto ENDnation_
        }
        D( " 이곳은 화폐개혁을 추진하는 곳입니다. 화폐단위가 cell에서 crit으로 바뀐 것을 선포합니다.. " );
        CallSmallMenu( 0, 78 ) 
end

@Npc00022
;; 농장
 	sGetNat(); 바이서스면.
        if( yes==3)
        {
                D( " 이제 이 곳은 바이서스가 아냐..." )
                goto ENDnation_
        }
        random( 0, 3 )
        if( ran == 0 )
        {
        D( "땅에서 나는 모든 산물은 시무니안의 영광이 깃들어 있지 " );
        }
        if( ran == 1)
        {
        D( "가축을 길러보고 싶지는 않은가? 아님 밭을 일구어 작물을 기를수도 있고..." );
        }     
        if( ran == 2)
        {
        D( "아쉽게도 이곳은 밭이 부족해서 농군으로 살아가긴 힘들겠지만 그만큼 농작물의 가격도 짭짤하지" );
        }     
        CallSmallMenu( 0, 19 ); 농장
end

@Npc00023
;; 국가 고급 아이템 상점
 	sGetNat(); 바이서스면.
        if( yes==3)
        {
                D( " 이제 이 곳은 바이서스가 아냐..." )
                goto ENDnation_
        }
	D("국가 기부금으로 운영되는 상점입니다. 돈과 명성을 통해 고급아이템을 구하실 수 있습니다.")
	CallMenu( 66 )
end

@Npc00024
	D("바람속에 흩날리는 코스모스를... 폭풍을 잠재우는 꽃잎의 영광을...")
end

@Npc00025
;; 옷가게
 	sGetNat(); 바이서스면.
        if( yes==3)
        {
                D( " 이제 이 곳은 바이서스가 아냐..." )
                goto ENDnation_
        }
        D( "마법사의 로브나 가죽 신발은 여기서만 파는 물건입니다. " );
        CallSmallMenu( 0, 24 ); 의류점
end

@Npc00026
;; 무기점
 	sGetNat(); 바이서스면.
        if( yes==3)
        {
                D( " 이제 이 곳은 바이서스가 아냐..." )
                goto ENDnation_
        }
        random( 0, 2 )
        if( ran == 0 )
        {
	        D( "난 대장장이 그랜드 마스터요 그래서 이세상 무기는 다만들 수 있거든 한번볼텐가?" );
        }
        if( ran == 1 )
        {
	        D( "이제는 좋은 몇 가지의 물건들은 다른 곳에서 구해야 할 거요..." );
        }
        CallSmallMenu( 0, 18 ); 대장간
end

@Npc00027
;; 은행
 	sGetNat(); 바이서스면.
        if( yes==3)
        {
                D( " 이제 이 곳은 바이서스가 아냐..." )
                goto ENDnation_
        }
        random( 0, 2 )
        if( ran == 0 )
        {
	        D( "어서 오세요 이곳은 레너스 은행입니다. 예금,출금,대출, 경매가 가능하죠 " );
        }
        if( ran == 1 )
        {
	        D( "다른 은행과 연결되 있어서 여기서도 당신의 물건을 찾을수 있을겁니다." );
        }
        CallSmallMenu( 0, 13 ); 은행
end

@Npc00028
;; 빵집 (시장)
 	sGetNat(); 바이서스면.
        if( yes==3)
        {
                D( " 이제 이 곳은 바이서스가 아냐..." )
                goto ENDnation_
        }
        random( 0, 4 )
        if( ran == 0 )
        {
        D("다양한 요리가 준비되어 있습니다. 여긴 시장이라서 다른곳 보다는 저렴하죠 ")
        }       
        if( ran == 1)
        {
        D("멀리 길을 떠나는 사람이 라면 미리 음식을 준비할 필요가 있지요.")
        }       
        if( ran == 2 )
        {
        D( "이제 cell은 더 이상 받지 않는다네. 은행에서 crit으로 바꿀 수 있다네.." );
        }
        if( ran == 3 )
        {
        D( "내가 원하는 요리를 직접 재료를 사다가 만든다고 생각해 보세요. " );
        }
        CallSmallMenu( 0, 20 ); 빵집
end

@Npc00029
; 무기점 (시장)
 	sGetNat(); 바이서스면.
        if( yes==3)
        {
                D( " 이제 이 곳은 바이서스가 아냐..." )
                goto ENDnation_
        }
        D( "난 아직 초보라서 멋진 검을 만들지 못하지만 곳 만들 수 있을꺼야" );
        CallSmallMenu( 0, 18 ); 대장간
end

@Npc00030
;; 주점
 	sGetNat(); 바이서스면.
        if( yes==3)
        {
                D( " 이제 이 곳은 바이서스가 아냐..." )
                goto ENDnation_
        }
        random( 0, 2 )
        if( ran == 0 )
        {
	        D( "여기는 술을 마시며 이야기를 나눌 수 있는 곳이지." );
        }
        if( ran == 1 )
        {
	        D( "어떤걸 주문하시겠소. 물론 지금은 맥주밖에 없지만 말이요." );
        }
        CallSmallMenu( 0, 57 ) ;주점
end

@Npc00031
;; 잡화점
 	sGetNat(); 바이서스면.
        if( yes==3)
        {
                D( " 이제 이 곳은 바이서스가 아냐..." )
                goto ENDnation_
        }
        D( "이곳이 처음이죠. 자, 내가 싼가격에 물건을 줄께요. 잘 오신겁니다. " );
        CallSmallMenu( 0, 60 ); 상점
end

@Npc00032
;; 학술원
 	sGetNat(); 바이서스면.
        if( yes==3)
        {
                D( " 이제 이 곳은 바이서스가 아냐..." )
                goto ENDnation_
        }
        D( "수준높은 지식을 알길 원하겠지. 인간은 학문을 탐구하고 싶어하기 때문에 다른 동물과 다른법이지." );
        CallSmallMenu( 0, 72 ); 학술원
end

@Npc00033
;; 여관 (12인의 여관)
 	sGetNat(); 바이서스면.
        if( yes==3)
        {
                D( " 이제 이 곳은 바이서스가 아냐..." )
                goto ENDnation_
        }
        random( 0, 2 )
        if( ran == 0 )
        {
	        D( "편안한 휴식과 수면을 하면 Life와 Health가 올라 가지요. 하지만 아쉽게도 당분간은 영업을 않한다오" );
        }
        if( ran == 1 )
        {
	        D( "마법사라면 메모라이즈를 위해서 수면이 꼭 필요합니다. " );
        }
        CallSmallMenu( 0, 67 ); 여관
end

@Npc00034    
;; 활제작소
 	sGetNat(); 바이서스면.
        if( yes==3)
        {
                D( " 이제 이 곳은 바이서스가 아냐..." )
                goto ENDnation_
        }
        random( 0, 2 )
        if( ran == 0 )
        {
	        D( "활을 쏘기 위해서는 굉장한 민첩성과 정신력이 필요하지." );
        }
        if( ran == 1 )
        {
	        D( "활을 잘다루는 사람은 10명의 전사를 만나도 두렵지 않을껄..." );
        }
        CallSmallMenu( 0, 27 )
end

@Npc00035
; 에델브로이 신전
        D("코스모스와 대폭풍의 에델브로이 이름이 당신에게 축복을 내려줄것입니다.")
        CallSmallMenu( 0, 73 ) ;에델브로이
end

@Npc00036
;; 서바이벌 이벤트 NPC
	CheckEventLocalWarStatus()
	if( yes==0 )
	{
		goto END3601_ ; 이벤트 없음
	}
	if( yes==1 )
	{
		goto END3602_ ; 이벤트 등록
	}
	if( yes==2 )
	{
		goto END3603_ ; 이벤트 이동
	}
	if( yes==3 )
	{
		goto END3604_ ; 이벤트 진행중
	}
	if( yes==4 )
	{
		goto END3605_ ; 이벤트 휴식
	}
	
:END3601_
	D(" 아직 대회 일정이 잡히지 않았습니다. 대회 일정이 잡히면 공지로 알려 드릴 것입니다. ")
	goto END3699_
	
:END3602_
	D(" 대회 참가자 등록을 받고 있습니다. ")
	CallMenu(293)
	goto END3699_

:END3603_
	D(" 대회 참가 신청자들은 대회 장소로 이동하시기 바랍니다. ")
	CallMenu(294)
	goto END3699_
	
:END3604_
	D(" 현재 대회 진행 중입니다. 대회가 끝난 후에 참가 신청을 하시기 바랍니다.")
	goto END3699_

:END3605_
	D(" 다음 대회는 잠시 후에 접수를 받게 됩니다. 공지를 하면 접수를 해 주시기 바랍니다. ")
	goto END3699_


:END3699_

end

@Npc00037
 	sGetNat(); 바이서스면.
        if( yes==3)
        {
                D( " 이제 이 곳은 바이서스가 아냐..." )
                goto ENDnation_
        }
        random( 0, 2 )
        if( ran == 0 )
        {
	        D("레너스 시장에서 장사를 한다고 아무도 뭐라하지 않거든 손수 만든 물건을 파는 것도 좋을 것 같애.")
        }
        if( ran == 1 )
        {
	        D("당신의 직업을 이용해서 돈을 벌 생각은 없소?.")
        }
end

@Npc00038
;; 병원
 	sGetNat(); 바이서스면.
        if( yes==3)
        {
                D( " 이제 이 곳은 바이서스가 아냐..." )
                goto ENDnation_
        }
        random( 0, 2 )
        if( ran == 0 )
        {
	        D("몸에 이상이 있다고 생각되면 그건 병이 있는겁니다. 치료를 한번 받아 보세요.")
        }
        if( ran == 1 )
        {
	        D("앞으로 레벨이 높은 사람은 던젼에 들어 갈수 없을 꺼야.")
        }
        CallSmallMenu( 0, 63 )
end

@Npc00039
 	sGetNat(); 바이서스면.
        if( yes==3)
        {
                D( " 이제 이 곳은 바이서스가 아냐..." )
                goto ENDnation_
        }
        D("날씨도 좋은데 한잔 하시는 게 어떻소? 이곳의 술을 세계에서 제일 으뜸이지.")
end

@Npc00040
;; 길드관리소
 	sGetNat(); 바이서스면.
        if( yes==3)
        {
                D( " 이제 이 곳은 바이서스가 아냐..." )
                goto ENDnation_
        }
        D("어서 오시오,, 당신은 어느 길드 소속인가?")
	CallSmallMenu( 0, 76 ) ;길드관리 인터페이스
end
@Npc00041
end
@Npc00042
end
@Npc00043
end
@Npc00044
;; 전체 공지
 	sGetNat(); 바이서스면.
        if( yes==3)
        {
                D( " 이제 이 곳은 바이서스가 아냐..." )
                goto ENDnation_
        }
	D( "레너스 시민 여러분! 다음은 자네가 말하게.." )
	CallSmallMenu( 0, 79 )	
end
@Npc00045	;초보안내 NPC
 	sGetNat()
	if(yes==4)
	{
		CmpQuestNumStep(49,101)
		if(yes==0)
		{
			D("마을에 왔는데 무엇을 해야 하는지 잘 모르시겠어요?")
			SetQuestNumStep(49,102)
			goto ENDchobo_
		}
		CmpQuestNumStep(49,116)
		if(yes==2)
		{
			D("마을에 왔는데 무엇을 해야 하는지 잘 모르시겠어요?")
			SetQuestNumStep(49,102)
			goto ENDchobo_
		}
		CmpQuestNumStep(49,101)
		if(yes==1)
		{
			D("마을에 왔는데 무엇을 해야 하는지 잘 모르시겠어요?")
			SetQuestNumStep(49,102)
			goto ENDchobo_
		}
		CmpQuestNumStep(49,102)
		if(yes==1)
		{
			D("마을에는 곳곳에 위험 요소들이 산재해 있으니, 조심하셔야 해요.")
			SetQuestNumStep(49,103)
			goto ENDchobo_
		}
		CmpQuestNumStep(49,103)
		if(yes==1)
		{
			sGetClass()
			if(yes==0)	;전사이면
			{
				D("당신의 클래스는 전사로군요.")
			}
			if(yes==1)	;도둑이면
			{
				D("당신의 클래스는 도둑이로군요.")
			}
			if(yes==2)	;궁수이면
			{
				D("당신의 클래스는 궁수로군요.")
			}
			if(yes==3)	;마법사이면
			{
				D("당신의 클래스는 마법사로군요.")
			}
			if(yes==4)	;성직자이면
			{
				D("당신의 클래스는 성직자로군요.")
			}
			SetQuestNumStep(49,104)
			goto ENDchobo_
		}
		CmpQuestNumStep(49,104)
		if(yes==1)
		{
			D("자, 그럼 지도를 보시면서 제 이야기를 잘 들으세요. 마을에서 주로 가거나 이용하는 장소 등을 꼭 기억하셔야 해요. ")
			SetQuestNumStep(49,105)
			goto ENDchobo_
		}		
		CmpQuestNumStep(49,105)
		if(yes==1)
		{
			sGetClass()
			if(yes==0)	;전사이면
			{
				sCallCustomSmallMenu(280,3,436,437,770)		;자이펀 전사맵 띄우기
				SendSound(0,1432)
				SetQuestNumStep(49,106)
				goto ENDchobo_
			}
			if(yes==1)	;도둑이면
			{
				sCallCustomSmallMenu(280,1,436,437,770)		;자이펀 도둑맵 띄우기
				SendSound(0,1432)
				SetQuestNumStep(49,106)
				goto ENDchobo_
			}
			if(yes==2)	;궁수이면
			{
				sCallCustomSmallMenu(280,0,436,437,770)		;자이펀 궁수맵 띄우기
				SendSound(0,1432)
				SetQuestNumStep(49,106)
				goto ENDchobo_
			}
			if(yes==3)	;마법사이면
			{
				sCallCustomSmallMenu(280,2,436,437,770)		;자이펀 마법사맵 띄우기
				SendSound(0,1432)
				SetQuestNumStep(49,106)
				goto ENDchobo_
			}
			if(yes==4)	;성직자이면
			{
				sCallCustomSmallMenu(280,2,436,437,770)		;자이펀 성직자맵 띄우기
				SendSound(0,1432)
				SetQuestNumStep(49,106)
				goto ENDchobo_
			}
		}
		CmpQuestNumStep(49,106)
		if(yes==1)
		{
			D("지금 당신이 있는 이곳 중앙 마을 광장은 주로 사람들이 모여 이야기를 나누고, 파티 원을 모으는 곳이지요.")
			SetQuestNumStep(49,107)
			goto ENDchobo_
		}
		CmpQuestNumStep(49,107)
		if(yes==1)
		{
			D("마을광장에서 사람들과 어울려 파티를 맺고 함께 몬스터와의 전투를 하러 떠나보세요")
			SetQuestNumStep(49,108)
			goto ENDchobo_
		}		
		CmpQuestNumStep(49,108)
		if(yes==1)
		{
			D("10레벨 미만에서는 주로 목장이나 슬라임 지역으로 가서 사냥을 하면, 보다 빠른 레벨 업을 할 수 있답니다.")
			SetQuestNumStep(49,109)
			goto ENDchobo_
		}
		CmpQuestNumStep(49,109)
		if(yes==1)
		{
			D("'/도움말 몬스터좌표' 라는 명령어를 치시면 나의 레벨 대에서 사냥해야 할 몬스터 및 그 위치 등을 알 수 있어요.")
			SetQuestNumStep(49,110)
			goto ENDchobo_
		}
		CmpQuestNumStep(49,110)
		if(yes==1)
		{
			D("참! 소와 양을 제외한 몬스터들은 모두 사람을 공격하므로 미리 점성술사(연금술사)의 집에서 포션을 넉넉히 준비하셔야 해요.")
			SetQuestNumStep(49,111)
			goto ENDchobo_
		}
		CmpQuestNumStep(49,111)
		if(yes==1)
		{
			D("마법을 배우고자 하시면 점성술사의 집이나 마법사길드로 가시면 된답니다. 이 때 꼭 내가 다음에 배우게 될 마법의 요구 능력치를 알아두세요.")
			SetQuestNumStep(49,112)
			goto ENDchobo_
		}
		CmpQuestNumStep(49,112)
		if(yes==1)
		{
			D("또한 '/도움말 마법배우기' 명령어를 이용하시면 마법의 요구 능력치를 미리 알고 어빌리티를 올리는데 큰 문제가 없을 거에요.")
			SetQuestNumStep(49,113)
			goto ENDchobo_
		}
		CmpQuestNumStep(49,113)
		if(yes==1)
		{
			D("죽음을 당하셨을 때에는 에델브로이 신전에서 '코스모스와 대폭풍의 에델브로이 이름으로' 주문을 통해 다시 살아나실 수 있답니다.")
			SetQuestNumStep(49,114)
			goto ENDchobo_
		}
		CmpQuestNumStep(49,114)
		if(yes==1)
		{
			D("샤냥을 통해 획득하는 아이템들을 해당 상점에 되팔게 되면 약간의 돈을 벌 수 있어요. 이 돈으로 포션을 사고 다시 사냥을 떠나는 것이지요.")
			SetQuestNumStep(49,115)
			goto ENDchobo_
		}
		CmpQuestNumStep(49,115)
		if(yes==1)
		{
			D("자, 이제 조금은 눈앞이 환해졌나요? ^^ 좌측상단의 HELP(단축키 F2)나 '/도움말' 명령어를 꾸준히 이용해보세요. 어떤 어려움도 쉽게 극복해 나가실 수 있을 거에요.")
			SetQuestNumStep(49,116)
			goto ENDchobo_
		}
		CmpQuestNumStep(49,116)
		if(yes==1)
		{
			D("드래곤 라자의 세계에서 즐거운 여행하시길 바랍니다. 가시는 길마다 행운이 있기를…")
			SetQuestNumStep(49,101)
			goto ENDchobo_
		}
	}
	else
	{
		random(0,2)
		if(ran==0)
		{
			D("머나먼 이국땅에서 오셨군요...")
			goto ENDchobo_
		}
		if(ran==1)
		{
			D("고향이 그리우십니까...")
			goto ENDchobo_
		}
	}
:ENDchobo_
end

@Npc00046
;; hint
 	sGetNat(); 바이서스면.
        if( yes==3)
        {
                D( " 이제 이 곳은 바이서스가 아냐..." )
                goto ENDnation_
        }
	D("바람속에 흩날리는 코스모스를... 폭풍을 잠재우는 꽃잎의 영광을...")
end
@Npc00047
end

@Npc00048
;;  Change the Color (옷, 장식 컬러 교체)
 	sGetNat(); 바이서스면.
        if( yes==3)
        {
                D( " 이제 이 곳은 바이서스가 아냐..." )
                goto ENDnation_
        }
	random( 0, 3 )
	if( ran == 0 )
	{
		D("안녕하세요.. 이 곳은 당신의 옷 색깔과 피부색을 바꿀 수 있는 곳입니다. ")
	}
	if( ran == 1 )
	{
		D( "바꿔~! 바꿔~! 옷 색깔과 피부색이 맘에 안 드십니까? 제가 바꿔드리죠..")
	}
	if( ran == 2 )
	{
		D( "옷 색깔과 피부색을 바꾸기 위해서는 많은 돈이 필요합니다." )
	}
	CallMenu(28)
end
@Npc00049
;; 국가후원회 (국가기부금)
 	sGetNat(); 바이서스면.
        if( yes==3)
        {
                D( " 이제 이 곳은 바이서스가 아냐..." )
                goto ENDnation_
        }
	random( 0, 3 )
	if( ran == 0 )
	{
		D("당신이 이 곳에 내는 돈은 대 자이펀 국을 위해 쓰여질 걸세.. ")
	}
	if( ran == 1 )
	{
		D( "당신에게 쇠사슬과 자유의 닐림이 함께 하기를..")
	}
	if( ran == 2 )
	{
		D( "우리의 조국 자이펀을 위해~ 자이펀 만세..!" )
	}
	CallSmallMenu( 0, 77 ) ;   

:ENDnation_
end





@Event00000
end

@Event00001
;; 칼라일 마을
        MapMove( "COLOR", 209,13 )
	if( yes == 1 ) 
	{
		EventMsg( "칼라일마을로 이동합니다." ) 
	}
	else
	{
		EventMsg( "맵 이동에 실패했습니다." ) 
	}
end

@Event00002
;; 레너스시 외부
        MapMove( "RENES_OUT", 372,369 )
	if( yes == 1 ) 
	{
		EventMsg( "레너스외부로 이동합니다." ) 
	}
	else
	{
		EventMsg( "맵 이동에 실패했습니다." ) 
	}
end

@Event00003
;; 실리키안 남작저택 1층
        MapMove( "Sn_1F", 54,123 )
	if( yes == 1 ) 
	{
		EventMsg( "실리키안 남작저택으로 이동합니다." ) 
	}
	else
	{
		EventMsg( "맵 이동에 실패했습니다." ) 
	}
end

@Event00004
;; 미니던전 1층
;; 출입조건 Level 61~90
	sGetLevel()
	if( yes >= 61 )
	{
		if( yes <= 90 )
		{
			MapMove( "Mini2", 185,54 )
			if( yes == 1 )
			{
				EventMsg("<미니던전>으로 이동합니다.")
			}
			else
			{
				EventMsg("맵 이동에 실패했습니다.")
			}
		}
		else	; 레벨 61 이상 91 이상
		{
			EventMsg("이 곳은 레벨 61 ~ 90 인 영웅들만 출입할 수 있는 곳입니다.  당신은 너무 레벨이 높군요.")
		}
	}
	else	; 레벨 61 미만
	{
		EventMsg("이 곳은 레벨 61 ~ 90 인 영웅들만 출입할 수 있는 곳입니다. 당신은 아직 레벨이 낮군요.")
	}
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
;; 초보자 안내소
;; 레벨 10 이하까지 출입가능
        IsLevel(11)
        if( yes == 1)
        {
        	EventMsg("이곳은 초보자의 가이드를 위한 맵입니다. 당신은 초보가 아니군요")
        	SendSound(0,2061)
        }
        else
        {           
	    	MapMove( "Scholium", 4,24 )
		if( yes == 1 )
		{
			EventMsg("초보자 안내소로 포탈 이동합니다.")
			SendSound(0,2061)
		}
		else
		{
			EventMsg("맵 이동에 실패했습니다.")
		}
	}
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
;; 길드집으로
	GotoGuildHouse()
	if( yes == 1 )
	{
		EventMsg( "당신의 길드 엠포리아로 이동 중입니다." )
		goto ENDgh_
	}
	else
	{
		EventMsg( "당신은 길드 엠포리아를 가지고 있지 않습니다." )
		goto ENDgh_
	}
:ENDgh_
end
@Event00015
;; 결투장 안 --> 밖
	QuestTeleport(1, 295,132)
	EventMsg("결투장 밖으로 이동합니다.")
end
@Event00016
;; 결투장 밖 --> 안
	QuestTeleport(1, 323,131)
	EventMsg("결투장 안으로 이동합니다.")
end
@Event00017
end
@Event00018
end
@Event00019
end
