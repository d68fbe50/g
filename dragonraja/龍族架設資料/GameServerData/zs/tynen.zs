@sys00	; 처음 서버 Setting하는 함수.

	MaxNPC( 50 )
	
	MapName( "tynen" )
	
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
@Npc00003	; 마을회관
        CheckNation(3); 바이서스면.
        if( yes==1)
        {
                D( " 당신은 바이서스 사람인가? 조심하시게.." )
                goto ENDnation_
        }
	random( 0, 2 )
	if( ran == 0 )
	{
	D("자이펀 제2의 도시 타이넨에 온 걸 환영하오...")
	}
	if( ran == 1 )
	{
	D("타이넨에서 할 수 있는 일에 대해 알려드리죠.")
	}
	CallSmallMenu( 0, 29 )
end
@Npc00004	; 여관
        CheckNation(3); 바이서스면.
        if( yes==1)
        {
                D( " 당신은 바이서스 사람인가? 조심하시게.." )
                goto ENDnation_
        }
	random( 0, 2 )
	if( ran == 0 )
	{
	D( "편안한 휴식과 수면을 하면 Life와 Health가 올라 가지요." );
	}
	if( ran == 1 )
	{
	D( "마법사라면 메모라이즈를 위해서 수면이 꼭 필요합니다. " );
	}
        CallSmallMenu( 0, 67 )
end
@Npc00005	; 은행주인
        CheckNation(3); 바이서스면.
        if( yes==1)
        {
                D( " 당신은 바이서스 사람인가? 조심하시게.." )
                goto ENDnation_
        }
	D( "어서 오세요. 이곳은 타이넨 은행입니다. 예금,출금,대출 업무가 가능하죠 " );
        CallSmallMenu( 0, 13 )
end
@Npc00006	; 주점주인
        CheckNation(3); 바이서스면.
        if( yes==1)
        {
	        D( " 당신은 바이서스 사람인가? 조심하시게.." )
                goto ENDnation_
        }
	D( "어서 옵쇼~! 이 곳은 술을 마시며 인생을 논하는 곳이지... " );
        CallSmallMenu( 0, 57 )
end
@Npc00007	; 병원주인
        CheckNation(3); 바이서스면.
        if( yes==1)
        {
                D( " 당신은 바이서스 사람인가? 조심하시게.." )
                goto ENDnation_
        }
        D( "몸에 이상이 있다고 생각되면 그건 병이 있는겁니다. 치료를 한번 받아 보세요." )
        CallSmallMenu( 0, 63 )
end
@Npc00008   	; 학술원 주인
        CheckNation(3); 바이서스면.
        if( yes==1)
        {
                D( " 당신은 바이서스 사람인가? 조심하시게.." )
                goto ENDnation_
        }
        D( "수준높은 지식을 알려 주길 원하나?" )
        CallSmallMenu( 0, 72 )
end
@Npc00009	; 길드관리소
        CheckNation(3); 바이서스면.
        if( yes==1)
        {
                D( " 당신은 바이서스 사람인가? 조심하시게.." )
                goto ENDnation_
        }
        D("어서 오시오,, 당신은 어느 길드 소속인가?")
	CallSmallMenu( 0, 76 ) ;길드관리 인터페이스
end
@Npc00010	
end
@Npc00011	; 농장주인
        CheckNation(3); 바이서스면.
        if( yes==1)
        {
                D( " 당신은 바이서스 사람인가? 조심하시게.." )
                goto ENDnation_
        }
        random( 0, 2 )
        if( ran == 0 )
        {
        D( "땅에서 나는 모든 산물은 시무니안의 영광이 깃들어  있지 " );
        }
        if( ran == 1)
	{
        D( "가축을 길러보고 싶지는 않은가? 아님 밭을 일구어 작물을 기를수도 있고..." );
        }
end
@Npc00012	; 빵집주인
        CheckNation(3); 바이서스면.
        if( yes==1)
        {
                D( " 당신은 바이서스 사람인가? 조심하시게.." )
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
        D( " 자이펀인들은 무서운 저주를 내릴 줄 안다던데.. 무서운 일이야.." );
        }
        CallSmallMenu( 0, 20 )
end
@Npc00013	; 대장간
        CheckNation(4); 자이펀이면.
        if( yes==1)
        {
                D( " 헉.. 당신이 어떻게 여기까지..." )
                goto ENDnation_
        }
        random( 0, 2 )
        if( ran == 0 )
        {
        D( "난 대장장이라오. 요즘은 전쟁중이라 무기를 많이 만들어야 한다네..." );
        }
        if( ran == 1 )
        {
        D( "불에 이글거리는 쇠를 보고 있자면, 무언가에 사로잡히는 듯하다네..." );
        }
        CallSmallMenu( 0, 18 )
	
end
@Npc00014	; 무기점
        CheckNation(3); 바이서스면.
        if( yes==1)
        {
                D( " 당신은 바이서스 사람인가? 조심하시게.." )
                goto ENDnation_
        }
        random( 0, 2 )
        if( ran == 0 )
        {
        D( "난 대장장이라오. 요즘은 전쟁중이라 무기를 많이 만들어야 한다네..." );
        }
        if( ran == 1 )
        {
        D( "얼마전까지 대장장이를 하던차라 여러물건을 보실수 있을거요." );
        }
        CallSmallMenu( 0, 18 )
end
@Npc00015	; 목공소
        CheckNation(3); 바이서스면.
        if( yes==1)
        {
                D( " 당신은 바이서스 사람인가? 조심하시게.." )
                goto ENDnation_
        }
        random( 0, 2 )
        if( ran == 0 )
        {
        D( "나무꾼들이 베어온 나무로 무기와 가구, 도구를 만들 수 있습니다." );
        }
        if( ran == 1 )
        {
        D( "나무는 어딜가나 흔하기 때문에 굶어 죽을이는 없을꺼요. Cutting 기술을 배우는 것은 어떻소?")
        }
        CallSmallMenu( 0, 26 ); 목공소
end
@Npc00016	; 활제작소
        CheckNation(3); 바이서스면.
        if( yes==1)
        {
                D( " 당신은 바이서스 사람인가? 조심하시게.." )
                goto ENDnation_
        }
        random( 0, 2 )
        if( ran == 0 )
        {
        D( "활을 쏘기 위해서는 굉장한 민첩성과 정신력이 필요하지." );
        }
        if( ran == 1 )
        {
        D( "활을 잘다루는 사람은 10명의 전사를 만나도 두렵지 않을껄..." );
        }
        CallSmallMenu( 0, 27 )
end
@Npc00017	; 푸줏간
        CheckNation(3); 바이서스면.
        if( yes==1)
        {
                D( " 당신은 바이서스 사람인가? 조심하시게.." )
                goto ENDnation_
        }
        random( 0, 2 )
        if( ran == 0 )
        {
        D( "사람이 곡식과 야채만을 먹고 살 수 있을까? 고기도 먹어야 한다네." );
        }
        if( ran == 1 )
        {
        D( "소는 죽어서 고기와 가죽을 남기고, 양은 살아서 털을 남긴다네." );
        }
        CallSmallMenu( 0, 22 )
end
@Npc00018	; 의류점
        CheckNation(3); 바이서스면.
        if( yes==1)
        {
                D( " 당신은 바이서스 사람인가? 조심하시게.." )
                goto ENDnation_
        }
        random( 0, 3 )
        if( ran == 0 )
        {
        D("옷감의 재료를 구하려 왔나.")
        }       
        if( ran == 1)
        {
        D( "자자, 다들 좋은 옷을 골라 보게, 우리 집에선 좋은 천만 쓴다네." )
        }       
        if( ran == 2 )
        {
        D( "옷을 입지 않고 다니는 사람들은 미개인 같지 않나? " );
        }
        CallSmallMenu( 0, 24 )
end
@Npc00019	; 점성술사
        CheckNation(3); 바이서스면.
        if( yes==1)
        {
                D( " 당신은 바이서스 사람인가? 조심하시게.." )
                goto ENDnation_
        }
        random( 0, 3 );
        if( ran == 0 )
        {
        D( "세상에는 보이지 않는 힘이 존재하는데 이를 마나라고 부르지...  " );
        }
        if( ran == 1 )
        {
        D("마법사의 마법을 배울수 있는 사람은 여기서 마법을 배워야 한다오.")
        }
        if( ran == 2 )
        {
        D("당신은 마법사의 자질이 보이는 군요...")
        }
        CallSmallMenu( 0, 71 )
end

@Npc00020	; 약초점
        CheckNation(3); 바이서스면.
        if( yes==1)
        {
                D( " 당신은 바이서스 사람인가? 조심하시게.." )
                goto ENDnation_
        }
	random( 0, 2 )
        if( ran == 0 )
        {
       	D( "약초는 마을 외부에서 찾아볼 수 있다네... " );
        }
        if( ran == 1 )
        {
        D( "약초는 그 자체로서도 신비한 능력을 지녔지만 포션을 만드는 재료가 됩니다. " );
        }
	CallSmallMenu( 0, 21 )
end
@Npc00021	; 연금술사
        CheckNation(3); 바이서스면.
        if( yes==1)
        {
                D( " 당신은 바이서스 사람인가? 조심하시게.." )
                goto ENDnation_
        }
        random( 0, 3 )
        if(ran == 0)
        {
        D("할 말 있으면 빨리 하게. 지금 철을 금으로 만드는 방법을 구상중이야..")
        }
        if(ran == 1)
        {
        D(" 포션의 재료는 약초라구. 약초만 있으면 포션을 얼마든지 만들수 있지.")
        }
        if(ran == 2)
        {
        D("후세사람들에게 말해주게. 세상은 4가지 원소로 이루어져 있지...")
        }       
        CallSmallMenu( 0, 25 ) ; 연금술소
end
@Npc00022	; 초쟁이
        CheckNation(3); 바이서스면.
        if( yes==1)
        {
                D( " 당신은 바이서스 사람인가? 조심하시게.." )
                goto ENDnation_
        }
	random( 0, 2 )
        if( ran == 0 )
        {
        D( " 전쟁때문에, 양초가 모자랄 지경이야... " );
        }
        if( ran == 1 )
        {
        D( " 마을 외부로 나가면 던젼이 있는데 그곳에선 양초가 제몫을 하죠.")  
        }
        CallSmallMenu( 0, 23 )
end
@Npc00023	; 낚시점
        CheckNation(3); 바이서스면.
        if( yes==1)
        {
                D( " 당신은 바이서스 사람인가? 조심하시게.." )
                goto ENDnation_
        }
	random( 0, 2 )
        if( ran == 0 )
        {
        D( "원래 이맘때쯤이면 이 근처에 물고기들이 몰려든다네..." );
        }
        if( ran == 1 )
        {
        D( "여기에 앉아서 세월을 낚는 것도 좋지..." );
        }
        CallSmallMenu( 0, 28 ); 조선소
end
@Npc00024	
        CheckNation(3); 바이서스면.
        if( yes==1)
        {
                D( " 당신은 바이서스 사람인가? 조심하시게.." )
                goto ENDnation_
        }
        if( ran == 0 )
        {
        D( "이 곳에서는 다른 상점에서는 팔지 않는 물건을 판다네..." );
        }
        if( ran == 1 )
        {
	D( "자 골라 보세요 없는게 없습니다. 다른데서 못 찾은 건 여기서 고르세요." )
        }
        CallSmallMenu( 0, 60 ) ; 상점
end
@Npc00025	; 에델브로이 신전
	random( 0 , 3 )
        if( ran == 0 )
        {
        D( "코스모스와 대폭풍의 에델브로이 신전입니다. " );
        }
        if( ran == 1 )
        {
        D( "죽은자에게 부활의 권능을 행할수 있는 곳입니다." );
        }
        if( ran == 2 )
        {
        D( "코스모스와 대폭풍의 에델브로이 이름으로 ." );
        }
        CallSmallMenu( 0, 73 )
end
@Npc00026	; 테페리 신전
        random( 0 , 2 )
        if( ran == 0 )
        {
        D( "필요한 때를 위한 작은 행운을..." );
        }
        if( ran == 1 )
        {
        D( "갈림길과 호비트의 테페리 신전입니다.." );
        }
        CallSmallMenu( 0, 74 )
end
@Npc00027
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
@Npc00034	; 잡화점
        CheckNation(3); 바이서스면.
        if( yes==1)
        {
                D( " 당신은 바이서스 사람인가? 조심하시게.." )
                goto ENDnation_
        }
        random( 0 , 2 )
        if( ran == 0 )
        {
        D( "이 곳에서는 다른 상점에서는 팔지 않는 물건을 판다네..." );
        }
        if( ran == 1 )
        {
        D( "뭐 필요한 거 없수? 잡동사니들은 여기 다 있는데.." );
        }
        CallSmallMenu( 0, 60 )
end
@Npc00035	; 아저씨	
end
@Npc00036	; 마을여자애
end
@Npc00037	; 마을남자애
end
@Npc00038	; 뚱뚱한 아줌마
end
@Npc00039	; 감옥 간수
        CheckNation(3); 바이서스면.
        if( yes==1)
        {
                D( " 당신은 바이서스 사람인가? 조심하시게.." )
                goto ENDnation_
        }
        random( 0 , 2 )
        if( ran == 0 )
        {
        D( "당신은 이 곳에 무슨 볼일이 있나? " );
        }
        if( ran == 1 )
        {
        D( "이 곳에서는 한번 갇히면 절대 빠져나갈 수 없다네..." );
        }
end
@Npc00040	; 마굿간 주인
        CheckNation(3); 바이서스면.
        if( yes==1)
        {
                D( " 당신은 바이서스 사람인가? 조심하시게.." )
                goto ENDnation_
        }
end
@Npc00041	; 게덴 신전
        CheckNation(3); 바이서스면.
        if( yes==1)
        {
                D( " 당신은 바이서스 사람인가? 조심하시게.." )
                goto ENDnation_
        }
:ENDnation_
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
@Event00001	; 대사막
	MapMove( "b_desert", 710,712 )
	if( yes == 1)
	{
		EventMsg("대사막으로 이동합니다.")
		SendSound(0,2061)
	}
	else
	{
		EventMsg("맵 이동에 실패했습니다.")
	}
end
@Event00002	; 디프유벤
	IsLevel(41)		; 41레벨 제한
	if( yes == 1)
	{
		MapMove( "dep", 15,254 )
		if( yes == 1)
		{
			EventMsg("디프유벤으로 이동합니다.")
			SendSound(0,2061)
		}
		else
		{
			EventMsg("맵 이동에 실패했습니다.")
		}
	}
	else
	{
		EventMsg("이곳은 자이펀의 수도 디프유벤입니다. 디프유벤은 Lv. 41부터 들어갈 수 있습니다.")
		SendSound(0,2061)
	}
:END13_

end
@Event00003
;; 지하던전
	MapMove( "antsdun1", 104,7 )
	if( yes == 1 )
	{
		EventMsg("<지하던전>으로 이동합니다.")
	}
	else
	{
		EventMsg("맵 이동에 실패했습니다.")
	}
end
@Event00004	; out_portal (to 4, Act2_1)
	CmpQuestNumStep( 71, 15 )
	if(yes==1)
	{
		QuestTeleport(1,8,366)
		EventMsg("황혼의 펜턴트를 꼭 얻으시기 바랍니다.")
	}
	else
	{
		EventMsg("이 곳은 은거한 영웅의 이야기(Quest)를 들은 사람만이 들어올 수 있습니다.")
	}
end
@Event00005	; in_portal (to 5, Act2_2)
	QuestTeleport(1,175,579)
end
@Event00006		
end
@Event00007	; 엠포리아 하우스
	IsMyGuildHouse(7)
	if(yes == 1)
	{
		EventMsg(" 환영합니다. 이 곳은  길드 엠포리아 입니다...")
		goto ENDemp09_
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
@Event00012	; 엠포리아 하우스
	IsMyGuildHouse(12)
	if(yes == 1)
	{
		EventMsg(" 환영합니다. 이 곳은  길드 엠포리아 입니다...")
		goto ENDemp12_
	}
	else
	{
		EventMsg("이 곳은  길드의 엠포리아입니다.  길드원만이 들어갈 수 있습니다.")
		SendSound(0,0161)
		goto ENDemp12_
	}
:ENDemp12_

end
@Event00013	; 엠포리아 하우스
	IsMyGuildHouse(13)
	if(yes == 1)
	{
		EventMsg(" 환영합니다. 이 곳은  길드 엠포리아 입니다...")
		goto ENDemp13_
	}
	else
	{
		EventMsg("이 곳은  길드의 엠포리아입니다.  길드원만이 들어갈 수 있습니다.")
		SendSound(0,0161)
		goto ENDemp13_
	}
:ENDemp13_

end

@Event00014	

end
@Event00015	; 엠포리아 하우스
	IsMyGuildHouse(15)
	if(yes == 1)
	{
		EventMsg(" 환영합니다. 이 곳은  길드 엠포리아 입니다...")
		goto ENDemp15_
	}
	else
	{
		EventMsg("이 곳은  길드의 엠포리아입니다.  길드원만이 들어갈 수 있습니다.")
		SendSound(0,0161)
		goto ENDemp15_
	}
:ENDemp15_

end

@Event00016	; 엠포리아 하우스
	IsMyGuildHouse(16)
	if(yes == 1)
	{
		EventMsg(" 환영합니다. 이 곳은  길드 엠포리아 입니다...")
		goto ENDemp16_
	}
	else
	{
		EventMsg("이 곳은  길드의 엠포리아입니다.  길드원만이 들어갈 수 있습니다.")
		SendSound(0,0161)
		goto ENDemp16_
	}
:ENDemp16_

end
@Event00017	; 엠포리아 하우스
	IsMyGuildHouse(17)
	if(yes == 1)
	{
		EventMsg(" 환영합니다. 이 곳은  길드 엠포리아 입니다...")
		goto ENDemp17_
	}
	else
	{
		EventMsg("이 곳은  길드의 엠포리아입니다.  길드원만이 들어갈 수 있습니다.")
		SendSound(0,0161)
		goto ENDemp17_
	}
:ENDemp17_

end
@Event00018	
end
@Event00019	
end








