
@sys00	; 처음 서버 Setting하는 함수.

	MaxNPC( 50 )
	
	MapName( "Scholium" )
	
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

@Npc00001	;하프여인
; Tutorial 1step
	CmpQuestNumStep(63,1)
	if(yes==0)
	{
		D("드래곤 라자에 오신걸 환영합니다")
		SendSound(0,0050)
		SetQuestNumStep(63,2)
		goto ENDtutori1_
	}
	CmpQuestNumStep(63,1)
	if(yes==1)
	{
		D("드래곤 라자에 오신걸 환영합니다")
		SendSound(0,0050)
		SetQuestNumStep(63,2)
		goto ENDtutori1_
	}	
	CmpQuestNumStep(63,2)
	if(yes==1)
	{
		D("메인 인터페이스의 주요 기능들을 알려드릴께요.")
		SendSound(0,2425)
		SetQuestNumStep(63,3)
		goto ENDtutori1_
	}
	CmpQuestNumStep(63,3)
	if(yes==1)
	{
		D("인터페이스 중앙의 6개 버튼은 각각 자기 정보, 인벤토리, 파티, 마법, 전투스킬, 스킬 창을 여는 버튼이에요.")
		SendSound(0,2425)
		SetQuestNumStep(63,4)
		goto ENDtutori1_
	}
	CmpQuestNumStep(63,4)
	if(yes==1)
	{
		sGetSpell()
		if( yes == 0 )	 ;위자드스펠일때
		{
			D("빨간색, 파란색, 노란색 막대가 보이시나요?")
			SendSound(0,2425)
			SetQuestNumStep(63,5)
			goto ENDtutori1_
		}
		else		; 프리스트스펠일때
		{
			D("빨간색, 초록색, 노란색 막대가 보이시나요?")
			SendSound(0,2425)
			SetQuestNumStep(63,5)
			goto ENDtutori1_
		}
	}
	CmpQuestNumStep(63,5)
	if(yes==1)
	{
		sGetSpell()
		if(yes==0)	;위자드스펠일때
		{
			D("빨간색은 생명력을, 파란색은 마법 사용을 위한 마나량을, 노란색을 배고픔을 나타낸답니다.")
			SendSound(0,2425)
			SetQuestNumStep(63,6)
			goto ENDtutori1_
		}
		else		;프리스트스펠일때
		{
			D("빨간색은 생명력을, 초록색은 신법 사용을 위한 디바인량을, 노란색은 배고픔을 나타낸답니다.")
			SendSound(0,2425)
			SetQuestNumStep(63,6)
			goto ENDtutori1_
		}
	}
	CmpQuestNumStep(63,6)
	if(yes==1)
	{
		sGetSpell()
		if(yes==0)	;위자드스펠일때
		{
			D("생명력은 힐링포션으로, 마나는 마나포션으로, 그리고 배고픔은 빵 등의 음식으로 회복할 수 있어요.")
			SendSound(0,2425)
			SetQuestNumStep(63,7)
			goto ENDtutori1_
		}
		else		;프리스트스펠일때
		{
			D("생명력은 힐링포션으로, 배고픔은 빵 등의 음식으로 회복할 수 있으며, 디바인은 시간이 지남에 따라 저절로 회복된답니다.")
			SendSound(0,2425)
			SetQuestNumStep(63,7)
			goto ENDtutori1_
		}
	}
	CmpQuestNumStep(63,7)
	if(yes==1)
	{
		D("우측의 PEACE 버튼을 BATTLE 상태로 바꾸면(단축키 tab) 캐릭터가 전투할 수 있는 자세로 변경되요.")
		SendSound(0,2425)
		SetQuestNumStep(63,8)
		goto ENDtutori1_
	}
	CmpQuestNumStep(63,8)
	if(yes==1)
	{
		D("MAP 버튼은 현재 위치해 있는 지역의 전체 지도 및 나의 현재 위치, 그리고 몬스터의 분포 위치를 알려준답니다.")
		SendSound(0,2425)
		SetQuestNumStep(63,9)
		goto ENDtutori1_
	}
	CmpQuestNumStep(63,9)
	if(yes==1)
	{
		D("또한 우측에 위치한 게임 내에서 편지를 주고 받을 수 있는 메일 버튼과 국가간 전쟁 관리를 하는 전쟁관리소 버튼도 보이죠?")
		SendSound(0,2425)
		SetQuestNumStep(63,10)
		goto ENDtutori1_
	}
	CmpQuestNumStep(63,10)
	if(yes==1)
	{
		D("검이 그려진 버튼은 자신이 배운 전투 스킬을 여는 버튼으로 전투 스킬을 사용하고자 할 때 사용되지요.")
		SendSound(0,2425)
		SetQuestNumStep(63,11)
		goto ENDtutori1_
	}
	CmpQuestNumStep(63,11)
	if(yes==1)
	{
		D("인터페이스 각 버튼에는 단축키 표시가 되어 있어 쉽게 익힐 수 있으니, 꼬옥~ 확인하세요.")
		SendSound(0,2425)
		SetQuestNumStep(63,13)
		goto ENDtutori1_
	}
	CmpQuestNumStep(63,13)
	if(yes==1)
	{
		sCallCustomSmallMenu(280,0,516,395,10027)	;메인인터 그림 띄우기 변경일 2002년7월8일
		SendSound(0,1432)
		SetQuestNumStep(63,14)
		goto ENDtutori1_
	}
	CmpQuestNumStep(63,14)
	if(yes==1)
	{
		D("무기는 인벤토리 창을 열어 오른 손에 착용해요. 특히 활은 오른손에, 화살은 왼손에 착용하는거 잊지마세요.")
		SendSound(0,2425)
		SetQuestNumStep(63,15)
		goto ENDtutori1_
	}
	CmpQuestNumStep(63,15)
	if(yes==1)
	{
		sGetNat()
		if(yes==6)	;일스 국가 소속일 때
		{
			D("전투나 PK에 의해 죽었을 경우에는 마을의 오렘 신전에서 다시 살아날 수 있어요.")
			SendSound(0,2425)
			SetQuestNumStep(63,16)
			goto ENDtutori1_
		}
		else		;바이서스나 자이펀 국가 소속일 때
		{
			D("전투나 PK에 의해 죽었을 경우에는 마을의 에델브로이 신전에서 다시 살아날 수 있어요.")
			SendSound(0,2425)
			SetQuestNumStep(63,16)
			goto ENDtutori1_
		}
	}
	CmpQuestNumStep(63,16)
	if(yes==1)
	{
		sGetNat()
		if(yes==6)	;일스 국가 소속일 때
		{
			D("오렘 신전에서 '붉은 장미와 정의의 오렘의 이름으로' 라고 주문을 외우면 다시 생명을 얻게 된답니다.")
			SendSound(0,2425)
			SetQuestNumStep(63,17)
			goto ENDtutori1_
		}
		else		;바이서스나 자이펀 국가 소속일 때
		{
			D("에델브로이 신전에서 '코스모스와 대폭풍의 에델브로이 이름으로' 라고 주문을 외우면 다시 생명을 얻게 된답니다.")
			SendSound(0,2425)
			SetQuestNumStep(63,17)
			goto ENDtutori1_
		}
	}
	CmpQuestNumStep(63,17)
	if(yes==1)
	{
		D("지금까지 기본적인 지식들을 알려드렸으니, 이제 충분히 게임을 진행하실 수 있을거에요.")
		SendSound(0,2425)
		SetQuestNumStep(63,18)
		goto ENDtutori1_
	}
	CmpQuestNumStep(63,18)
	if(yes==1)
	{
		D("이제 포탈지역으로 가셔서 다음 단계를 진행하세요..^^")
		SendSound(0,2425)
		SetQuestNumStep(63,19)
		goto ENDtutori1_
	}
	CmpQuestNumStep(63,18)
	if(yes==2)
	{
		D("어서 포탈지역으로 가서 다음 사람을 만나세요.")
		SendSound(0,2425)
		goto ENDtutori1_
	}

:ENDtutori1_

end

@Npc00002	;기사
; Turorial 2step
	CmpQuestNumStep(63,19)
	if(yes==1)
	{
		D("이곳은 수련을 통해 레벨을 올리는 곳입니다. 이제 레벨을 올려보도록 하죠. 흠흠")
		SendSound(0,0092)
		SetQuestNumStep(63,20)
		goto ENDtutori2_
	}
	CmpQuestNumStep(63,20)
	if(yes==1)
	{
		sGetClass()
		if(yes==0)	;전사일 경우
		{
			D("님이 사용하실 무기를 착용하신 후 PEACE에서 BATTLE 상태로 바꾸고 저기 있는 더미들을 무작정 때리십시오. 으음..")
			SendSound(0,2425)
			SetQuestNumStep(63,21)
			goto ENDtutori2_
		}
		if(yes==2)	;궁수일 경우
		{
			D("활과 화살을 착용하신 후 PEACE에서 BATTLE 상태로 바꾸고 저기 있는 더미들을 무작정 때리십시오. 으음..")
			SendSound(0,2425)
			SetQuestNumStep(63,21)
			goto ENDtutori2_
		}
		if(yes==1)	;도둑일 경우
		{
			D("비검과 방패를 착용하신 후 PEACE에서 BATTLE 상태로 바꾸고 저기 있는 더미들을 무작정 때리십시오. 으음..")
			SendSound(0,2425)
			SetQuestNumStep(63,21)
			goto ENDtutori2_
		}
		if(yes==3)	;마법사일 경우
		{
			D("쇼트스태프를 착용하신 후 PEACE에서 BATTLE 상태로 바꾸고 저기 있는 더미들을 무작정 때리십시오. 으음..")
			SendSound(0,2425)
			SetQuestNumStep(63,21)
			goto ENDtutori2_
		}
		if(yes==4)	;성직자일 경우
		{
			D("쇼트스태프를 착용하신 후 PEACE에서 BATTLE 상태로 바꾸고 저기 있는 더미들을 무작정 때리십시오. 으음..")
			SendSound(0,2425)
			SetQuestNumStep(63,21)
			goto ENDtutori2_
		}
	}
	CmpQuestNumStep(63,21)
	if(yes==1)
	{
		MessageBox("수련하셔서 레벨을 4까지 올린 다음에 다시 저에게 오십시오. 레벨만 올리시고 다른 것은 함부로 건드리지 마십시오. 건투를 빕니다.")
		SendSound(0,2087)
		SetQuestNumStep(63,22)
		goto ENDtutori2_
	}
	CmpQuestNumStep(63,22)
	if(yes==1)
	{
		sGetLevel()
		if(yes < 4)
		{
			D("강인하게 되기를 원하지 않으십니까? ^^ 어서 4레벨까지 올리신 후 저에게 오십시오.")
			SendSound(0,2161)
			goto ENDtutori2_
		}
		else
		{
			D("수고가 많으셨습니다.")
			SendSound(0,1309)
			SetQuestNumStep(63,23)
			goto ENDtutori2_
		}
	}
	CmpQuestNumStep(63,23)
	if(yes==1)
	{
		D("저레벨이실 때에는 이렇게 더미를 통해 수련을 하면 서서히 레벨을 올릴 수 있습니다.")
		SendSound(0,2425)
		SetQuestNumStep(63,24)
		goto ENDtutori2_
	}
	CmpQuestNumStep(63,24)
	if(yes==1)
	{
		D("이제 어느 정도 레벨을 갖추셨으니, 포탈지역으로 가셔서 다음 단계로 가십시오.")
		SendSound(0,2425)
		SetQuestNumStep(63,25)
		goto ENDtutori2_
	}
	CmpQuestNumStep(63,24)
	if(yes==2)
	{
		D("포탈지역으로 어서 가십시오. 어떤 분이 당신을 기다리고 계십니다.")
		SendSound(0,2425)
		goto ENDtutori2_
	}
			
:ENDtutori2_
end

@Npc00003	;하프여인
; Tutorial 3step
	CmpQuestNumStep(63,25)
	if(yes==1)
	{
		D("레벨 업을 잘 하셨네요. 그럼 이제부터는 매우 중요한!! 어빌리티 분배에 관해 알려드릴께요.")
		SendSound(0,0096)
		SetQuestNumStep(63,26)
		goto ENDtutori3_
	}
	CmpQuestNumStep(63,26)
	if(yes==1)
	{
		D("좌측 하단에 붉은 색으로 깜빡이는 'LEVEL UP'을 눌러보세요. POINT 부분에 숫자가 보이나요?")
		SendSound(0,2425)
		SetQuestNumStep(63,27)
		goto ENDtutori3_
	}
	CmpQuestNumStep(63,27)
	if(yes==1)
	{
		D("그 포인트로 자신의 어빌리티를 직접 올리는 거예요. 올려야 할 어빌리티의 종류는 클래스마다 차이가 있죠.")
		SendSound(0,2425)
		SetQuestNumStep(63,28)
		goto ENDtutori3_
	}
	CmpQuestNumStep(63,28)
	if(yes==1)
	{
		sGetClass()
		if(yes==0)	;전사일 경우
		{
			D("님은 전사로군요. 전사는 힘과 체력을 바탕으로 하는 클래스이므로, STR과 CON 수치를 올립니다.")
			SendSound(0,2425)
			SetQuestNumStep(63,29)
			goto ENDtutori3_
		}
		if(yes==2)	;궁수일 경우
		{
			D("님은 궁수로군요. 궁수는 정확함과 민첩성을 요구하는 클래스이므로, DEX와 MOVP, 그리고 CON 수치를 올립니다.")
			SendSound(0,2425)
			SetQuestNumStep(63,29)
			goto ENDtutori3_
		}
		if(yes==1)	;도둑일 경우
		{
			D("님은 도둑이군요. 도둑은 빠른 움직임과 민첩성을 요구하는 클래스이므로, DEX와 MOVP, 그리고 CON 수치를 올립니다.")
			SendSound(0,2425)
			SetQuestNumStep(63,29)
			goto ENDtutori3_
		}
		if(yes==3)	;마법사일 경우
		{
			D("님은 마법사네요. 마법사는 강력한 공격마법을 운용하는 클래스이므로, INT와 WS, 그리고 CON 수치를 올립니다.")
			SendSound(0,2425)
			SetQuestNumStep(63,29)
			goto ENDtutori3_
		}
		if(yes==4)	;성직자일 경우
		{
			D("님은 성직자네요. 성직자는 성스러운 보호신법을 운용하는 클래스이므로, WIS와 PS, 그리고 CON 수치를 올립니다.")
			SendSound(0,2425)
			SetQuestNumStep(63,29)
			goto ENDtutori3_
		}
	}
	CmpQuestNumStep(63,29)
	if(yes==1)
	{
		sGetClass()
		if(yes==0)	;전사일 경우
		{
			D("창을 사용하는 경우를 제외하고는 절대 DEX 수치를 올리시면 안돼요~~!!")
			SendSound(0,2425)
			SetQuestNumStep(63,30)
			goto ENDtutori3_
		}
		if(yes==2)	;궁수일 경우
		{
			D("무거운 활을 잘 다루기 위해서는 DEX가 가장 중요하므로, 절대 STR 수치를 올리시면 안돼요~~!!")
			SendSound(0,2425)
			SetQuestNumStep(63,30)
			goto ENDtutori3_
		}
		if(yes==1)	;도둑일 경우
		{
			D("도둑은 방패를 착용할 수 있으며, 클래스 중에 가장 빠른 움직임을 가지므로 CON과 MOVP 수치가 가장 중요합니다.")
			SendSound(0,2425)
			SetQuestNumStep(63,30)
			goto ENDtutori3_
		}
		if(yes==3)	;마법사일 경우
		{
			D("특히 마법사에게 WIS는 아무 도움도 안되는 수치이니 절대!!! WIS 수치를 올리시면 안돼요~~!!")
			SendSound(0,2425)
			SetQuestNumStep(63,30)
			goto ENDtutori3_
		}
		if(yes==4)	;성직자일 경우
		{
			D("특히 성직자에게 INT는 아무 도움도 안되는 수치이니 절대!!! INT 수치를 올리시면 안돼요~~!!")
			SendSound(0,2425)
			SetQuestNumStep(63,30)
			goto ENDtutori3_
		}
	}
	CmpQuestNumStep(63,30)
	if(yes==1)
	{
		D("위와 같이 어빌리티를 올리지 않을 경우, 잘못하면 '허접'(^.^)이란 소릴 들을 수 있어요. 그러니 꼭 기억해두세요~.")
		SendSound(0,2425)
		SetQuestNumStep(63,31)
		goto ENDtutori3_
	}
	CmpQuestNumStep(63,31)
	if(yes==1)
	{
		D("CON 수치의 경우, 이는 빨간 막대인 생명력과 관계있는 수치에요. 이를 많이 올리고 적게 올리고는 님의 선택이지요.") 
		SendSound(0,2425)
		SetQuestNumStep(63,32)
		goto ENDtutori3_
	}
	CmpQuestNumStep(63,32)
	if(yes==1)
	{
		sGetClass()
		if(yes==0)	;전사일 경우
		{
			MessageBox("그럼, 레벨 업 포인트로 'STR 65, CON 45'으로 만드세요~~")
			SendSound(0,1432)
			SetQuestNumStep(63,33)
			goto ENDtutori3_
		}
		if(yes==2)	;궁수일 경우
		{
			MessageBox("그럼, 레벨업 포인트로 'DEX 66, MOVP 18'로 만드세요~~")
			SendSound(0,1432)
			SetQuestNumStep(63,33)
			goto ENDtutori3_
		}
		if(yes==1)	;도둑일 경우
		{
			MessageBox("그럼, 레벨업 포인트로 'DEX 52, MOVP 32' 으로 만드세요~~")
			SendSound(0,1432)
			SetQuestNumStep(63,33)
			goto ENDtutori3_
		}
		if(yes==3)	;마법사일 경우
		{
			MessageBox("그럼, 레벨업 포인트로 'INT 60, WS 33' 으로 만드세요~~")
			SendSound(0,1432)
			SetQuestNumStep(63,33)
			goto ENDtutori3_
		}
		if(yes==4)	;성직자일 경우
		{
			MessageBox("그럼, 레벨업 포인트로 'WIS 51, PS 33' 으로 만드세요~~")
			SendSound(0,1432)
			SetQuestNumStep(63,33)
			goto ENDtutori3_
		}
	}
	CmpQuestNumStep(63,33)
	if(yes==1)
	{
		sGetClass()
		if(yes==0)	;전사일 경우
		{
			sGetAbil(1)
			if(yes>=65)	;STR 65 이상일 경우
			{
				sGetAbil(2)
				if(yes>=45)	;CON 45 이상일 경우
				{
					D("잘 하셨어요. 전사는 STR과 CON을 중점적으로 올려야 한다는 거!! 꼭 기억하세요~~")
					SendSound(0,2128)
				}
				else	;CON 50 이상으로 안올렸을 경우
				{
					D("어빌리티를 제대로 올리지 않으면, '허접' 이 될 수 있어요. 전사는 STR과 CON!! 잊지마세요~")
					SendSound(0,2161)
				}
			}
			else	;STR 65 이상으로 안올렸을 경우 
			{
				D("어빌리티를 제대로 올리지 않으면, '허접' 이 될 수 있어요. 전사는 STR과 CON!! 잊지마세요~")
				SendSound(0,2161)
			}
			SetQuestNumStep(63,34)
			goto ENDtutori3_
		}	
		if(yes==2)	;궁수일 경우
		{
			sGetAbil(3)
			if(yes>=66)	;DEX 66 이상일 경우
			{
				D("잘 하셨어요. 궁수는 DEX와 MOVP와 CON을 중점적으로 올려야 한다는 거!! 꼭 기억하세요~~")
				SendSound(0,2128)
			}
			else	;DEX 66 이상으로 안올렸을 경우 
			{
				D("어빌리티를 제대로 올리지 않으면, '허접' 이 될 수 있어요. 궁수는 DEX와 MOVP와 CON!! 잊지마세요~")
				SendSound(0,2161)
			}
			SetQuestNumStep(63,34)
			goto ENDtutori3_
		}
		if(yes==1)	;도둑일 경우
		{
			sGetAbil(3)
			if(yes>=52)	;DEX 52 이상일 경우
			{
				sGetAbil(4)
				if(yes>=32)	;MOVP 32 이상일 경우
				{
					D("잘 하셨어요. 도둑은 DEX와 MOVP와 CON을 중점적으로 올려야 한다는 거!! 꼭 기억하세요~~")
					SendSound(0,2128)
				}
				else	;MOVP 32 이상으로 안올렸을 경우
				{
					D("어빌리티를 제대로 올리지 않으면, '허접' 이 될 수 있어요. 도둑은 DEX와 MOVP와 CON!! 잊지마세요~")
					SendSound(0,2161)
				}
			}
			else	;DEX 52 이상으로 안올렸을 경우 
			{
				D("어빌리티를 제대로 올리지 않으면, '허접' 이 될 수 있어요. 도둑은 DEX와 MOVP와 CON!! 잊지마세요~")
				SendSound(0,2161)
			}
			SetQuestNumStep(63,34)
			goto ENDtutori3_	
		}
		if(yes==3)	;마법사일 경우
		{
			sGetAbil(6)
			if(yes>=60)	;INT 60 이상일 경우
			{
				sGetAbil(7)
				if(yes>=33)	;WS 33 이상일 경우
				{
					D("잘 하셨어요. 마법사는 INT와 WS와 CON을 중점적으로 올려야 한다는 거!! 꼭 기억하세요~~")
					SendSound(0,2128)
				}
				else	;WS 33 이상으로 안올렸을 경우
				{
					D("어빌리티를 제대로 올리지 않으면, '허접' 이 될 수 있어요. 마법사는 INT와 WS와 CON!! 잊지마세요~")
					SendSound(0,2161)
				}
			}
			else	;INT 60 이상으로 안올렸을 경우 
			{
				D("어빌리티를 제대로 올리지 않으면, '허접' 이 될 수 있어요. 마법사는 INT와 WS와 CON!! 잊지마세요~")
				SendSound(0,2161)
			}
			SetQuestNumStep(63,34)
			goto ENDtutori3_	
		}
		if(yes==4)	;성직자일 경우
		{
			sGetAbil(5)
			if(yes>=51)	;WIS 51 이상일 경우
			{
				sGetAbil(7)
				if(yes>=33)	;PS 33 이상일 경우
				{
					D("잘 하셨어요. 성직자는 WIS와 PS와 CON을 중점적으로 올려야 한다는 거!! 꼭 기억하세요~~")
					SendSound(0,2128)
				}
				else	;PS 33 이상으로 안올렸을 경우
				{
					D("어빌리티를 제대로 올리지 않으면, '허접' 이 될 수 있어요. 성직자는 WIS와 PS와 CON!! 잊지마세요~")
					SendSound(0,2161)
				}
			}
			else	;WIS 51 이상으로 안올렸을 경우 
			{
				D("어빌리티를 제대로 올리지 않으면, '허접' 이 될 수 있어요. 성직자는 WIS와 PS와 CON!! 잊지마세요~")
				SendSound(0,2161)
			}
			SetQuestNumStep(63,34)
			goto ENDtutori3_	
		}
	}
	CmpQuestNumStep(63,34)
	if(yes==1)
	{
		D("위의 사항을 가장 기억하기 쉬운 방법은 내가 '다음에 착용할 무기나 배울 마법의 요구 수치'를 미리 알고 그것에 맞게 올리는 것이에요. ^^")
		SendSound(0,2425)
		SetQuestNumStep(63,35)
		goto ENDtutori3_
	}
	CmpQuestNumStep(63,35)
	if(yes==1)
	{
		D("'/자동분배' 명령어를 통해 어빌리티를 자동으로 분배할 수도 있답니다. 꼬옥~ 기억하시구. 보다 강한 캐릭터로 성장하여 영웅이 될 꿈을 키워 나가세요~~.")
		SendSound(0,2425)
		SetQuestNumStep(63,36)
		goto ENDtutori3_
	}	
	CmpQuestNumStep(63,36)
	if(yes==1)
	{
		D("자, 그럼 다음 단계로 가보세요. 포탈지역으로 가시면 된답니다.")
		SendSound(0,2425)
		SetQuestNumStep(63,37)
		goto ENDtutori3_
	}
	CmpQuestNumStep(63,36)
	if(yes==2)
	{
		D("포탈 지역으로 어서 가세요. 저와의 얘기는 이미 끝났습니다.")
		SendSound(0,2425)
		goto ENDtutori3_
	}
	
:ENDtutori3_
end

@Npc00004	;하프여인
;Tutorial 4step
	sGetClass()
	if(yes==0)	;전사일 경우
	{
		CmpQuestNumStep(63,37)
		if(yes==1)
		{
			D("님은 전사로군요. 님은 아직 마법 관련 능력이 부족하여 현재 마법을 사용할 수 없어요.")
			SendSound(0,0097)
			SetQuestNumStep(63,38)
			goto ENDtutori4_
		}
		CmpQuestNumStep(63,38)
		if(yes==1)
		{
			D("마법사와 성직자를 제외하고는 마법 관련 어빌리티를 따로 올려야 마법을 사용할 수 있답니다. ^^")
			SendSound(0,2425)
			SetQuestNumStep(63,39)
			goto ENDtutori4_
		}
		CmpQuestNumStep(63,39)
		if(yes==1)
		{
			sGetSpell()
			if(yes==0)	;위자드스펠일때
			{
				D("마법 관련 수치란 INT와 WS로, 이 수치를 일정 이상 올리셔야 마법을 사용할 수 있어요.")
				SendSound(0,2425)
				SetQuestNumStep(63,40)
				goto ENDtutori4_
			}
			else		;프리스트스펠일때
			{
				D("마법 관련 수치란 WIS와 PS로, 이 수치를 일정 이상 올리셔야 마법을 사용할 수 있어요.")
				SendSound(0,2425)
				SetQuestNumStep(63,40)
				goto ENDtutori4_
			}
		}
		CmpQuestNumStep(63,40)
		if(yes==1)
		{
			D("그럼 일단 다음 단계로 가세요.")
			SendSound(0,2425)
			SetQuestNumStep(63,54)	;음훼훼
			goto ENDtutori4_
		}
		CmpQuestNumStep(63,40)
		if(yes==2)
		{
			D("포탈지역으로 어서 가세요. 누군가 당신을 찾고 있습니다.")
			SendSound(0,2425)
			goto ENDtutori4_
		}
	}
	if(yes==2)	;궁수일 경우
	{
		CmpQuestNumStep(63,37)
		if(yes==1)
		{
			D("님은 궁수로군요. 님은 아직 마법 관련 능력이 부족하여 현재 마법을 사용할 수 없어요.")
			SendSound(0,0097)
			SetQuestNumStep(63,38)
			goto ENDtutori4_
		}
		CmpQuestNumStep(63,38)
		if(yes==1)
		{
			D("마법사와 성직자를 제외하고는 마법 관련 어빌리티를 따로 올려야 마법을 사용할 수 있답니다. ^^")
			SendSound(0,2425)
			SetQuestNumStep(63,39)
			goto ENDtutori4_
		}
		CmpQuestNumStep(63,39)
		if(yes==1)
		{
			sGetSpell()
			if(yes==0)	;위자드스펠일때
			{
				D("마법 관련 수치란 INT와 WS로, 이 수치를 일정 이상 올리셔야 마법을 사용할 수 있어요.")
				SendSound(0,2425)
				SetQuestNumStep(63,40)
				goto ENDtutori4_
			}
			else		;프리스트스펠일때
			{
				D("마법 관련 수치란 WIS와 PS로, 이 수치를 일정 이상 올리셔야 마법을 사용할 수 있어요.")
				SendSound(0,2425)
				SetQuestNumStep(63,40)
				goto ENDtutori4_
			}
		}
		CmpQuestNumStep(63,40)
		if(yes==1)
		{
			D("그럼 일단 다음 단계로 가세요.")
			SendSound(0,2425)
			SetQuestNumStep(63,54)	;음훼훼
			goto ENDtutori4_
		}
		CmpQuestNumStep(63,40)
		if(yes==2)
		{
			D("포탈지역으로 어서 가세요. 누군가 당신을 찾고 있습니다.")
			SendSound(0,2425)
			goto ENDtutori4_
		}
	}
	if(yes==1)	;도둑일 경우
	{
		CmpQuestNumStep(63,37)
		if(yes==1)
		{
			D("님은 도둑이로군요. 님은 아직 마법 관련 능력이 부족하여 현재 마법을 사용할 수 없어요.")
			SendSound(0,0097)
			SetQuestNumStep(63,38)
			goto ENDtutori4_
		}
		CmpQuestNumStep(63,38)
		if(yes==1)
		{
			D("마법사와 성직자를 제외하고는 마법 관련 어빌리티를 따로 올려야 마법을 사용할 수 있답니다. ^^")
			SendSound(0,2425)
			SetQuestNumStep(63,39)
			goto ENDtutori4_
		}
		CmpQuestNumStep(63,39)
		if(yes==1)
		{
			sGetSpell()
			if(yes==0)	;위자드스펠일때
			{
				D("마법 관련 수치란 INT와 WS로, 이 수치를 일정 이상 올리셔야 마법을 사용할 수 있어요.")
				SendSound(0,2425)
				SetQuestNumStep(63,40)
				goto ENDtutori4_
			}
			else		;프리스트스펠일때
			{
				D("마법 관련 수치란 WIS와 PS로, 이 수치를 일정 이상 올리셔야 마법을 사용할 수 있어요.")
				SendSound(0,2425)
				SetQuestNumStep(63,40)
				goto ENDtutori4_
			}
		}
		CmpQuestNumStep(63,40)
		if(yes==1)
		{
			D("일단 다음 단계로 가세요.")
			SendSound(0,2425)
			SetQuestNumStep(63,54)	;음훼훼
			goto ENDtutori4_
		}
		CmpQuestNumStep(63,40)
		if(yes==2)
		{
			D("포탈지역으로 어서 가세요. 누군가 당신을 찾고 있습니다.")
			SendSound(0,2425)
			goto ENDtutori4_
		}
	}
	if(yes==3)	;마법사일 경우
	{
		CmpQuestNumStep(63,37)
		if(yes==1)
		{
			D("님은 마법사로군요. INT와 WS의 기운이 물씬 느껴져요. ^^")
			SendSound(0,0097)
			SetQuestNumStep(63,38)
			goto ENDtutori4_
		}
		CmpQuestNumStep(63,38)
		if(yes==1)
		{
			D("마법을 사용하려면 우선 마법을 배워야 하는데, 이때 INT와 WS, 그리고 공격마법운용 수치를 요구한답니다.")
			SendSound(0,2425)
			SetQuestNumStep(63,39)
			goto ENDtutori4_
		}
		CmpQuestNumStep(63,39)
		if(yes==1)
		{
			MessageBox("마법은 점성술사에게 배우는데, 일단 저기 있는 점성술사에게 '보호막' 마법을 배워오세요. 그리고 다음에 배울 마법의 요구 능력치도 알아두세요!!")
			SendSound(0,1432)
			SetQuestNumStep(63,40)
			goto ENDtutori4_
		}
		CmpQuestNumStep(63,40)
		if(yes==1)
		{
			D("마법을 사용하려면 매 접속 시마다 메모라이즈라는 것을 해야 되요. 메모라이즈란 이미 배워 놓은 마법을 기억해내는 일이랍니다.")
			SendSound(0,2425)
			SetQuestNumStep(63,41)
			goto ENDtutori4_
		}
		CmpQuestNumStep(63,41)
		if(yes==1)
		{
			D("우선 인벤토리 창에 있는 마법책을 마우스 오른쪽 버튼으로 눌러 여세요. 단, 접속 후 20분 이상이 경과했다면 다시 접속하셔야 해요.")
			SendSound(0,2425)
			SetQuestNumStep(63,42)
			goto ENDtutori4_
		}
		CmpQuestNumStep(63,42)
		if(yes==1)
		{
			D("책 안에 마법들이 보이나요? 여기서 마법을 하나 누르고 우측 하단의 MEMORIZE를 누르면(enter) 그 마법이 메모라이즈 된답니다.")
			SendSound(0,2425)
			SetQuestNumStep(63,43)
			goto ENDtutori4_
		}
		CmpQuestNumStep(63,43)
		if(yes==1)
		{
			D("책의 우측 하단에 접힌 부분을 누르면 페이지가 넘어가게 되지요.")
			SendSound(0,2425)
			SetQuestNumStep(63,44)
			goto ENDtutori4_
		}
		CmpQuestNumStep(63,44)
		if(yes==1)
		{
			sCallCustomSmallMenu(280,16,516,273,770)	;마법책 그림 띄우기
			SendSound(0,1432)
			SetQuestNumStep(63,45)
			goto ENDtutori4_
		}
		CmpQuestNumStep(63,45)
		if(yes==1)
		{
			MessageBox("그럼 '체력회복', '보호', '보호막', 그리고 '화염구' 등의 마법을 메모라이즈 해보세요.")
			SendSound(0,1432)
			SetQuestNumStep(63,46)
			goto ENDtutori4_
		}
		CmpQuestNumStep(63,46)
		if(yes==1)
		{
			D("이제 책을 닫고 메인 인터페이스의 마법 버튼을 눌러보세요. 조금 전에 메모라이즈 한 마법들의 아이콘이 보이나요?")
			SendSound(0,2425)
			SetQuestNumStep(63,47)
			goto ENDtutori4_
		}
		CmpQuestNumStep(63,47)
		if(yes==1)
		{
			D("흠...그럼 이제 마법을 한번 사용해볼까요?")
			SendSound(0,2425)
			SetQuestNumStep(63,48)
			goto ENDtutori4_
		}
		CmpQuestNumStep(63,48)
		if(yes==1)
		{
			MessageBox("'체력회복'을 누르고 2초 정도 후 님 자신을 마우스 오른쪽 버튼으로 누르세요.")
			SendSound(0,1432)
			SetItemInvPC(0,4002,100)
			SetQuestNumStep(63,49)
			goto ENDtutori4_
		}
		CmpQuestNumStep(63,49)
		if(yes==1)
		{
			D("어때요??? 마법의 효과가 발휘되었나요? ^^")
			SendSound(0,2128)
			SetQuestNumStep(63,50)
			goto ENDtutori4_
		}
		CmpQuestNumStep(63,50)
		if(yes==1)
		{
			D("마법은 해당 마법 아이콘을 누른 후 2초 정도 후에 대상을 마우스 오른쪽 버튼으로 클릭하면 마법의 효과를 낼 수 있답니다.")
			SendSound(0,2425)
			SetQuestNumStep(63,51)
			goto ENDtutori4_
		}
		CmpQuestNumStep(63,51)
		if(yes==1)
		{
			D("상위의 마법들을 배워가기 위해서는 INT, WS의 어빌리티 뿐만 아니라 공격마법운용 택틱도 올려야 해요. 마법 택틱은 마법을 많이 사용할수록 오른답니다.")
			SendSound(0,2425)
			SetQuestNumStep(63,52)
			goto ENDtutori4_
		}
		CmpQuestNumStep(63,52)
		if(yes==1)
		{
			D("마법을 사용하기 위해서는 마나가 충분해야 하므로, 제가 마나포션 7개를 선물로 드릴께요.")
			SendSound(0,2425)
			SetItemInvPC(0,4002,100)
			SetItemInvPC(0,4002,100)
			SetItemInvPC(0,4002,100)
			SetItemInvPC(0,4002,100)
			SetItemInvPC(0,4002,100)
			SetItemInvPC(0,4002,100)
			SetItemInvPC(0,4002,100)
			SetQuestNumStep(63,53)
			goto ENDtutori4_
		}
		CmpQuestNumStep(63,53)
		if(yes==1)
		{
			D("자, 여기까지 마법에 대해 알려드렸으니 이제 다음 단계로 넘어갈까요?")
			SendSound(0,2425)
			SetQuestNumStep(63,54)
			goto ENDtutori4_
		}
		CmpQuestNumStep(63,53)
		if(yes==2)
		{
			D("포탈지역으로 어서 가세요. 누군가 당신을 찾고 있습니다.")
			SendSound(0,2425)
			goto ENDtutori4_
		}
	}
	if(yes==4)	;성직자일 경우
	{
		CmpQuestNumStep(63,37)
		if(yes==1)
		{
			D("님은 성직자로군요. WIS와 PS의 기운이 물씬 느껴져요. ^^")
			SendSound(0,0097)
			SetQuestNumStep(63,38)
			goto ENDtutori4_
		}
		CmpQuestNumStep(63,38)
		if(yes==1)
		{
			D("마법을 사용하려면 우선 마법을 배워야 하는데, 이때 WIS와 PS, 그리고 보호신법운용 수치를 요구한답니다.")
			SendSound(0,2425)
			SetQuestNumStep(63,39)
			goto ENDtutori4_
		}
		CmpQuestNumStep(63,39)
		if(yes==1)
		{
			MessageBox("마법은 점성술사에게 배우는데, 일단 저기 있는 점성술사에게 가서 '위험으로부터의 보호' 마법을 배워오세요. 그리고 다음에 배울 마법의 요구 능력치도 알아두세요!!")
			SendSound(0,1432)
			SetQuestNumStep(63,40)
			goto ENDtutori4_
		}
		CmpQuestNumStep(63,40)
		if(yes==1)
		{
			D("그럼 이제 메인 인터페이스의 마법 버튼을 눌러보세요. 이미 배워놓은 마법들의 아이콘이 보이나요?")
			SendSound(0,2425)
			SetQuestNumStep(63,41)
			goto ENDtutori4_
		}
		CmpQuestNumStep(63,41)
		if(yes==1)
		{
			D("흠...그럼 이제 마법을 한번 사용해볼까요?")
			SendSound(0,2425)
			SetQuestNumStep(63,42)
			goto ENDtutori4_
		}
		CmpQuestNumStep(63,42)
		if(yes==1)
		{
			MessageBox("'회복의 권능'을 누르고 2초 정도 후에 님 자신을 마우스 오른쪽 버튼으로 누르세요")
			SendSound(0,1432)
			SetQuestNumStep(63,43)
			goto ENDtutori4_
		}
		CmpQuestNumStep(63,43)
		if(yes==1)
		{
			D("어때요??? 마법의 효과가 발휘되었나요? ^^")
			SendSound(0,2128)
			SetQuestNumStep(63,44)
			goto ENDtutori4_
		}
		CmpQuestNumStep(63,44)
		if(yes==1)
		{
			D("마법은 해당 마법 아이콘을 누른 후 2초 정도 후에 대상을 마우스 오른쪽 버튼으로 클릭하면 마법의 효과를 낼 수 있답니다.")
			SendSound(0,2425)
			SetQuestNumStep(63,45)
			goto ENDtutori4_
		}
		CmpQuestNumStep(63,45)
		if(yes==1)
		{
			D("상위의 마법들을 배워가기 위해서는 WIS, PS의 어빌리티 뿐만 아니라 보호신법운용 택틱도 올려야 해요. 마법 택틱은 마법을 많이 사용할수록 오른답니다.")
			SendSound(0,2425)
			SetQuestNumStep(63,46)
			goto ENDtutori4_
		}
		CmpQuestNumStep(63,46)
		if(yes==1)
		{
			D("성직자가 마법을 사용하기 위해 필요로 하는 디바인은 시간이 지남에 따라 서서히 자연 회복된답니다. ^^")
			SendSound(0,2425)
			SetQuestNumStep(63,47)
			goto ENDtutori4_
		}
		CmpQuestNumStep(63,47)
		if(yes==1)
		{
			D("자, 여기까지 마법에 대해 알려드렸으니 이제 다음 단계로 넘어갈까요?")
			SendSound(0,2425)
			SetQuestNumStep(63,54)
			goto ENDtutori4_
		}
		CmpQuestNumStep(63,47)
		if(yes==2)
		{
			D("포탈지역으로 어서 가세요. 누군가 당신을 찾고 있습니다.")
			SendSound(0,2425)
			goto ENDtutori4_
		}
	}

:ENDtutori4_
end

@Npc00005	;기사
;Tutorial 5step
	CmpQuestNumStep(63,54)
	if(yes==1)
	{
		D("택틱이 무엇을 의미하는지 아십니까?")
		SendSound(0,0050)
		SetQuestNumStep(63,55)
		goto ENDtutori5_
	}
	CmpQuestNumStep(63,55)
	if(yes==1)
	{
		D("택틱이란 자신이 사용하고 있는 무기에 대한 숙련도를 나타내는 수치입니다.")
		SendSound(0,2425)
		SetQuestNumStep(63,56)
		goto ENDtutori5_
	}
	CmpQuestNumStep(63,56)
	if(yes==1)
	{
		D("즉, 얼마나 그 무기를 잘 다룰 수 있는가에 대한 정도를 나타내는 것으로, 이 수치가 높을수록 해당 무기로 더 높은 타격치를 냅니다.")
		SendSound(0,2425)
		SetQuestNumStep(63,57)
		goto ENDtutori5_
	}
	CmpQuestNumStep(63,57)
	if(yes==1)
	{
		D("택틱 수치들은 자기 정보창의 TACTIC 창에 나타나 있으며, 현재 착용하고 있는 무기의 택틱 수치는 화면 좌측에 나타납니다.")
		SendSound(0,2425)
		SetQuestNumStep(63,58)
		goto ENDtutori5_
	}
	CmpQuestNumStep(63,58)
	if(yes==1)
	{
		D("무기의 숙련도인 택틱을 올리는 방법은, 그 무기를 얼마나 많이 사용하느냐와 비례합니다.")
		SendSound(0,2425)
		SetQuestNumStep(63,59)
		goto ENDtutori5_
	}
	CmpQuestNumStep(63,59)
	if(yes==1)
	{
		D("그 무기를 가지고 수련이나 전투를 꾸준히 한다면, 자연히 그 무기의 숙련도가 올라가겠죠?")
		SendSound(0,2425)
		SetQuestNumStep(63,60)
		goto ENDtutori5_
	}
	sGetClass()
	if(yes==0)	;전사일때
	{
		CmpQuestNumStep(63,60)	;수치7은 실제 택틱 6
		if(yes==1)
		{
			MessageBox("그럼 저기 오크 더미로 가서 앞으로 님이 사용하실 무기의 택틱 수치를 7까지 올리고 저에게 다시 오십시오.")
			SendSound(0,2087)
			SetQuestNumStep(63,61)
			goto ENDtutori5_
		}
	}
	if(yes==2)	;궁수일때
	{
		CmpQuestNumStep(63,60)
		if(yes==1)
		{
			MessageBox("그럼 저기 오크 더미로 가서 '활쏘기' 택틱 수치를 7까지 올리고 저에게 다시 오십시오.")
			SendSound(0,2087)
			SetQuestNumStep(63,61)
			goto ENDtutori5_
		}
	}
	if(yes==1)	;도둑일때
	{
		CmpQuestNumStep(63,60)
		if(yes==1)
		{
			MessageBox("그럼 저기 오크 더미로 가서 '비검던지기' 택틱 수치를 7까지 올리고 저에게 다시 오십시오.")
			SendSound(0,2087)
			SetQuestNumStep(63,61)
			goto ENDtutori5_
		}
	}
	if(yes==3)	;마법사일때
	{
		CmpQuestNumStep(63,60)
		if(yes==1)
		{
			MessageBox("그럼 저기 오크 더미로 가서 봉돌리기와 공격마법운용 택틱 수치를 각각 7과 4까지 올리고 저에게 다시 오십시오.")
			SendSound(0,2087)
			SetQuestNumStep(63,61)
			goto ENDtutori5_
		}
	}
	if(yes==4)	;성직자일 때
	{
		CmpQuestNumStep(63,60)
		if(yes==1)
		{
			MessageBox("그럼 저기 오크 더미로 가서 봉돌리기와 보호신법운용 택틱 수치를 각각 7과 3까지 올리고 저에게 다시 오십시오.")
			SendSound(0,2087)
			SetQuestNumStep(63,61)
			goto ENDtutori5_
		}
	}
	sGetClass()
	if(yes==0)	;전사일때
	{
		CmpQuestNumStep(63,61)
		if(yes==1)
		{
			sCheckTacticPoint(2,5) 	;5(실제6)보다 큰 택틱 수치가 있는지 체크
			if(yes==1)
			{
				D("어떻습니까? 타격치가 점점 증가하는 것을 느끼셨습니까?")
				SendSound(0,1310)
				SetQuestNumStep(63,62)
				goto ENDtutori5_
			}
			else
			{
				MessageBox("오크더미로 가서 님이 사용하실 무기의 택틱 수치를 7까지 올리고 오십시오.")
				SendSound(0,2161)
				goto ENDtutori5_
			}
		}
	}	
	if(yes==2)	;궁수일때
	{
		CmpQuestNumStep(63,61)
		if(yes==1)
		{
			sGetTactic(3)	;활쏘기 택틱이 6이상인가
			if(yes>=6)
			{
				D("어떻습니까? 타격치가 점점 증가하는 것을 느끼셨습니까?")
				SendSound(0,1310)
				SetQuestNumStep(63,62)
				goto ENDtutori5_
			}
			else
			{
				MessageBox("오크더미로 가서 '활쏘기' 택틱 수치를 7까지 올리고 오십시오.")
				SendSound(0,2161)
				goto ENDtutori5_
			}
		}
	}	
	if(yes==1)	;도둑일때
	{
		CmpQuestNumStep(63,61)
		if(yes==1)
		{	
			sGetTactic(8)	;비검던지기 택틱이 6이상인가
			if(yes>=6)
			{
				D("어떻습니까? 타격치가 점점 증가하는 것을 느끼셨습니까?")
				SendSound(0,1310)
				SetQuestNumStep(63,62)
				goto ENDtutori5_
			}
			else
			{
				MessageBox("오크더미로 가서 '비검던지기' 택틱 수치를 7까지 올리고 오십시오.")
				SendSound(0,2161)
				goto ENDtutori5_
			}
		}
	}	
	if(yes==3)	;마법사일때
	{
		CmpQuestNumStep(63,61)
		if(yes==1)
		{
			sGetTactic(7)	;봉돌리기 택틱이 6이상인가
			if(yes>=6)
			{
				sGetTactic(12)	;공격마법운용 택틱이 3이상인가
				if(yes>=3)
				{				
					D("어떻습니까? 타격치가 점점 증가하는 것을 느끼셨습니까?")
					SendSound(0,1310)
					SetQuestNumStep(63,62)
					goto ENDtutori5_
				}
				else
				{
					MessageBox("오크더미로 가서 봉돌리기와 공격마법운용 택틱 수치를 각가 7과 4까지 올리고 오십시오.")
					SendSound(0,2161)
					goto ENDtutori5_
				}
			}
			else
			{
				MessageBox("오크더미로 가서 봉돌리기와 공격마법운용 택틱 수치를 각각 7과 4까지 올리고 오십시오.")
				SendSound(0,2161)
				goto ENDtutori5_
			}
		}
	}
	if(yes==4)	;성직자일때
	{
		CmpQuestNumStep(63,61)
		if(yes==1)
		{
			sGetTactic(7)	;봉돌리기 택틱이 6이상인가
			if(yes>=6)
			{
				sGetTactic(13)	;보호신법운용 택틱이 2이상인가
				if(yes>=2)
				{				
					D("어떻습니까? 타격치가 점점 증가하는 것을 느끼셨습니까?")
					SendSound(0,1310)
					SetQuestNumStep(63,62)
					goto ENDtutori5_
				}
				else
				{
					MessageBox("오크더미로 가서 봉돌리기와 보호신법운용 택틱 수치를 각각 7과 3까지 올리고 오십시오.")
					SendSound(0,2161)
					goto ENDtutori5_
				}
			}
			else
			{
				MessageBox("오크더미로 가서 봉돌리기와 보호신법운용 택틱 수치를 각가 7과 3까지 올리고 오십시오.")
				SendSound(0,2161)
				goto ENDtutori5_
			}
		}
	}
	CmpQuestNumStep(63,62)
	if(yes==1)
	{
		sGetClass()
		if(yes==0)	;전사일 경우
		{
			D("이제 님은 무기를 더 좋은 것으로 바꾸셔도 될 듯 하군요. 대장간에 들르셔서 보다 좋은 무기로 꼭 바꿔 착용하십시오.")
			SendSound(0,2425)
			SetQuestNumStep(63,63)
			goto ENDtutori5_
		}
		if(yes==2)	;궁수일 경우
		{
			D("이제 님은 무기를 더 좋은 것으로 바꾸셔도 될 듯 하군요. 활제작소에 들르셔서 보다 좋은 무기로 꼭 바꿔 착용하십시오.")
			SendSound(0,2425)
			SetQuestNumStep(63,63)
			goto ENDtutori5_
		}
		if(yes==1)	;도둑일 경우
		{
			D("이제 님은 무기를 더 좋은 것으로 바꾸셔도 될 듯 하군요. 대장간에 들르셔서 보다 좋은 무기로 꼭 바꿔 착용하십시오.")
			SendSound(0,2425)
			SetQuestNumStep(63,63)
			goto ENDtutori5_
		}
		if(yes==3)	;마법사일 경우
		{
			D("이제 님은 무기를 더 좋은 것으로 바꾸셔도 될 듯 하군요. 목공소에 들르셔서 보다 좋은 무기로 꼭 바꿔 착용하십시오.")
			SendSound(0,2425)
			SetQuestNumStep(63,63)
			goto ENDtutori5_
		}
		if(yes==4)	;성직자일 경우
		{
			D("이제 님은 무기를 더 좋은 것으로 바꾸셔도 될 듯 하군요. 목공소에 들르셔서 보다 좋은 무기로 꼭 바꿔 착용하십시오.")
			SendSound(0,2425)
			SetQuestNumStep(63,63)
			goto ENDtutori5_
		}
	}
	CmpQuestNumStep(63,63)
	if(yes==1)
	{
		D("전투 등을 통해 레벨 업을 하시는 과정에서 님이 사용하고 계시는 무기의 택틱 수치에도 많은 신경을 쓰셔야 합니다.")
		SendSound(0,2425)
		SetQuestNumStep(63,64)
		goto ENDtutori5_
	}
	CmpQuestNumStep(63,64)
	if(yes==1)
	{
		D("택틱이란 중요한 개념이므로 꼭 기억해두시길 바랍니다. 그럼 이제 다음 단계로 가시죠.")
		SendSound(0,2425)
		SetQuestNumStep(63,65)
		goto ENDtutori5_
	}
	CmpQuestNumStep(63,64)
	if(yes==2)
	{
		D("포탈지역으로 어서 가십시오. 저와의 얘기는 이미 끝났습니다.")
		SendSound(0,2425)
		goto ENDtutori5_
	}
	
:ENDtutori5_
end

@Npc00006	;하프여인
; Tutorial 6step
	CmpQuestNumStep(63,65)
	if(yes==1)
	{
		D("파티라고 했을 때 무엇이 생각나시나요? 생일파티? 키득키득 ^^")
		SendSound(0,0096)
		SetQuestNumStep(63,66)
		goto ENDtutori6_
	}
	CmpQuestNumStep(63,66)
	if(yes==1)
	{
		D("파티란 전투 시 동료들과 맺는 관계로, 서로에게 데미지를 입히지 않으면서 안전하게 전투에 임할 수 있답니다.")
		SendSound(0,2425)
		SetQuestNumStep(63,67)
		goto ENDtutori6_
	}
	CmpQuestNumStep(63,67)
	if(yes==1)
	{
		D("또한 파티 관계의 사람들 사이에는 얻는 경험치를 일정 비율로 플러스하여 공유함으로써 보다 빠른 레벨 업을 할 수 있게 되지요. ^^*")
		SendSound(0,2425)
		SetQuestNumStep(63,68)
		goto ENDtutori6_
	}
	CmpQuestNumStep(63,68)
	if(yes==1)
	{
		D("그럼 이제 파티 관계를 맺는 방법을 알려드릴께요. 파티는 국적이 같아야 맺을 수 있답니다.")
		SendSound(0,2425)
		SetQuestNumStep(63,69)
		goto ENDtutori6_
	}
	CmpQuestNumStep(63,69)
	if(yes==1)
	{
		MessageBox("우선 PEACE 상태에서 파티 인터페이스를 열어보세요.")
		SendSound(0,1432)
		SetQuestNumStep(63,70)
		goto ENDtutori6_
	}
	CmpQuestNumStep(63,70)
	if(yes==1)
	{
		D("컨트롤 키를 누른 상태에서 동료를 3초정도 클릭하고 있으면 동료의 사진이 크게 나타난답니다. 그 사진을 파티 창 안으로 올려놓으면 끝~~!!")
		SendSound(0,2425)
		SetQuestNumStep(63,71)
		goto ENDtutori6_
	}
	CmpQuestNumStep(63,71)
	if(yes==1)
	{
		MessageBox("그럼 주위에 있는 같은 국적의 사람과 파티 관계를 맺어보세요.")
		SendSound(0,1432)
		SetQuestNumStep(63,72)
		goto ENDtutori6_
	}
	CmpQuestNumStep(63,72)
	if(yes==1)
	{
		D("파티는 반드시 PEACE 상태에서 맺어야 해요. 안그러면 맺는 도중에 동료를 때릴 수도 있답니다. ^^")
		SendSound(0,2128)
		SetQuestNumStep(63,73)
		goto ENDtutori6_
	}
	CmpQuestNumStep(63,73)
	if(yes==1)
	{
		D("파티는 명령어 '/파티 동료이름' 으로도 맺을 수 있어요.")
		SendSound(0,2425)
		SetQuestNumStep(63,74)
		goto ENDtutori6_
	}
	CmpQuestNumStep(63,74)
	if(yes==1)
	{
		D("파티 관계를 맺고 전투에 임하면 서로에 대한 공격 데미지를 입히지 않으며, 서로가 얻는 경험치 혹은 택틱도 플러스로 공유하게 되어 더 빠른 레벨 업을 이룰 수 있어요.")
		SendSound(0,2425)
		SetQuestNumStep(63,75)
		goto ENDtutori6_
	}
	CmpQuestNumStep(63,75)
	if(yes==1)
	{
		D("파티 창 위의 Exp., Weapon, Spell 버튼은 각각 자신이 파티 원들로부터 부가적으로 얻어 오게 될 수치의 종류(경험치, 무기택틱, 마법택틱)를 선택하는 것이랍니다.")
		SendSound(0,2128)
		SetQuestNumStep(63,76)
		goto ENDtutori6_
	}
	CmpQuestNumStep(63,76)
	if(yes==1)
	{
		D("파티에 대해 어느 정도 이해가 되셨나요? 그럼 이제 다음 단계로 가볼까요?")
		SendSound(0,2425)
		SetQuestNumStep(63,77)
		goto ENDtutori6_
	}
	CmpQuestNumStep(63,76)
	if(yes==2)
	{
		D("포탈지역으로 어서 가세요. 빨리빨리 끝내고 마을로 가야죠. ^^")
		SendSound(0,2425)
		goto ENDtutori6_
	}

:ENDtutori6_	
end

@Npc00007	;기사
; Tutorial 7step
	CmpQuestNumStep(63,77)
	if(yes==1)
	{
		D("이곳에서 마음껏 전투를 즐겨보십시오. 파티도 맺고!! 포션도 사고!! 마법도 배우고!! 무기도 바꾸고!! 하시면서 마음껏 레벨 업을 하십시오. ^^")
		SendSound(0,0092)
		SetQuestNumStep(63,78)
		goto ENDtutori7_
	}
	CmpQuestNumStep(63,78)
	if(yes==1)
	{
		D("단, 개와 쥐, 좀비는 님을 공격할 수 있으니 혼자서는 위험합니다!!! 죽었을 경우에는 '코스모스와 대폭풍의 에델브로이 이름으로'라는 주문을 외우십시오.")
		SendSound(0,2425)
		SetItemInvPC(0,10123,5000)	; 돈 주기
		SetQuestNumStep(63,79)
		goto ENDtutori7_
	}
	CmpQuestNumStep(63,79)
	if(yes==1)
	{
		D("전투를 마치고 싶다면 다시 저를 찾아오십시오.")
		SendSound(0,2425)
		SetQuestNumStep(63,80)
		goto ENDtutori7_
	}
	CmpQuestNumStep(63,80)
	if(yes==1)
	{
		D("재미있으셨습니까? ^^ 그럼 이제 다음 단계로 가시지요.")
		SendSound(0,2425)
		SetQuestNumStep(63,81)
		goto ENDtutori7_
	}
	CmpQuestNumStep(63,80)
	if(yes==2)
	{
		D("전투를 계속하시기를 원하십니까? 아니라면 저기 포탈 지역으로 어서 가십시오.")
		SendSound(0,2425)
		goto ENDtutori7_
	}
	
:ENDtutori7_
end

@Npc00008	;하프여인
; Tutorial 8step
	CmpQuestNumStep(63,81)
	if(yes==1)
	{
		D("드래곤 라자의 세계를 따라 흐르는 여러 이야기가 궁금하시다구요?")
		SendSound(0,0097)
		SetQuestNumStep(63,82)
		goto ENDtutori8_
	}
	CmpQuestNumStep(63,82)	
	if(yes==1)
	{
		D("시나리오를 읽어보신 후 게임을 진행하시게 되면 '왜 내가 그곳을 가야하고, 왜 내가 이런 행동을 해야 하는지'에 대한 의문이 풀린답니다.")
		SendSound(0,0273)
		SetQuestNumStep(63,83)
		goto ENDtutori8_
	}
	CmpQuestNumStep(63,83)
	if(yes==1)
	{
		D("현재는 시나리오 ACT4  '드래곤 로드의 귀환'가 진행 중이며, 결국엔 드래곤 로드의 귀환을 저지하는 것이 최종의 목표라는 것. 잊지 마세요!!!")
		SendSound(0,2425)
		SetQuestNumStep(63,84)
		goto ENDtutori8_
	}
	CmpQuestNumStep(63,84)
	if(yes==1)
	{
		D("시나리오 내용을 쭈욱~ 읽어보신 후에 다음 단계로 가세요~")
		SendSound(0,2425)
		SetQuestNumStep(63,85)
		goto ENDtutori8_
	}
	CmpQuestNumStep(63,85)
	if(yes==1)
	{
		sCallCustomSmallMenu(280,18,539,403,770)	;시나리오 그림 띄우기
		SendSound(0,1432)
		SetQuestNumStep(63,86)
		goto ENDtutori8_
	}
	CmpQuestNumStep(63,85)
	if(yes==2)
	{
		D("시나리오 다 읽으셨나요? 그럼 어서 다음 단계로 가세요~")
		SendSound(0,2425)
		goto ENDtutori8_
	}
	
:ENDtutori8_
end     
	
@Npc00009	;기사
; Tutorial 9step
	CmpQuestNumStep(63,86)
	if(yes==1)
	{
		D("듀얼클래스란 한 클래스의 최고 레벨인 99레벨에 도달했을 때, 그 한계를 뛰어넘는 클래스 체인지(Class Change)의 개념입니다.")
		SendSound(0,0091)
		SetQuestNumStep(63,87)
		goto ENDtutori9_
	}
	CmpQuestNumStep(63,87)
	if(yes==1)
	{
		D("즉, 한 클래스의 한계 레벨인 99레벨에 도달했을 경우 또 다시 다섯 클래스 중 하나의 클래스로 새로운 능력을 부여받게 되는 것입니다.")
		SendSound(0,0067)
		SetQuestNumStep(63,88)
		goto ENDtutori9_
	}
	CmpQuestNumStep(63,88)
	if(yes==1)
	{
		D("듀얼 클래스에 도달했을 때, 이제 레벨은 단지 경험 정도의 의미로만 여겨지게 되며,")
		SendSound(0,2425)
		SetQuestNumStep(63,89)
		goto ENDtutori9_
	}
	CmpQuestNumStep(63,89)
	if(yes==1)
	{
		D("시나리오에 따라 진행되는 퀘스트를 통해 단계 단계 상승하면서 새로운 호칭 및 능력을 부여받게 됩니다.")
		SendSound(0,2425)
		SetQuestNumStep(63,90)
		goto ENDtutori9_
	}
	CmpQuestNumStep(63,90)
	if(yes==1)
	{
		sCallCustomSmallMenu(280,15,516,274,770)	;듀얼 클래스 그림 띄우기
		SendSound(0,1432)
		SetQuestNumStep(63,91)
		goto ENDtutori9_
	}
	CmpQuestNumStep(63,91)
	if(yes==1)
	{
		D("듀얼 클래스로의 상승과 시나리오 퀘스트의 완수를 통해 드래곤 로드의 귀환을 저지하는 것이 드래곤 라자 세계에서의 궁극적인 목표가 되는 것입니다.")
		SendSound(0,2425)
		SetQuestNumStep(63,92)
		goto ENDtutori9_
	}
	CmpQuestNumStep(63,92)
	if(yes==1)
	{
		D("현재는 시나리오 ACT4  '드래곤 로드의 귀환' 단계로서 듀얼 클래스 5단계까지 진행되게 됩니다.")
		SendSound(0,2425)
		SetQuestNumStep(63,93)
		goto ENDtutori9_
	}
	CmpQuestNumStep(63,93)
	if(yes==1)
	{
		D("이제 다음 단계로 가십시오. 또 다른 정보를 만나실 수 있습니다.")
		SendSound(0,2425)
		SetQuestNumStep(63,94)
		goto ENDtutori9_
	}
	CmpQuestNumStep(63,93)
	if(yes==2)
	{
		D("어서 다음 단계로 가십시오.")
		SendSound(0,2425)
		goto ENDtutori9_
	}

:ENDtutori9_
end

@Npc00010	;하프여인
; Tutorial 10step
	CmpQuestNumStep(63,94)
	if(yes==1)
	{
		D("길드란 게임 내 하나의 커뮤니티로 뜻과 행동을 같이 하는 사람들의 모임이라 할 수 있어요. 길드 관련 사항은 '길드관리소'에서 담당하죠.")
		SendSound(0,0096)
		SetQuestNumStep(63,95)
		goto ENDtutori10_
	}
	CmpQuestNumStep(63,95)
	if(yes==1)
	{
		D("한 길드의 길드원들에게는 길드마크 및 길드직책이 부여되며, '엠포리아'라는 길드 집을 얻어 그 길드만의 공간을 만들 수도 있답니다.")
		SendSound(0,0062)
		SetQuestNumStep(63,96)
		goto ENDtutori10_
	}
	CmpQuestNumStep(63,96)
	if(yes==1)
	{
		sCallCustomSmallMenu(280,14,516,274,770)	;콜로서스 그림 띄우기1
		SendSound(0,1432)
		SetQuestNumStep(63,97)
		goto ENDtutori10_
	}
	CmpQuestNumStep(63,97)
	if(yes==1)
	{
		D("이러한 길드들은 '콜로서스 아레나'라는 경기장을 통해 길드의 세력 싸움을 해요.")
		SendSound(0,2425)
		SetQuestNumStep(63,98)
		goto ENDtutori10_
	}
	CmpQuestNumStep(63,98)
	if(yes==1)
	{
		sCallCustomSmallMenu(280,19,516,274,770)	;콜로서스 그림 띄우기2
		SendSound(0,1432)
		SetQuestNumStep(63,99)
		goto ENDtutori10_
	}
	CmpQuestNumStep(63,99)
	if(yes==1)
	{
		D("콜로서스는 길드에 속한 사람이면 누구나 참여할 수 있고, 정기적으로 열리는 대회를 통해 퀘스트, 유니크 아이템 등을 얻게 된답니다.")
		SendSound(0,2425)
		SetQuestNumStep(63,100)
		goto ENDtutori10_
	}
	CmpQuestNumStep(63,100)
	if(yes==1)
	{
		D("콜로서스에서는 각 클래스마다의 역할을 확실히 하여 서로를 보조하며 전투를 하는 것이 승리의 열쇠에요.^^v")
		SendSound(0,2425)
		SetQuestNumStep(63,101)
		goto ENDtutori10_
	}
	CmpQuestNumStep(63,101)
	if(yes==1)
	{
		sCallCustomSmallMenu(280,20,516,274,770)	;콜로서스 그림 띄우기3
		SendSound(0,1432)
		SetQuestNumStep(63,102)
		goto ENDtutori10_
	}
	CmpQuestNumStep(63,102)
	if(yes==1)
	{
		D("화려한 마법, 강력한 파워, 빠른 움직임 등 자신의 장기를 살려 길드의 명예를 드높일 수 있는 절호의 기회가 바로 콜로서스!!!")
		SendSound(0,2425)
		SetQuestNumStep(63,103)
		goto ENDtutori10_
	}
	CmpQuestNumStep(63,103)
	if(yes==1)
	{
		D("개인적으로는 콜로서스 전적을 통해 레더점수라는 것을 부여받게 되며, 일정 레더 점수 이상이면 '은거한 영웅' 퀘스트를 부여받게 된답니다.")
		SendSound(0,2425)
		SetQuestNumStep(63,104)
		goto ENDtutori10_
	}
	CmpQuestNumStep(63,104)
	if(yes==1)
	{
		sCallCustomSmallMenu(280,21,516,274,770)	;콜로서스 그림 띄우기4
		SendSound(0,1432)
		SetQuestNumStep(63,105)
		goto ENDtutori10_
	}
	CmpQuestNumStep(63,105)
	if(yes==1)
	{
		D("은거한 영웅으로서 이름을 널리 알리고, 동시에 길드의 명예를 드높일 수 있는 절호의 기회인 콜로서스에 벌써부터 참여해보고 싶으시죠? ^^")
		SendSound(0,2425)
		SetQuestNumStep(63,106)
		goto ENDtutori10_
	}
	CmpQuestNumStep(63,106)
	if(yes==1)
	{
		D("이제 국가간 전쟁에 대해 알려드릴께요. 어서 다음 단계로 가세요~")
		SendSound(0,2425)
		SetQuestNumStep(63,107)
		goto ENDtutori10_
	}
	CmpQuestNumStep(63,106)
	if(yes==2)
	{
		D("어서 다음 단계로 가세요. 흥미진진한 정보가 당신을 기다리고 있습니다.")
		SendSound(0,2425)
		goto ENDtutori10_
	}
:ENDtutori10_
end

@Npc00011	;기사
; Tutorial 11step
	CmpQuestNumStep(63,107)	
	if(yes==1)
	{
		D("드래곤 라자의 세계에는 바이서스, 자이펀, 일스 이렇게 세 국가가 존재합니다.")
		SendSound(0,0092)
		SetQuestNumStep(63,108)
		goto ENDtutori11_
	}
	CmpQuestNumStep(63,108)
	if(yes==1)
	{
		D("바이서스와 자이펀은 현재 전시 상태이며, 일스공국은 중립국으로 두 국가의 세력 균형을 맞추려 하고 있죠.")
		SendSound(0,0274)
		SetQuestNumStep(63,109)
		goto ENDtutori11_
	}
	CmpQuestNumStep(63,109)
	if(yes==1)
	{
		D("국가간 전쟁은 국지전과 전면전. 이렇게 두 가지 형태로 일어납니다.")
		SendSound(0,2425)
		SetQuestNumStep(63,110)
		goto ENDtutori11_
	}
	CmpQuestNumStep(63,110)
	if(yes==1)
	{
		D("국지전은 세 국가의 공유 지역인 대초원에 위치해 있는 상대 국가의 결계석을 부수어 그 국가의 수호석을 가지고 침입하는 형태입니다.")
		SendSound(0,2425)
		SetQuestNumStep(63,111)
		goto ENDtutori11_
	}
	CmpQuestNumStep(63,111)
	if(yes==1)
	{
		sCallCustomSmallMenu(280,13,516,274,770)	;국가전 그림 띄우기1
		SendSound(0,1432)
		SetQuestNumStep(63,112)
		goto ENDtutori11_
	}
	CmpQuestNumStep(63,112)
	if(yes==1)
	{
		D("보통 때는 결계석의 힘이 강하여 부술 수 없으며, 밤 9시부터 11시까지는 결계석의 힘이 약해져 이를 부수고 칩입할 수 있습니다.")
		SendSound(0,2425)
		SetQuestNumStep(63,113)
		goto ENDtutori11_
	}
	CmpQuestNumStep(63,113)
	if(yes==1)
	{
		D("전면전은 바이서스와 자이펀의 국경 지대에 위치해있는 전쟁터의 성을 중심으로 이루어지는 전쟁입니다.")
		SendSound(0,2425)
		SetQuestNumStep(63,114)
		goto ENDtutori11_
	}
	CmpQuestNumStep(63,114)
	if(yes==1)
	{
		D("전면전의 경우에는 자이펀과 바이서스가 주로 전쟁을 하게 되며, 일스는 용병 형태로 양 국가의 전쟁에 참여하게 됩니다.")
		SendSound(0,2425)
		SetQuestNumStep(63,115)
		goto ENDtutori11_
	}
	CmpQuestNumStep(63,115)
	if(yes==1)
	{
		D("성을 중심으로 전개되는 국가 전면전은 다양한 전략과 전술을 바탕으로 대규모의 군사들이 벌이는 치열한 전투이지요.")
		SendSound(0,2425)
		SetQuestNumStep(63,116)
		goto ENDtutori11_
	}
	CmpQuestNumStep(63,116)
	if(yes==1)
	{
		sCallCustomSmallMenu(280,12,516,273,770)	;국가전 그림 띄우기2
		SendSound(0,1432)
		SetQuestNumStep(63,117)
		goto ENDtutori11_
	}
	CmpQuestNumStep(63,117)
	if(yes==1)
	{
		D("국가 전면전에서 승리할 경우 전쟁터의 성을 차지하게 되며, 성 안에 있는 '비밀지역'을 출입할 수 있게 됩니다.")
		SendSound(0,2425)
		SetQuestNumStep(63,118)
		goto ENDtutori11_
	}
	CmpQuestNumStep(63,118)
	if(yes==1)
	{
		D("SUN, MOON, HORIZON 이라 이름 붙여진 이 비밀지역에서는 특정 몬스터와의 전투를 통해 유니크 아이템을 100%의 확률로 얻는 등의 혜택을 누릴 수 있게 됩니다.")
		SendSound(0,2425)
		SetQuestNumStep(63,119)
		goto ENDtutori11_
	}
	CmpQuestNumStep(63,119)
	if(yes==1)
	{
		D("만약 한 국가가 세 곳의 성을 모두 차지하게 되면, 이 때에는 일스 공국도 전쟁에 전면적으로 참여하게 됩니다.")
		SendSound(0,2425)
		SetQuestNumStep(63,120)
		goto ENDtutori11_
	}
	CmpQuestNumStep(63,120)
	if(yes==1)
	{
		D("자이펀과 바이서스의 세력 균형을 유지하려고 하는 일스는 성을 모두 빼앗긴 국가와 손잡고 상대 국가와 전면전을 벌이는 것입니다.")
		SendSound(0,2425)
		SetQuestNumStep(63,121)
		goto ENDtutori11_
	}
	CmpQuestNumStep(63,121)
	if(yes==1)
	{
		D("국가의 안위와 개인의 명성을 드높이기 위해 님도 힘을 길러 전쟁에 반드시 참여하십시오!!!")
		SendSound(0,2425)
		SetQuestNumStep(63,122)
		goto ENDtutori11_
	}
	CmpQuestNumStep(63,122)
	if(yes==1)
	{
		D("지금까지 전쟁에 대한 정보를 다 알려드렸으니, 이제 다음 단계로 가십시오.")
		SendSound(0,2425)
		SetQuestNumStep(63,123)
		goto ENDtutori11_
	}
	CmpQuestNumStep(63,122)
	if(yes==2)
	{
		D("다음 단계로 어서 가십시오. 마을로 갈 시간이 다 되어 갑니다.")
		SendSound(0,2425)
		goto ENDtutori11_
	}
:ENDtutori11_
end



@Npc00012	;하프여인
; Tutorial 12step
	CmpQuestNumStep(63,123)
	if(yes==1)
	{
		D("레벨 업을 보다 빠르게 하고 싶으시죠?")
		SendSound(0,0096)
		SetQuestNumStep(63,124)
		goto ENDtutori12_
	}
	CmpQuestNumStep(63,124)
	if(yes==1)
	{
		D("레벨 업을 보다 빠르게 효과적으로 하기 위해서는 우선 자신의 레벨과 비슷한 레벨의 몬스터를 사냥하세요.^^")
		SendSound(0,2425)
		SetQuestNumStep(63,125)
		goto ENDtutori12_
	}
	CmpQuestNumStep(63,125)
	if(yes==1)
	{
		D("몬스터의 레벨 및 그 위치는 좌측 상단의 'HELP'(H 버튼)를 통해 참고하시면 된답니다.")
		SendSound(0,2425)
		SetQuestNumStep(63,126)
		goto ENDtutori12_
	}
	CmpQuestNumStep(63,126)
	if(yes==1)
	{
		D("물론 여러 사람과 함께 파티를 맺고 같이 사냥을 가시는 것이 보다 안전하고 빠른 레벨 업이 될거라는거...알고계시죠? ^^")
		SendSound(0,2425)
		SetQuestNumStep(63,127)
		goto ENDtutori12_
	}
	CmpQuestNumStep(63,127)
	if(yes==1)
	{
		D("또한 드래곤 라자에는 전투 이외에도 직업 스킬을 즐기실 수 있어요.")
		SendSound(0,2425)
		SetQuestNumStep(63,128)
		goto ENDtutori12_
	}
	CmpQuestNumStep(63,128)
	if(yes==1)
	{
		D("직업 스킬을 통해서는 최고의 무기를 만들기 위한 재료를 얻거나, 직접 제작하게 되지요.")
		SendSound(0,2425)
		SetQuestNumStep(63,129)
		goto ENDtutori12_
	}
	CmpQuestNumStep(63,129)
	if(yes==1)
	{
		D("그럼 이제 마을로 나갈 준비를 하시고, 다음 단계로 가세요~")
		SendSound(0,2425)
		SetQuestNumStep(63,130)
		goto ENDtutori12_
	}
	CmpQuestNumStep(63,129)
	if(yes==2)
	{
		D("다음 단계로 가시면 어떤 사람이 님을 마을로 보내줄거에요.")
		SendSound(0,2425)
		goto ENDtutori12_
	}
:ENDtutori12_
end



@Npc00013	;하프여인
; Tutorial 13step
	CmpQuestNumStep(63,130)
	if(yes==1)
	{
		D("드래곤 라자의 세계는 바이서스, 자이펀, 일스. 이렇게 세 국가로 나뉘어 있답니다.")
		SendSound(0,0097)
		SetQuestNumStep(63,131)
		goto ENDtutori13_
	}
	CmpQuestNumStep(63,131)
	if(yes==1)
	{
		sGetNat()
		if(yes==3)	;바이서스 국가 소속이면
		{
			sGetClass()
			if(yes==0)	;전사이면
			{
				D("님은 바이서스 국가 소속이며, 클래스는 전사군요.")
				SendSound(0,2425)
				SetQuestNumStep(63,132)
				goto ENDtutori13_
			}
			if(yes==2)	;궁수이면
			{
				D("님은 바이서스 국가 소속이며, 클래스는 궁수군요.")
				SendSound(0,2425)
				SetQuestNumStep(63,132)
				goto ENDtutori13_
			}
			if(yes==1)	;도둑이면
			{
				D("님은 바이서스 국가 소속이며, 클래스는 도둑이군요.")
				SendSound(0,2425)
				SetQuestNumStep(63,132)
				goto ENDtutori13_
			}
			if(yes==3)	;마법사이면
			{
				D("님은 바이서스 국가 소속이며, 클래스는 마법사군요.")
				SendSound(0,2425)
				SetQuestNumStep(63,132)
				goto ENDtutori13_
			}
			if(yes==4)	;성직자이면
			{
				D("님은 바이서스 국가 소속이며, 클래스는 성직자군요.")
				SendSound(0,2425)
				SetQuestNumStep(63,132)
				goto ENDtutori13_
			}
		}
		if(yes==4)	;자이펀 국가 소속이면
		{
			sGetClass()
			if(yes==0)	;전사이면
			{
				D("님은 자이펀 국가 소속이며, 클래스는 전사군요.")
				SendSound(0,2425)
				SetQuestNumStep(63,132)
				goto ENDtutori13_
			}
			if(yes==2)	;궁수이면
			{
				D("님은 자이펀 국가 소속이며, 클래스는 궁수군요.")
				SendSound(0,2425)
				SetQuestNumStep(63,132)
				goto ENDtutori13_
			}
			if(yes==1)	;도둑이면
			{
				D("님은 자이펀 국가 소속이며, 클래스는 도둑이군요.")
				SendSound(0,2425)
				SetQuestNumStep(63,132)
				goto ENDtutori13_
			}
			if(yes==3)	;마법사이면
			{
				D("님은 자이펀 국가 소속이며, 클래스는 마법사군요.")
				SendSound(0,2425)
				SetQuestNumStep(63,132)
				goto ENDtutori13_
			}
			if(yes==4)	;성직자이면
			{
				D("님은 자이펀 국가 소속이며, 클래스는 성직자군요.")
				SendSound(0,2425)
				SetQuestNumStep(63,132)
				goto ENDtutori13_
			}
		}
		if(yes==6)	;일스 국가 소속이면
		{
			sGetClass()
			if(yes==0)	;전사이면
			{
				D("님은 일스 공국 소속이며, 클래스는 전사군요.")
				SendSound(0,2425)
				SetQuestNumStep(63,132)
				goto ENDtutori13_
			}
			if(yes==2)	;궁수이면
			{
				D("님은 일스 공국 소속이며, 클래스는 궁수군요.")
				SendSound(0,2425)
				SetQuestNumStep(63,132)
				goto ENDtutori13_
			}
			if(yes==1)	;도둑이면
			{
				D("님은 일스 공국 소속이며, 클래스는 도둑이군요.")
				SendSound(0,2425)
				SetQuestNumStep(63,132)
				goto ENDtutori13_
			}
			if(yes==3)	;마법사이면
			{
				D("님은 일스 공국 소속이며, 클래스는 마법사군요.")
				SendSound(0,2425)
				SetQuestNumStep(63,132)
				goto ENDtutori13_
			}
			if(yes==4)	;성직자이면
			{
				D("님은 일스 공국 소속이며, 클래스는 성직자군요.")
				SendSound(0,2425)
				SetQuestNumStep(63,132)
				goto ENDtutori13_
			}
		}
	}
	CmpQuestNumStep(63,132)
	if(yes==1)
	{
		D("자. 지도를 보시면 님이 마을에 가면 주로 이용하게 될 장소를 알 수 있어요. 지도를 보면서 제가 하는 얘기를 잘 들으세요.")
		SendSound(0,2425)
		SetQuestNumStep(63,133)
		goto ENDtutori13_
	}
	CmpQuestNumStep(63,133)		;맵 그림 띄우기
	if(yes==1)
	{
		sGetNat()
		if(yes==3)	;바이서스 국가 소속이면
		{
			sGetClass()
			if(yes==0)	;전사이면
			{
				sCallCustomSmallMenu(280,11,436,428,770)		;바이서스 전사맵 띄우기
				SendSound(0,1432)
				SetQuestNumStep(63,134)
				goto ENDtutori13_
			}
			if(yes==2)	;궁수이면
			{
				sCallCustomSmallMenu(280,8,436,428,770)		;바이서스 궁수맵 띄우기
				SendSound(0,1432)
				SetQuestNumStep(63,134)
				goto ENDtutori13_
			}
			if(yes==1)	;도둑이면
			{
				sCallCustomSmallMenu(280,9,436,428,770)		;바이서스 도둑맵 띄우기
				SendSound(0,1432)
				SetQuestNumStep(63,134)
				goto ENDtutori13_
			}
			if(yes==3)	;마법사이면
			{
				sCallCustomSmallMenu(280,10,436,428,770)		;바이서스 마법사맵 띄우기
				SendSound(0,1432)
				SetQuestNumStep(63,134)
				goto ENDtutori13_
			}
			if(yes==4)	;성직자이면
			{
				sCallCustomSmallMenu(280,10,436,428,770)		;바이서스 성직자맵 띄우기
				SendSound(0,1432)
				SetQuestNumStep(63,134)
				goto ENDtutori13_
			}
		}
		if(yes==4)	;자이펀 국가 소속이면
		{
			sGetClass()
			if(yes==0)	;전사이면
			{
				sCallCustomSmallMenu(280,3,436,437,770)		;자이펀 전사맵 띄우기
				SendSound(0,1432)
				SetQuestNumStep(63,134)
				goto ENDtutori13_
			}
			if(yes==2)	;궁수이면
			{
				sCallCustomSmallMenu(280,0,436,437,770)		;자이펀 궁수맵 띄우기
				SendSound(0,1432)
				SetQuestNumStep(63,134)
				goto ENDtutori13_
			}
			if(yes==1)	;도둑이면
			{
				sCallCustomSmallMenu(280,1,436,437,770)		;자이펀 도둑맵 띄우기
				SendSound(0,1432)
				SetQuestNumStep(63,134)
				goto ENDtutori13_
			}
			if(yes==3)	;마법사이면
			{
				sCallCustomSmallMenu(280,2,436,437,770)		;자이펀 마법사맵 띄우기
				SendSound(0,1432)
				SetQuestNumStep(63,134)
				goto ENDtutori13_
			}
			if(yes==4)	;성직자이면
			{
				sCallCustomSmallMenu(280,2,436,437,770)		;자이펀 성직자맵 띄우기
				SendSound(0,1432)
				SetQuestNumStep(63,134)
				goto ENDtutori13_
			}
		}
		if(yes==6)	;일스 국가 소속이면
		{
			sGetClass()
			if(yes==0)	;전사이면
			{
				sCallCustomSmallMenu(280,7,493,427,770)		;일스 전사맵 띄우기
				SendSound(0,1432)
				SetQuestNumStep(63,134)
				goto ENDtutori13_
			}
			if(yes==2)	;궁수이면
			{
				sCallCustomSmallMenu(280,4,493,427,770)		;일스 궁수맵 띄우기
				SendSound(0,1432)
				SetQuestNumStep(63,134)
				goto ENDtutori13_
			}
			if(yes==1)	;도둑이면
			{
				sCallCustomSmallMenu(280,5,493,427,770)		;일스 도둑맵 띄우기
				SendSound(0,1432)
				SetQuestNumStep(63,134)
				goto ENDtutori13_
			}
			if(yes==3)	;마법사이면
			{
				sCallCustomSmallMenu(280,6,493,427,770)		;일스 마법사맵 띄우기
				SendSound(0,1432)
				SetQuestNumStep(63,134)
				goto ENDtutori13_
			}
			if(yes==4)	;성직자이면
			{
				sCallCustomSmallMenu(280,6,493,427,770)		;일스 성직자맵 띄우기
				SendSound(0,1432)
				SetQuestNumStep(63,134)
				goto ENDtutori13_
			}
		}
	}
	CmpQuestNumStep(63,134)
	if(yes==1)
	{
		D("중앙의 마을광장은 사람들이 많이 모여 이야기를 나누고, 파티원을 모으고 하는 곳이에요.")
		SendSound(0,2425)
		SetQuestNumStep(63,135)
		goto ENDtutori13_
	}
	CmpQuestNumStep(63,135)
	if(yes==1)
	{
		D("마을광장에서 사람들과 어울려 파티를 맺고 같이 몬스터와의 전투를 하러 떠나보세요.")
		SendSound(0,2425)
		SetQuestNumStep(63,136)
		goto ENDtutori13_
	}
	CmpQuestNumStep(63,136)
	if(yes==1)
	{
		D("목장이나 슬라임이 있는 지역으로 가서 사냥을 하면, 보다 빠른 레벨 업을 경험하실 수 있답니다.")
		SendSound(0,2425)
		SetQuestNumStep(63,137)
		goto ENDtutori13_
	}
	CmpQuestNumStep(63,137)
	if(yes==1)
	{
		D("단, 소와 양을 제외한 몬스터들은 모두 님을 공격할 수 있으므로 미리 점성술사(연금술사)의 집으로 가서 포션을 넉넉히 준비해 가세요.")
		SendSound(0,2425)
		SetQuestNumStep(63,138)
		goto ENDtutori13_
	}
	CmpQuestNumStep(63,138)
	if(yes==1)
	{
		D("마법을 배우고자 하시면 점성술사의 집이나 마법사길드로 가시면 된답니다. 이 때 꼭 내가 다음에 배울 마법의 요구 능력치를 알아두세요!!")
		SendSound(0,2425)
		SetQuestNumStep(63,139)
		goto ENDtutori13_
	}
	CmpQuestNumStep(63,139)
	if(yes==1)
	{
		sGetNat()
		if(yes==6)
		{
			D("죽음을 당하셨을 경우에는 오렘 신전에서 '붉은 장미와 정의의 오렘의 이름으로' 주문을 통해 다시 살아나 실 수 있답니다.")
			SendSound(0,2425)
			SetQuestNumStep(63,140)
			goto ENDtutori13_
		}
		else
		{
			D("죽음을 당하셨을 경우에는 에델브로이 신전에서 '코스모스와 대폭풍의 에델브로이 이름으로' 주문을 통해 다시 살아나실 수 있답니다.")
			SendSound(0,2425)
			SetQuestNumStep(63,140)
			goto ENDtutori13_
		}
	}
	CmpQuestNumStep(63,140)
	if(yes==1)
	{
		D("사냥을 통해 획득하는 아이템들을 해당 상점에 되팔면 조금의 돈을 벌 수 있답니다. 이 돈으로 포션을 사고 다시 사냥을 떠나는 것이지요.")
		SendSound(0,2425)
		SetQuestNumStep(63,141)
		goto ENDtutori13_
	}
	CmpQuestNumStep(63,141)
	if(yes==1)
	{
		D("캐릭터의 피부색 및 옷 색깔은 마을의 의류점에 가시면 개성있게 변화시킬 수 있답니다.")
		SendSound(0,2425)
		SetQuestNumStep(63,142)
		goto ENDtutori13_
	}
	CmpQuestNumStep(63,142)
	if(yes==1)
	{
		D("꼭 기억하시구요. 이제 마을로 가볼까요?")
		SendSound(0,2425)
		SetQuestNumStep(63,143)
		goto ENDtutori13_
	}
	CmpQuestNumStep(63,143)
	if(yes==1)
	{
		D("드래곤 라자의 세계에서 즐거운 여행하시길 바랍니다. 빠빠~~.")
		SendSound(0,2425)
		SetQuestNumStep(63,0)
		goto ENDtutori13_
	}
	CmpQuestNumStep(63,0)
	if(yes==1)
	{
		D("어서 밖으로 나가 마을로 가세요. ^^ 즐거운 여행 되시길...")
		SendSound(0,2425)
		goto ENDtutori13_
	}
:ENDtutori13_
end

@Npc00014	;대장간
	random(0,3)
        if( ran == 0 )
        {
        	D( "돈만준다면  철을 이용해서 만들수 있는 것은 뭐든지 팔지. 또한 그 기술도 가르쳐 주지." )
        	goto ENDtutori14_
        }
        if( ran == 1 )
        {
        	D( "철로 된 모든 무기와 방어구들은 내가 다 관리하지.")
        	goto ENDtutori14_
        }
        if( ran == 2 )
        {
        	D( "전쟁때문에 무기들이 옛날처럼 많지가 않아. 고급물건들은 희귀해져서 팔 물건이 없다네...")
        	goto ENDtutori14_
        }
:ENDtutori14_
        CallSmallMenu( 0, 18 ); 대장간
end

@Npc00015	; 목공소
        random( 0, 2 )
        if( ran == 0 )
        {
        	D( "나무꾼들이 베어온 나무로 무기와 가구, 도구를 만들 수 있습니다." )
        	goto ENDtutori15_
        }
        if( ran == 1 )
        {
        	D( "나무는 어딜가나 흔하기 때문에 굶어 죽을리는 없을꺼요. Cutting 기술을 배우는 것은 어떻소?")
        	goto ENDtutori15_
        }
:ENDtutori15_
        CallSmallMenu( 0, 26 ); 목공소
end

@Npc00016	; 의류점
        D( "마법사의 로브나 가죽 신발은 여기서만 파는 물건입니다. " )
        CallSmallMenu( 0, 24 ); 의류점
:ENDtutori16_
end

@Npc00017	; 빵집주인
        random( 0, 3 )
        if( ran == 0 )
        {
        	D("다양한 요리가 준비되어 있습니다. 여긴 시장이라서 다른곳 보다는 저렴하죠 ")
        	goto ENDtutori17_
        }       
        if( ran == 1)
        {
        	D("멀리 길을 떠나는 사람이 라면 미리 음식을 준비할 필요가 있지요.")
        	goto ENDtutori17_
        }       
        if( ran == 2 )
        {
        	D( "내가 원하는 요리를 직접 재료를 사다가 만든다고 생각해 보세요. " )
        	goto ENDtutori17_
        }
:ENDtutori17_
        CallSmallMenu( 0, 20 ); 빵집
end
@Npc00018	; 점성술사
        random( 0, 3 )
        if( ran == 0 )
        {
		D( "세상에는 보이지 않는 힘이 존재하는데 이를 마나라고 부르지...  " )
		goto ENDtutori18_
        }
        if( ran == 1 )
        {
        	D("마법사의 마법을 배울수 있는 사람은 여기서 마법을 배워야 한다오.")
        	goto ENDtutori18_
        }
        if( ran == 2 )
        {
        	D("포션이 필요하다면 나에게 오게나.")
        	goto ENDtutori18_
        }
:ENDtutori18_
        CallSmallMenu( 0, 71 ) ;점성술사
end
@Npc00019	; 활제작소
        random( 0, 2 )
        if( ran == 0 )
        {
        	D( "활을 쏘기 위해서는 굉장한 민첩성과 정신력이 필요하지." )
        	goto ENDtutori19_
        }
        if( ran == 1 )
        {
        	D( "활을 잘다루는 사람은 10명의 전사를 만나도 두렵지 않을껄..." )
        	goto ENDtutori19_
        }
:ENDtutori19_
        CallSmallMenu( 0, 27 )
end

@Npc00020	;수련 더미
	random(0,4)	; 두수 사이의 랜덤수 받아 오기 
        if( ran == 0 ) 
        {
       		D( "공격 자세로 바꾸세요." )
       		goto ENDtutori20_
        }
        if( ran == 1 ) 
        {
        	D( "PEACE 버튼을 눌러 BATTLE 상태로 바꾸셔야죠." )
        	goto ENDtutori20_
        }
        if( ran == 2 ) 
        {
        	D( "님이 사용하실 무기를 착용하셨나요?" )
        	goto ENDtutori20_
        }
        if( ran == 3 ) 
        {
        	D( "PEACE 버튼을 눌러 BATTLE 상태로 바꾸세요." )
        	goto ENDtutori20_
        }
:ENDtutori20_
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
	CmpQuestNumStep(63,18)
	if(yes==2)
	{
		random(0,2)	; 두수 사이의 랜덤수 받아 오기 
        	if( ran == 0 ) 
        	{
        		EventMsg("Tutorial Mode 제2단계로 이동합니다.")
			QuestTeleport( 1, 46, 7 )
       		
       	        }
        	if( ran == 1 ) 
        	{
        		EventMsg("Tutorial Mode 제2단계로 이동합니다.")
			QuestTeleport( 1, 47, 8 )
        	}
	}
	else
	{
		EventMsg("하프를 튕기고 있는 여인이 해주는 얘기를 끝까지 듣고 오세요.")
	}
end

@Event00002		
	CmpQuestNumStep(63,24)
	if(yes==2)
	{
		random(0,2)
		if(ran==0)
		{
			EventMsg("Tutorial Mode 제3단계로 이동합니다.")
			QuestTeleport( 1, 21, 50 )
		}
		if(ran==1)
		{
			EventMsg("Tutorial Mode 제3단계로 이동합니다.")
			QuestTeleport( 1, 22, 50 )
		}
	}
	else
	{
		EventMsg("은빛 갑옷을 입은 기사가 해주는 얘기를 끝까지 듣고 오세요.")
	}
end

@Event00003		
	CmpQuestNumStep(63,36)
	if(yes==2)
	{
		random(0,2)
		if(ran==0)
		{			
			EventMsg("Tutorial Mode 제4단계로 이동합니다.")
			QuestTeleport( 1, 43, 74 )
		}
		if(ran==1)
		{
			EventMsg("Tutorial Mode 제4단계로 이동합니다.")
			QuestTeleport( 1, 44, 74 )
		}
	}
	else
	{
		EventMsg("하프를 튕기고 있는 여인이 해주는 얘기를 끝까지 듣고 오세요.")
	}

end

@Event00004		
	CmpQuestNumStep(63,47)
	if(yes==2)
	{
		random(0,2)
		if(ran==0)
		{
			EventMsg("Tutorial Mode 제5단계로 이동합니다.")
			QuestTeleport( 1, 56, 63 )
		}
		if(ran==1)
		{
			EventMsg("Tutorial Mode 제5단계로 이동합니다.")
			QuestTeleport( 1, 57, 63 )
		}
	}
	else
	{
		EventMsg("하프를 튕기고 있는 여인이 해주는 얘기를 끝까지 듣고 오세요.")
	}

end

@Event00005		
	CmpQuestNumStep(63,64)
	if(yes==2)
	{
		random(0,2)
		if(ran==0)
		{
			EventMsg("Tutorial Mode 제6단계로 이동합니다.")
			QuestTeleport( 1, 109, 6 )
		}
		if(ran==1)
		{
			EventMsg("Tutorial Mode 제6단계로 이동합니다.")
			QuestTeleport( 1, 110, 6 )
		}
	}
	else
	{
		EventMsg("은빛 갑옷을 입은 기사가 해주는 얘기를 끝까지 듣고 오세요.")
	}

end

@Event00006		
	CmpQuestNumStep(63,76)
	if(yes==2)
	{
		random(0,2)
		if(ran==0)
		{
			EventMsg("Tutorial Mode 제7단계로 이동합니다.")
			QuestTeleport( 1, 117, 44 )
		}
		if(ran==1)
		{
			EventMsg("Tutorial Mode 제7단계로 이동합니다.")
			QuestTeleport( 1, 118, 44 )
		}
	}
	else
	{
		EventMsg("하프를 튕기고 있는 여인이 해주는 얘기를 끝까지 듣고 오세요.")
	}

end

@Event00007
	CmpQuestNumStep(63,80)
	if(yes==2)
	{
		random(0,2)
		if(ran==0)
		{
			EventMsg("Tutorial Mode 제8단계로 이동합니다.")
			QuestTeleport( 1, 109, 50 )
		}		
		if(ran==1)
		{
			EventMsg("Tutorial Mode 제8단계로 이동합니다.")
			QuestTeleport( 1, 110, 50 )
		}
	}
	else
	{
		EventMsg("은빛 갑옷을 입은 기사가 해주는 얘기를 끝까지 듣고 오세요.")
	}
end

@Event00008
	CmpQuestNumStep(63,85)
	if(yes==2)
	{
		random(0,2)
		if(ran==0)
		{
			EventMsg("Tutorial Mode 제9단계로 이동합니다.")
			QuestTeleport( 1, 86, 73 )
		}		
		if(ran==1)
		{
			EventMsg("Tutorial Mode 제9단계로 이동합니다.")
			QuestTeleport( 1, 87, 73 )
		}
	}
	else
	{
		EventMsg("하프를 튕기고 있는 여인이 해주는 얘기를 끝까지 듣고 오세요.")
	}
end

@Event00009		
	CmpQuestNumStep(63,93)
	if(yes==2)
	{
		random(0,2)
		if(ran==0)
		{
			EventMsg("Tutorial Mode 제10단계로 이동합니다.")
			QuestTeleport( 1, 133, 76 )
		}		
		if(ran==1)
		{
			EventMsg("Tutorial Mode 제10단계로 이동합니다.")
			QuestTeleport( 1, 134, 76 )
		}
	}
	else
	{
		EventMsg("은빛 갑옷을 입은 기사가 해주는 얘기를 끝까지 듣고 오세요.")
	}
end

@Event00010		
	CmpQuestNumStep(63,106)
	if(yes==2)
	{
		random(0,2)
		if(ran==0)
		{
			EventMsg("Tutorial Mode 제11단계로 이동합니다.")
			QuestTeleport( 1, 184, 104 )
		}		
		if(ran==1)
		{
			EventMsg("Tutorial Mode 제11단계로 이동합니다.")
			QuestTeleport( 1, 185, 104 )
		}
	}
	else
	{
		EventMsg("하프를 튕기고 있는 여인이 해주는 얘기를 끝까지 듣고 오세요.")
	}
end

@Event00011
	CmpQuestNumStep(63,122)
	if(yes==2)
	{
		random(0,2)
		if(ran==0)
		{
			EventMsg("Tutorial Mode 제12단계로 이동합니다.")
			QuestTeleport( 1, 126, 116 )
		}
		if(ran==1)
		{
			EventMsg("Tutorial Mode 제12단계로 이동합니다.")
			QuestTeleport( 1, 127, 116 )
		}
	}		
	else
	{
		EventMsg("은빛 갑옷을 입은 기사가 해주는 얘기를 끝까지 듣고 오세요.")
	}
end

@Event00012		
	CmpQuestNumStep(63,129)
	if(yes==2)
	{
		random(0,2)
		if(ran==0)
		{
			EventMsg("Tutorial Mode 제13단계로 이동합니다.")
			QuestTeleport( 1, 84, 115 )
		}
		if(ran==1)
		{
			EventMsg("Tutorial Mode 제13단계로 이동합니다.")
			QuestTeleport( 1, 85, 115 )
		}
	}
	else
	{
		EventMsg("하프를 튕기고 있는 여인이 해주는 얘기를 끝까지 듣고 오세요.")
	}
end

@Event00013		
	CmpQuestNumStep(63,0)
	if(yes==1)	;각 마을로 이동하기
	{
		sGetNat()
		if(yes==3)	;바이서스 소속일 때
		{
			MapMove( "MA-IN" , 232 , 97 )
			if( yes == 1 )
			{
				EventMsg("바이서스의 헬턴트 마을로 이동합니다.")
			}
			else
			{
				EventMsg("맵 이동에 실패했습니다.")
			}
		}
		if(yes==4)	;자이펀 소속일 때
		{
			MapMove( "RENES_C" , 210 , 175 )
			if( yes == 1 )
			{
				EventMsg("자이펀의 레너스 시로 이동합니다.")
			}
			else
			{
				EventMsg("맵 이동에 실패했습니다.")
			}
		}
		if(yes==6)	;일스 소속일 때
		{
			MapMove( "BARANTAN" , 329 , 95 )
			if( yes == 1 )
			{
				EventMsg("일스공국의 마을 바란탄으로 이동합니다.")
			}
			else
			{
				EventMsg("맵 이동에 실패했습니다.")
			}
		}		
	}		
	else
	{
		EventMsg("하프를 튕기고 있는 여인이 해주는 얘기를 끝까지 듣고 오세요.")
	}
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




