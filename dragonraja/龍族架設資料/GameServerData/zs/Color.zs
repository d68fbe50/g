
@sys00	; 처음 서버 Setting하는 함수.

	MaxNPC( 50 )
	
	MapName( "Color" )
	
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
; 낚시점
	random( 0, 2 )
	if( ran == 0 )
	{
	D( "일스라는 나라는 바다를 마주하고 있는 곳이라던데 난 바다가 좋아." );
	}
	if( ran == 1 )
	{
	D( "강에서 상어를 잡는 사람이 종종 있더라고 자네도 도전해 보게." );
	}
	CallSmallMenu( 0, 28 ); 조선소
end

@Npc00002	
; 주점
	random( 0, 2 )
	if( ran == 0 )
	{
	D( "던젼에 관한 정보를 얻을수 있을겁니다." );
	}
	if( ran == 1 )
	{
	D( "밖의 몬스터들이 무섭죠 하지만 술한잔 하고 용기를 내세요." );
	}
	CallSmallMenu( 0, 57 ) ;주점
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

	CheckNation(4)
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
		EventMsg("침입자는 자이펀 점령지 칼라힐 외부로 이동할 수 없습니다.")
		goto END1199_
	}
	else
	{
		goto END1103_
	}

:END1103_

	CompFriendShip(4,5)
	if( yes >= 0 )
	{
		EventMsg("당신은 자이펀의 적대수치(NK)가 높아 자이펀으로 이동하실 수가 없습니다.")
		goto END1199_
	}
	if( yes < 0 )
	{
		CheckNation(3)
		if(yes==1)
		{
			EventMsg("바이서스는 적대 국가 이므로 칼라힐 외부로 이동하실 수가 없습니다.")
			goto END1199_
		}
		goto END1120_
	}
	

:END1120_

	MapMove( "Kal_os", 367,10 )
	if( yes==1)
	{
		EventMsg("자이펀 점령지인 칼라힐 외부로 이동합니다.")
	}
	else
	{
		EventMsg("맵 이동에 실패했습니다.")		
	}	
	goto END1199_
	

:END1199_


end


@Event00002

	CheckNation(4)
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
		EventMsg("침입자는 자이펀 점령지인 레너스시로 이동할 수 없습니다.")
		goto END1299_
	}
	else
	{
		goto END1203_
	}

:END1203_

	CompFriendShip(4,5)
	if( yes >= 0 )
	{
		EventMsg("당신은 자이펀의 적대수치(NK)가 높아 자이펀으로 이동하실 수가 없습니다.")
		goto END1299_
	}
	if( yes < 0 )
	{
		CheckNation(3)
		if(yes==1)
		{
			EventMsg("바이서스는 적대 국가 이므로 마을로 이동하실 수가 없습니다.")
			goto END1299_
		}
		goto END1220_
	}
	

:END1220_

	MapMove( "Renes_c", 248,440 )
	if( yes==1)
	{
		EventMsg("자이펀 점령지인 레너스시로 이동합니다.")
	}
	else
	{
		EventMsg("맵 이동에 실패했습니다.")		
	}	
	goto END1299_
	

:END1299_


end


@Event00003

	CheckNation(4)
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
		EventMsg("침입자는 자이펀 사막으로 이동할 수 없습니다.")
		goto END1399_
	}
	else
	{
		goto END1303_
	}

:END1303_

	CompFriendShip(4,5)
	if( yes >= 0 )
	{
		EventMsg("당신은 자이펀의 적대수치(NK)가 높아 자이펀으로 이동하실 수가 없습니다.")
		goto END1399_
	}
	if( yes < 0 )
	{
		CheckNation(3)
		if(yes==1)
		{
			EventMsg("바이서스는 적대 국가 이므로 사막으로 이동하실 수가 없습니다.")
			goto END1399_
		}
		goto END1320_
	}
	

:END1320_

	MapMove( "Desert", 350,190 )
	if( yes==1)
	{
		EventMsg("자이펀 사막으로 이동합니다.")
	}
	else
	{
		EventMsg("맵 이동에 실패했습니다.")		
	}	
	goto END1399_
	

:END1399_


end


@Event00004

	MapMove( "Renes_out", 22,368 )	
	if( yes==1)
	{
		EventMsg("자이펀 점령지인 레너스 외부로 이동합니다.")
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








