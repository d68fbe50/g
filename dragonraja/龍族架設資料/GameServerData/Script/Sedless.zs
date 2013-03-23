
@sys00	; 처음 서버 Setting하는 함수.

	MaxNPC( 50 )
	
	MapName( "Sedless" )
	
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
@Npc00012	; 빵집주인
         random( 0, 3 )
        if( ran == 0 )
        {
        D("일스는 희귀한 음식이 아주 많다네...")
        }       
        if( ran == 1)
        {
        D("멀리 길을 떠나는가? 음식을 넉넉히 준비하지 않으면 굶어죽을거야.. ")
        }       
        if( ran == 2 )
        {
        D( "혹시 수도에 있는 요리사가 요리대회에서 1등을 했다고 하지 않던가?. 그거 다 뻥이라네.. " );
        }
        CallSmallMenu( 0, 20 )
end
@Npc00013	; 대장간
        random( 0, 2 )
        if( ran == 0 )
        {
        D( "난 대장장이라오.. 조금 더워도 참으시게나.. 대장간이라 항상 뜨거운 열이 가득차 있지... " );
        }
        if( ran == 1 )
        {
        D( "불에 이글거리는 쇠를 보고 있자면, 무언가에 사로잡히는 듯하다네..." );
        }
        CallSmallMenu( 0, 18 )
end
@Npc00014	
end
@Npc00015	
end
@Npc00016	; 활제작소
        random( 0, 2 )
        if( ran == 0 )
        {
        D( "자네 가끔은 빗나가게 쏘는 것이 어떤가? " );
        }
        if( ran == 1 )
        {
        D( "루트에리노를 따르던 여덟기사 중 우타크를 아는가? " );
        }
        CallSmallMenu( 0, 27 )
end
@Npc00017	
end
@Npc00018   
end
@Npc00019	; 점성술사
        random( 0, 3 );
        if( ran == 0 )
        {
        D( "마나는 보이지 않는 대자연의 힘이 뭉쳐진 것이라네... " );
        }
        if( ran == 1 )
        {
        D("마법은 신력을 거부하지만, 반드시 그렇지만은 않다네... ")
        }
        if( ran == 2 )
        {
        D("당신은 마법사와 인연이 많군요...")
        }
        CallSmallMenu( 0, 71 )
end

@Npc00020	
end
@Npc00021	
end
@Npc00022	
end
@Npc00023	; 낚시점
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
@Npc00048	; 국가 고급 아이템
	D("국가 기부금으로 운영되는 상점입니다. 돈과 명성을 통해 고급아이템을 구하실 수 있습니다.")
	CallMenu( 66 )
end
@Npc00049	
end

@Event00000	

end

@Event00001	; 대계곡

	CheckNation(6)
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
		EventMsg("침입자는 일스 공국의 대계곡으로 이동할 수 없습니다.")
		goto END1199_
	}
	else
	{
		goto END1103_
	}

:END1103_

	CompFriendShip(6,5)
	if( yes >= 0 )
	{
		EventMsg("당신은 일스 공국 적대수치(NK)가 높아 일스 공국 지역을 이동할 수 없습니다.")
		goto END1199_
	}
	if( yes < 0 )
	{
		goto END1120_
	}
	

:END1120_

	MapMove( "big_valley", 4, 433 )
	if( yes == 1 )
	{
		EventMsg(" 대계곡으로 이동합니다... ")
	}
	else
	{
		EventMsg("맵 이동에 실패했습니다.")		
	}	
	goto END1199_
	

:END1199_


end

@Event00002	; 바란탄


	CheckNation(6)
	if(yes==1)
	{
		goto END1220_
	}
	else
	{
		goto END1202_
	}
	

:END1202_

	LocalWarMode()
	if(yes==1) ; 전쟁모드인 경우
	{
		EventMsg("침입자는 일스 공국의 바란탄으로 이동할 수 없습니다.")
		goto END1299_
	}
	else
	{
		goto END1203_
	}

:END1203_

	CompFriendShip(6,5)
	if( yes >= 0 )
	{
		EventMsg("당신은 일스 공국 적대수치(NK)가 높아 일스 공국 지역을 이동할 수 없습니다.")
		goto END1299_
	}
	if( yes < 0 )
	{
		goto END1220_
	}
	

:END1220_

	MapMove( "barantan", 380, 10 )
	if( yes == 1 )
	{
		EventMsg("일스공국의 수도 <바란 탄>으로 이동합니다. ")
	}
	else
	{
		EventMsg("맵 이동에 실패했습니다.")		
	}	
	goto END1299_
	

:END1299_

end

@Event00003	; 던전입구

	LocalWarMode()
	if(yes==1) ; 전쟁모드인 경우
	{
		EventMsg("침입자는 일스 공국의 빛의 던전으로 이동할 수 없습니다.")
		goto END1399_
	}
	else
	{
		goto END1303_
	}

:END1303_

	CompFriendShip(6,5)
	if( yes >= 0 )
	{
		EventMsg("당신은 일스 공국 적대수치(NK)가 높아 일스 공국 지역을 이동할 수 없습니다.")
		goto END1399_
	}
	if( yes < 0 )
	{
		goto END1320_
	}
	

:END1320_

	MapMove( "lightdun1", 10,20 )
	if( yes == 1 )
	{
		EventMsg("빛의 던전으로 이동합니다.")
	}
	else
	{
		EventMsg("맵 이동에 실패했습니다.")		
	}	
	goto END1399_
	

:END1399_


end
@Event00004	; 대정글 
	MapMove( "big_tree", 707, 707 )
	if( yes == 1 )
	{
		EventMsg("대정글로 이동합니다. ")
	}
	else
	{
		EventMsg("맵 이동에 실패했습니다.")
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








