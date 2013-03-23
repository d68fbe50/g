
@sys00	; 처음 서버 Setting하는 함수.

	MaxNPC( 50 )

	MapName( "K_sung2" )

	
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
; :END_
	
end
@Npc00005

        D( "바이서스 대륙과 헬턴트의 역사에 대해서 알려드리죠..." );

end

@Npc00006	
; 이곳은 마을 회관
;	D("헬턴트에서 할 수 있는 일에 대해 알려드리죠")
;	마을 회관 인터페이스 호출
;	CallSmallMenu( 0, 29 )	

	D("말을 탄 기사의 멋있는 모습을 본적있소?")
end

@Npc00007	
	D("헬턴트성에 언제나 평화만이 있었으면 좋겠어")
end
@Npc00008
end


@Npc00009	
	random(0,3)
	if(ran == 0)
	{
		D(" 훈련장은 성쪽 , 헬턴트 마을은 동쪽 , 헬턴트 성은 북쪽, 남쪽은 뭐가 있지 ....")
	}
	if(ran == 1)
	{
		D(" 연금술사를 만나려면 북쪽으로 가야 하오.")
	}
	if(ran == 2)
	{
		D(" 지금은 평화롭지만 언제 드래곤이 헬턴트를 부수러 올지 걱정이군요.")
	}
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
;길드관리소
        CheckNation(4); 자이펀이면.
        if( yes==1)
        {
                D( " 이제 이 곳은 바이서스가 아냐..." )
                goto ENDnation_
        }
        D("어서 오시오,, 당신은 어느 길드 소속인가?")
	CallSmallMenu( 0, 76 ) ;길드관리 인터페이스
:ENDnation_		
end

@Npc00017	
end
@Npc00018   
end
@Npc00019	; 포탈 인터페이스 호출
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

@Npc00020	; 무기점
	random(0,3)
        if( ran == 0 )
        {
	        D( "자이펀의 스파이들을 본 적이 있나? 그들은 위험하니, 조심하게나.." );
        }
        if( ran == 1 )
        {
	        D( "이 곳은 쇠로 된 무기와 방어구들을 파는 곳입니다... ")
        }
        if( ran == 2 )
        {
	        D( "곧 자이펀과 전쟁이 있을  모양이야... 고급 무기들은 전부 군대로 들어가서 여기에서는 못판다네...")
        }
        CallSmallMenu( 0, 18 )
end
@Npc00021	; 목공소
	random(0,3)
        if( ran == 0 )
        {
	        D( "이 곳은 나무로 된 스태프나 도구들을 파는 곳입니다..." );
        }
        if( ran == 1 )
        {
	        D( "이 곳에서는 목공기술을 연마할 수 있답니다... ")
        }
        if( ran == 2 )
        {
	        D( "나무는 우리에게 참 아낌없이 도움을 주지..")
        }
        CallSmallMenu( 0, 27 )
end

@Npc00022	; 활제작소
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
@Npc00023	; 점성술사
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
        CallSmallMenu( 0, 71 )
end
@Npc00024	; 연금술사
	random(0,3)
	if(ran == 0)
	{
		D(" 약초를 포션으로, 쇠와 구리를 합쳐서 강한 금속으로 ...  히히히히.")
	}
	if(ran == 0)
	{
		D(" 포션의 재료는 약초라구 약초만 있으면 포션을 얼마든지 만들수 있지.")
	}
	if(ran == 0)
	{
		D(" 연금술은 정말 놀라운 것이지.. ")
	}
        CallSmallMenu( 0, 25 )
end
@Npc00025	; 빵집
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
        CallSmallMenu( 0, 20 )
end
@Npc00026	; 의류점
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
	        D( "이 곳에서는 천으로 된 옷감과 아름다운 옷들을 많이 판다네..." );
        }
        CallSmallMenu( 0, 24 )
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
@Npc00044	; 편지 수신자
	CmpQuestNumStep(53,100)
	if( yes == 1 )
	{
		IsInvHavePC(10077)
		if( yes == 1 )
		{
			MessageBox("아니 어떻게 자네가? 대신 온 것이군. 정말 고맙게. 자네 수고에 대한 나의 성의이니 받아주게나.") ; MessageBox 사용
			EventMsg("편지 심부름에 대한 보답을 받았습니다.")
			SendSound(0,1217)
			SetItemInvPC(10077,10123,2000) ; 편지를 없애고 돈을 받는다.
			SetQuestNumStep(53,0)
			goto ENDsim2_
		}
		else
		{
			D("헬턴트마을로 부터 편지가 와야하는데 왜 소식이 없지.. 중간에 무슨 일이 생겼는지 불안하군.")
			goto ENDsim2_
		}
	}
	else
	{
	D("헬턴트마을로 부터 편지가 와야하는데 왜 소식이 없지.. 중간에 무슨 일이 생겼는지 불안하군.")
	goto ENDsim2_
	}
:ENDsim2_
end

@Npc00045	;길드원리스트 열기
	D("길드에 소속되어 계시다면, 제가 길드원 리스트를 보여드리지요.")
	CallMenu(24)
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


@Event00001	; To 헬턴트마을
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
			MapMove( "Ma-In", 344,14 )
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
	else
	{
		MapMove( "Ma-In", 344,14 )
        	EventMsg("바이서스 헬턴트 마을로 이동합니다.")
	}
:END12_
end

@Event00002		; 헬턴트성 내부 (307,11)
;;;	MapMove( "Sung_Tile_00", 116,242 )
end


@Event00003	; 회색산맥
	MapMove( "GRAY", 348,188 )
	if(yes == 1)
	{
		EventMsg("회색산맥으로 이동합니다..")
        }
        else
        {
		EventMsg("맵이동에 실패했습니다..")
	}
end
@Event00004	

end

@Event00005	; 엠포리아 하우스
	IsMyGuildHouse(5)
	if(yes == 1)
	{
		EventMsg(" 환영합니다. 이 곳은  길드 엠포리아 입니다...")
		goto ENDemp05_
	}
	else
	{
		EventMsg("이 곳은  길드의 엠포리아입니다.  길드원만이 들어갈 수 있습니다.")
		SendSound(0,0161)
		goto ENDemp05_
	}
:ENDemp05_

end

@Event00006	; 엠포리아 하우스
	IsMyGuildHouse(6)
	if(yes == 1)
	{
		EventMsg(" 환영합니다. 이 곳은  길드 엠포리아 입니다...")
		goto ENDemp06_
	}
	else
	{
		EventMsg("이 곳은  길드의 엠포리아입니다.  길드원만이 들어갈 수 있습니다.")
		SendSound(0,0161)
		goto ENDemp06_
	}
:ENDemp06_

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
@Event00008	; 엠포리아 하우스
	IsMyGuildHouse(8)
	if(yes == 1)
	{
		EventMsg(" 환영합니다. 이 곳은  길드 엠포리아 입니다...")
		goto ENDemp08_
	}
	else
	{
		EventMsg("이 곳은  길드의 엠포리아입니다.  길드원만이 들어갈 수 있습니다.")
		SendSound(0,0161)
		goto ENDemp08_
	}
:ENDemp08_

end
@Event00009	; 엠포리아 하우스
	IsMyGuildHouse(9)
	if(yes == 1)
	{
		EventMsg(" 환영합니다. 이 곳은  길드 엠포리아 입니다...")
		goto ENDemp09_
	}
	else
	{
		EventMsg("이 곳은  길드의 엠포리아입니다.  길드원만이 들어갈 수 있습니다.")
		SendSound(0,0161)
		goto ENDemp09_
	}
:ENDemp09_

end

@Event00010	; 엠포리아 하우스
	IsMyGuildHouse(10)
	if(yes == 1)
	{
		EventMsg(" 환영합니다. 이 곳은  길드 엠포리아 입니다...")
		goto ENDemp10_
	}
	else
	{
		EventMsg("이 곳은  길드의 엠포리아입니다.  길드원만이 들어갈 수 있습니다.")
		SendSound(0,0161)
		goto ENDemp10_
	}
:ENDemp10_

end
@Event00011	; 엠포리아 하우스
	IsMyGuildHouse(11)
	if(yes == 1)
	{
		EventMsg(" 환영합니다. 이 곳은  길드 엠포리아 입니다...")
		goto ENDemp11_
	}
	else
	{
		EventMsg("이 곳은  길드의 엠포리아입니다.  길드원만이 들어갈 수 있습니다.")
		SendSound(0,0161)
		goto ENDemp11_
	}
:ENDemp11_

end

@Event00012	; 오크심장 비밀지역 밖
	IsInvHavePC(10062) ; 오크 심장 번호
	if(yes == 1)
	{
		EventMsg("고대 비밀 지역으로 이동합니다.")
		QuestTeleport(1,335,310) ; 비밀지역 이동
		SetItemInvPC(10062,0,0)
		goto ENDsecret1_
	}
	else
	{
		goto ENDsecret1_
	}
:ENDsecret1_

end

@Event00013	; 오크심장 비밀지역 안
	EventMsg("비밀 지역에서 밖으로 이동합니다.")
	QuestTeleport(1,299,264) ; 비밀지역에서 밖으로 이동
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








