
@sys00	; 처음 서버 Setting하는 함수.

	MaxNPC( 50 )
	
	MapName( "Jolran" )
	
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
@Npc00005	; 은행
        CheckNation(3); 바이서스면.
        if( yes==1)
        {
                D( " 당신은 바이서스인? 조심하시게.." )
                goto ENDnation_
        }
	D( "어서 오세요. 이곳은 자이펀 졸란 은행입니다. 예금,출금,대출 업무가 가능하죠 " );
        CallSmallMenu( 0, 13 )
end
@Npc00006	; 주점
        CheckNation(3); 바이서스면.
        if( yes==1)
        {
	        D( " 당신은 바이서스인? 조심하시게.." )
                goto ENDnation_
        }
	D( "어서 오시게나. 진귀한 술을 많이 구비해두었네.. 자~ 마시게나 " );
        CallSmallMenu( 0, 57 )
end
@Npc00007	; 선원조합건물
	random( 0, 2 )
	if( ran == 0 )
	{
		D( "이 곳은 바다로 나가는 선원들의 이익을 보호하기 위한 곳입니다.." );
	}
	if( ran == 1 )
	{
		D( "안녕하세요... 자이펀 선원 조합입니다.. " );
	}
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
@Npc00013	; 대장간
        CheckNation(3); 바이서스면.
        if( yes==1)
        {
                D( " 헉.. 당신이 어떻게 여기까지..." )
                goto ENDnation_
        }
        random( 0, 2 )
        if( ran == 0 )
        {
        D( "난 대장장이라오. 철을 어디에서 수입하는지는 잘은 모르겠지만, 재료가 많이 부족하다네.." );
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
                D( " 당신은 바이서스인? 조심하시게.." )
                goto ENDnation_
        }
        random( 0, 2 )
        if( ran == 0 )
        {
        D( "무기가 많이 팔리지가 않는구먼... 자네는 어떤 무기를 원하는가?" );
        }
        if( ran == 1 )
        {
        D( "요즘은 물건이 별로 신통치 않아..." );
        }
        CallSmallMenu( 0, 18 )
end
@Npc00015	; 목공소
        CheckNation(3); 바이서스면.
        if( yes==1)
        {
                D( " 당신은 바이서스인? 조심하시게.." )
                goto ENDnation_
        }
        random( 0, 2 )
        if( ran == 0 )
        {
        D( "나무꾼들이 베어온 나무로 무기와 가구, 도구를 만들 수 있습니다." );
        }
        if( ran == 1 )
        {
        D( "이 옆으로 돌아가면, 울창한 숲이 있는데... 거기에서 나무를 베도록하시오...")
        }
        CallSmallMenu( 0, 26 ); 목공소
end
@Npc00016	; 활제작소
        CheckNation(3); 바이서스면.
        if( yes==1)
        {
                D( " 당신은 바이서스인? 조심하시게.." )
                goto ENDnation_
        }
        random( 0, 2 )
        if( ran == 0 )
        {
        D( "활을 쏘기 위해서는 굉장한 민첩성과 정신력이 필요하지." );
        }
        if( ran == 1 )
        {
        D( "활을 잘 다루는 사람은 10명의 전사를 만나도 두렵지 않을껄..." );
        }
        CallSmallMenu( 0, 27 )
end
@Npc00017	
end
@Npc00018   
end
@Npc00019	; 점성술사
        CheckNation(3); 바이서스면.
        if( yes==1)
        {
                D( " 당신은 바이서스인? 조심하시게.." )
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
                D( " 당신은 바이서스인? 조심하시게.." )
                goto ENDnation_
        }
	random( 0, 3 )
        if( ran == 0 )
	{
	        D( "이곳에서 나는 약초는 신비한 힘을 가지고 있소.. " );
        }
        if( ran == 1 )
        {
        	D( "약초는 마을 외부에서 찾아볼 수 있다네... " );
        }
        if( ran == 2 )
        {
	        D( "약초는 그 자체로서도 신비한 능력을 지녔지만 포션을 만드는 재료가 됩니다. " );
        }
	CallSmallMenu( 0, 21 )
end
@Npc00021	
end
@Npc00022	
end
@Npc00023	   
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
        CallSmallMenu( 0, 28 );
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
:ENDnation_
end






@Event00000
end


@Event00001	; 디프유벤
	MapMove( "dep", 710, 636 )
	if( yes == 1)
	{
		EventMsg("자이펀의 수도 <디프유벤>으로 이동합니다.")
	}
	else
	{
		EventMsg("맵 이동에 실패하였습니다...")		
	}
end

@Event00002		

end

@Event00003

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
@Event00012	; 엠포리아 캐슬 안
	EventMsg("이동합니다.")
	QuestTeleport(1,341,236)

end
@Event00013	; 엠포리아 캐슬 안
	EventMsg("이동합니다.")
	QuestTeleport(1,290,220)

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








