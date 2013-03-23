
@sys00	; 처음 서버 Setting하는 함수.

	MaxNPC( 50 )
	
	MapName( "training" )
	
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
	IsClassPC(0)	;전사
	if(yes==1)
	{
		EventMsg("전사 전용 택틱 수련장에 오셨습니다.")
		goto Event0099_
	}
	else
	{
		QuestTeleport(1,153,153)
		EventMsg("전사만 이용할 수 있는 택틱 수련장입니다. 다른 수련장을 이용하시기 바랍니다.")
		goto Event0099_
	}
:Event0099_

end
@Event00001
	IsClassPC(1)	;도둑
	if(yes==1)
	{
		EventMsg("도둑, 궁수 전용 택틱 수련장에 오셨습니다.")
		goto Event0199_
	}
	IsClassPC(2)	;궁수
	if(yes==1)
	{
		EventMsg("도둑, 궁수 전용 택틱 수련장에 오셨습니다")
		goto Event0199_
	}
	else
	{
		QuestTeleport(1,218,137)
		EventMsg("도둑, 궁수만 이용할 수 있는 택틱 수련장입니다. 다른 수련장을 이용하시기 바랍니다.")
		goto Event0199_
	}
:Event0199_

end
@Event00002		
	IsClassPC(3)	;마법사
	if(yes==1)
	{
		EventMsg("마법사, 성직자 전용 택틱 수련장에 오셨습니다.")
		goto Event0299_
	}
	IsClassPC(4)	;성직자
	if(yes==1)
	{
		EventMsg("마법사, 성직자 전용 택틱 수련장에 오셨습니다")
		goto Event0299_
	}
	else
	{
		QuestTeleport(1,149,209)
		EventMsg("마법사, 성직자만 이용할 수 있는 택틱 수련장입니다. 다른 수련장을 이용하시기 바랍니다.")
		goto Event0299_
	}
:Event0299_

end
@Event00003		
	EventMsg("모든 클래스가 이용할 수 있는 택틱 수련장에 오셨습니다.")
end
@Event00004		
	MapMove( "Ma-in", 245, 115 )
	if( yes == 1)
	{
		EventMsg("헬턴트 마을 광장으로 이동합니다.")
		goto Event0499_		
	}
	else
	{
		EventMsg("맵 이동에 실패했습니다.")
		goto Event0499_
	}
:Event0499_

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








