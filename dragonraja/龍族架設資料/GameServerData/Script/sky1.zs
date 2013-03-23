
@sys00	; 처음 서버 Setting하는 함수.

	MaxNPC( 50 )
	
	MapName( "sky1" )
	
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
;SQuest33_Npc00033
CmpQuestNumStep(33,195)
	if(yes==1){
	D("그건 뭐지?")
	LogForScript(33,"시커의 탑에서 저레벨 퀘스트 드워프 만남")
	SetQuestNumStep(33,200)
	goto End_QuestNpc00033 
}
 
CmpQuestNumStep(33,200)
if( yes==1 ){
	IsInvHavePC(5004)
	if(yes==1){
	D("흐음... 베리의 곡괭이군.")
	SetQuestNumStep(33,205)
	goto End_QuestNpc00033 
}
	else{
	D("눈이 많이 침침해졌군. 잘못 봤어.")		;Stay205
	SetQuestNumStep(33,205)
	goto End_QuestNpc00033 
}
}

CmpQuestNumStep(33,205)
if( yes==1 ){
	DeleteItemMulti(5004,1)
	EventMsg("곡괭이를 건네주었습니다.")
	LogForScript(33,"가지고 있는 곡괭이 건네줌")
	SetQuestNumStep(33,210)
	goto End_QuestNpc00033 
}

CmpQuestNumStep(33,210)
if( yes==1 ){
	D("불쌍한 드워프를 만나 도와줘서 고맙네.")
	SetQuestNumStep(33,215)
	goto End_QuestNpc00033 
}

CmpQuestNumStep(33,215)
if( yes==1 ){
	D("자네라면 이 탑에 도전해 우리 드워프 일족의 원한을 풀어줄 수 있을거야.")
	SetQuestNumStep(33,220)
	goto End_QuestNpc00033 
}

CmpQuestNumStep(33,220)
if( yes==1 ){
	D("우리가 탑을 다 완성하자 서큐버스가 나타나기 시작했어.")
	SetQuestNumStep(33,225)
	goto End_QuestNpc00033 
}

CmpQuestNumStep(33,225)
if( yes==1 ){
	D("결국 탑의 한 구석에 서큐버스들이 둥지를 틀었어.")
	SetQuestNumStep(33,230)
	goto End_QuestNpc00033 
}

CmpQuestNumStep(33,230)
if( yes==1 ){
	D("그리고는 밤낮을 가리지 않고 우리 드워프들을 계속 공격했어.")
	SetQuestNumStep(33,295)
	goto End_QuestNpc00033 
}
CmpQuestNumStep(33,295)
	if(yes==1){
	D("서큐버스를 잡아 우리 드워프들의 원한을 풀어주지 않겠나?")
	SetQuestNumStep(33,300)
	goto End_QuestNpc00033 
}
 
CmpQuestNumStep(33,300)
if( yes==1 ){
	D("서큐버스를 쓰러뜨리고 증거로 이빨을 뽑아와주게.")
	SetQuestNumStep(33,305)
	goto End_QuestNpc00033 
}

CmpQuestNumStep(33,305)
if( yes==1 ){
	D("그러면 자네에게 필요한 무기를 만들어주겠네.")
	SetQuestNumStep(33,310)
	goto End_QuestNpc00033 
}

CmpQuestNumStep(33,310)
if( yes==1 ){
	D("자네에게 카리스 누멘의 가호가 있기를...")
	LogForScript(33,"서큐버스의 이빨 4개 요구")
	SetQuestNumStep(33,315)
	goto End_QuestNpc00033 
}

CmpQuestNumStep(33,315)
if( yes==1 ){
	CheckItemMulti(10246,4)
	if(yes==1){
	D("조금이나마 죽어간 드워프들에게 위로가 되겠군.")
	LogForScript(33,"서큐버스의 이빨 4개 건네줌")	
	DeleteItemMulti(10246,4)
	SetQuestNumStep(33,320)
	goto End_QuestNpc00033 
}
	else{
	D("이걸로는 부족해.")
	D("이빨 4개가 필요하다고 얘기하지 않았나?")		;Stay315
	SetQuestNumStep(33,315)
	goto End_QuestNpc00033 
}
}

CmpQuestNumStep(33,320)
if( yes==1 ){
	D("드워프는 그 놈과 달라 약속을 잘 지키지.")
	SetQuestNumStep(33,325)
	goto End_QuestNpc00033 
}

CmpQuestNumStep(33,325)
if( yes==1 ){
	D("자네에게 도움이 될지 모르겠지만 잘 쓰도록 하게.")
	SetQuestNumStep(33,330)
	goto End_QuestNpc00033 
}

CmpQuestNumStep(33,330)
if( yes==1 ){
	random(0,21)
	if(ran==0){
	D("너를 위해 만든 건틀렛이다. 잘 사용하기 바란다.")
	sSetRareItemInvPc(6430,1,3,3,1)	;;20031117 SetItemInvPC(0,6430,2003)에서 수정
	EventMsg("이스크라 건틀렛을 받았습니다.")
	LogForScript(33,"이스크라 건틀렛 6430 받음")	
	SetQuestNumStep(33,335)
	goto End_QuestNpc00033 
}
	if(ran==1){
	D("너를 위해 만든 한손검이다. 잘 사용하기 바란다.")
	sSetRareItemInvPc(6431,1,3,3,1)	;;20031117 SetItemInvPC(0,6431,2002)에서 수정
	EventMsg("이스크라 슬래시를 받았습니다.")
	LogForScript(33,"이스크라 슬래시 6431 받음")
	SetQuestNumStep(33,335)
	goto End_QuestNpc00033 
}
	if(ran==2){
	D("너를 위해 만든 할이다. 잘 사용하기 바란다.")
	sSetRareItemInvPc(6432,1,3,3,1)	;;20031117 SetItemInvPC(0,6432,2403)에서 수정
	EventMsg("이스크라 보우를 받았습니다.")
	LogForScript(33,"이스크라 보우 6432 받음")
	SetQuestNumStep(33,335)
	goto End_QuestNpc00033 
}
	if(ran==3){
	D("너를 위해 만든 펜싱검이다. 잘 사용하기 바란다.")
	sSetRareItemInvPc(6433,1,3,3,1)	;;20031117 SetItemInvPC(0,6433,2203)에서 수정
	EventMsg("이스크라 펜싱검을 받았습니다.")
	LogForScript(33,"이스크라 펜싱검 6433 받음")
	SetQuestNumStep(33,335)
	goto End_QuestNpc00033 
}
	if(ran==4){
	D("너를 위해 만든 철퇴다. 잘 사용하기 바란다.")
	sSetRareItemInvPc(6434,1,3,3,1)	;;20031117 SetItemInvPC(0,6434,2002)에서 수정
	EventMsg("유피테르 메이스를 받았습니다.")
	LogForScript(33,"유피테르 메이스 6434 받음")
	SetQuestNumStep(33,335)
	goto End_QuestNpc00033 
}
	if(ran==5){
	D("너를 위해 만든 창이다. 잘 사용하기 바란다.")
	sSetRareItemInvPc(6435,1,3,3,1)	;;2003117 SetItemInvPC(0,6435,2002)에서 수정
	EventMsg("프로즌 혼 스피어를 받았습니다.")
	LogForScript(33,"프로즌 혼 스피어 6435 받음")
	SetQuestNumStep(33,335)
	goto End_QuestNpc00033 
}
	if(ran==6){
	D("너를 위해 만든 봉이다. 잘 사용하기 바란다.")
	sSetRareItemInvPc(6436,1,3,3,1)	;;20031117 SetItemInvPC(0,6436,2002)에서 수정
	EventMsg("아다드 스태프를 받았습니다.")
	LogForScript(33,"아다드 스태프 6436 받음")
	SetQuestNumStep(33,335)
	goto End_QuestNpc00033 
}
	if(ran==7){
	D("너를 위해 만든 봉이다. 잘 사용하기 바란다.")
	sSetRareItemInvPc(6437,1,3,3,46)	;;20031117 SetItemInvPC(0,6437,2002)에서 수정
	EventMsg("아다드 완드를 받았습니다.")
	LogForScript(33,"아다드 완드 6437 받음")
	SetQuestNumStep(33,335)
	goto End_QuestNpc00033 
}
	if(ran==8){
	D("너를 위해 만든 비도다. 잘 사용하기 바란다.")
	sSetRareItemInvPc(6438,1,3,3,1)	;;20031117 SetItemInvPC(0,6438,400)에서 수정
	EventMsg("프로스트 나이프를 받았습니다.")
	LogForScript(33,"프로스트 나이프 6438 받음")
	SetQuestNumStep(33,335)
	goto End_QuestNpc00033 
}
	if(ran==9){
	D("너를 위해 만든 양손검이다. 잘 사용하기 바란다.")
	sSetRareItemInvPc(6439,1,3,3,1)	;;20031117 SetItemInvPC(0,6439,2203)에서 수정
	EventMsg("프로스트 더블 슬래시를 받았습니다.")
	LogForScript(33,"프로스트 더블 슬래시 6439 받음")
	SetQuestNumStep(33,335)
	goto End_QuestNpc00033 
}
	if(ran==10){
	D("너를 위해 만든 양손도끼다. 잘 사용하기 바란다.")
	sSetRareItemInvPc(6440,1,3,3,1)	;;20031117 SetItemInvPC(0,6440,2203)에서 수정
	EventMsg("시커 더블 액스를 받았습니다.")
	LogForScript(33,"시커 더블 액스 6440 받음")
	SetQuestNumStep(33,335)
	goto End_QuestNpc00033 
}
	if(ran==11)
	{
	D("부족하지만 너를 위해 준비한 선물이다. 잘 사용하기 바란다.")
	SetItemInvPC(0,1046,1)
	EventMsg("사드오닉스를 받았습니다.")
	LogForScript(33,"사드오닉스 받음")
	SetQuestNumStep(33,335)
	goto End_QuestNpc00033 
	}
	if(ran==12)
	{
	D("부족하지만 너를 위해 준비한 선물이다. 잘 사용하기 바란다.")
	SetItemInvPC(0,10064,1)
	EventMsg("발록의 이빨을 받았습니다.")
	LogForScript(33,"발록의 이빨 받음")	
	SetQuestNumStep(33,335)
	goto End_QuestNpc00033 
	}
	if(ran==13)
	{
	D("부족하지만 너를 위해 준비한 선물이다. 잘 사용하기 바란다.")
	SetItemInvPC(0,1047,1)
	EventMsg("축복받은 잎사귀를 받았습니다.")
	LogForScript(33,"축복받은 잎사귀 받음")	
	SetQuestNumStep(33,335)
	goto End_QuestNpc00033 
	}
	if(ran==14)
	{
	D("부족하지만 너를 위해 준비한 선물이다. 잘 사용하기 바란다.")
	SetItemInvPC(0,1048,1)
	EventMsg("바이서스 원석을 받았습니다.")
	LogForScript(33,"바이서스 원석 받음")	
	SetQuestNumStep(33,335)
	goto End_QuestNpc00033 
	}
	if(ran==15)
	{
	D("부족하지만 너를 위해 준비한 선물이다. 잘 사용하기 바란다.")
	SetItemInvPC(0,1048,1)
	EventMsg("바이서스 원석을 받았습니다.")
	LogForScript(33,"바이서스 원석 받음")		
	SetQuestNumStep(33,335)
	goto End_QuestNpc00033 
	}
	if(ran==16)
	{
	D("부족하지만 너를 위해 준비한 선물이다. 잘 사용하기 바란다.")
	SetItemInvPC(0,1049,1)
	EventMsg("자이펀 원석을 받았습니다.")
	LogForScript(33,"자이펀 원석 받음")		
	SetQuestNumStep(33,335)
	goto End_QuestNpc00033 
	}
	if(ran==17)
	{
	D("부족하지만 너를 위해 준비한 선물이다. 잘 사용하기 바란다.")
	SetItemInvPC(0,1049,1)
	EventMsg("자이펀 원석을 받았습니다.")
	LogForScript(33,"자이펀 원석 받음")
	SetQuestNumStep(33,335)
	goto End_QuestNpc00033 
	}
	if(ran==18)
	{
	D("부족하지만 너를 위해 준비한 선물이다. 잘 사용하기 바란다.")
	SetItemInvPC(0,1050,1)
	EventMsg("일스 원석을 받았습니다.")
	LogForScript(33,"일스 원석 받음")			
	SetQuestNumStep(33,335)
	goto End_QuestNpc00033 
	}
	if(ran==19)
	{
	D("부족하지만 너를 위해 준비한 선물이다. 잘 사용하기 바란다.")
	SetItemInvPC(0,1050,1)
	EventMsg("일스 원석을 받았습니다.")
	LogForScript(33,"일스 원석 받음")			
	SetQuestNumStep(33,335)
	goto End_QuestNpc00033 
	}
	if(ran==20)
	{
	D("부족하지만 너를 위해 준비한 선물이다. 잘 사용하기 바란다.")
	SetItemInvPC(0,10235,2)
	EventMsg("부활절 달걀을 받았습니다.")
	LogForScript(33,"부활절 달걀 받음")
	SetQuestNumStep(33,335)
	goto End_QuestNpc00033 
	}
}

CmpQuestNumStep(33,335)
if( yes==1 ){
	D("마음에 들지 않는다고?")
	SetQuestNumStep(33,340)
	goto End_QuestNpc00033 
}

CmpQuestNumStep(33,340)
if( yes==1 ){
	D("그렇다면 한 번만 더 수고해주게.")
	SetQuestNumStep(33,295)
	goto End_QuestNpc00033 
}

;EQuest33_Npc00033
:End_QuestNpc00033
end
@Npc00034	
end
@Npc00035	
end
@Npc00036	
;SQuest36_Npc00036
CmpQuestNumStep(36,0)
if( yes==1 ){
	D("우스운 얘기 하나 해줄까?")
	LogForScript(36,"고레벨 이펙트 무기 퀘스트 드워프 만남")				
	SetQuestNumStep(36,5)
	goto End_QuestNpc00036 
}

CmpQuestNumStep(36,5)
if( yes==1 ){
	D("저 탑의 문 말이야... 내가 만든 문이야.")
	SetQuestNumStep(36,10)
	goto End_QuestNpc00036 
}

CmpQuestNumStep(36,10)
if( yes==1 ){
	D("마법을 건다는 얘기를 들었지만 드워프의 자존심이 허락하지 않았지.")
	SetQuestNumStep(36,15)
	goto End_QuestNpc00036 
}

CmpQuestNumStep(36,15)
if( yes==1 ){
	D("그래서 나는 내가 가진 모든 재주를 쏟아부어 아무도 들어올 수 없는 문을 만들었어.")
	SetQuestNumStep(36,20)
	goto End_QuestNpc00036 
}

CmpQuestNumStep(36,20)
if( yes==1 ){
	D("그런 내 재주때문에 우리 드워프들은 저 탑에 올라가지 못하고 있어.")
	SetQuestNumStep(36,25)
	goto End_QuestNpc00036 
}
CmpQuestNumStep(36,25)
if( yes==1 ){
	sIsDual()
	if(yes==1){
	D("그래서 나는 내가 만든 문을 부수기 위한 공성 무기를 만들고 있어.")
	SetQuestNumStep(36,30)
	goto End_QuestNpc00036 
}
	else{
	D("이 이상 움직였다간 장의사만 즐거워할거야.")
	D("돌아가.")
	EventMsg("드워프가 당신을 탑 바깥으로 떠밀었습니다.")		;Stay0
	LogForScript(36,"레벨이 낮아 퀘스트에서 거부당함")
	SetQuestNumStep(36,0)
	goto End_QuestNpc00036 
}
}

CmpQuestNumStep(36,30)
if( yes==1 ){
	D("자네라면 나를 도울 수 있을 것 같군.")
	SetQuestNumStep(36,35)
	goto End_QuestNpc00036 
}

CmpQuestNumStep(36,35)
if( yes==1 ){
	D("공성 무기에는 이런 저런 재료가 필요해.")
	SetQuestNumStep(36,40)
	goto End_QuestNpc00036 
}

CmpQuestNumStep(36,40)
if( yes==1 ){
	D("망치와 휴즈액스.")
	SetQuestNumStep(36,45)
	goto End_QuestNpc00036 
}

CmpQuestNumStep(36,45)
if( yes==1 ){
	D("그리고 철괴 20개가 필요해.")
	SetQuestNumStep(36,50)
	goto End_QuestNpc00036 
}
CmpQuestNumStep(36,50)
if( yes==1 ){
	IsInvHavePC(5017)
	if(yes==1){
	IsInvHavePC(6051)
	if(yes==1){
	CheckItemMulti(1007,20)
	if(yes==1){
	D("모든 재료가 다 준비되었군.")
	DeleteItemMulti(5017,1)
	DeleteItemMulti(6051,1)
	DeleteItemMulti(1007,20)
	EventMsg("모아온 재료를 전부 건네 주었습니다.")	
	SetQuestNumStep(36,55)
	goto End_QuestNpc00036 
}
	else{
	D("숫자가 틀리군.")		;Stay45
	SetQuestNumStep(36,45)
	goto End_QuestNpc00036 
}
}
	else{
	D("나는 보통 도끼는 쓰지 않아.")		;Stay45
	SetQuestNumStep(36,45)
	goto End_QuestNpc00036 
}
}
	else{
	D("망치를 빼먹었군.")		;Stay45
	SetQuestNumStep(36,45)
	goto End_QuestNpc00036 
}
}

CmpQuestNumStep(36,55)
if( yes==1 ){
	D("네 도움으로 저 문을 부술 수 있는 거대한 공성 망치를 만들었다.")
	EventMsg("굉음과 함께 문이 부서졌습니다.")
	LogForScript(36,"공성 무기 재료들을 건네줌")
	SetQuestNumStep(36,60)
	goto End_QuestNpc00036 
}

CmpQuestNumStep(36,60)
if( yes==1 ){
	D("나는 절대 그 녀석처럼 배신하지 않겠다.")
	SetQuestNumStep(36,65)
	goto End_QuestNpc00036 
}

CmpQuestNumStep(36,65)
if( yes==1 ){
	D("드워프가 흘린 피의 댓가로 어둠에 물든 자들의 날개를 뜯어와라.")
	SetQuestNumStep(36,70)
	goto End_QuestNpc00036 
}

CmpQuestNumStep(36,70)
if( yes==1 ){
	D("그렇게만 해준다면 나는 너에게 최강의 무기를 만들어주겠다.")
	SetQuestNumStep(36,75)
	goto End_QuestNpc00036 
}

CmpQuestNumStep(36,75)
if( yes==1 ){
	D("가라. 저 문을 뛰어넘어 드워프의 원한을 갚아다오.")
	LogForScript(36,"발록의 날개 6장을 부탁받음")
	SetQuestNumStep(36,80)
	goto End_QuestNpc00036 
}
CmpQuestNumStep(36,80)
if( yes==1 ){
	CheckItemMulti(10245,6)
	if(yes==1){
	D("이 날개를 태워 마지막 담금질을 하겠다.")
	DeleteItemMulti(10245,6)
	SetQuestNumStep(36,85)
	goto End_QuestNpc00036 
}
	else{
	D("이 정도로는 분이 풀리지 않는다.")
	D("어둠에 물든 자들의 날개 수는 6장. 나는 6장 전부를 원한다.")		;Stay85
	SetQuestNumStep(36,80)
	goto End_QuestNpc00036 
}
}

CmpQuestNumStep(36,85)
if( yes==1 ){
	D("부탁한다. 이 무기로 드워프들의 한을 풀어주기 바란다.")
	SetQuestNumStep(36,90)
	goto End_QuestNpc00036 
}

CmpQuestNumStep(36,90)
if( yes==1 ){
	random(0,21)
	if(ran==0){
	D("너를 위해 만든 건틀렛이다. 잘 사용하기 바란다.")
	sSetRareItemInvPc(6441,1,3,3,1)	;;20031117 SetItemInvPC(0,6441,6530)에서 수정
	EventMsg("노바 이스크라 건틀렛을 받았습니다.")
	LogForScript(36,"노바 이스크라 건틀렛 6441 받음")
	SetQuestNumStep(36,95)
	goto End_QuestNpc00036 
}
	if(ran==1){
	D("너를 위해 만든 한손검이다. 잘 사용하기 바란다.")
	sSetRareItemInvPc(6442,1,3,3,1)	;;20031117 SetItemInvPC(0,6442,5937)에서 수정
	EventMsg("아우라 이스크라 스워드를 받았습니다.")
	LogForScript(36,"노바 이스크라 스워드 6442 받음")
	SetQuestNumStep(36,95)
	goto End_QuestNpc00036 
}
	if(ran==2){
	D("너를 위해 만든 할이다. 잘 사용하기 바란다.")
	sSetRareItemInvPc(6443,1,3,3,1)	;;20031117 SetItemInvPC(0,6443,7124)에서 수정
	EventMsg("아우라 이스크라 보우를 받았습니다.")
	LogForScript(36,"아우라 이스크라 보우 6443 받음")
	SetQuestNumStep(36,95)
	goto End_QuestNpc00036 
}
	if(ran==3){
	D("너를 위해 만든 펜싱검이다. 잘 사용하기 바란다.")
	sSetRareItemInvPc(6444,1,3,3,1)	;;20031117 SetItemInvPC(0,6444,6530)에서 수정
	EventMsg("노바 이스크라 스워드를 받았습니다.")
	LogForScript(36,"노바 이스크라 스워드 6444 받음")
	SetQuestNumStep(36,95)
	goto End_QuestNpc00036 
}
	if(ran==4){
	D("너를 위해 만든 철퇴다. 잘 사용하기 바란다.")
	sSetRareItemInvPc(6445,1,3,3,1)	;;20031117 SetItemInvPC(0,6445,5937)에서 수정
	EventMsg("홀리 유피테르 메이스를 받았습니다.")
	LogForScript(36,"홀리 유피테르 메이스 6445 받음")
	SetQuestNumStep(36,95)
	goto End_QuestNpc00036 
}
	if(ran==5){
	D("너를 위해 만든 창이다. 잘 사용하기 바란다.")
	sSetRareItemInvPc(6446,1,3,3,1)	;;20031117 SetItemInvPC(0,6446,5937)에서 수정
	EventMsg("홀리 혼 스피어를 받았습니다.")
	LogForScript(36,"홀리 혼 스피어 6446 받음")
	SetQuestNumStep(36,95)
	goto End_QuestNpc00036 
}
	if(ran==6){
	D("너를 위해 만든 봉이다. 잘 사용하기 바란다.")
	sSetRareItemInvPc(6447,1,3,3,1)	;;20031117 SetItemInvPC(0,6447,5937)에서 수정
	EventMsg("성 엘모의 성직자 봉을 받았습니다.")
	LogForScript(36,"성 엘모의 성직자 봉 6447 받음")
	SetQuestNumStep(36,95)
	goto End_QuestNpc00036 
}
	if(ran==7){
	D("너를 위해 만든 봉이다. 잘 사용하기 바란다.")
	sSetRareItemInvPc(6448,1,3,3,46)	;;20031117 SetItemInvPC(0,6448,5937)에서 수정
	EventMsg("플뢰헨블리츠 마법사 봉을 받았습니다.")
	LogForScript(36,"플뢰헨블리츠 마법사 봉 6448 받음")
	SetQuestNumStep(36,95)
	goto End_QuestNpc00036 
}
	if(ran==8){
	D("너를 위해 만든 비도다. 잘 사용하기 바란다.")
	sSetRareItemInvPc(6449,1,3,3,1)	;;20031117 SetItemInvPC(0,6449,1187)에서 수정
	EventMsg("폴라 프로스트 나이프를 받았습니다.")
	LogForScript(36,"폴라 프로스트 나이프 6449 받음")
	SetQuestNumStep(36,95)
	goto End_QuestNpc00036 
}
	if(ran==9){
	D("너를 위해 만든 양손검이다. 잘 사용하기 바란다.")
	sSetRareItemInvPc(6450,1,3,3,1)	;;20031117 SetItemInvPC(0,6450,6530)에서 수정
	EventMsg("폴라 프로스트 더블스워드를 받았습니다.")
	LogForScript(36,"폴라 프로스트 더블스워드 6450 받음")
	SetQuestNumStep(36,95)
	goto End_QuestNpc00036 
}
	if(ran==10){
	D("너를 위해 만든 양손도끼다. 잘 사용하기 바란다.")
	sSetRareItemInvPc(6451,1,3,3,1)	;;20031117 SetItemInvPC(0,6451,6530)에서 수정
	EventMsg("노커 더블액스를 받았습니다.")
	LogForScript(36,"노커 더블액스 6451 받음")
	SetQuestNumStep(36,95)
	goto End_QuestNpc00036 
}
	if(ran==11){
	D("부족하지만 너를 위해 준비한 선물이다. 잘 사용하기 바란다.")
	SetItemInvPC(0,1046,1)
	EventMsg("사드오닉스를 받았습니다.")
	LogForScript(36,"사드오닉스 받음")
	SetQuestNumStep(36,95)
	goto End_QuestNpc00036 
}
	if(ran==12)
	{
	D("부족하지만 너를 위해 준비한 선물이다. 잘 사용하기 바란다.")
	SetItemInvPC(0,10064,1)
	EventMsg("발록의 이빨을 받았습니다.")
	LogForScript(36,"발록의 이빨 받음")
	SetQuestNumStep(36,95)
	goto End_QuestNpc00033 
	}
	if(ran==13)
	{
	D("부족하지만 너를 위해 준비한 선물이다. 잘 사용하기 바란다.")
	SetItemInvPC(0,1047,1)
	EventMsg("축복받은 잎사귀를 받았습니다.")
	LogForScript(36,"축복받은 잎사귀 받음")
	SetQuestNumStep(36,95)
	goto End_QuestNpc00033 
	}
	if(ran==14)
	{
	D("부족하지만 너를 위해 준비한 선물이다. 잘 사용하기 바란다.")
	SetItemInvPC(0,1048,1)
	EventMsg("바이서스 원석을 받았습니다.")
	LogForScript(36,"바이서스 원석 받음")
	SetQuestNumStep(36,95)
	goto End_QuestNpc00033 
	}
	if(ran==15)
	{
	D("부족하지만 너를 위해 준비한 선물이다. 잘 사용하기 바란다.")
	SetItemInvPC(0,1048,1)
	EventMsg("바이서스 원석을 받았습니다.")
	LogForScript(36,"바이서스 원석 받음")
	SetQuestNumStep(36,95)
	goto End_QuestNpc00033 
	}
	if(ran==16)
	{
	D("부족하지만 너를 위해 준비한 선물이다. 잘 사용하기 바란다.")
	SetItemInvPC(0,1049,1)
	EventMsg("자이펀 원석을 받았습니다.")
	LogForScript(36,"자이펀 원석 받음")
	SetQuestNumStep(36,95)
	goto End_QuestNpc00033 
	}
	if(ran==17)
	{
	D("부족하지만 너를 위해 준비한 선물이다. 잘 사용하기 바란다.")
	SetItemInvPC(0,1049,1)
	EventMsg("자이펀 원석을 받았습니다.")
	LogForScript(36,"자이펀 원석 받음")
	SetQuestNumStep(36,95)
	goto End_QuestNpc00033 
	}
	if(ran==18)
	{
	D("부족하지만 너를 위해 준비한 선물이다. 잘 사용하기 바란다.")
	SetItemInvPC(0,1050,1)
	EventMsg("일스 원석을 받았습니다.")
	LogForScript(36,"일스 원석 받음")
	SetQuestNumStep(36,95)
	goto End_QuestNpc00033 
	}
	if(ran==19)
	{
	D("부족하지만 너를 위해 준비한 선물이다. 잘 사용하기 바란다.")
	SetItemInvPC(0,1050,1)
	EventMsg("일스 원석을 받았습니다.")
	LogForScript(36,"일스 원석 받음")
	SetQuestNumStep(36,95)
	goto End_QuestNpc00033 
	}
	if(ran==20)
	{
	D("부족하지만 너를 위해 준비한 선물이다. 잘 사용하기 바란다.")
	SetItemInvPC(0,10235,2)
	EventMsg("부활절 달걀을 받았습니다.")
	LogForScript(36,"부활절 달걀 받음")
	SetQuestNumStep(36,95)
	goto End_QuestNpc00033 
	}
}

CmpQuestNumStep(36,95)
if( yes==1 ){
	D("마음에 들지 않는다고?")
	SetQuestNumStep(36,100)
	goto End_QuestNpc00036 
}

CmpQuestNumStep(36,100)
if( yes==1 ){
	D("그렇다면 어둠에 물든 자들의 씨를 말려다오.")
	SetQuestNumStep(36,75)
	goto End_QuestNpc00036 
}

;EQuest36_Npc00036
:End_QuestNpc00036
end
@Npc00037	
end
@Npc00038   
end
@Npc00039	
end

@Npc00040	
;SQuest40_Npc00040
CmpQuestNumStep(40,0)
if( yes==1 ){
	D("인간이 왜 드워프를 돕지?")
	SetQuestNumStep(40,5)
	goto End_QuestNpc00040 
}

CmpQuestNumStep(40,5)
if( yes==1 ){
	D("아니군. 죄많은 인간이 죄많은 드워프와 손을 잡았군.")
	SetQuestNumStep(40,10)
	goto End_QuestNpc00040 
}

CmpQuestNumStep(40,10)
if( yes==1 ){
	D("죄많은 인간이여. 신의 섭리를 받아들이도록 하여라.")
	SetQuestNumStep(40,15)
	goto End_QuestNpc00040 
}

CmpQuestNumStep(40,15)
if( yes==1 ){
	D("이 곳은 진정한 신의 역사가 이루어진 곳!")
	SetQuestNumStep(40,20)
	goto End_QuestNpc00040 
}

CmpQuestNumStep(40,20)
if( yes==1 ){
	D("무엄한 놈! 네가 감히 내 앞에서 신을 이야기한단 말이냐!")
	SetQuestNumStep(40,25)
	goto End_QuestNpc00040 
}

CmpQuestNumStep(40,25)
if( yes==1 ){
	D("그렇다면 직접 네 몸으로 느끼고 반성해라!")
	SetQuestNumStep(40,30)
	goto End_QuestNpc00040 
}
CmpQuestNumStep(40,30)
if( yes==1 ){
	random(0,3)
	if(ran==0){
	D("어둠의 날개 아래에서 죽을 때까지 춤을 추어라.")
	QuestTeleport(1,26,151)	;;20031023좌표 수정 완료
	SetQuestNumStep(40,0)	;;20031023반복 가능케 수정
	goto End_QuestNpc00040 
}
	if(ran==1){
	D("빛이 밝으면 어둠 또한 더욱 짙어지지.")
	QuestTeleport(1,27,152)	;;20031023좌표 수정 완료
	SetQuestNumStep(40,0)	;;20031023반복 가능케 수정
	goto End_QuestNpc00040 
}
	if(ran==2){
	D("어둠의 불꽃은 영혼만 태우지.")
	QuestTeleport(1,28,153)	;;20031023좌표 수정 완료
	SetQuestNumStep(40,0)	;;20031023반복 가능케 수정
	goto End_QuestNpc00040 
}
}

;EQuest40_Npc00040
:End_QuestNpc00040
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





@Event00000	;;사용하지 않음
end
@Event00001	;;이스턴 바넨으로 돌아감
	MapMove("eastern_w",517,508)
		if( yes == 1 )
		{
			EventMsg("<이스턴 바넨>으로 이동합니다.")
		}
		else
		{
			EventMsg("맵 이동에 실패했습니다.")
		}
end
@Event00002	;;2층에서 3층으로 포털
	QuestTeleport(1,40,270)
	if(yes == 1) 
	{
		EventMsg("3층으로 올라갑니다.")
	}
	else 
	{
		EventMsg("이동에 실패했습니다.")
	}
end
@Event00003	;;노커의 탑 보스방에서 6층으로 나가는 포털
	QuestTeleport(1,260,511)
	if(yes == 1) 
	{
		EventMsg("6층으로 내려갑니다.")
	}
	else 
	{
		EventMsg("이동에 실패했습니다.")
	}
end
@Event00004	;;4층에서 3층으로 포털
	QuestTeleport(1,40,270)
	if(yes == 1) 
	{
		EventMsg("3층으로 내려갑니다.")
	}
	else 
	{
		EventMsg("이동에 실패했습니다.")
	}
end
@Event00005	;;3층에서 4층으로 포털
	QuestTeleport(1,398,24)
	if(yes == 1) 
	{
		EventMsg("4층으로 올라갑니다.")
	}
	else 
	{
		EventMsg("이동에 실패했습니다.")
	}
end
@Event00006	;;5층에서 6층으로 포털
	QuestTeleport(1,260,511)
	if(yes == 1) 
	{
		EventMsg("6층으로 올라갑니다.")
	}
	else 
	{
		EventMsg("이동에 실패했습니다.")
	}
end
@Event00007	;;듀얼 여부 체크하여 각 층으로 분기
	sIsDual()
	if(yes==1)
	{
		QuestTeleport(1,167,82)
		if(yes == 1) 
		{
			EventMsg("알 수 없는 곳으로 이동합니다.")
		}
		else 
		{
			EventMsg("이동에 실패했습니다.")
		}
	}		
	else
	{
		QuestTeleport(1,360,171)
		if(yes == 1) 
		{
			EventMsg("7층으로 올라갑니다.")
		}
		else 
		{
			EventMsg("이동에 실패했습니다.")
		}		
	}
end
@Event00008	;;6층에서 5층으로 이동 포털
	QuestTeleport(1,259,382)
	if(yes == 1) 
	{
		EventMsg("5층으로 내려갑니다.")
	}
	else 
	{
		EventMsg("이동에 실패했습니다.")
	}
end
@Event00009	;;3층에서 2층으로 포털
	QuestTeleport(1,26,151)
	if(yes == 1) 
	{
		EventMsg("2층으로 내려갑니다.")
	}
	else 
	{
		EventMsg("이동에 실패했습니다.")
	}
end

@Event00010	;;5층에서 4층으로 이동 포털
	QuestTeleport(1,398,24)
	if(yes == 1) 
	{
		EventMsg("4층으로 내려갑니다.")
	}
	else 
	{
		EventMsg("이동에 실패했습니다.")
	}
end
@Event00011	;;2층에서 1층으로 이동 포털
	QuestTeleport(1,50,73)
	if(yes == 1) 
	{
		EventMsg("1층으로 내려갑니다.")
	}
	else 
	{
		EventMsg("이동에 실패했습니다.")
	}
end
@Event00012	;;노커의 탑 보스방에서 1층으로 나가는 포털
	QuestTeleport(1,50,73)
	if(yes == 1) 
	{
		EventMsg("1층으로 내려갑니다.")
	}
	else 
	{
		EventMsg("이동에 실패했습니다.")
	}
end
@Event00013	;;4층에서 5층으로 이동 포털
	QuestTeleport(1,259,382)
	if(yes == 1)
	{
		EventMsg("5층으로 올라갑니다.")
	}
	else 
	{
		EventMsg("이동에 실패했습니다.")
	}	
end
@Event00014	;;테스트를 위해 일시 기능 정지
	;QuestTeleport(1,259,382)
	;if(yes == 1) 
	;{
	;	EventMsg("6층으로 내려갑니다.")
	;}
	;else 
	;{
	;	EventMsg("이동에 실패했습니다.")
	;}
end
@Event00015	;;노커의 탑에서 시커의 탑으로 올라가는 포털
	MapMove("sky2",212,39)
		if( yes == 1 )
		{
			EventMsg("<시커의 탑>으로 올라갑니다.")
		}
		else
		{
			EventMsg("이동에 실패했습니다.")
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

