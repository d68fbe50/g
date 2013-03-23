
@sys00	; 처음 서버 Setting하는 함수.

	MaxNPC( 50 )
	
	MapName( "sermenys_d2" )
	
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
end
@Event00002
;SQuest76_Event00002
CheckQuestMode()
if( yes==1 ){
CmpQuestNumStep(76,280)
if( yes==1 ){
	ScriptCounter(225,   0,40,   2)
	if(yes == 1){
	QuestTeleport(1, 15, 304)
	EventMsg("다음 지역으로 이동합니다.")
	ScriptTimer(0,"0",0,0)
	LogForScript(76,"세르메니스 던전 2층 1번방 출구")
	SetQuestNumStep(76,285)
	goto End_QuestEvent00002 
}
	else{
	EventMsg("20분 동안 헬하운드 40마리를 죽이셔야 합니다.")
	EventMsg("...")		;Stay280
	SetQuestNumStep(76,280)
	goto End_QuestEvent00002 
}
}

}else{;EQuest76_Event00002
}:End_QuestEvent00002
end
@Event00003
end
@Event00004
;SQuest76_Event00004
CheckQuestMode()
if( yes==1 ){
CmpQuestNumStep(76,290)
if( yes==1 ){
	ScriptCounter(269,0,40,2)
	if(yes == 1){
	QuestTeleport(1, 275, 462)
	EventMsg("다음 지역으로 이동합니다.")
	ScriptTimer(0,"0",0,0)
	LogForScript(76,"세르메니스 던전 2층 2번방 출구")
	SetQuestNumStep(76,295)
	goto End_QuestEvent00004 
}
	else{
	EventMsg("20분 동안 광분 캐론 40마리를 죽이셔야 합니다.")
	EventMsg("...")		;Stay290
	SetQuestNumStep(76,290)
	goto End_QuestEvent00004 
}
}

}else{;EQuest76_Event00004
}:End_QuestEvent00004
end
@Event00005
end
@Event00006
;SQuest76_Event00006
CheckQuestMode()
if(yes==1)
{
	CmpQuestNumStep(76,300)
		if( yes==1 )
		{
			ScriptCounter(268,0,40,2)
				if(yes == 1)
				{
					iFlag=1
					EventMsg("광분 라바 40마리를 모두 죽이셨습니다.")
					ScriptTimer(0,"0",0,0)
					BossTimerCheck(90,500,41,7,1200,300,0)
						if(yes==0)
						{
							EventMsg("현재 다른 유저가 이벤트 진행 중이므로 잠시만 기다려 주시기 바랍니다.")	;Stay300
							SetQuestNumStep(76,300)
							LogForScript(76,"세르메니스 던전 2층 3번방 출구_스틱스 방이 시끄러워 대기중")
							goto End_QuestEvent00006 
						}
						if(yes==1)
						{
							EventMsg("현재 인원이 꽉 찼습니다. 잠시만 기다려 주시기 바랍니다.")	;Stay300
							LogForScript(76,"세르메니스 던전 2층 3번방 출구_스틱스 방이 꽉 차서 대기중")
							SetQuestNumStep(76,300)
							goto End_QuestEvent00006 
						}
						if(yes>0)
						{
							iFlag=0
							QuestTeleport(1,510,137)
							EventMsg("스틱스가 있는 지역으로 이동합니다.")	;Stay305
							ScriptTimer(yes,"northern_w",262,88)	
							LogForScript(76,"세르메니스 던전 2층 3번방 출구_스틱스 방 입장")
							SetQuestNumStep(76,305)
							goto End_QuestEvent00006 
						}
				}
				else
				{
					EventMsg("20분 동안 광분 라바 40마리를 죽이셔야 합니다.")	;Stay300
					SetQuestNumStep(76,300)
					goto End_QuestEvent00006		
				}
			}
		}
else
{
	;EQuest76_Event00006
}:End_QuestEvent00006
end
@Event00007
end
@Event00008
	MapMove("northern_w",262,88)
	if(yes==1) {
	EventMsg("노던 바넨으로 이동합니다.")
	ScriptTimer(0,"0",0,0)
}
	else {
	EventMsg("이동에 실패했습니다.")
}
 
end
@Event00009		
;SQuest76_Event00009
CheckQuestMode()
if( yes==1 ){
CmpQuestNumStep(76,185)
if( yes==1 ){
	MessageBox("기억 혹은 망각을 위해 세르메니스에 서기를 원하는자는 분명 나의 길을 걷게 될 터, 망각의 뼈를 찾아야 할 것이다.")
	EventMsg("노던 바넨 마을로 돌아가 '빌모어'에게 상세한 이야기를 들으시기 바랍니다.")
	LogForScript(76,"세르메니스 던전 2층 망각의 뼈 요구 지점")
	SetQuestNumStep(76,190)
	goto End_QuestEvent00009 
}
CmpQuestNumStep(76,275)
if( yes==1 ){
	MessageBox("어리석은 자여, 나의 땅을 딛는 순간 죽음의 그림자가 너를 인도할 것이다. 나를 만나기 위해서는 시간에 쫓기어 나의 행렬을 뚫어 보거라.")
	ScriptTimer(1200,"northern_w",262,88)
	ScriptCounter(225,0,40,1)
	EventMsg("20분 동안 광분 헬하운드 40마리를 죽이셔야 합니다.")
	LogForScript(76,"세르메니스 던전 2층 1번방 입구")
	SetQuestNumStep(76,280)
	goto End_QuestEvent00009 
}

}else{;EQuest76_Event00009
}:End_QuestEvent00009
end
@Event00010		
end
@Event00011		
;SQuest76_Event00011
CheckQuestMode()
if( yes==1 ){
CmpQuestNumStep(76,285)
if( yes==1 ){
	MessageBox("어리석은 자여, 나의 땅을 딛는 순간 죽음의 그림자가 너를 인도할 것이다. 나를 만나기 위해서는 시간에 쫓기어 나의 행렬을 뚫어 보거라.")
	ScriptTimer(1200,"northern_w",262,88)
	ScriptCounter(269,0,40,1)
	EventMsg("20분 동안 광분 캐론 40마리를 죽이셔야 합니다.")
	LogForScript(76,"세르메니스 던전 2층 2번방 입구")
	SetQuestNumStep(76,290)
	goto End_QuestEvent00011 
}

}else{;EQuest76_Event00011
}:End_QuestEvent00011
end
@Event00012		
end
@Event00013		
;SQuest76_Event00013
CheckQuestMode()
if( yes==1 ){
CmpQuestNumStep(76,295)
if( yes==1 ){
	MessageBox("어리석은 자여, 나의 땅을 딛는 순간 죽음의 그림자가 너를 인도할 것이다. 나를 만나기 위해서는 시간에 쫓기어 나의 행렬을 뚫어 보거라.")
	ScriptTimer(1200,"northern_w",  262,  88)
	ScriptCounter(268,0,40,1)
	EventMsg("20분 동안 광분 라바 40마리를 죽이셔야 합니다.")
	LogForScript(76,"세르메니스 던전 2층 3번방 입구")
	SetQuestNumStep(76,300)
	goto End_QuestEvent00013 
}

}else{;EQuest76_Event00013
}:End_QuestEvent00013
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








