
@sys00	; 처음 서버 Setting하는 함수.

	MaxNPC( 50 )
	MapName( "big_g" )
	
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
;; 대정글 (to Big_tree in Yllse)

	CheckNation(6)
	if(yes==1)
	{
		goto END1111_
	}
	else
	{
		goto END1102_
	}


:END1102_

	LocalWarMode()
	if(yes==1) ; 전쟁모드인 경우
	{
		goto END1103_
	}
	else
	{
		goto END1105_
	}


:END1103_

	CheckAllSealStoneBroked(6)
	if(yes==1)
	{
		goto END1120_
	}
	else
	{
		EventMsg("결계석의 보호로 들어갈 수가 없습니다.")
		goto END1199_
	}


:END1104_


:END1105_


	CompFriendShip(6,5)
	if( yes >= 0 )
	{
		EventMsg("당신은 일스 공국의 적대수치(NK)가 높아 일스 공국으로 이동하실 수가 없습니다.")
		goto END1199_
	}
	if( yes < 0 )
	{
		goto END1106_
	}

:END1106_

	IsInvHavePC(10159)
	if(yes==1)
	{
		SetItemInvPC(10159,0,0)
		EventMsg("환영합니다. 이곳부터는 일스 공국 영토입니다. 좋은 여행이 되시길.")
		goto END1120_
	}
	else
	{
		EventMsg("타국인이 일스 공국으로 들어가기 위해서는 일스 출입증이 필요합니다.")
		goto END1199_
	}

:END1111_

	LocalWarMode()
	if(yes==1) ; 전쟁모드인 경우
	{
		goto END1120_
	}
	else
	{
		goto END1120_
	}



:END1112_

:END1113_

:END1120_

	MapMove( "big_tree", 112,713 )
	if( yes==1)
	{
		EventMsg("일스공국의 <대정글>로 이동합니다.")
	}
	else
	{
		EventMsg("맵 이동에 실패했습니다.")		
	}	
	goto END1199_

:END1199_

end



@Event00002
;; 웨스트 그레이드
	MapMove( "W_glade", 368,9 )
	if( yes==1 )
	{
		EventMsg("<웨스트 그레이드> 지역으로 이동합니다.")
	}
	else
	{
		EventMsg("맵 이동에 실패했습니다.")		
	}
end

@Event00003	
;; 레너스시 외부 (to Renes_out in Zypern)

	CheckNation(4)
	if(yes==1)
	{
		goto END1311_
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

	CheckAllSealStoneBroked(4)
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

:END1305_

	CheckNation(3)
	if(yes==1)
	{
		EventMsg("바이서스와 자이펀은 서로 적대 관계로 자이펀 점령 지대에 왕래가 불가능합니다.")
		goto END1399_
	}
	else
	{
		goto END1306_
	}

:END1306_

	CompFriendShip(4,5)
	if( yes >= 0 )
	{
		EventMsg("당신은 자이펀의 적대수치(NK)가 높아 자이펀으로 이동하실 수가 없습니다.")
		goto END1399_
	}
	if( yes < 0 )
	{
		goto END1307_
	}

:END1307_

	IsInvHavePC(10158)
	if(yes==1)
	{
		SetItemInvPC(10158,0,0)
		EventMsg("환영합니다. 이곳부터는 자이펀 점령지입니다. 좋은 여행이 되시길.")
		goto END1320_
	}
	else
	{
		EventMsg("일스인이 자이펀으로 들어가기 위해서는 자이펀 출입증이 필요합니다.")
		goto END1399_
	}

:END1311_

	LocalWarMode()
	if(yes==1) ; 전쟁모드인 경우
	{
		goto END1320_
	}
	else
	{
		goto END1320_
	}

:END1312_

:END1313_



:END1320_

	MapMove( "renes_out", 12,183 )
	if( yes==1)
	{
		EventMsg("자이펀 점령지인 레너스 외부로 이동합니다.")
	}
	else
	{
		EventMsg("맵 이동에 실패했습니다.")		
	}	
	goto END1399_


:END1399_


end



@Event00004
;; 물의던전 1층
;; 50레벨 이상, 전쟁모드가 아닌 경우, 출입가능
	LocalWarMode()
	if(yes == 1)
	{
		EventMsg("전쟁모드인 상태에서는 물의 던전에 들어가실 수가 없습니다.")
		goto END1499_
	}
	else
	{
		goto END1401_
	}

:END1401_

	IsLevel(50)		;물던전 50레벨 제한
	if( yes == 1)
	{
		MapMove( "waterdun1", 13, 148 )
		if( yes == 1 )
		{
			EventMsg("물던전으로 이동합니다.")
		}
		else
		{
			EventMsg("맵 이동에 실패했습니다.")
		}
	}
	else
	{
		EventMsg("당신의 레벨로 이 곳에 들어가기에는 매우 위험하군요. Lv.50부터 들어갈 수 있습니다.")
	}

:END1499_

end
@Event00005
;; 휴다인고개 (to hu_vm in Vyseus)
	
	CheckNation(3)
	if( yes==1 )
	{
		goto END1011_
	}
	else
	{
		goto END1002_
	}



:END1002_

	LocalWarMode()
	if(yes==1) ; 전쟁모드인 경우
	{
		goto END1003_
	}
	else
	{
		goto END1005_
	}


:END1003_

	CheckAllSealStoneBroked(3)
	if(yes==1)
	{
		goto END1020_
	}
	else
	{
		EventMsg("결계석의 보호로 들어갈 수가 없습니다.")
		goto END1099_
	}

:END1004_




:END1005_

	CheckNation(4)
	if(yes==1)
	{
		EventMsg("바이서스와 자이펀은 서로 적대 관계로 바이서스 국경 지대에 왕래가 불가능합니다.")
		goto END1099_
	}
	else
	{
		goto END1006_
	}

:END1006_

	CompFriendShip(3,5)
	if( yes >= 0 )
	{
		EventMsg("당신은 바이서스의 적대수치(NK)가 높아 바이서스로 이동하실 수가 없습니다.")
		goto END1099_
	}
	if( yes < 0 )
	{
		goto END1007_
	}

:END1007_

	IsInvHavePC(10157)
	if(yes==1)
	{
		SetItemInvPC(10157,0,0)
		EventMsg("환영합니다. 이곳부터는 바이서스 영지입니다. 좋은 여행이 되시길.")
		goto END1020_
	}
	else
	{
		EventMsg("일스인이 바이서스로 들어가기 위해서는 바이서스 출입증이 필요합니다.")
		goto END1099_
	}

:END1011_

	LocalWarMode()
	if(yes==1) ; 전쟁모드인 경우
	{
		goto END1020_
	}
	else
	{
		goto END1020_
	}

:END1012_


:END1013_



:END1020_

	MapMove( "hu_vm", 348,189 )
	if( yes==1 )
	{
		EventMsg("바이서스 국경 지대인 휴다인고개로 이동합니다.")
	}
	else
	{
		EventMsg("맵 이동에 실패했습니다.")		
	}	
	goto END1099_


:END1099_

end
@Event00006
;; 헤게모니아
	MapMove( "Hegmonia", 9,530 )
	if( yes==1 )
	{
		EventMsg("<헤게모니아> 지역으로 이동합니다.")
	}
	else
	{
		EventMsg("맵 이동에 실패했습니다.")		
	}	
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





