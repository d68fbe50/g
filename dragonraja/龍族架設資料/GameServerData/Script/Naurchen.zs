
@sys00	; 처음 서버 Setting하는 함수.

	MaxNPC( 50 )
	MapName( "Naurchen" )

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
;; 활제작소
	random( 0, 3 )
        if( ran == 0 )
        {
		D( "이 곳은 <나우르첸> 지역입니다." )
        }
        if( ran == 1 )
        {
        	D( "이 곳은 활과 화살을 사고 파는 곳입니다." )
        }
        if( ran == 2 )
        {
	        D( "당신은 궁수입니까? 궁수라면 꼭 다시 들러주십시오." )
        }
        CallSmallMenu( 0, 27 )
end
@Npc00002
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
@Npc00003
;; 대장간
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
@Npc00004
;; 목공소
	random( 0, 3 )
        if( ran == 0 )
        {
		D( "이 곳은 <나우르첸> 지역입니다." )
        }
        if( ran == 1 )
        {
        	D( "이 곳은 나무로 된 스태프 등을 사고 파는 곳입니다." )
        }
        if( ran == 2 )
        {
	        D( "이 곳은 위험한 곳입니다. 에델브로이의 은총이 있기를." )
        }
        CallSmallMenu( 0, 26 )
end
@Npc00005
;; 빵집
	random( 0, 3 )
        if( ran == 0 )
        {
		D( "이 곳은 <나우르첸> 지역입니다." )
        }
        if( ran == 1 )
        {
        	D( "이 곳은 빵과 같은 음식을 사고 파는 곳입니다." )
        }
        if( ran == 2 )
        {
	        D( "여행길에 배가 고프지 않도록 음식을 항상 준비를 하셔야 합니다." )
        }
        CallSmallMenu( 0, 20 )
end
@Npc00006
;; 의류점
	random( 0, 3 )
        if( ran == 0 )
        {
		D( "이 곳은 <나우르첸> 지역입니다." )
        }
        if( ran == 1 )
        {
        	D( "던전에 들어가더라도 옷은 입어야지요?" )
        }
        if( ran == 2 )
        {
	        D( "좋은 옷은 좋은 방어력을 갖추고 있습니다." )
        }
        CallSmallMenu( 0, 24 )
end
@Npc00007
;; 연금술소 (포션)
	random( 0, 3 )
        if( ran == 0 )
        {
		D( "이 곳은 <나우르첸> 지역입니다." )
        }
        if( ran == 1 )
        {
        	D( "이 곳은 포션을 사고 파는 곳입니다." )
        }
        if( ran == 2 )
        {
	        D( "연금술을 아십니까? 대륙 곳곳에는 연금술사들이 적지 않습니다." )
        }
        CallSmallMenu( 0, 25 )
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
end
@Event00002
;; 나우르첸 --> 바란탄
  MapMove( "Barantan", 475,306 )
	if( yes == 1 )
	{
		EventMsg("<바란탄>으로 이동합니다.")
	}
	else
	{
		EventMsg("맵 이동에 실패했습니다.")
	}
end
@Event00003
;; 나우르첸 --> 대계곡
	MapMove( "Big_valley", 415,706 )
	if( yes == 1 )
	{
		EventMsg("<대계곡으로 이동합니다.")
	}
	else
	{
		EventMsg("맵 이동에 실패했습니다.")
	}
end
@Event00004
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



