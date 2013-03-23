
@sys00	; 처음 서버 Setting하는 함수.

	MaxNPC( 50 )
	
	MapName( "HU_VM" )
	
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
        CheckNation(4);자이펀이면.
        if( yes==1)
        {
                D( " 쳇.. 당신 자이펀인이로군..." )
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
	D( "Health를 올려주는 음식과 그 음식을 만들 수 있는 기술을 가르쳐 줍니다. " );
	}
	CallSmallMenu( 0, 20 )
end
@Npc00002
        CheckNation(4);자이펀이면.
        if( yes==1)
        {
                D( " 자이펀인이군.. 당장 경비를 부르겠네. 경비~... " )
                goto ENDnation_
        }
	
	random(0,4)
	if( ran == 0 )
	{
		D( "돈만준다면  철을 이용해서 만들수 있는 것은 뭐든지 팔지. 또한 그 기술도 가르쳐 주지." );
        }
	if( ran == 1 )
	{
		D( "불의 던젼은 그나만 몬스터들의 레벨이 낮다고 그래서 초보들이 주로 가는 던젼이지.")
        }
	if( ran == 2 )
	{
        	D( "광물은 주로 바위에서 얻을수 있지, 곡괭이로 바위를 내려치면 광맥이 보일꺼야.")  
        }
        if( ran == 3 )
	{
	        D( "여보게 전투에 들어가기전에 무기를 수리해 놓는건 어떤가 ?.")  
        }
	CallSmallMenu( 0, 18 )

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
;	CallSmallMenu( 0, 21 )	
end
@Npc00027	
;	D( "농가3" );
;	CallSmallMenu( 0, 19 )	

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
; 
;	D( "푸줏간2" );

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
;	D( "빵집2" ); 식당 인터페이스 다음 대사 랜덤
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
; 대장간
	random( 0, 2 )
	if( ran == 0 )
	{
	D( "늑대를 조심하게나... 늑대 한마리는 별거아니지만, 떼거지로 덤비면 당해낼 수 없다네." )
	}
	if( ran == 1 )
	{
       	D("광산은 저기 위쪽에 있다네.. 여기에서는 광물을 사고 팔 수 있지.")
	}
	CallSmallMenu( 0, 18 )		
end
@Npc00034
; 낚시점
	random( 0, 2 )
	if( ran == 0 )
	{
	D( "저쪽 일스에 나가면 상어나 고래같은 큰놈들도 잡을 수 있다는데..." )
	}
	if( ran == 1 )
	{
       	D("남쪽으로 내려가다 보면, 낚시터가 있지.. 물고기도 많이 잡으면 꽤나 짭짤한 수입이 될거야..")
	}
	CallSmallMenu( 0, 28 )	
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
@Npc00041	; 보따리 수신자
	CmpQuestNumStep(54,100)
	if( yes == 1 )
	{
		IsInvHavePC(10080)
		if( yes == 1 )
		{
			MessageBox("고맙네. 막 물건이 떨어져서 급하던 참이었는데.. 성의의 표시이니 이것을 받게나..")
			EventMsg("물건 운반에 대한 보답으로 돈을 받았습니다.")
			SendSound(0,1217)
			SetItemInvPC(10080,10123,2000)
			SetQuestNumStep(54,0)
			goto ENDquest2_
		}
		else
		{
			D("정말 큰일이군 헬턴트 마을에서 무기가 와야할 때가 됐는데.. 무슨 일이 생긴건가..")
			goto ENDquest2_
		}
	}
	else
	{
		D("정말 큰일이군 헬턴트 마을에서 무기가 와야할 때가 됐는데.. 무슨 일이 생긴건가..")
		goto ENDquest2_
	}


:ENDquest2_
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
:ENDnation_
end





@Event00000
end


@Event00001

	CheckNation(3)
	if(yes==1)
	{
		goto END1020_
	}
	else
	{
		goto END1002_
	}
	

:END1002_

	LocalWarMode()
	if(yes==1) ; 전쟁모드인 경우
	{
		EventMsg("침입자는 바이서스 인공던전으로 이동할 수 없습니다.")
		goto END1099_
	}
	else
	{
		goto END1003_
	}

:END1003_

	CompFriendShip(3,5)
	if( yes >= 0 )
	{
		EventMsg("당신은 바이서스 적대수치(NK)가 높아 바이서스 지역을 이동할 수 없습니다.")
		goto END1099_
	}
	if( yes < 0 )
	{
		goto END1020_
	}
	

:END1020_

;; 인공 던전
	MapMove( "Mandun2", 81,169 )
	if( yes == 1)
	{
		EventMsg("인공 던전 1층으로 이동합니다.")
	}
	else
	{
		EventMsg("맵 이동에 실패했습니다.")
	}
	goto END1099_
	

:END1099_


end


@Event00002	

	CheckNation(3)
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
		EventMsg("침입자는 바이서스 헬턴트 마을로 이동할 수 없습니다.")
		goto END1299_
	}
	else
	{
		goto END1203_
	}

:END1203_

	CompFriendShip(3,5)
	if( yes >= 0 )
	{
		EventMsg("당신은 바이서스 적대수치(NK)가 높아 바이서스 지역을 이동할 수 없습니다.")
		goto END1299_
	}
	if( yes < 0 )
	{
		CheckNation(4)
		if(yes==1)
		{
			EventMsg("자이펀은 적대 국가 이므로 마을로 출입할 수가 없습니다.")
			goto END1299_
		}
		goto END1220_
	}
	

:END1220_

	MapMove( "MA-IN", 345,137 )
	if( yes==1)
	{
		EventMsg("헬턴트 마을로 이동합니다.")
	}
	else
	{
		EventMsg("맵 이동에 실패했습니다.")		
	}	
	goto END1299_
	

:END1299_


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
		goto END1303_
	}
	else
	{
		goto END1305_
	}

:END1303_

	CheckAllSealStoneBroked(3)
	if(yes==1)
	{
		goto END1320_
	}
	else
	{
		EventMsg("결계석의 보호로 들어갈 수가 없습니다.")
		goto END1399_
	}


:END1304_


:END1305_ ; 바이서스 적대 수치 체크


	CompFriendShip(3,5)
	if( yes >= 0 )
	{
		EventMsg("당신은 바이서스 적대수치(NK)가 높아 바이서스 지역을 이동할 수가 없습니다.")
		goto END1399_
	}
	if( yes < 0 )
	{
		goto END1320_
	}


:END1320_

	MapMove( "SOURCE", 351,204 )
	if( yes==1)
	{
		EventMsg("휴다인강으로 이동합니다.")
	}
	else
	{
		EventMsg("맵 이동에 실패했습니다.")		
	}	
	goto END1399_
	
:END1399_


end



@Event00004	
	MapMove( "big_g", 7, 239 )
	if( yes==1)
	{
		EventMsg("대초원으로 이동합니다.")
	}
	else
	{
		EventMsg("맵 이동에 실패했습니다.")
	}
end

@Event00005	

	IsLevel(31)		; 출입 31레벨 제한
	if( yes == 1)
	{
		goto END1501_
	}
	else
	{
		EventMsg("당신의 레벨로는 이곳을 지날 수 없습니다. 이 길은 Lv.31부터 지날 수 있습니다.")
		SendSound(0,2061)
		goto END1599_
	}

:END1501_

	CheckNation(3)
	if(yes==1)
	{
		goto END1520_
	}
	else
	{
		goto END1502_
	}
	

:END1502_

	LocalWarMode()
	if(yes==1) ; 전쟁모드인 경우
	{
		EventMsg("침입자는 바이서스 이라무스로 이동할 수 없습니다.")
		goto END1599_
	}
	else
	{
		goto END1503_
	}

:END1503_

	CompFriendShip(3,5)
	if( yes >= 0 )
	{
		EventMsg("당신은 바이서스 적대수치(NK)가 높아 바이서스 지역을 이동할 수 없습니다.")
		goto END1599_
	}
	if( yes < 0 )
	{
		CheckNation(4)
		if(yes==1)
		{
			EventMsg("자이펀은 적대 국가 이므로 마을로 출입할 수가 없습니다.")
			goto END1599_
		}
		goto END1520_
	}
	

:END1520_

	MapMove( "iramus", 15, 162 )
	if( yes==1)
	{
		EventMsg("바이서스 이라무스로 이동합니다.")
	}
	else
	{
		EventMsg("맵 이동에 실패했습니다.")		
	}	
	goto END1599_
	

:END1599_



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








