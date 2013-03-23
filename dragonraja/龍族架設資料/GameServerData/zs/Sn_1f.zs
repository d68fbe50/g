
@sys00	; 처음 서버 Setting하는 함수.

	MaxNPC( 50 )
	
	MapName( "Sn_1F" )
	
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
	MapMove( "Sn_2F", 76,7 )
end


@Event00002		
	MapMove( "SN_2F", 67,106 )
end


@Event00003	
	CheckNation(3); 바이서스면.
	if( yes==1)
	{
		IsInvHavePC(10067)
		if(yes == 1)
		{
		IsInvHavePC(10069)
		if(yes == 1)
		{
		IsInvHavePC(10070)
		if(yes == 1)
		{
			SetItemInvPC(10067,0,0)
			SetItemInvPC(10069,0,0)
			SetItemInvPC(10070,0,0)
			MapMove(  "Renes_c", 15,9 )
	        	EventMsg("자이펀 군대가 점령한 레너스시로 들어갑니다...")
		        SendSound(0,2061)
		}
		else
		{
			EventMsg("3종류의 수호석 <자이펀 대지>(보라, 주황, 파랑)가 필요합니다.")
		}
		}
		else
		{
			EventMsg("3종류의 수호석 <자이펀 대지>(보라, 주황, 파랑)가 필요합니다.")
		}
		}
		else
		{
			EventMsg("3종류의 수호석 <자이펀 대지>(보라, 주황, 파랑)가 필요합니다.")
		}
		goto END12_
        }
	MapMove(  "Renes_c", 15,9 )
:END12_
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








