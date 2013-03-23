
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
	CheckNation(4); 자이펀이면.
	if( yes==1)
	{
		IsInvHavePC(10066)
		if(yes == 1)
		{
			SetItemInvPC(10066,0,0)
			MapMove( "hu_vm", 348,189 )
	        	EventMsg("이 곳부터는 바이서스 국왕이 다스리는 영지입니다.")
		        QuestSound(15007)
		}
		else
		{
			EventMsg("바이서스 빛의 수호석(흰색)이 필요합니다.")
		}
		goto END10_
        }
	MapMove( "hu_vm", 348,189 )
;	EventMsg("이 곳부터는 바이서스 국왕이 다스리는 영지입니다.")
;	QuestSound(15007)
:END10_
end

@Event00001
	CheckNation(3); 바이서스면.
	if( yes==1)
	{
		IsInvHavePC(10072)
		if(yes == 1)
		{
			SetItemInvPC(10072,0,0)
			MapMove( "renes_out", 6,183 )
	        	EventMsg("이 곳부터가 자이펀군대가 점령한 지역입니다..")
		        QuestSound(15007)
		}
		else
		{
			EventMsg("자이펀 대지의 수호석(검은색)이 필요합니다.")
		}
		goto END11_
        }		
	MapMove( "renes_out", 6,183 )
;       EventMsg("이 곳부터가 자이펀군대가 점령한 지역입니다..")
;       QuestSound(15007)
:END11_
end

@Event00002	
	CheckNation(4); 자이펀이면.
	if( yes==1)
	{
		IsInvHavePC(10066)
		if(yes == 1)
		{
			SetItemInvPC(10066,0,0)
			MapMove( "Desert2", 323,7 )
	        	EventMsg("이 곳부터는 바이서스 국왕이 다스리는 영지입니다.")
		        QuestSound(15007)
		}
		else
		{
			EventMsg("바이서스 빛의 수호석(흰색)이 필요합니다.")
		}
		goto END12_
        }
	MapMove( "Desert2", 323,7 )
;       EventMsg("이 곳부터는 바이서스 국왕이 다스리는 영지입니다.")
;       QuestSound(15007)
:END12_
end
@Event00003	
	CheckNation(3); 바이서스면.
	if( yes==1)
	{
		IsInvHavePC(10072)
		if(yes == 1)
		{
			SetItemInvPC(10072,0,0)
			MapMove( "Desert", 42, 7 )
	        	EventMsg("이 곳부터가 자이펀군대가 점령한 지역입니다..")
		        QuestSound(15007)
		}
		else
		{
			EventMsg("자이펀 대지의 수호석(검은색)이 필요합니다.")
		}
		goto END13_
        }
	MapMove( "Desert", 42, 7 )
;       EventMsg("이 곳부터는 자이펀군대가 점령한 지역입니다.")
;       QuestSound(15007)
:END13_	
end
@Event00004
	IsLevel(50)		;물던전 50레벨 제한
	if( yes == 1)
	{
		MapMove( "waterdun1", 13, 148 )
	}
	else
	{
		EventMsg("당신의 레벨로 이 곳에 들어가기에는 매우 위험하군요. Lv.50부터 들어갈 수 있습니다.")
		QuestSound(15007)
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








