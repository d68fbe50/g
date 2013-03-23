
@sys00	; 처음 서버 Setting하는 함수.

	MaxNPC( 50 )
	MapName( "barantan" )

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
;; 마을회관
	random( 0, 2 ) 
	if( ran == 0 ) 
	{
		D( "일스공국의 수도 바란 탄에 온 걸 환영하오." ) 
	}
	if( ran == 1 ) 
	{
		D( "일스공국의 앞날은 어떻게 될지 걱정이 된다네. 자네는 안 그런가?" ) 
	}
	CallSmallMenu( 0, 29 ) 
end
@Npc00004
;; 여관
	random( 0, 2 ) 
	if( ran == 0 ) 
	{
		D( "이 곳에서 휴식과 수면을 취하면 Life와 Health가 빠르게 회복된답니다." ) 
	}
	if( ran == 1 ) 
	{
		D( "마법사라면 메모라이즈를 위해서 휴식과 수면이 꼭 필요합니다." ) 
	}
        CallSmallMenu( 0, 67 ) 
end
@Npc00005
;; 은행
	D( "어서 오시구려. 이곳은 일스의 바란 탄 은행입니다. 예금,출금,대출,보관 업무가 가능하죠 " ) 
        CallSmallMenu( 0, 13 ) 
end
@Npc00006
;; 주점
        random( 0, 2 ) 
        if( ran == 0 ) 
        {
	        D( "어서 오시게. 뭐? 골든벨을 울린다고? 무슨 좋은 일이라도 있나?" ) 
        }
        if( ran == 1 ) 
	{
		D( "어서 오게나. 자네는 어떤 일을 하는 사람인가? 좋은 인상을 가지고 있군. " ) 
        }
        CallSmallMenu( 0, 57 ) 
end
@Npc00007
;; 병원
        D( "이 곳은 병원이야. 이상하게도 요즘은 병원을 찾는 사람이 없군." ) 
        CallSmallMenu( 0, 63 ) 
end
@Npc00008
;; 학술원
        D( "학문을 갈고 닦는 길은 끝이 없어. 항상 마음 가짐을 청결히 하게나." ) 
        CallSmallMenu( 0, 72 ) 
end
@Npc00009
;; 길드관리소
        D( "어서 오시오, 당신은 어느 길드 소속인가?" ) 
	CallSmallMenu( 0, 76 ) ;길드관리 인터페이스
end
@Npc00010
;; 화폐개혁 (은행)
        D( " 이곳은 화폐개혁을 추진하는 곳입니다. 화폐단위가 cell에서 crit으로 바뀐 것을 선포합니다.. " );
        CallSmallMenu( 0, 78 )
end
@Npc00011
;; 농장주인
        random( 0, 2 ) 
        if( ran == 0 ) 
        {
	        D( "땅에서 나는 모든 산물은 시무니안의 영광이 깃들어  있지. " ) 
        }
        if( ran == 1) 
	{
	        D( " 대지라는 거대한 적과 싸우는 농부의 땀은 정말 값진 것이야." ) 
        }
        CallSmallMenu( 0, 19 )
end
@Npc00012
;; 빵집주인
        random( 0, 3 ) 
        if( ran == 0 ) 
        {
	        D( "일스는 희귀한 음식이 아주 많다네." ) 
        }       
        if( ran == 1) 
        {
	        D( "멀리 길을 떠나는가? 음식을 넉넉히 준비하지 않으면 굶어죽을거야. " ) 
        }       
        if( ran == 2 ) 
        {
	        D( "내가 일스 요리대회에서 1등을 했다네. 움하하~ " ) 
        }
        CallSmallMenu( 0, 20 ) 
end
@Npc00013
;; 대장간
        random( 0, 2 ) 
        if( ran == 0 ) 
        {
	        D( "난 대장장이라오. 조금 더워도 참으시게나. 대장간이라 항상 뜨거운 열이 가득차 있지. " ) 
        }
        if( ran == 1 ) 
        {
	        D( "불에 이글거리는 쇠를 보고 있자면, 무언가에 사로잡히는 듯하다네." ) 
        }
        CallSmallMenu( 0, 18 ) 
	
end
@Npc00014
;; 무기점
        random( 0, 2 ) 
        if( ran == 0 ) 
        {
	        D( "난 무기점 주인이라오. 일스가 아무리 작은 나라지만, 최소한의 방어는 가능하도록 해야." ) 
        }
        if( ran == 1 ) 
        {
	        D( "자네 혹시 걸프 스트림을 아시는가? " ) 
        }
        CallSmallMenu( 0, 18 ) 
end
@Npc00015
;; 목공소
        random( 0, 2 ) 
        if( ran == 0 ) 
        {
	        D( "이곳에서는 목재로 무기와 가구, 도구를 만들 수 있습니다." ) 
        }
        if( ran == 1 ) 
        {
	        D( "여기에서는 석양에 비쳐서 붉은 빛의 숲을 볼 수 있다네." ) 
        }
        CallSmallMenu( 0, 26 )
end
@Npc00016
;; 활제작소
        random( 0, 2 ) 
        if( ran == 0 ) 
        {
	        D( "자네 가끔은 빗나가게 쏘는 것이 어떤가? " ) 
        }
        if( ran == 1 ) 
        {
	        D( "루트에리노를 따르던 여덟기사 중 우타크를 아는가? " ) 
        }
        CallSmallMenu( 0, 27 ) 
end
@Npc00017
;; 푸줏간
        random( 0, 2 ) 
        if( ran == 0 ) 
        {
        	D( "사람이 곡식과 야채만을 먹고 살 수 있을까? 고기도 가끔은 먹어야 힘이 날거야." ) 
        }
        if( ran == 1 ) 
        {
        	D( "소는 죽어서 고기와 가죽을 남기고, 양은 살아서 털을 남긴다네. 자네는 죽어서 무엇을 남기려나?" ) 
        }
        CallSmallMenu( 0, 22 ) 
end
@Npc00018
;; 의류점
        random( 0, 3 ) 
        if( ran == 0 ) 
        {
	        D( "옷감의 재료를 구해 왔나? " ) 
        }       
        if( ran == 1) 
        {
	        D( "자자, 다들 좋은 옷을 골라 보게, 일스에선 어떤 옷을 입어야 어울릴까? " ) 
        }       
        if( ran == 2 ) 
        {
        D( "자네 옷은 어디에서 샀나? 우리집에서 만든 옷이 더 어울릴텐데." ) 
        }
        CallSmallMenu( 0, 24 ) 
end
@Npc00019
;; 점성술사
        random( 0, 3 ) 
        if( ran == 0 ) 
        {
	        D( "마나는 보이지 않는 대자연의 힘이 뭉쳐진 것이라네. " ) 
        }
        if( ran == 1 ) 
        {
	        D( "마법은 신력을 거부하지만, 반드시 그렇지만은 않다네. " ) 
        }
        if( ran == 2 ) 
        {
	        D( "당신은 마법사와 인연이 많군요." ) 
        }
        CallSmallMenu( 0, 71 ) 
end
@Npc00020
;; 약초점
	random( 0, 2 ) 
        if( ran == 0 ) 
        {
	       	D( "자네 약초 때문에 살이 많이 빠졌군. 약초는 건강에 좋다네. " ) 
        }
        if( ran == 1 ) 
        {
	        D( "약초는 주위의 신비한 힘에 뿌리내리고 있어서 약효가 좋아. " ) 
        }
	CallSmallMenu( 0, 21 ) 
end
@Npc00021
;; 연금술소
        random( 0, 3 ) 
        if(ran == 0) 
        {
	        D( " 할 말 있으면 빨리 하게. 지금 철을 금으로 만드는 방법을 구상중이야. " ) 
        }
        if(ran == 1) 
        {
	        D( " 연금술이란 것은 참으로 신비한 기술이야. " ) 
        }
        if(ran == 2) 
        {
	        D( " 당신은 세상이 4가지 원소로 이루어져 있다는 것을 아는가? " ) 
        }       
        CallSmallMenu( 0, 25 ) ; 연금술소
end
@Npc00022
;; 초쟁이
	random( 0, 2 ) 
        if( ran == 0 ) 
        {
	        D( "혹시 양초의 원료가 무었인지 알고 있나? 모른다면 가르쳐주지." ) 
        }
        if( ran == 1 ) 
        {
	        D( "앞으로 새로운 양초들이 많이 만들어질걸세. 기대하시게나." )  
        }
        CallSmallMenu( 0, 23 ) 
end
@Npc00023
;; 낚시점
	random( 0, 2 ) 
        if( ran == 0 ) 
        {
	        D( "자네는 낚시를 해 본 적 있소? 저쪽으로 가면 어부들이 많지. " ) 
        }
        if( ran == 1 ) 
        {
	        D( "바닷바람을 맞으면 몸이 나른한 이유를 아는가? " ) 
        }
        CallSmallMenu( 0, 28 ) ;조선소
end
@Npc00024
;; 잡화점
        random( 0 , 2 ) 
        if( ran == 0 ) 
        {
	        D( "우리 상점에서는 다른 상점에서는 팔지 않는 물건도 판다네." )
        }
        if( ran == 1 ) 
        {
	        D( "필요한 것이 있다면 언제든지 오게나." ) 
        }
        CallSmallMenu( 0, 60 ) 
end
@Npc00025
;; 전체 공지
        random( 0 , 2 ) 
        if( ran == 0 ) 
        {
	        D( "사람들에게 알리고 싶은 것이 있나 보죠?" ) 
        }
        if( ran == 1 ) 
        {
	        D( "바란탄에 모든 일스 국민 여러분..." ) 
        }
        CallSmallMenu( 0, 79 )
end
@Npc00026

end
@Npc00027
;; Change the Color
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
@Npc00028
;; 오렘신전
        random( 0 , 2 ) 
        if( ran == 0 ) 
        {
        D( "정의가 닿는 그 어느곳에서라도 피어오르는 장미를." ) 
        }
        if( ran == 1 ) 
        {
        D( "장미와 정의의 오렘 신전입니다." ) 
        }
        CallSmallMenu( 0, 82 ) ; Orem 
end
@Npc00029
;; 비자 판매
	CheckNation(6)
	if(yes==1)
	{
		random( 0 , 3 )
        	if( ran == 0 )
	        {
        		D( "이 곳은 타국의 출입증을 판매하는 곳입니다. " );
	        }
        	if( ran == 1 )
	        {
		        D( "다른 나라로 가실려면, 출입증을 항상 휴대하고 계셔야 합니다." );
	        }
        	if( ran == 2 )
	        {
        		D( "출입증은 타국의 마을로 들어갈 때 회수하게 됩니다." );
	        }
        	CallSmallMenu( 0, 85 )
        }
        else
	{
		random( 0 , 3 )
	        if( ran == 0 )
        	{
		        D( "이 곳은 일스인에게 타국의 출입증을 판매하는 곳입니다. " );
	        }
	        if( ran == 1 )
	        {
		        D( "일스 사람이 아니군요. 당신의 수도에 가서 출입증을 발급받으시기 바랍니다." );
	        }
	        if( ran == 2 )
	        {
			D( "죄송합니다. 이 곳은 일스인들만 이용이 가능합니다. " );
	        }
	}
end
@Npc00030
;일스 지도보기
 	sGetNat()
	if(yes==6)
	{
		CmpQuestNumStep(49,122)
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
			D("바란탄에서 몬스터가 나타나는 곳이네..")
			sCallCustomSmallMenu(280,4,436,379,900)	;바란탄 몬스터 지도
			EventMsg("이것은 바란탄의 주요 사냥터입니다. 다음은 세들레스의 주요 사냥터를 볼 수 있습니다.")
			SetQuestNumStep(49,122)
			goto ENDmonmap_
		}
		CmpQuestNumStep(49,122)
		if(yes==1)
		{
			D("세들레스의 주요 사냥터 지역입니다.")
			sCallCustomSmallMenu(280,10,436,494,900)	;세들레스 몬스터 지도
			EventMsg("이것은 세들레스의 주요 사냥터입니다. 처음부터 다시 보고 싶다면, 다시 클릭해주세요..")
			SetQuestNumStep(49,123)
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
@Npc00031
end
@Npc00032
	D("정의가 닿는 그 어느곳에서라도 피어오르는 장미를.. 열정의 꽃잎처럼 불타는 마음을...")
end
@Npc00033	;초보안내 NPC
	sGetNat()
	if(yes==6)
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
				sCallCustomSmallMenu(280,7,493,427,770)		;일스 전사맵 띄우기
				SendSound(0,1432)
				SetQuestNumStep(49,106)
				goto ENDchobo_
			}
			if(yes==1)	;도둑이면
			{
				sCallCustomSmallMenu(280,5,493,427,770)		;일스 도둑맵 띄우기
				SendSound(0,1432)
				SetQuestNumStep(49,106)
				goto ENDchobo_
			}
			if(yes==2)	;궁수이면
			{
				sCallCustomSmallMenu(280,4,493,427,770)		;일스 궁수맵 띄우기
				SendSound(0,1432)
				SetQuestNumStep(49,106)
				goto ENDchobo_
			}
			if(yes==3)	;마법사이면
			{
				sCallCustomSmallMenu(280,6,493,427,770)		;일스 마법사맵 띄우기
				SendSound(0,1432)
				SetQuestNumStep(49,106)
				goto ENDchobo_
			}
			if(yes==4)	;성직자이면
			{
				sCallCustomSmallMenu(280,6,493,427,770)		;일스 성직자맵 띄우기
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
			D("죽음을 당하셨을 때에는 오렘 신전에서 '붉은 장미와 정의의 오렘의 이름으로' 주문을 통해 다시 살아나실 수 있답니다.")
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
@Npc00034
;; 길드원리스트 열기
	D("길드에 소속되어 계시다면, 제가 길드원 리스트를 보여드리지요.")
	CallMenu(24)
end
@Npc00035
;; 길드 엠포리아 구입
	D("길드 엠포리아를 구입하시려구요?")
	CallMenu(68)
end
@Npc00036
;; 서바이벌 이벤트 NPC
	CheckEventLocalWarStatus()
	if( yes==0 )
	{
		goto END0101_ ; 이벤트 없음
	}
	if( yes==1 )
	{
		goto END0102_ ; 이벤트 등록
	}
	if( yes==2 )
	{
		goto END0103_ ; 이벤트 이동
	}
	if( yes==3 )
	{
		goto END0104_ ; 이벤트 진행중
	}
	if( yes==4 )
	{
		goto END0105_ ; 이벤트 휴식
	}
	
:END0101_
	D(" 아직 대회 일정이 잡히지 않았습니다. 대회 일정이 잡히면 공지로 알려 드릴 것입니다. ")
	goto END0199_
	
:END0102_
	D(" 대회 참가자 등록을 받고 있습니다. ")
	CallMenu(293)
	goto END0199_

:END0103_
	D(" 대회 참가 신청자들은 대회 장소로 이동하시기 바랍니다. ")
	CallMenu(294)
	goto END0199_
	
:END0104_
	D(" 현재 대회 진행 중입니다. 대회가 끝난 후에 참가 신청을 하시기 바랍니다.")
	goto END0199_

:END0105_
	D(" 다음 대회는 잠시 후에 접수를 받게 됩니다. 공지를 하면 접수를 해 주시기 바랍니다. ")
	goto END0199_


:END0199_

end
@Npc00037
;; 포탈 인터페이스 호출
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
@Npc00038
end
@Npc00039
end
@Npc00040
end
@Npc00041
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
end
@Npc00046
end
@Npc00047
end
@Npc00048
;; 국가 고급 아이템 상점
	D("국가 기부금으로 운영되는 상점입니다. 돈과 명성을 통해 고급아이템을 구하실 수 있습니다.")
	CallMenu( 66 )
end
@Npc00049
;; 국가후원회 (국가기부금)
	random( 0, 3 )
	if( ran == 0 )
	{
		D("감사합니다..정의가 닿는 그 어느곳에서라도 피어오르는 장미를..")
	}
	if( ran == 1 )
	{
		D( "이 봐.. 그 것뿐이야? 좀 더 성의를 보이게나...")
	}
	if( ran == 2 )
	{
		D( "어떤가? 일스는 아주 살기 좋은 나라라고 생각하지 않는가?" )
	}
	CallSmallMenu( 0, 77 )
end


@Event00000

end
@Event00001
;; 세들레스 입구
	MapMove( "Sedless", 160,410 ) 
	if( yes == 1 ) 
	{
		EventMsg( "세들레스로 이동합니다." ) 
	}
	else
	{
		EventMsg( "맵 이동에 실패했습니다." ) 
	}
end
@Event00002
;; 시청 안 --> 져스티스 기사단
	QuestTeleport(1,20,94) 
	EventMsg( "져스티스 기사단으로 포탈 이동합니다." ) 
end
@Event00003
;; 오렘신전에서 --> 마을광장
	QuestTeleport(1,329,95) 
	EventMsg( "마을광장으로 포탈 이동합니다." ) 
end
@Event00004
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
@Event00005

end
@Event00006	

end
@Event00007
;; 초보자 안내소
;; 레벨 7 이하까지 출입가능
       IsLevel(7) 
       if( yes == 1) 
       {
	  	    EventMsg( "이곳은 초보자의 가이드를 위한 맵입니다. 당신은 초보가 아니군요" ) 
					SendSound(0,0161) 
       }
       else
       {
					MapMove( "Scholium2", 51, 164 ) 
					if( yes == 1 ) 
					{
						EventMsg( "초보자 안내소로 포탈 이동합니다." ) 
						SendSound(0,0161) 
					}
					else
					{
						EventMsg( "맵 이동에 실패했습니다." ) 
						SendSound(0,0161) 
					}
      }
end
@Event00008
;; 3등급 길드집
	IsMyGuildHouse(8)
	if(yes == 1)	; 테스트서버 버전
	{
		EventMsg(" 환영합니다. 이 곳은 길드 엠포리아 입니다...")
		goto ENDkey1_
	}
	else
	{
		EventMsg("이 곳은 길드의 엠포리아입니다. 길드원만이 들어갈 수 있습니다.")
		SendSound(0,0161) 
		goto ENDkey1_
	}
:ENDkey1_
end
@Event00009	
end

@Event00010
;; 세들레스 입구
	MapMove( "Naurchen", 8,270 ) 
	if( yes == 1 ) 
	{
		EventMsg( "나우르첸으로 이동합니다." ) 
	}
	else
	{
		EventMsg( "맵 이동에 실패했습니다." ) 
	}
end
@Event00011
end
@Event00012
;; 길드관리소 비밀통로 좌
	QuestTeleport(1,330,54)
end
@Event00013
;; 길드관리소 비밀통로 우
	QuestTeleport(1,330,54) 
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
