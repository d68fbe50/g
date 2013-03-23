
@sys00	; 처음 서버 Setting하는 함수.

	MaxNPC( 50 )
	
	MapName( "sermenys_d1" )
	
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
;SQuest93_Npc00021
CmpQuestNumStep( 93, 35 )
if( yes==1 ){
	D("나는 세르메니스 던전에서 최고의 연금술을 연구하고 있는 '마그나시안'이오.")
	SetQuestNumStep( 93, 40 )
	goto End_QuestNpc00021 
}

CmpQuestNumStep( 93, 40 )
if( yes==1 ){
	D("나는 그 동안 수많은 반복과 연구 끝에 익스트림 스톤을 만들 수 있는 재료를 알아냈소.")
	SetQuestNumStep( 93, 45 )
	goto End_QuestNpc00021 
}

CmpQuestNumStep( 93, 45 )
if( yes==1 ){
	D("하지만 너무 오랜 시간이 걸렸기 때문에")
	SetQuestNumStep( 93, 50 )
	goto End_QuestNpc00021 
}

CmpQuestNumStep( 93, 50 )
if( yes==1 ){
	D("그 재료들을 모아 익스트림 스톤을 만드는 방법까지는 알아내지 못했소.")
	SetQuestNumStep( 93, 55 )
	goto End_QuestNpc00021 
}

CmpQuestNumStep( 93, 55 )
if( yes==1 ){
	D("나와 동문수학한 '마그나슈'는 그 방법에 대해서 알아내기 위해")
	SetQuestNumStep( 93, 60 )
	goto End_QuestNpc00021 
}

CmpQuestNumStep( 93, 60 )
if( yes==1 ){
	D("노던바넨에서 연구중인데 아마 지금은 정리를 하지 않았나 싶소.")
	SetQuestNumStep( 93, 65 )
	goto End_QuestNpc00021 
}

CmpQuestNumStep( 93, 65 )
if( yes==1 ){
	D("그대가 만일 익스트림 스톤을 얻고 싶다면 내가 말하는 재료를 가져 오시기 바랍니다.")
	SetQuestNumStep( 93, 70 )
	goto End_QuestNpc00021 
}

CmpQuestNumStep( 93, 70 )
if( yes==1 ){
	D("사드오닉스5개, 축복의잎사귀10개, 별의문장 1개가 필요합니다.")
	SetQuestNumStep( 93, 75 )
	goto End_QuestNpc00021 
}

CmpQuestNumStep( 93, 75 )
if( yes==1 ){
	CheckItemMulti(1046,   5)
	if(yes == 1){
	CheckItemMulti(1047,   10)
	if(yes == 1){
	CheckItemMulti(9089,   1)
	if(yes == 1){
	EventMsg("재료를 보여줬습니다.")
	SetQuestNumStep( 93, 80 )
	goto End_QuestNpc00021 
}
	else{
	D("사드오닉스5개, 축복의잎사귀10개, 별의문장 1개가 필요합니다.")
	EventMsg("...")		;Stay75
	SetQuestNumStep( 93, 75 )
	goto End_QuestNpc00021 
}
}
	else{
	D("사드오닉스5개, 축복의잎사귀10개, 별의문장 1개가 필요합니다.")
	EventMsg("...")		;Stay75
	SetQuestNumStep( 93, 75 )
	goto End_QuestNpc00021 
}
}
	else{
	D("사드오닉스5개, 축복의잎사귀10개, 별의문장 1개가 필요합니다.")
	EventMsg("...")		;Stay75
	SetQuestNumStep( 93, 75 )
	goto End_QuestNpc00021 
}
}

CmpQuestNumStep( 93, 80 )
if( yes==1 ){
	D("그 재료를 가지고 '마그나슈'를 찾아가시기 바랍니다.")
	SetQuestNumStep( 93, 85 )
	goto End_QuestNpc00021 
}

;EQuest93_Npc00021
:End_QuestNpc00021
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
end
@Event00003
end
@Event00004
end
@Event00005
;SQuest76_Event00005
CheckQuestMode()
if( yes==1 ){
CmpQuestNumStep(76,180)
if( yes==1 ){
	ScriptCounter(25,0,40,2)
	if(yes == 1){
	SetQuestNumStep(76,185)
	EventMsg("다음 지역으로 이동합니다.")
	ScriptTimer(0,"0",0,0)
	MapMove("sermenys_d2", 21, 11)
	LogForScript(76,"세르메니스 던전 1층 2번방 출구")
	SetQuestNumStep(76,185)
	goto End_QuestEvent00005 
}
	else{
	EventMsg("20분 동안 헬하운드 40마리를 죽이셔야 합니다.")
	EventMsg("...")		;Stay180
	SetQuestNumStep(76,180)
	goto End_QuestEvent00005 
}
}
CmpQuestNumStep(76,270)
if( yes==1 ){
	ScriptCounter(125,  0,40,  2)
	if(yes == 1){
	IsInvHavePC(10230)
	if(yes == 1){
	SetQuestNumStep(76,275)
	EventMsg("다음 지역으로 이동합니다.")
	SetItemInvPC(10230, 0, 0)
	ScriptTimer(0,"0",0,0)
	MapMove("sermenys_d2", 21, 11)
	LogForScript(76,"세르메니스 던전 1층 4번방 출구_망각의 뼈 사라짐")
	SetQuestNumStep(76,275)
	goto End_QuestEvent00005 
}
	else{
	MessageBox("'망각의뼈'가 필요합니다. 망각의뼈를 잃어버린 경우 다시 세르메니스 던전에 들어온 후 노던바넨 마을 광장에 있는 '빌모어'에게 가시면 됩니다.")
	EventMsg("...")		;Stay270
	SetQuestNumStep(76,270)
	goto End_QuestEvent00005 
}
}
	else{
	EventMsg("20분 동안 헬하운드 40마리를 죽이셔야 합니다.")
	EventMsg("...")		;Stay270
	SetQuestNumStep(76,270)
	goto End_QuestEvent00005 
}
}

}else{;EQuest76_Event00005
}:End_QuestEvent00005
end
@Event00006
;SQuest76_Event00006
CheckQuestMode()
if( yes==1 ){
CmpQuestNumStep(76,260)
if( yes==1 ){
	ScriptCounter(125,0,30,2)
	if(yes == 1){
	QuestTeleport(1, 60, 331)
	EventMsg("다음 지역으로 이동합니다.")
	ScriptTimer(0,"0",0,0)
	LogForScript(76,"세르메니스 던전 1층 3번방 출구")
	SetQuestNumStep(76,265)
	goto End_QuestEvent00006 
}
	else{
	EventMsg("20분 동안 인첸트 헬하운드 30마리를 죽이셔야 합니다.")
	EventMsg("...")		;Stay260
	SetQuestNumStep(76,260)
	goto End_QuestEvent00006 
}
}

}else{;EQuest76_Event00006
}:End_QuestEvent00006
end
@Event00007
;SQuest76_Event00007
CheckQuestMode()
if( yes==1 ){
CmpQuestNumStep(76,170)
if( yes==1 ){
	ScriptCounter(25,0,20,2)
	if(yes == 1){
	QuestTeleport(1, 400, 264)
	EventMsg("다음 지역으로 이동합니다.")
	ScriptTimer(0,"0",0,0)
	LogForScript(76,"세르메니스 던전 1층 1번방 출구")
	SetQuestNumStep(76,175)
	goto End_QuestEvent00007 
}
	else{
	EventMsg("20분 동안 헬하운드 20마리를 죽이셔야 합니다.")
	EventMsg("...")		;Stay170
	SetQuestNumStep(76,170)
	goto End_QuestEvent00007 
}
}

}else{;EQuest76_Event00007
}:End_QuestEvent00007
end
@Event00008		
;SQuest76_Event00008
CheckQuestMode()
if( yes==1 ){
CmpQuestNumStep(76,255)
if( yes==1 ){
	MessageBox("어리석은 자여, 나의 땅을 딛는 순간 죽음의 그림자가 너를 인도할 것이다. 나를 만나기 위해서는 시간에 쫓기어 나의 행렬을 뚫어 보거라.")
	ScriptTimer(1200,"northern_w",262,88)
	ScriptCounter(125,0,30,1)
	EventMsg("20분 동안 인첸트 헬하운드 30마리를 죽이셔야 합니다.")
	LogForScript(76,"웨스트 바넨-세르메니스 던전 1층 3번방 입구")
	SetQuestNumStep(76,260)
	goto End_QuestEvent00008 
}

}else{;EQuest76_Event00008
}:End_QuestEvent00008
end
@Event00009		
end
@Event00010		
;SQuest76_Event00010
CheckQuestMode()
if( yes==1 ){
CmpQuestNumStep(76,265)
if( yes==1 ){
	MessageBox("어리석은 자여, 나의 땅을 딛는 순간 죽음의 그림자가 너를 인도할 것이다. 나를 만나기 위해서는 시간에 쫓기어 나의 행렬을 뚫어 보거라.")
	ScriptTimer(1200,"northern_w",262,88)
	ScriptCounter(125,0,40,1)
	EventMsg("20분 동안 인첸트 헬하운드 40마리를 죽이셔야 합니다.")
	LogForScript(76,"세르메니스 던전 1층 4번방 입구")
	SetQuestNumStep(76,270)
	goto End_QuestEvent00010 
}

}else{;EQuest76_Event00010
}:End_QuestEvent00010
end
@Event00011		
end
@Event00012		
;SQuest76_Event00012
CheckQuestMode()
if( yes==1 ){
CmpQuestNumStep(76,165)
if( yes==1 ){
	MessageBox("어리석은 자여, 나의 땅을 딛는 순간 죽음의 그림자가 너를 인도할 것이다. 나를 만나기 위해서는 시간에 쫓기어 나의 행렬을 뚫어 보거라.")
	ScriptTimer(1200,"northern_w",262,88)
	ScriptCounter(25,0,20,1)
	EventMsg("20분 동안 헬하운드 20마리를 죽이셔야 합니다.")
	LogForScript(76,"이스턴 바넨-세르메니스 1층 1번방 입구")
	SetQuestNumStep(76,170)
	goto End_QuestEvent00012 
}

}else{;EQuest76_Event00012
}:End_QuestEvent00012
end
@Event00013		
end
@Event00014
;SQuest76_Event00014
CheckQuestMode()
if( yes==1 ){
CmpQuestNumStep(76,175)
if( yes==1 ){
	MessageBox("어리석은 자여, 나의 땅을 딛는 순간 죽음의 그림자가 너를 인도할 것이다. 나를 만나기 위해서는 시간에 쫓기어 나의 행렬을 뚫어 보거라.")
	ScriptTimer(1200,"northern_w",262,88)
	ScriptCounter(25,0,40,1)
	EventMsg("20분 동안 헬하운드 40마리를 죽이셔야 합니다.")
	LogForScript(76,"세르메니스 던전 1층 2번방 입구")
	SetQuestNumStep(76,180)
	goto End_QuestEvent00014 
}

}else{;EQuest76_Event00014
}:End_QuestEvent00014
end
@Event00015
CmpQuestNumStep(76,165)
if(yes == 2){
	CmpQuestNumStep(76,190)
	if(yes == 0){
		MessageBox("과거에 시나리오 진행에 실패해 Part I 부터 다시 시작하셔야 합니다. 이스턴 바넨을 통해 세르메니스 던전에 다시 들어오시기 바랍니다.")
		SetQuestNumStep(76,165)
		}
	}
CmpQuestNumStep(76,255)
if(yes == 2){
	CmpQuestNumStep(76,275)
	if(yes == 0){
		MessageBox("과거에 시나리오 진행에 실패해 Part III 부터 다시 시작하셔야 합니다. 웨스턴 바넨을 통해 세르메니스 던전에 다시 들어오시기 바랍니다.")
		SetQuestNumStep(76,255)
		}
	}
CmpQuestNumStep(76,270)
if(yes == 2){
	CmpQuestNumStep(76,310)
	if(yes == 0){
		MessageBox("과거에 시나리오 진행에 실패해 Part II 부터 다시 시작하셔야 합니다. 노던 바넨 마을 광장에 있는 빌모어를 다시 찾아가시기 바랍니다.")
		SetQuestNumStep(76,  190)
		}
	}
end
@Event00016	
end
@Event00017	
end
@Event00018	
end
@Event00019	
end








