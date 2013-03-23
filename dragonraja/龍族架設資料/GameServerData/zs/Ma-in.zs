@sys00 ; 처음 서버 Setting하는 함수.

        MaxNPC( 50 )
        MapName( "MA-IN" )

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
;사람일 경우 다음 대사 랜덤 
 	sGetNat(); 자이펀이면.
        if( yes==4)
        {
                D( " 쳇! 자이펀인이로군...." )
                goto ENDnation_
        }

        random( 0, 13 )
        if( ran == 0 ) 
        {
	        D( "자이펀이 쳐들어 왔대~" )
        }
        if( ran == 1 ) 
        {
        	D( "바람에 흩날리는 코스모스를..." )
        }
        if( ran == 2 ) 
        {
	        D( "필요한 때를 위한 작은 행운을... " )
        }
       	if( ran == 3 ) 
        {
	        D( "칼날 위에 실을 수 있는 가장 거대한 이름의 영광에 의지하여..." )
        }
        if( ran == 4 ) 
        {
        	D( "자네 지금 자이펀이 어디까지 쳐들어 왔는지 아나?" )
        }
        if( ran == 5 ) 
        {
	        D( "자이펀이 휴다인 계곡 넘어까지 들어와 있다던데..." )
        }
        if( ran == 6 ) 
        {
        	D( "자이펀이 레너스를 침공했다는데, 자넨 여기서 뭐하나?" )
        }
        if( ran == 7 ) 
        {
	        D( "이곳은 헬턴트 마을 입니다." )
        }
        if( ran == 8 ) 
        {
        	D( "마을 밖으로 나가면 강한 몬스터들이 우굴거리지." )
        }
        if( ran == 9 ) 
        {
	        D( "자이펀이 쳐들어오면, 우리 경비병들이 가만히 있지는 않겠지." )
        }
        if( ran == 10 ) 
        {
        	D( "북쪽으로 가면 성이 있는데, 그 곳은 경비병들이 쫙 깔려 있지.")
        }
        if( ran == 11 ) 
        {
	        D( "마을 밖으로 나가면 던젼이 있는데, 아무나 들어 갈 수 있는 곳이 아니야..")
        }       
        if( ran == 12 )
        {
        	D( "죽은 사람은 에델브로이 신전에서 부활시켜준다는 전설이 있었지.." )   
        }
        
end
@Npc00001
;; 에델브로이 신전
	random( 0, 3 )
        if( ran == 0 )
        {
   	     D( "코스모스와 대폭풍의 에델브로이 신전입니다. " )
        }
        if( ran == 1 )
        {
        	D( "죽은자에게 부활의 권능을 행할수 있는 곳입니다." )
        }
        if( ran == 2 )
        {
	        D( "코스모스와 대폭풍의 에델브로이 이름으로 ." )
        }
        CallSmallMenu( 0, 73 )
end
@Npc00002
;; 테페리 신전
        random( 0, 3 )
        if( ran == 0 )
        {
	        D( "필요한 때를 위한 작은 행운을..." )
        }
        if( ran == 1 )
        {
		D( "갈림길과 호비트의 테페리 신전입니다.." )
        }
        if( ran == 2 )
        {
		D( "두 갈래의 갈림길에서는 테페리에게 기도를 해보세요.." )
        }
        CallSmallMenu( 0, 74 )
end
@Npc00003
;; 레티신전
        random( 0, 3 )
        if( ran == 0 )
        {
	        D( "이 곳은 검과 파괴의 레티 신전입니다..." )
        }
        if( ran == 1 )
        {
		D( "칼날 위에 실을 수 있는 가장 거대한 이름의 영광에 의지하여..." )
        }
        if( ran == 2 )
        {
		D( "검술 훈련도 신의 뜻을 받드는 길 중의 하나입니다." )
        }
        CallSmallMenu( 0, 75 )
end
@Npc00004
;; 학술원
 	sGetNat(); 자이펀이면.
        if( yes==4)
        {
                D( " 쳇! 자이펀인이로군...." )
                goto ENDnation_
        }
        random( 0, 3 )
        if( ran == 0 )
        {
	        D( "이 곳은 학문과 스킬을 연구하는 학술원입니다." )
        }
        if( ran == 1 )
        {
		D( "나는 다른 곳에서 배울 수 없는 것들을 알고 있지.." )
        }
        if( ran == 2 )
        {
		D( "수준높은 지식을 알려 주길 원하나 ?" )
        }
        CallSmallMenu( 0, 72 )
end
@Npc00005
;;의료원
 	sGetNat(); 자이펀이면.
        if( yes==4)
        {
                D( " 쳇! 자이펀인이로군...." )
                goto ENDnation_
        }
        random( 0, 3 )
        if( ran == 0 )
        {
	        D( "이 곳은 의료원입니다.." )
        }
        if( ran == 1 )
        {
		D( "각종 질병의 예방 주사를 맞을 수 있습니다.." )
        }
        if( ran == 2 )
        {
	        D("병에 걸렸다면 이곳에서 치료를 해줄수 있습니다.")
        }
        CallSmallMenu( 0, 63 )
end
@Npc00006    
;; 마을회관
 	sGetNat(); 자이펀이면.
        if( yes==4)
        {
                D( " 쳇! 자이펀인이로군...." )
                goto ENDnation_
        }
	random( 0, 3 )
	if( ran == 0 )
	{
		D("헬턴트마을은 바이서스에서 가장 서쪽에 위치한 마을이라네...")
	}
	if( ran == 1 )
	{
		D("헬턴트에서 할 수 있는 일에 대해 알려드리죠.")
	}
	if( ran == 2 )
	{
		D("당신 회색산맥에는 가봤나? 휴다인강에도 한번 가보게..")
	}
	CallSmallMenu( 0, 29 )
end
@Npc00007
;; 서바이벌 이벤트 NPC
	CheckEventLocalWarStatus()
	if( yes==0 )
	{
		goto END0701_ ; 이벤트 없음
	}
	if( yes==1 )
	{
		goto END0702_ ; 이벤트 등록
	}
	if( yes==2 )
	{
		goto END0703_ ; 이벤트 이동
	}
	if( yes==3 )
	{
		goto END0704_ ; 이벤트 진행중
	}
	if( yes==4 )
	{
		goto END0705_ ; 이벤트 휴식
	}
	
:END0701_
	D(" 아직 대회 일정이 잡히지 않았습니다. 대회 일정이 잡히면 공지로 알려 드릴 것입니다. ")
	goto END0799_
	
:END0702_
	D(" 대회 참가자 등록을 받고 있습니다. ")
	CallMenu(293)
	goto END0799_

:END0703_
	D(" 대회 참가 신청자들은 대회 장소로 이동하시기 바랍니다. ")
	CallMenu(294)
	goto END0799_
	
:END0704_
	D(" 현재 대회 진행 중입니다. 대회가 끝난 후에 참가 신청을 하시기 바랍니다.")
	goto END0799_

:END0705_
	D(" 다음 대회는 잠시 후에 접수를 받게 됩니다. 공지를 하면 접수를 해 주시기 바랍니다. ")
	goto END0799_

:END0799_

end
@Npc00008
;바이서스 지도보기 (마을주변)
 	sGetNat()
	if(yes==3)
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
			D("헬턴트마을에서 몬스터가 나타나는 곳이네..")
			sCallCustomSmallMenu(280,7,436,423,900)	;헬턴트마을 몬스터 지도
			EventMsg("이것은 헬턴트 마을의 주요 사냥터입니다. 다음은 회색산맥의 주요 사냥터를 볼 수 있습니다.")
			SetQuestNumStep(49,122)
			goto ENDmonmap_
		}
		CmpQuestNumStep(49,122)
		if(yes==1)
		{
			D("회색산맥에서 주요 몬스터 사냥터 지역입니다.")
			sCallCustomSmallMenu(280,6,436,423,900)	;회색산맥 몬스터 지도
			EventMsg("이것은 회색산맥의 주요 사냥터입니다. 다음은 휴다인강의 주요 사냥터를 볼 수 있습니다.")
			SetQuestNumStep(49,123)
			goto ENDmonmap_
		}
		CmpQuestNumStep(49,123)
		if(yes==1)
		{
			D("휴다인강의 오크마을은 사람들이 자주 찾는 사냥터입니다.")
			sCallCustomSmallMenu(280,11,436,423,900)	;휴다인강 몬스터 지도
			EventMsg("이것은 휴다인강의 주요 사냥터입니다. 처음부터 다시 보고 싶다면, 다시 클릭해주세요..")
			SetQuestNumStep(49,124)
			goto ENDmonmap_
		}
	}
	else
	{
		random( 0, 3 )
		if(ran==0)
		{
			D("당신은 다른 나라에서 오신 분이군요..")
			goto ENDmonmap_
		}
		if(ran==1)
		{
			D("타국인에게는 말할 수 없는 기밀이 있습니다..")
			goto ENDmonmap_
		}
		if(ran==2)
		{
			D("국가 기밀을 함부로 알려드릴 수 없습니다..")
			goto ENDmonmap_
		}
	}
:ENDmonmap_

end
@Npc00009
;; 은행
 	sGetNat(); 자이펀이면.
        if( yes==4)
        {
                D( " 쳇! 자이펀인이로군...." )
                goto ENDnation_
        }
	random( 0, 3 )
	if( ran == 0 )
	{
		D("은행에서는 예금, 출금, 대출, 보관 이 가능합니다..")
	}
	if( ran == 1 )
	{
		D("안녕하세요.. 헬턴트 은행장입니다..")
	}
	if( ran == 2 )
	{
		D( "어서 오세요 이곳은 헬턴트 은행입니다. 예금,출금,대출, 경매가 가능하죠.." )
	}
	CallSmallMenu( 0, 13 )
end

@Npc00010
;; 길드원리스트 열기
 	sGetNat(); 바이서스면.
        if( yes==4)
        {
                D( " 쳇! 자이펀이니이로군..." )
                goto ENDnation_
        }
	random( 0, 3 )
	if( ran == 0 )
	{
		D("저는 당신이 소속한 길드의 길드원들을 알려드릴 수 있습니다.")
	}
	if( ran == 1 )
	{
		D("제가 당신의 길드원들을 알려드리겠습니다.")
	}
	if( ran == 2 )
	{
		D("길드에 소속되어 계시다면, 제가 길드원 리스트를 보여드리지요.")
	}
	CallMenu(24)
end

@Npc00011
	D("바람속에 흩날리는 코스모스를... 폭풍을 잠재우는 꽃잎의 영광을...")
end

@Npc00012
;; 화폐개혁(은행)
 	sGetNat(); 자이펀이면.
        if( yes==4)
	{
		D( " 쳇! 자이펀인이로군...." )
		goto ENDnation_
        }
	D( " 이곳은 화폐개혁을 추진하는 곳입니다. 화폐단위가 cell에서 crit으로 바뀐 것을 선포합니다.. " );
	CallSmallMenu( 0, 78 )
end

@Npc00013
;; 여관
 	sGetNat(); 자이펀이면.
        if( yes==4)
        {
                D( " 쳇! 자이펀인이로군...." )
                goto ENDnation_
        }
	random( 0, 3 )
	if( ran == 0 )
	{
		D("편안한 휴식과 수면을 하면 Life와 Health가 올라 가지요.")
	}
	if( ran == 1 )
	{
		D("마법사라면 메모라이즈를 위해서 수면이 꼭 필요합니다.")
	}
	if( ran == 2 )
	{
		D("메모라이즈가 안 될 때, 이 곳에서 자고나면 메모라이즈가 가능해집니다.")
	}
       	CallSmallMenu( 0, 67 )
end
@Npc00014
;; 빵집
 	sGetNat(); 자이펀이면.
        if( yes==4)
        {
                D( " 쳇! 자이펀인이로군...." )
                goto ENDnation_
        }
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
		D( " 자이펀인들은 무서운 저주를 내릴 줄 안다던데.. 무서운 일이야.." )
	}
	CallSmallMenu( 0, 20 )
end

@Npc00015    
;; 약초점
 	sGetNat(); 자이펀이면.
        if( yes==4)
        {
                D( " 쳇! 자이펀인이로군...." )
                goto ENDnation_
        }
        random( 0, 3 )
        if( ran == 0 )
        {
	        D( "다양한 약초와 약초가루를 팔고 있습니다.." )
        }
        if( ran == 1 )
        {
        	D( "요즘 자이펀의 스파이들이 설치고 다닌다는데.. 조심하게나." )
        }
        if( ran == 2 )
        {
        	D( "나도 약초를 불태워서 돈이나 벌어볼까? " )
        }
        CallSmallMenu( 0, 21 ) 
end
@Npc00016
;; 방어구점
 	sGetNat(); 자이펀이면.
        if( yes==4)
        {
                D( " 쳇! 자이펀인이로군...." )
                goto ENDnation_
        }
        
        D( "여긴 전문적으로 방어구를 파는 곳이지만 철로 만든물건은 뭐든지 팔고  삽니다. " )
        CallSmallMenu( 0, 18 )	; 대장간 인터페이스 
end
@Npc00017    
;; 대장간
 	sGetNat(); 자이펀이면.
        if( yes==4)
        {
                D( " 쳇! 자이펀인이로군...." )
                goto ENDnation_
        }
        random( 0, 3 )
	if( ran == 0 )
	{
		D( "돈만준다면  철을 이용해서 만들수 있는 것은 뭐든지 팔지. 또한  그 기술도 가르쳐 주지." )
	}
	if( ran == 1 )
	{
		D( "철광석을 얻기 위해서는 곡괭이와 mining 스킬이 있어야만 해. 이곳에서 그 기술을 가르쳐주지.")
	}
	if( ran == 2 )
	{
		D( "오랜 전쟁때문에, 이제는 고급물건은 옛날처럼 많이 팔지를 못해... ")
	}
	CallSmallMenu( 0, 18 )
end
@Npc00018
;; 무기점
 	sGetNat(); 자이펀이면.
        if( yes==4)
        {
                D( " 쳇! 자이펀인이로군...." )
                goto ENDnation_
        }
        random( 0, 3 )
	if( ran == 0 )
	{
		D( "어서 오게나. 난 무기점을 운영하는 무기 전문가지." )
	}
	if( ran == 1 )
	{
		D( "여긴 전문적으로 무기를 파는 곳이지만 철로 만든물건은 뭐든지 팔고 삽니다.")
	}
	if( ran == 2 )
	{
		D( "오랜 전쟁때문에, 이제는 고급물건은 옛날처럼 많이 팔지를 못해... ")
	}
	CallSmallMenu( 0, 18 )
end
@Npc00019
;; 의류점
 	sGetNat(); 자이펀이면.
        if( yes==4)
        {
                D( " 쳇! 자이펀인이로군...." )
                goto ENDnation_
        }
        
        random( 0, 3 )
        if( ran == 0 )
        {
	        D("옷을 입지 않고 다니는 사람들은 미개인 같지 않나?")
        }       
        if( ran == 1)
        {
        	D( "자자, 다들 좋은 옷을 골라 보게, 우리 집에선 좋은 천만 쓴다네." )
        }       
        if( ran == 2 )
        {
	        D( "이제 cell은 더 이상 받지 않는다네. 은행에서 crit으로 바꿀 수 있다네.. " );
        }
        CallSmallMenu( 0, 24 )
end
@Npc00020    
;; 양초점
 	sGetNat(); 자이펀이면.
        if( yes==4)
        {
                D( " 쳇! 자이펀인이로군...." )
                goto ENDnation_
        }
        random( 0, 2 )
        if( ran == 0 )
        {
	        D( " 자이펀과의 전쟁때문에, 양초가 모자랄 지경이야... " );
        }
        if( ran == 1 )
        {
        	D( " 마을 외부로 나가면 던젼이 있는데 그곳에선 양초가 제몫을 하죠.")  
        }
        CallSmallMenu( 0, 23 )
end
@Npc00021
;; 푸줏간
 	sGetNat(); 자이펀이면.
        if( yes==4)
        {
                D( " 쳇! 자이펀인이로군...." )
                goto ENDnation_
        }
        random( 0, 2 )
        if( ran == 0 )
        {
		D( "Butchering Skill이 있으면 죽은 동물에게서 고기와 가죽을 얻을 수 있습니다." );
        }
        if( ran == 1 )
        {
        	D( "요즘은 자이펀 전쟁에 나가는 군대에 소고기를 보급하고 있다네...")
        }
        CallSmallMenu( 0, 22 ) 
end
@Npc00022
;; 목공소
 	sGetNat(); 자이펀이면.
        if( yes==4)
        {
                D( " 쳇! 자이펀인이로군...." )
                goto ENDnation_
        }
	random( 0, 3 )
	if( ran == 0 )
	{
		D( "나무꾼들이 만든 목재로 가구와 도구를 만들 수 있습니다." )
	}
	if( ran == 1 )
	{
		D( "나무는 헬턴트 주위에 많이 있어서 구하기 쉬운 물건중의 하나지요.")
	}
	if( ran == 2 )
	{
		D( "좋은 나무는 스태프를 만드는 데에 있어서 필수 재료라네." )
	}
	CallSmallMenu( 0, 26 )
end
@Npc00023    
;; 점성술사의 집
 	sGetNat(); 자이펀이면.
        if( yes==4)
        {
                D( " 쳇! 자이펀인이로군...." )
                goto ENDnation_
        }
        
	random( 0, 3 )
	if( ran == 0 )
	{
		D("당신은 마나의 힘을 믿으시나요?")
	}
	if( ran == 1)
	{
		D( "세상에는 보이지 않는 힘이 존재하는데 이를  대자연의 힘 이라고 부르지...  " )
	}
	if( ran == 2 )
	{
		D( "이 곳에서는 마법을 배울 수 있습니다." )
	}
	CallSmallMenu( 0, 71 )
end
@Npc00024
;; 농장
 	sGetNat(); 자이펀이면.
        if( yes==4)
        {
                D( " 쳇! 자이펀인이로군...." )
                goto ENDnation_
        }
	random( 0, 3 )
	if( ran == 0 )
	{
		D( "땅에서 나는 모든 산물은 시무니안의 영광이 깃들어 있지 " )
	}
	if( ran == 1)
	{
		D( "가축을 길러보고 싶지는 않은가?  아님 밭을 일구어 작물을 기를수도 있고" )
	}
	if( ran == 2)
	{
		D( "흙에 살리라~ 나는야 헬턴트의 유명한 농부라네..." )
	}
	CallSmallMenu( 0, 19 )
end
@Npc00025
;; 낚시점
 	sGetNat(); 자이펀이면.
        if( yes==4)
        {
                D( " 쳇! 자이펀인이로군...." )
                goto ENDnation_
        }
	random( 0, 2 )
	if( ran == 0 )
	{
		D( " 저 바다에서 뱃사람들이 혈류 속을 헤쳐나가는 모습은 인간의 삶 바로 그자체야.. " );
	}
	if( ran == 1)
	{
		D( " 자네 밤낚시를 해 본 적이 있나? 방금 낚은 이름모를 생선으로 끊인 매운탕의 맛은 정말... " );
	}     
	CallSmallMenu( 0, 28 )
end
@Npc00026
;; 국가 고급 아이템 상점
 	sGetNat(); 자이펀이면.
        if( yes==4)
        {
                D( " 쳇! 자이펀인이로군...." )
                goto ENDnation_
        }
	D("국가 기부금으로 운영되는 상점입니다. 돈과 명성을 통해 고급아이템을 구하실 수 있습니다.")
	CallMenu( 66 )
end
@Npc00027    
;; 활제작소
 	sGetNat(); 자이펀이면.
        if( yes==4)
        {
                D( " 쳇! 자이펀인이로군...." )
                goto ENDnation_
        }
	random(0,3)
        if( ran == 0 )
        {
	        D( "활과 화살을 제작하기 위해서는 나뭇꾼스킬을 마스터해야 하네.. " );
        }
        if( ran == 1 )
        {
	        D( "활과 화살은 궁수들에게 매우 큰 역할을 하고 있답니다...  ")
        }
        if( ran == 2 )
        {
	        D( "곧 자이펀과 전쟁이 있을  모양이야... 고급 무기들은 전부 군대로 들어가서 여기에서는 못판다네...")
        }
        CallSmallMenu( 0, 27 )
end
@Npc00028   
;; 푸줏간
 	sGetNat(); 자이펀이면.
        if( yes==4)
        {
                D( " 쳇! 자이펀인이로군...." )
                goto ENDnation_
        }
        D("도축자가 고기와 가죽을 제공하고 있지?")
        CallSmallMenu( 0, 22 ) 
end
@Npc00029
;; 농장
 	sGetNat(); 자이펀이면.
        if( yes==4)
        {
                D(" 쳇! 자이펀인이로군....")
                goto ENDnation_
        }
	random( 0, 3 )
	if( ran == 0 )
	{
		D("땅에서 나는 모든 산물에는 시무니안의 영광이 깃들어 있지.")
	}
	if( ran == 1)
	{
		D("가축을 길러보고 싶지 않은가?  아님 밭을 일구어 작물을 기를 수도 있고" )
	}
	if( ran == 2)
	{
		D("흙에 살리라~ 나는야 헬턴트의 유명한 농부라네..." )
	}
	CallSmallMenu( 0, 19 )
end
@Npc00030
;; 전체 공지
 	sGetNat(); 자이펀이면.
        if( yes==4)
        {
                D( " 쳇! 자이펀인이로군...." )
                goto ENDnation_
        }
        D( "에~ 헬턴트 주민 여러분! " )
        CallSmallMenu( 0, 79 )
end
@Npc00031    
;; 주점
 	sGetNat(); 자이펀이면.
        if( yes==4)
        {
                D( " 쳇! 자이펀인이로군...." )
                goto ENDnation_
        }

        CallSmallMenu( 0, 57 )
end
@Npc00032    
; 목공소 (점성술사 집 근처)
 	sGetNat(); 자이펀이면.
        if( yes==4)
        {
                D( " 쳇! 자이펀인이로군...." )
                goto ENDnation_
        }
	random( 0, 3 )
	if( ran == 0 )
	{
		D( "나무꾼들이 만든 목재로 가구와 도구를 만들 수 있습니다." )
	}
	if( ran == 1 )
	{
		D( "나무는 헬턴트 주위에 많이 있어서 구하기 쉬운 물건중의 하나지요.")
	}
	if( ran == 2 )
	{
		D( "좋은 나무는 스태프를 만드는 데에 있어서 필수 재료라네." )
	}
	CallSmallMenu( 0, 26 )
end

@Npc00033
;; 연금술사
sGetNat(); 자이펀이면.
	if( yes==4)
	{
		D( " 쳇! 자이펀인이로군...." )
		goto ENDnation_
	}
	random(0,3)
	if(ran == 0)
	{
		D(" 약초를 포션으로, 쇠와 구리를 합쳐서 강한 금속으로 ...  히히히히.")
	}
	if(ran == 1)
	{
	D(" 포션의 재료는 약초라구 약초만 있으면 포션을 얼마든지 만들수 있지.")
	}
	if(ran == 3)
	{
		D(" 포션만들기 기술은 누구든지 부자로 만들어 주지.")
	}	
	CallSmallMenu( 0, 25 )
end
@Npc00034    
;; 테페리 신전 근처에 있는 식량 창고....운영자의 비밀퀘스트초기화
IsItemHavePC(4006,0)
if( yes == 1)
{
D("퀘스트52초기화" )
SetQuestNumStep(52,0)
goto END34_
}
IsItemHavePC(4009,0)
if( yes == 1)
{
D("퀘스트51초기화" )
SetQuestNumStep(51,0)
goto END34_
}
IsItemHavePC(4001,0)
if( yes == 1)
{
D("퀘스트51컴플릿트" )
SetQuestNumStep(51,2000)
goto END34_
}
IsItemHavePC(4003,0)
if( yes == 1)
{
D("퀘스트52컴플릿트" )
SetQuestNumStep(52,2000)
goto END34_
}
                random( 0, 3 )
                if( ran == 0 )
                {
        	        D("이곳은 종종 트롤들의 습격을  받곤 하지. 내가 왜  여기를 서성대냐곤 묻지 말게?" )
                }
                if( ran == 1 )
                {
	                D( "이곳에 오면 종종 트롤의 습격 장면과 전사들의 결투 장면을 볼 수 있다네." )
                }
                if( ran == 2 )
                {
	                D( "자넨 트롤이 습격 해오면 나서서 싸우게나~ 난 구경을 할테니." )
                }
:END34_
end
@Npc00035
;; 길드관리소
 	sGetNat(); 자이펀이면.
        if( yes==4)
        {
                D( " 쳇! 자이펀인이로군...." )
                goto ENDnation_
        }
        D( "어서 오시오, 당신은 어느 길드 소속인가?" )
	CallSmallMenu( 0, 76 )
end
@Npc00036
;; hint
 	sGetNat(); 자이펀이면.
        if( yes==4)
        {
                D( " 쳇! 자이펀인이로군...." )
                goto ENDnation_
        }
	D("바람속에 흩날리는 코스모스를... 폭풍을 잠재우는 꽃잎의 영광을...")
end

@Npc00037
;; 초보 안내 NPC
	sGetNat()
	if(yes==3)
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
				sCallCustomSmallMenu(280,11,436,428,770)	;바이서스 전사맵 띄우기
				SendSound(0,1432)
				SetQuestNumStep(49,106)
				goto ENDchobo_
			}
			if(yes==1)	;도둑이면
			{
				sCallCustomSmallMenu(280,9,436,428,770)		;바이서스 도둑맵 띄우기
				SendSound(0,1432)
				SetQuestNumStep(49,106)
				goto ENDchobo_
			}
			if(yes==2)	;궁수이면
			{
				sCallCustomSmallMenu(280,8,436,428,770)		;바이서스 궁수맵 띄우기
				SendSound(0,1432)
				SetQuestNumStep(49,106)
				goto ENDchobo_
			}
			if(yes==3)	;마법사이면
			{
				sCallCustomSmallMenu(280,10,436,428,770)	;바이서스 마법사맵 띄우기
				SendSound(0,1432)
				SetQuestNumStep(49,106)
				goto ENDchobo_
			}
			if(yes==4)	;성직자이면
			{
				sCallCustomSmallMenu(280,10,436,428,770)	;바이서스 성직자맵 띄우기
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

@Npc00038   
;; 빵집
        CheckNation(4); 자이펀이면.
        if( yes==1)
        {
                D( " 쳇! 자이펀인이로군...." )
                goto ENDnation_
        }
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
	        D( "이제 cell은 더 이상 받지 않는다네. 은행에서 crit으로 바꿀 수 있다네.." );
	}
	CallSmallMenu( 0, 20 ) 
end
@Npc00039
;; 길드 엠포리아 구입
 	sGetNat(); 자이펀이면.
        if( yes==4)
        {
                D( " 쳇! 자이펀인이로군...." )
                goto ENDnation_
        }
	D("길드 엠포리아를 구입하시려구요?")
	CallMenu(68)
end
@Npc00040    
;; 약초점
 	sGetNat(); 자이펀이면.
        if( yes==4)
        {
                D( " 쳇! 자이펀인이로군...." )
                goto ENDnation_
        }
	random( 0, 3 )
	if( ran == 0 )
	{
		D( "이곳에서 나는 약초는 신비한 힘을 가지고 있소. " );
	}
	if( ran == 1 )
	{
		D( "비가 풍부하고 햇빛이 좋은 헬턴트는 언제나 숲이 울창합니다. " );
	}
	if( ran == 2 )
	{
		D( "약초는 그 자체로서도 신비한 능력을 지녔지만 포션을 만드는  재료가 됩니다. " );
	}
	CallSmallMenu( 0, 21 ) 
end
@Npc00041
 	sGetNat(); 자이펀이면.
        if( yes==4)
        {
                D( " 쳇! 자이펀인이로군...." )
                goto ENDnation_
        }
end
@Npc00042
;; 아이템몰
	random( 0, 2 )
	if( ran == 0 )
	{
		D("이곳에서 마일리지 아이템을 받으실 수 있습니다.")
	}
	if( ran == 1 )
	{
		D("마일리지 몰에서 구입한 아이템을 찾으실 수 있습니다.")
	}
	GetItemMallItem() ;; 아이템몰 아이템 받아오기
end
@Npc00043
end
@Npc00044
end
@Npc00045
;; 포탈 인터페이스 호출
 	sGetNat(); 자이펀이면.
        if( yes==4)
        {
                D( " 쳇! 자이펀인이로군...." )
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
@Npc00046    
;; 잡화점
 	sGetNat(); 자이펀이면.
        if( yes==4)
        {
                D( " 쳇! 자이펀인이로군...." )
                goto ENDnation_
        }
        D( "다른 길드에서 팔지 않는다면 이곳에 다있지 자 한번 골라 보시게" );
        CallSmallMenu( 0, 60 )	; 잡화점 인터페이스

end
@Npc00047
;; 활제작소
 	sGetNat(); 자이펀이면.
        if( yes==4)
        {
                D( " 쳇! 자이펀인이로군...." )
                goto ENDnation_
        }
	random( 0, 3 )
	if( ran == 0 )
	{
		D("궁수라면 당연히 활을 가지고 있어야지~" )
	}
	if( ran == 1 )
	{
		D( "전쟁에서 화살과 비도의 위력은 상당히 크지..." )
	}
	if( ran == 2 )
	{
		D( "멀리있는 목표물을 맞추기 위해서는 비도와 화살이 필요하지.." )
	}
	CallSmallMenu( 0, 27 ) 


end
@Npc00048
;;  Change the Color (옷, 장식 컬러 교체)
 	sGetNat(); 자이펀이면.
        if( yes==4)
        {
                D( " 쳇! 자이펀인이로군...." )
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
 	sGetNat(); 자이펀이면.
        if( yes==4)
        {
                D( " 쳇! 자이펀인이로군...." )
                goto ENDnation_
        }
	random( 0, 3 )
	if( ran == 0 )
	{
		D("이 돈은 바이서스 왕국의 위해 쓰여질 것이야...")
	}
	if( ran == 1 )
	{
		D( "이 봐.. 그 것뿐이야? 좀 더 성의를 보이게나...")
	}
	if( ran == 2 )
	{
		D( "공짜로 달라는 건 아냐, 국가에서도 성의를 보이겠지." )
	}
	CallSmallMenu( 0, 77 )
:ENDnation_
end





@Event00000
;; 휴다인강
        MapMove( "Source", 270,8 )
       	if( yes == 1 ) 
	{
		EventMsg( "휴다인강으로 이동합니다." ) 
	}
	else
	{
		EventMsg( "맵 이동에 실패했습니다." ) 
	}
end

@Event00001
;; 헬턴트성
        MapMove( "K_Sung2", 344,224 )
      	if( yes == 1 ) 
	{
		EventMsg( "헬턴트성으로 이동합니다." ) 
	}
	else
	{
		EventMsg( "맵 이동에 실패했습니다." ) 
	}
end

@Event00002
;; 휴다인 고개
        MapMove( "Hu_Vm", 9,10 )
       	if( yes == 1 ) 
	{
		EventMsg( "휴다인고개로 이동합니다." ) 
	}
	else
	{
		EventMsg( "맵 이동에 실패했습니다." ) 
	}
end

@Event00003           
;; 회색산맥
        MapMove( "Gray", 346,349 )
       	if( yes == 1 ) 
	{
		EventMsg( "회색산맥으로 이동합니다." ) 
	}
	else
	{
		EventMsg( "맵 이동에 실패했습니다." ) 
	}
end

@Event00004
;; 초보자 안내소
;; 레벨 7 이하까지 출입가능
        IsLevel(7)
        if( yes == 1)
        {
	        EventMsg("이곳은 초보자의 가이드를 위한 맵입니다. 당신은 초보가 아니군요")
        	QuestSound(15007)
        }
        else
        {
					MapMove( "Scholium2", 51, 164 )
		if( yes == 1 )
		{
			EventMsg("초보자 안내소로 포탈 이동합니다.")
			QuestSound(15007)
		}
		else
		{
			EventMsg("맵 이동에 실패했습니다.")
		}
        }
end

@Event00005

end

@Event00006
; 길드집으로
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
