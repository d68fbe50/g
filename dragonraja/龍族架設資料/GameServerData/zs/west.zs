
@sys00	; 처음 서버 Setting하는 함수.

	MaxNPC( 50 )
	
	MapName( "West" )
	
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
@Npc00031	; ACT2 by KTH

	CmpQuestNumStep(55,7)	; 기존 번호로 인한 혼란
	if(yes==2)
	{
		D("자네 미안하지만 1분 뒤에 돌아와주게.. 지금 하고있는 일을 금방끝낼것이니..")
		SetQuestNumStep(55,0)	; 초기화
		goto ENDact22_
	}

;start
	CmpQuestNumStep(55,3)
	if(yes==2)
	{
		CmpQuestNumStep(55,6)
		if(yes==1)
		{
			D("한층 더 멋있어졌군, 신전의 친구의 편지로 자네 얘기를 들었네.. 자네 부친이 살아계셨다면 참 자랑스러워 하실텐데. 아뭏든 계속 열심히 해주게나.")
			goto ENDact22_
		}
		CmpQuestNumStep(55,5)
		if(yes==1)
		{
			D("한층 더 멋있어졌군, 신전의 친구의 편지로 자네 얘기를 들었네.. 자네 부친이 살아계셨다면 참 자랑스러워 하실텐데. 아뭏든 계속 열심히 해주게나.")
			goto ENDact22_
		}
		CmpQuestNumStep(55,4)
		if(yes==1)
		{
			D("한층 더 멋있어졌군, 신전의 친구의 편지로 자네 얘기를 들었네.. 자네 부친이 살아계셨다면 참 자랑스러워 하실텐데. 아뭏든 계속 열심히 해주게나.")
			goto ENDact22_
		}
		else
		{
			D("있을 수 없는 단계.")
			goto ENDact22_
		}
	}
;	CmpQuestNumStep(55,3)
	if(yes==1)
	{
		D("빨리 가게.. 그쪽 사람에겐 내가 미리 수신을 보내놓았으니 그사람이 기다리고 있을 것이야. 위험할지도 모르니 가는 길에 아무하고도 얘기를나누지 말게. 명심하게..")
		goto ENDact22_
	}

	CmpQuestNumStep(55,2)
	if(yes==1)
	{
		IsInvHavePC(9050)
		if(yes==1)
		{
			CheckNation(3)
			if(yes==1)
			{	
				MessageBox("펜던트를 찾았군. 하지만 진정한 시험은 이제부터야. 바이서스 임펠 '320,692'의 신전으로 가면 도와줄 사람이 있을걸세.")
				SetQuestNumStep(55,3)
				goto ENDact22_
			}
			CheckNation(4)
			if(yes==1)
			{	
				MessageBox("펜던트를 찾았군. 하지만 진정한 시험은 이제부터야. 디프유벤 임펠 '488,345'의 신전으로 가면 도와줄 사람이 있을걸세.")
				SetQuestNumStep(55,3)
				goto ENDact22_
			}
			CheckNation(6)
			if(yes==1)
			{	
				MessageBox("펜던트를 찾았군. 하지만 진정한 시험은 이제부터야. 바란탄 '52,141'의 신전으로 가면 도와줄 사람이 있을걸세.")
				SetQuestNumStep(55,3)
				goto ENDact22_
			}
			else
			{
				D("이런 국적이 없는 사람치고 꽤 멀리도 왔군. 미안하지만 자네는 영웅의 영광을 찾지 못하네..영광은 신들이 내리는 축복이자 국가가 주는 특권이네..국적을 정하고 오게나..")
				goto ENDact22_
			}
		}
		else
		{
			D("자네 얼굴을 보니 황혼 펜던트를 아직도 못 찾은 모양이군..열심히 해보게나..")
			goto ENDact22_
		}
	}
	CmpQuestNumStep(55,2)
	if(yes==0)
	{	
		CmpQuestNumStep(55,1)
		if(yes==1)
		{
			CheckNation(3)
			if(yes==1)
			{				
				MessageBox("축하하네..하지만 '황혼의 숨결'의 영광이 없으면 트로피 같은 것이 무슨 뜻이 있겠나. 이라무스의 '425,119' 주위의 포탈로 가서 몬스터들과 싸워 황혼 펜던트를 찾으면 돌아오게나.")
				SetQuestNumStep(55,2)
				goto ENDact22_
			}
			CheckNation(4)
			if(yes==1)
			{				
				MessageBox("축하하네..하지만 '황혼의 숨결'의 영광이 없으면 트로피 같은 것이 무슨 뜻이 있겠나. 타이넨의 '170,582' 주위의 포탈로 가서 몬스터들과 싸워 황혼 펜던트를 찾으면 돌아오게나.")
				SetQuestNumStep(55,2)
				goto ENDact22_
			}
			CheckNation(6)
			if(yes==1)
			{				
				MessageBox("축하하네..하지만 '황혼의 숨결'의 영광이 없으면 트로피 같은 것이 무슨 뜻이 있겠나. 붉은 산맥의 '292,117' 주위의 포탈로 가서 몬스터들과 싸워 황혼 펜던트를 찾으면 돌아오게나.")
				SetQuestNumStep(55,2)
				goto ENDact22_
			}				
		}
;		CmpQuestNumStep(55,1)
		if(yes==0)
		{
			D("난 그냥 평범한 나뭇꾼일 뿐인데..도데체 뭘 바라고 왔는지 모르겠군.")
			goto ENDact22_
		}
	}

:ENDact22_


end
@Npc00032	
end
@Npc00033
        random( 0, 3 )
        if( ran == 0 )
        {
        D("아직은 당신에게 시킬 일이 없군..")
        }       
        if( ran == 1)
        {
        D("이곳은 붉은 산맥을 넘는 길이지..")
        }       
        if( ran == 2 )
        {
        D( " 저쪽이 바이서스와 일스가 서로 국경을 맞대고 있는 곳이야..." );
        }
end
@Npc00034
        random( 0, 3 )
        if( ran == 0 )
        {
        D("아직은 당신에게 시킬 일이 없군..")
        }       
        if( ran == 1)
        {
        D("이곳은 붉은 산맥을 넘는 길이지..")
        }       
        if( ran == 2 )
        {
        D( " 여기에서 붉은 산맥만 넘으면, 바이서스로 가는길이 보일거야.." );
        }
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
;	EventMsg("고대 비밀 지역으로 이동합니다.")
;	QuestTeleport(1,63,326) ; 비밀지역 이동
	EventMsg("아직 포탈의 에너지가 충분하지가 않습니다.")
end

@Event00002		
;	EventMsg("비밀 지역에서 밖으로 이동합니다.")
;	QuestTeleport(1,417,86) ; 비밀지역에서 밖으로 이동
end

@Event00003
	EventMsg("평원전쟁터로 가는 길입니다..")
end
@Event00004	;대정글
	MapMove( "big_tree", 11, 14 )
	if( yes == 1 )
	{
		EventMsg("대정글로 이동합니다...")
	}
	else
	{
		EventMsg("맵 이동에 실패했습니다.")
	}

end
@Event00005	; 3등급 길드집
;	IsInvHavePC(10094) ; 열쇠 번호
;	if(yes == 1)
;	{
;		goto ENDkey1_
;	}
;	else
;	{
		EventMsg("이 곳은 분배되지 않은 길드의 엠포리아입니다. 아직 아무도 들어갈 수 없습니다.")
		QuestTeleport(1,325,286) ; 집앞으로 이동
		SendSound(0,0161)
		goto ENDkey1_
;	}
:ENDkey1_
end
@Event00006	; 4등급 길드집
;	IsInvHavePC(10094) ; 열쇠 번호
;	if(yes == 1)
;	{
;		goto ENDkey2_
;	}
;	else
;	{
		EventMsg("이 곳은 분배되지 않은 길드의 엠포리아입니다. 아직 아무도 들어갈 수 없습니다.")
		QuestTeleport(1,684,235) ; 집앞으로 이동
		SendSound(0,0161)
		goto ENDkey2_
;	}
:ENDkey2_
end
@Event00007	; portal (act2_1)
	CmpQuestNumStep( 71, 15 )
	if(yes==1)
	{
		QuestTeleport(1,562,42)
		EventMsg("황혼의 펜턴트를 꼭 얻으시기 바랍니다.")
	}
	else
	{
		EventMsg("이 곳은 은거한 영웅의 이야기(Quest)를 들은 사람만이 들어올 수 있습니다.")
	}
end
@Event00008	; portal (act2_2)
	QuestTeleport(1,297,113)
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








