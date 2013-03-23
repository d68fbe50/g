
@sys00	; 처음 서버 Setting하는 함수.

	MaxNPC( 50 )
	
	MapName( "Western_w" )
	
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
;SQuest88_Npc00021
CmpQuestNumStep( 88, 95 )
if( yes==1 ){
	D("나는 피올라의 넷째 아들.")
	SetQuestNumStep( 88, 100 )
	goto End_QuestNpc00021 
}

CmpQuestNumStep( 88, 100 )
if( yes==1 ){
	D("둘째 형의 생각은 항상 기발하단 말야..")
	SetQuestNumStep( 88, 105 )
	goto End_QuestNpc00021 
}

CmpQuestNumStep( 88, 105 )
if( yes==1 ){
	D("이렇게 간단한 이벤트로 우리 형제가 어떻게 지내는지를 다 알수가 있으니..")
	SetQuestNumStep( 88, 110 )
	goto End_QuestNpc00021 
}

CmpQuestNumStep( 88, 110 )
if( yes==1 ){
	D("아직까지 모두 무사히 지내고 있어 정말 다행이야..")
	SetQuestNumStep( 88, 115 )
	goto End_QuestNpc00021 
}

CmpQuestNumStep( 88, 115 )
if( yes==1 ){
	D("여기까지 온 거 보니 첫째 형만 못 만난 거 같군..")
	SetQuestNumStep( 88, 120 )
	goto End_QuestNpc00021 
}

CmpQuestNumStep( 88, 120 )
if( yes==1 ){
	D("큰 형은 그곳에 한 번 가더니 더이상 돌아올 생각을 안하니..")
	SetQuestNumStep( 88, 125 )
	goto End_QuestNpc00021 
}

CmpQuestNumStep( 88, 125 )
if( yes==1 ){
	D("이스턴 바넨에 가면 폐허지역이 있을 거야.. 그곳에 한번 가보게..")
	SetQuestNumStep( 88, 130 )
	goto End_QuestNpc00021 
}

;EQuest88_Npc00021
:End_QuestNpc00021
end
@Npc00022	
;SQuest89_Npc00022
CmpQuestNumStep(89,90)
if( yes==1 ){
	D("왜 살아야 하는 것일까. 난 그게 궁금한 거야.")
	SetQuestNumStep(89,95)
	goto End_QuestNpc00022 
}

CmpQuestNumStep(89,95)
if( yes==1 ){
	D("어느 날 갑자기 내 삶이 먼지처럼 느껴질 뿐이지.")
	SetQuestNumStep(89,100)
	goto End_QuestNpc00022 
}

CmpQuestNumStep(89,100)
if( yes==1 ){
	D("나는 바보야. 정말 바보지.")
	SetQuestNumStep(89,105)
	goto End_QuestNpc00022 
}

CmpQuestNumStep(89,105)
if( yes==1 ){
	D("난 나의 일부인 나의 감정 조차 내 입으로 표현하지도 못하는 바보야.")
	SetQuestNumStep(89,110)
	goto End_QuestNpc00022 
}

CmpQuestNumStep(89,110)
if( yes==1 ){
	D("그래서 나보다 소중한 사람을 잃고 말았어,")
	SetQuestNumStep(89,115)
	goto End_QuestNpc00022 
}

CmpQuestNumStep(89,115)
if( yes==1 ){
	D("난 이제 살 가치를 찾지 못하겠어.")
	SetQuestNumStep(89,120)
	goto End_QuestNpc00022 
}

CmpQuestNumStep(89,120)
if( yes==1 ){
	D("그래서 이렇게 죽고 싶을 뿐이야.")
	SetQuestNumStep(89,125)
	goto End_QuestNpc00022 
}

CmpQuestNumStep(89,125)
if( yes==1 ){
	D("이 나무에는 내가 그녀를 생각하며 이름을 새기었지.")
	SetQuestNumStep(89,130)
	goto End_QuestNpc00022 
}

CmpQuestNumStep(89,130)
if( yes==1 ){
	D("이 나무의 이름처럼 될 수 있다면......")
	SetQuestNumStep(89,135)
	goto End_QuestNpc00022 
}

CmpQuestNumStep(89,135)
if( yes==1 ){
	D("그런데 나에게 무슨 볼 일인가?")
	SetQuestNumStep(89,140)
	goto End_QuestNpc00022 
}

CmpQuestNumStep(89,140)
if( yes==1 ){
	IsInvHavePC(10231)
	if(yes == 1){
	SetItemInvPC(10231,  0,  0)
	EventMsg("'망각의약'을 건내줬습니다.")
	SetQuestNumStep(89,145)
	goto End_QuestNpc00022 
}
	else{
	D("용건이 없다면 나를 혼자 있게 해주겠나..")
	EventMsg("...")		;Stay140
	SetQuestNumStep(89,140)
	goto End_QuestNpc00022 
}
}

CmpQuestNumStep(89,145)
if( yes==1 ){
	D("이게 무엇이지? 아! 독약인가 보군..")
	SetQuestNumStep(89,150)
	goto End_QuestNpc00022 
}

CmpQuestNumStep(89,150)
if( yes==1 ){
	EventMsg("'망각의약'을 먹는다.")
	SetQuestNumStep(89,155)
	goto End_QuestNpc00022 
}

CmpQuestNumStep(89,155)
if( yes==1 ){
	D("나에게 무슨 볼 일인가?")
	SetQuestNumStep(89,160)
	goto End_QuestNpc00022 
}

CmpQuestNumStep(89,160)
if( yes==1 ){
	D("나에게 부탁할 일이라도 있는 것인가?")
	SetQuestNumStep(89,165)
	goto End_QuestNpc00022 
}

CmpQuestNumStep(89,165)
if( yes==1 ){
	D("아버지께서 걱정하시겠군..")
	SetQuestNumStep(89,170)
	goto End_QuestNpc00022 
}

CmpQuestNumStep(89,170)
if( yes==1 ){
	D("그런데 내가 왜 이 낯선 곳에 온 것이지..")
	SetQuestNumStep(89,175)
	goto End_QuestNpc00022 
}

CmpQuestNumStep(89,175)
if( yes==1 ){
	D("주위를 보아하니 이곳은 웨스트 바넨인데..")
	SetQuestNumStep(89,180)
	goto End_QuestNpc00022 
}

CmpQuestNumStep(89,180)
if( yes==1 ){
	D("이곳은 위험한 곳이니 조심하길 바라네...")
	SetQuestNumStep(89,185)
	goto End_QuestNpc00022 
}

CmpQuestNumStep(89,185)
if( yes==1 ){
	D("그런데 난 방금 전까지 무슨 일을 하려고 했던 것 같은데 영 기억이 안 나는군.")
	SetQuestNumStep(89,190)
	goto End_QuestNpc00022 
}

CmpQuestNumStep(89,190)
if( yes==1 ){
	D("처음 만난 자네에게 이런 걸 물어볼 수 없고 말야..")
	SetQuestNumStep(89,195)
	goto End_QuestNpc00022 
}

CmpQuestNumStep(89,195)
if( yes==1 ){
	D("난 아무래도 그 일을 생각해낼 때까지 이곳에 있어야 겠네..")
	SetQuestNumStep(89,200)
	goto End_QuestNpc00022 
}

;EQuest89_Npc00022
:End_QuestNpc00022
end
@Npc00023	
;SQuest23_Npc00023
CmpQuestNumStep(23,0)
if( yes==1 ){
	sIsDual()
	if(yes==1){
	D("당신은 듀얼 클래스군요.")
	SetQuestNumStep(23,5)
	goto End_QuestNpc00023 
}
	else{
	D("아쉽지만 당신과는 할 이야기가 없어요.")		;Stay0
	SetQuestNumStep(23,0)
	goto End_QuestNpc00023 
}
}

CmpQuestNumStep(23,5)
if( yes==1 ){
	D("그렇다면 당신이 안 가 본 곳은 없고 또한 안 잡아본 몬스터가 없겠군요.")
	SetQuestNumStep(23,10)
	goto End_QuestNpc00023 
}

CmpQuestNumStep(23,10)
if( yes==1 ){
	D("이번에 웨스턴 바넨에서 새롭게 발견된 베놈 던전 얘기를 들으셨나요?")
	SetQuestNumStep(23,15)
	goto End_QuestNpc00023 
}

CmpQuestNumStep(23,15)
if( yes==1 ){
	D("그 곳이라면 당신을 만족시킬 새로운 모험 거리가 잔뜩 있을거에요.")
	SetQuestNumStep(23,20)
	goto End_QuestNpc00023 
}

CmpQuestNumStep(23,20)
if( yes==1 ){
	D("베놈 던전의 입구는 웨스턴 바넨의 [4, 26] 지점이랍니다.")
	SetQuestNumStep(23,25)
	goto End_QuestNpc00023 
}

CmpQuestNumStep(23,25)
if( yes==1 ){
	D("...")
	SetQuestNumStep(23,30)
	goto End_QuestNpc00023 
}

CmpQuestNumStep(23,30)
if( yes==1 ){
	D("앗! 잠깐만요.")
	SetQuestNumStep(23,35)
	goto End_QuestNpc00023 
}

CmpQuestNumStep(23,35)
if( yes==1 ){
	D("당신은 성격이 너무 급하군요.")
	SetQuestNumStep(23,40)
	goto End_QuestNpc00023 
}

CmpQuestNumStep(23,40)
if( yes==1 ){
	D("준비도 없이 무턱대고 갔다가 나중에 화부터 내실거죠?")
	SetQuestNumStep(23,45)
	goto End_QuestNpc00023 
}

CmpQuestNumStep(23,45)
if( yes==1 ){
	D("그러니까 설명이 조금 길더라도 차분하게 들어보시기 바랍니다.")
	SetQuestNumStep(23,50)
	goto End_QuestNpc00023 
}

CmpQuestNumStep(23,50)
if( yes==1 ){
	D("베놈 던전을 최초 발견한 모험자의 말을 빌어 설명해보자면")
	SetQuestNumStep(23,55)
	goto End_QuestNpc00023 
}

CmpQuestNumStep(23,55)
if( yes==1 ){
	D("던전의 안으로 들어가기 위해서는 '별의 문장'을 가지고 있어야 한답니다.")
	SetQuestNumStep(23,60)
	goto End_QuestNpc00023 
}

CmpQuestNumStep(23,60)
if( yes==1 ){
	D("그렇지 않으면 던전 안의 독기에 죽게 된다는군요.")
	SetQuestNumStep(23,65)
	goto End_QuestNpc00023 
}

CmpQuestNumStep(23,65)
if( yes==1 ){
	D("그러한 시련을 견디고 던전의 가장 깊숙한 곳까지 들어간 모험자들은")
	SetQuestNumStep(23,70)
	goto End_QuestNpc00023 
}

CmpQuestNumStep(23,70)
if( yes==1 ){
	D("그 곳에서 다크 엘프를 만나 '듀얼 심볼 아이템'이라는 것을 받았답니다.")
	SetQuestNumStep(23,75)
	goto End_QuestNpc00023 
}

CmpQuestNumStep(23,75)
if( yes==1 ){
	D("그것은 듀얼 클래스만의 특징을 더욱 잘 살려주는 보물이랍니다.")
	SetQuestNumStep(23,80)
	goto End_QuestNpc00023 
}

CmpQuestNumStep(23,80)
if( yes==1 ){
	D("모험자들은 다크 엘프의 부탁을 받아")
	SetQuestNumStep(23,85)
	goto End_QuestNpc00023 
}

CmpQuestNumStep(23,85)
if( yes==1 ){
	D("다른 모험자들에게 어려운 부탁을 하고 그것을 잘 수행하면")
	SetQuestNumStep(23,90)
	goto End_QuestNpc00023 
}

CmpQuestNumStep(23,90)
if( yes==1 ){
	D("다크 엘프로부터 받은 듀얼 심볼 아이템을 전해준답니다.")
	SetQuestNumStep(23,95)
	goto End_QuestNpc00023 
}

CmpQuestNumStep(23,95)
if( yes==1 ){
	D("당신이 듀얼 클래스라면 한 번 도전해보지 않겠나요?")
	SetQuestNumStep(23,0)		;stay0
	goto End_QuestNpc00023 
}

;EQuest23_Npc00023
:End_QuestNpc00023
end
@Npc00024	
;SQuest24_Npc00024
CmpQuestNumStep(24,0)
if( yes==1 ){
	sIsDual()
	if(yes==1){
	UpDualClassItem(0)
	if(yes == 0){
	D("당신은 듀얼 클래스군.")
	SetQuestNumStep(24,5)
	goto End_QuestNpc00024 
}
	else{
	D("당신이 도전할 만한 일이 아닙니다.")		;Stay0
	SetQuestNumStep(24,0)
	goto End_QuestNpc00024 
}
}
	else{
	D("당신은 듀얼 클래스가 아니군.")		;Stay0
	SetQuestNumStep(24,0)
	goto End_QuestNpc00024 
}
}

CmpQuestNumStep(24,5)
if( yes==1 ){
	DualClassCheck(0,0)
	if(yes==1){
	D("당신은...")
	SetQuestNumStep(24,10)
	goto End_QuestNpc00024 
}
	else{
	D("흐음...")		;Stay40
	SetQuestNumStep(24,40)
	goto End_QuestNpc00024 
}
}

CmpQuestNumStep(24,10)
if( yes==1 ){
	D("오직 곧은 검 한 자루만을 의지하고 사는 로드 나이트군.")
	SetQuestNumStep(24,15)
	goto End_QuestNpc00024 
}

CmpQuestNumStep(24,15)
if( yes==1 ){
	D("당신의 용기를 보여주시오.")
	EventMsg("다크 베어의 가죽 20장을 구해온다.")
	SetQuestNumStep(24,20)
	goto End_QuestNpc00024 
}

CmpQuestNumStep(24,20)
if( yes==1 ){
	CheckItemMulti(10244,20)
	if(yes==1){
	DeleteItemMulti(10244,20)
	D("대단하군.")
	SetQuestNumStep(24,25)
	goto End_QuestNpc00024 
}
	else{
	EventMsg("다크베어의 가죽 20장을 구해온다.")		;Stay20
	SetQuestNumStep(24,20)
	goto End_QuestNpc00024 
}
}

CmpQuestNumStep(24,25)
if( yes==1 ){
	D("이걸 가지고 베놈 던전의 다크 엘프를 찾아가보시오.")		;Stay200
	SetQuestNumStep(24,200)
	goto End_QuestNpc00024 
}

CmpQuestNumStep(24,40)
	if(yes==1){
	DualClassCheck(0,1)
	if(yes==1){
	D("당신은...")
	SetQuestNumStep(24,45)
	goto End_QuestNpc00024 
}
	else{
	D("당신은 검사가 아니군.")		;Stay80
	SetQuestNumStep(24,80)
	goto End_QuestNpc00024 
}
}
 
CmpQuestNumStep(24,45)
if( yes==1 ){
	D("태양 아래 빛나는 검과 어둠 속을 소리없이 달리는 비도를 동시에 다루는 스워시 버클러군.")
	SetQuestNumStep(24,50)
	goto End_QuestNpc00024 
}

CmpQuestNumStep(24,50)
if( yes==1 ){
	D("자주 상인들의 마차가 몬스터에게 습격당하고 있다.")
	SetQuestNumStep(24,55)
	goto End_QuestNpc00024 
}

CmpQuestNumStep(24,55)
if( yes==1 ){
	D("이를 해결하여 마을 사람들을 안심시켜주시오.")
	EventMsg("사이클롭스의 가죽 20장을 벗겨 온다.")
	SetQuestNumStep(24,60)
	goto End_QuestNpc00024 
}

CmpQuestNumStep(24,60)
if( yes==1 ){
	CheckItemMulti(10243,20)
	if(yes==1){
	DeleteItemMulti(10243,20)
	D("대단하군.")
	SetQuestNumStep(24,65)
	goto End_QuestNpc00024 
}
	else{
	EventMsg("사이클롭스의 가죽 20장을 벗겨 온다.")		;Stay60
	SetQuestNumStep(24,60)
	goto End_QuestNpc00024 
}
}

CmpQuestNumStep(24,65)
if( yes==1 ){
	D("이걸 가지고 베놈 던전의 다크 엘프를 찾아가보시오.")		;Stay200
	SetQuestNumStep(24,200)
	goto End_QuestNpc00024 
}

CmpQuestNumStep(24,80)
	if(yes==1){
	DualClassCheck(0,3)
	if(yes==1){
	D("당신은...")
	SetQuestNumStep(24,85)
	goto End_QuestNpc00024 
}
	else{
	D("검사가 아닌 사람과는 얘기하고 싶지 않군.")		;Stay115
	SetQuestNumStep(24,115)
	goto End_QuestNpc00024 
}
}
 
CmpQuestNumStep(24,85)
if( yes==1 ){
	D("검 위에 마나를 실은 블레이드 싱어군요.")
	SetQuestNumStep(24,90)
	goto End_QuestNpc00024 
}

CmpQuestNumStep(24,90)
if( yes==1 ){
	D("당신의 용기를 보여주시오.")
	EventMsg("다크 베어의 가죽 20장을 구해온다.")
	SetQuestNumStep(24,95)
	goto End_QuestNpc00024 
}

CmpQuestNumStep(24,95)
if( yes==1 ){
	CheckItemMulti(10244,20)
	if(yes==1){
	DeleteItemMulti(10244,20)
	D("대단하군.")
	SetQuestNumStep(24,100)
	goto End_QuestNpc00024 
}
	else{
	EventMsg("다크 베어의 가죽 20장을 구해온다.")		;Stay95
	SetQuestNumStep(24,95)
	goto End_QuestNpc00024 
}
}

CmpQuestNumStep(24,100)
if( yes==1 ){
	D("이걸 가지고 베놈 던전의 다크 엘프를 찾아가보시오.")		;Stay200
	SetQuestNumStep(24,200)
	goto End_QuestNpc00024 
}

CmpQuestNumStep(24,115)
	if(yes==1){
	DualClassCheck(0,2)
	if(yes==1){
	D("당신은...")
	SetQuestNumStep(24,120)
	goto End_QuestNpc00024 
}
	else{
	D("흐음...")		;Stay150
	SetQuestNumStep(24,150)
	goto End_QuestNpc00024 
}
}
 
CmpQuestNumStep(24,120)
if( yes==1 ){
	D("검과 더불어 활을 선택한 워 마스터군.")
	SetQuestNumStep(24,125)
	goto End_QuestNpc00024 
}

CmpQuestNumStep(24,125)
if( yes==1 ){
	D("당신의 용기를 보여주시오.")
	EventMsg("사이클롭스의 가죽 20장을 구해온다.")
	SetQuestNumStep(24,130)
	goto End_QuestNpc00024 
}

CmpQuestNumStep(24,130)
if( yes==1 ){
	CheckItemMulti(10243,20)
	if(yes==1){
	DeleteItemMulti(10243,20)
	D("대단하군.")
	SetQuestNumStep(24,135)
	goto End_QuestNpc00024 
}
	else{
	EventMsg("사이클롭스의 가죽 20장을 구해온다.")		;Stay130
	SetQuestNumStep(24,130)
	goto End_QuestNpc00024 
}
}

CmpQuestNumStep(24,135)
if( yes==1 ){
	D("이걸 가지고 베놈 던전의 다크 엘프를 찾아가보시오.")		;Stay200
	SetQuestNumStep(24,200)
	goto End_QuestNpc00024 
}

CmpQuestNumStep(24,150)
	if(yes==1){
	DualClassCheck(0,4)
	if(yes==1){
	D("당신은...")
	SetQuestNumStep(24,155)
	goto End_QuestNpc00024 
}
	else{
	D("당신은 아직 검을 모르고 있군.")		;Stay0
	SetQuestNumStep(24,0)
	goto End_QuestNpc00024 
}
}
 
CmpQuestNumStep(24,155)
if( yes==1 ){
	D("신의 권능을 방패삼은 팰러딘이군.")
	SetQuestNumStep(24,160)
	goto End_QuestNpc00024 
}

CmpQuestNumStep(24,160)
if( yes==1 ){
	D("그렇다면 악마를 용서할 수 없지요.")
	SetQuestNumStep(24,165)
	goto End_QuestNpc00024 
}

CmpQuestNumStep(24,165)
if( yes==1 ){
	D("당신의 용기를 보여주시오.")
	EventMsg("사이클롭스의 가죽 20장을 구해온다.")
	SetQuestNumStep(24,170)
	goto End_QuestNpc00024 
}

CmpQuestNumStep(24,170)
if( yes==1 ){
	CheckItemMulti(10243,20)
	if(yes==1){
	DeleteItemMulti(10243,20)
	D("대단하군.")
	SetQuestNumStep(24,175)
	goto End_QuestNpc00024 
}
	else{
	D("잊지 마시오. 사이클롭스의 가죽 20장입니다.")
	EventMsg("사이클롭스의 가죽 20장을 구해온다.")		;Stay170
	SetQuestNumStep(24,170)
	goto End_QuestNpc00024 
}
}

CmpQuestNumStep(24,175)
if( yes==1 ){
	D("이걸 가지고 베놈 던전의 다크 엘프를 찾아가보시오.")		;Stay200
	SetQuestNumStep(24,200)
	goto End_QuestNpc00024 
}

CmpQuestNumStep(24,200)
	if(yes==1){
	UpDualClassItem(1)
	SetQuestNumStep(24,205)
	goto End_QuestNpc00024 
}
 
CmpQuestNumStep(24,205)
if( yes==1 ){
	EventMsg("듀얼 심볼 아이템을 받았습니다.")
	SetQuestNumStep(24,205)
	goto End_QuestNpc00024 
}

;EQuest24_Npc00024
:End_QuestNpc00024
end
@Npc00025	
;SQuest25_Npc00025
CmpQuestNumStep(25,0)
if( yes==1 ){
	sIsDual()
	if(yes==1){
	UpDualClassItem(0)
	if(yes == 0){
	D("너 듀얼 클래스야?")
	SetQuestNumStep(25,5)
	goto End_QuestNpc00025 
}
	else{
	D("너와는 상관없는 이야기야.")		;Stay0
	SetQuestNumStep(25,0)
	goto End_QuestNpc00025 
}
}
	else{
	D("너는 듀얼 클래스의 도둑이 아니잖아.")		;Stay0
	SetQuestNumStep(25,0)
	goto End_QuestNpc00025 
}
}

CmpQuestNumStep(25,5)
if( yes==1 ){
	DualClassCheck(1,1)
	if(yes == 1){
	D("너는...")
	SetQuestNumStep(25,10)
	goto End_QuestNpc00025 
}
	else{
	D("난말이야.")		;Stay55
	SetQuestNumStep(25,55)
	goto End_QuestNpc00025 
}
}

CmpQuestNumStep(25,10)
if( yes==1 ){
	D("칠흑같은 어둠 속을 마음대로 돌아다닐 수 있는 나이트 호크군.")
	SetQuestNumStep(25,15)
	goto End_QuestNpc00025 
}

CmpQuestNumStep(25,15)
if( yes==1 ){
	D("블랙 다이아몬드 이야기 들어봤어요? 아마 이름만 들어 봤을 거야.")
	SetQuestNumStep(25,20)
	goto End_QuestNpc00025 
}

CmpQuestNumStep(25,20)
if( yes==1 ){
	D("전설적인 모험자인 네리와와 자크 단 두 명만이 그 블랙 다이아몬드를 손에 넣을 수 있었지.")
	SetQuestNumStep(25,25)
	goto End_QuestNpc00025 
}

CmpQuestNumStep(25,25)
if( yes==1 ){
	D("그런데 아는 마법사가 마나 메탈이 있으면 블랙 다이아몬드를 만들 수 있다는거야.")
	SetQuestNumStep(25,30)
	goto End_QuestNpc00025 
}

CmpQuestNumStep(25,30)
if( yes==1 ){
	D("당신의 솜씨를 보여주세요.")
	EventMsg("다크 베어의 가죽 20장을 구해온다.")
	SetQuestNumStep(25,35)
	goto End_QuestNpc00025 
}

CmpQuestNumStep(25,35)
if( yes==1 ){
	CheckItemMulti(10244,20)
	if(yes == 1){
	DeleteItemMulti(10244,20)
	D("대단하네요.")
	SetQuestNumStep(25,40)
	goto End_QuestNpc00025 
}
	else{
	EventMsg("다크 베어의 가죽 20장을 구해온다.")		;Stay35
	SetQuestNumStep(25,35)
	goto End_QuestNpc00025 
}
}

CmpQuestNumStep(25,40)
if( yes==1 ){
	D("이걸 가지고 독 던전의 다크 엘프를 찾아가봐요.")		;Stay250
	SetQuestNumStep(25,250)
	goto End_QuestNpc00025 
}

CmpQuestNumStep(25,55)
	if(yes==1){
	DualClassCheck(1,0)
	if(yes == 1){
	D("너는...")
	SetQuestNumStep(25,60)
	goto End_QuestNpc00025 
}
	else{
	D("지금")		;Stay105
	SetQuestNumStep(25,105)
	goto End_QuestNpc00025 
}
}
 
CmpQuestNumStep(25,60)
if( yes==1 ){
	D("어둠과 방패로 자신의 몸을 보호하는 코세어군.")
	SetQuestNumStep(25,65)
	goto End_QuestNpc00025 
}

CmpQuestNumStep(25,65)
if( yes==1 ){
	D("의뢰가 들어왔어. 가죽이 필요해요.")
	SetQuestNumStep(25,70)
	goto End_QuestNpc00025 
}

CmpQuestNumStep(25,70)
if( yes==1 ){
	D("아니 그런 싸구려말고.")
	SetQuestNumStep(25,75)
	goto End_QuestNpc00025 
}

CmpQuestNumStep(25,75)
if( yes==1 ){
	D("다크 베어의 푹신푹신한 가죽이 필요해요.")
	SetQuestNumStep(25,80)
	goto End_QuestNpc00025 
}

CmpQuestNumStep(25,80)
if( yes==1 ){
	D("당신의 솜씨를 보여주세요.")
	EventMsg("다크 베어의 가죽 20장을 구해온다.")
	SetQuestNumStep(25,85)
	goto End_QuestNpc00025 
}

CmpQuestNumStep(25,85)
if( yes==1 ){
	CheckItemMulti(10244,20)
	if(yes == 1){
	DeleteItemMulti(10244,20)
	D("대단하네요.")
	SetQuestNumStep(25,90)
	goto End_QuestNpc00025 
}
	else{
	EventMsg("다크 베어의 가죽 20장을 구해온다.")		;Stay85
	SetQuestNumStep(25,85)
	goto End_QuestNpc00025 
}
}

CmpQuestNumStep(25,90)
if( yes==1 ){
	D("이걸 가지고 독 던전의 다크 엘프를 찾아가봐요.")		;Stay250
	SetQuestNumStep(25,250)
	goto End_QuestNpc00025 
}

CmpQuestNumStep(25,105)
	if(yes==1){
	DualClassCheck(1,2)
	if(yes == 1){
	D("너는...")
	SetQuestNumStep(25,110)
	goto End_QuestNpc00025 
}
	else{
	D("부탁을 들어줄")		;Stay155
	SetQuestNumStep(25,155)
	goto End_QuestNpc00025 
}
}
 
CmpQuestNumStep(25,110)
if( yes==1 ){
	D("비도와 화살을 동시에 날릴 수 있는 비질런티군.")
	SetQuestNumStep(25,115)
	goto End_QuestNpc00025 
}

CmpQuestNumStep(25,115)
if( yes==1 ){
	D("의뢰가 들어왔어. 가죽이 필요해요.")
	SetQuestNumStep(25,120)
	goto End_QuestNpc00025 
}

CmpQuestNumStep(25,120)
if( yes==1 ){
	D("농담하지마. 네 가죽을 대신 전해줄 수도 있으니까.")
	SetQuestNumStep(25,125)
	goto End_QuestNpc00025 
}

CmpQuestNumStep(25,125)
if( yes==1 ){
	D("사이클롭스의 가죽이 필요해요.")
	SetQuestNumStep(25,130)
	goto End_QuestNpc00025 
}

CmpQuestNumStep(25,130)
if( yes==1 ){
	D("당신의 솜씨를 보여주세요.")
	EventMsg("사이클롭스의 가죽 20장을 구해온다.")
	SetQuestNumStep(25,135)
	goto End_QuestNpc00025 
}

CmpQuestNumStep(25,135)
if( yes==1 ){
	CheckItemMulti(10243,20)
	if(yes == 1){
	DeleteItemMulti(10243,20)
	D("대단하네요.")
	SetQuestNumStep(25,140)
	goto End_QuestNpc00025 
}
	else{
	EventMsg("사이클롭스의 가죽 20장을 구해온다.")		;Stay135
	SetQuestNumStep(25,135)
	goto End_QuestNpc00025 
}
}

CmpQuestNumStep(25,140)
if( yes==1 ){
	D("이걸 가지고 독 던전의 다크 엘프를 찾아가봐요.")		;Stay250
	SetQuestNumStep(25,250)
	goto End_QuestNpc00025 
}

CmpQuestNumStep(25,155)
	if(yes==1){
	DualClassCheck(1,4)
	if(yes==1){
	D("너는...")
	SetQuestNumStep(25,160)
	goto End_QuestNpc00025 
}
	else{
	D("솜씨좋은 사람이 필요해.")		;Stay200
	SetQuestNumStep(25,200)
	goto End_QuestNpc00025 
}
}
 
CmpQuestNumStep(25,160)
if( yes==1 ){
	D("어둠 속에서 신의 은총을 받아 빛나는 레비넌트군.")
	SetQuestNumStep(25,165)
	goto End_QuestNpc00025 
}

CmpQuestNumStep(25,165)
if( yes==1 ){
	D("다크 베어를 물리쳐서 너의 의지를 보여줘.")
	SetQuestNumStep(25,170)
	goto End_QuestNpc00025 
}

CmpQuestNumStep(25,170)
if( yes==1 ){
	D("증거로 따뜻한 가죽을 가져와요.")
	SetQuestNumStep(25,175)
	goto End_QuestNpc00025 
}

CmpQuestNumStep(25,175)
if( yes==1 ){
	D("당신의 솜씨를 보여주세요.")
	EventMsg("다크 베어의 가죽 20장을 구해온다.")
	SetQuestNumStep(25,180)
	goto End_QuestNpc00025 
}

CmpQuestNumStep(25,180)
if( yes==1 ){
	CheckItemMulti(10244,20)
	if(yes == 1){
	DeleteItemMulti(10244,20)
	D("대단하네요.")
	SetQuestNumStep(25,185)
	goto End_QuestNpc00025 
}
	else{
	EventMsg("다크 베어의 가죽 20장을 구해온다.")		;Stay180
	SetQuestNumStep(25,180)
	goto End_QuestNpc00025 
}
}

CmpQuestNumStep(25,185)
if( yes==1 ){
	D("이걸 가지고 독 던전의 다크 엘프를 찾아가봐요.")		;Stay250
	SetQuestNumStep(25,250)
	goto End_QuestNpc00025 
}

CmpQuestNumStep(25,200)
	if(yes==1){
	DualClassCheck(1,3)
	if(yes == 1){
	D("너는...")
	SetQuestNumStep(25,205)
	goto End_QuestNpc00025 
}
	else{
	D("나는 나보다 약한 사람과 이야기하지 않아.")		;Stay0
	SetQuestNumStep(25,0)
	goto End_QuestNpc00025 
}
}
 
CmpQuestNumStep(25,205)
if( yes==1 ){
	D("그 어둠 속에서 마나까지 이용하는 토레도군.")
	SetQuestNumStep(25,210)
	goto End_QuestNpc00025 
}

CmpQuestNumStep(25,210)
if( yes==1 ){
	D("이 땅에서 농사를 짓겠다는 농부가 있더군.")
	SetQuestNumStep(25,215)
	goto End_QuestNpc00025 
}

CmpQuestNumStep(25,215)
if( yes==1 ){
	D("조금 놀래켜줄까 하는데 뭐가 좋을까?")
	SetQuestNumStep(25,220)
	goto End_QuestNpc00025 
}

CmpQuestNumStep(25,220)
if( yes==1 ){
	D("그래. 사이클롭스의 가죽이 좋겠군.")
	SetQuestNumStep(25,225)
	goto End_QuestNpc00025 
}

CmpQuestNumStep(25,225)
if( yes==1 ){
	D("당신의 솜씨를 보여주세요.")
	EventMsg("사이클롭스의 가죽 20장을 구해온다.")
	SetQuestNumStep(25,230)
	goto End_QuestNpc00025 
}

CmpQuestNumStep(25,230)
if( yes==1 ){
	CheckItemMulti(10243,20)
	if(yes == 1){
	DeleteItemMulti(10243,20)
	D("대단하네요.")
	SetQuestNumStep(25,235)
	goto End_QuestNpc00025 
}
	else{
	EventMsg("사이클롭스의 가죽 20장을 구해온다.")		;Stay230
	SetQuestNumStep(25,230)
	goto End_QuestNpc00025 
}
}

CmpQuestNumStep(25,235)
if( yes==1 ){
	D("이걸 가지고 독 던전의 다크 엘프를 찾아가봐요.")		;Stay250
	SetQuestNumStep(25,250)
	goto End_QuestNpc00025 
}

CmpQuestNumStep(25,250)
	if(yes==1){
	UpDualClassItem(1)
	SetQuestNumStep(25,255)
	goto End_QuestNpc00025 
}
 
CmpQuestNumStep(25,255)
if( yes==1 ){
	EventMsg("듀얼 심볼 아이템을 받았습니다.")
	SetQuestNumStep(25,255)
	goto End_QuestNpc00025 
}

;EQuest25_Npc00025
:End_QuestNpc00025
end
@Npc00026	
;SQuest26_Npc00026
CmpQuestNumStep(26,0)
if( yes==1 ){
	sIsDual()
	if(yes==1){
	UpDualClassItem(0)
	if(yes == 0){
	D("듀얼 클래스시군요.")
	SetQuestNumStep(26,5)
	goto End_QuestNpc00026 
}
	else{
	D("죄송합니다만 당신과는 관계없는 이야기입니다. ")		;Stay0
	SetQuestNumStep(26,0)
	goto End_QuestNpc00026 
}
}
	else{
	D("당신은 듀얼 클래스의 궁수가 아니군요.")		;Stay0
	SetQuestNumStep(26,0)
	goto End_QuestNpc00026 
}
}

CmpQuestNumStep(26,5)
if( yes==1 ){
	DualClassCheck(2,1)
	if(yes==1){
	D("당신은...")
	SetQuestNumStep(26,10)
	goto End_QuestNpc00026 
}
	else{
	D("잠시만")		;Stay95
	SetQuestNumStep(26,95)
	goto End_QuestNpc00026 
}
}

CmpQuestNumStep(26,10)
if( yes==1 ){
	D("화살을 날리며 그 그림자 속으로 비도를 같이 던지는 데스페라도군요.")
	SetQuestNumStep(26,15)
	goto End_QuestNpc00026 
}

CmpQuestNumStep(26,15)
if( yes==1 ){
	D("솔직히 말해 믿기 힘들군요. 당신을 시험해보겠습니다.")
	SetQuestNumStep(26,20)
	goto End_QuestNpc00026 
}

CmpQuestNumStep(26,20)
if( yes==1 ){
	D("당신의 솜씨를 보여주시오.")
	EventMsg("사이클롭스의 가죽 20개를 구해온다.")
	SetQuestNumStep(26,25)
	goto End_QuestNpc00026 
}

CmpQuestNumStep(26,25)
if( yes==1 ){
	CheckItemMulti(10243,20)
	if(yes==1){
	DeleteItemMulti(10243,20)
	D("이제는 당신을 믿을 수 있겠습니다.")
	SetQuestNumStep(26,30)
	goto End_QuestNpc00026 
}
	else{
	D("잊지 마시오. 사이클롭스의 가죽 20개입니다.")
	EventMsg("사이클롭스의 가죽 20개를 구해온다.")		;Stay25
	SetQuestNumStep(26,25)
	goto End_QuestNpc00026 
}
}

CmpQuestNumStep(26,30)
if( yes==1 ){
	D("이것은 당신의 상징입니다. 이걸 가지고 베놈 던전의 다크 엘프를 찾아가보시오.")		;Stay495
	SetQuestNumStep(26,495)
	goto End_QuestNpc00026 
}

CmpQuestNumStep(26,95)
	if(yes==1){
	DualClassCheck(2,2)
	if(yes==1){
	D("당신은...")
	SetQuestNumStep(26,100)
	goto End_QuestNpc00026 
}
	else{
	D("당신의")		;Stay195
	SetQuestNumStep(26,195)
	goto End_QuestNpc00026 
}
}
 
CmpQuestNumStep(26,100)
if( yes==1 ){
	D("당신이 보고 당신의 팔로 당기는 활만을 믿는 호크아이군요.")
	SetQuestNumStep(26,105)
	goto End_QuestNpc00026 
}

CmpQuestNumStep(26,105)
if( yes==1 ){
	D("당신이 진정으로 활을 잘 다룬다면 많은 적과도 잘 싸울 수 있겠지요.")
	SetQuestNumStep(26,110)
	goto End_QuestNpc00026 
}

CmpQuestNumStep(26,110)
if( yes==1 ){
	D("당신의 솜씨를 보여주시오.")
	EventMsg("다크 베어의 가죽 20장을 구해온다.")
	SetQuestNumStep(26,115)
	goto End_QuestNpc00026 
}

CmpQuestNumStep(26,115)
if( yes==1 ){
	CheckItemMulti(10244,20)
	if(yes==1){
	DeleteItemMulti(10244,20)
	D("이제는 당신을 믿을 수 있겠습니다.")
	SetQuestNumStep(26,120)
	goto End_QuestNpc00026 
}
	else{
	D("잊지 마시오. 다크 베어의 가죽 20장입니다.")
	EventMsg("다크 베어의 가죽 20장을 구해온다.")		;Stay115
	SetQuestNumStep(26,115)
	goto End_QuestNpc00026 
}
}

CmpQuestNumStep(26,120)
if( yes==1 ){
	D("이것은 당신의 상징입니다. 이걸 가지고 베놈 던전의 다크 엘프를 찾아가보시오.")		;Stay495
	SetQuestNumStep(26,495)
	goto End_QuestNpc00026 
}

CmpQuestNumStep(26,195)
	if(yes==1){
	DualClassCheck(2,0)
	if(yes==1){
	D("당신은...")
	SetQuestNumStep(26,200)
	goto End_QuestNpc00026 
}
	else{
	D("이름을...")		;Stay295
	SetQuestNumStep(26,295)
	goto End_QuestNpc00026 
}
}
 
CmpQuestNumStep(26,200)
if( yes==1 ){
	D("활과 함께 검을 선택한 콩쿼러군요.")
	SetQuestNumStep(26,205)
	goto End_QuestNpc00026 
}

CmpQuestNumStep(26,205)
if( yes==1 ){
	D("어느 귀족 분에게 의뢰가 들어왔습니다. 검과 활을 잘 다루는 사람이 필요하다는군요.")
	SetQuestNumStep(26,210)
	goto End_QuestNpc00026 
}

CmpQuestNumStep(26,210)
if( yes==1 ){
	D("당신의 솜씨를 보여주시오.")
	EventMsg("사이클롭스의 가죽 20장을 구해온다.")
	SetQuestNumStep(26,215)
	goto End_QuestNpc00026 
}

CmpQuestNumStep(26,215)
if( yes==1 ){
	CheckItemMulti(10243,20)
	if(yes==1){
	DeleteItemMulti(10243,20)
	D("이제는 당신을 믿을 수 있겠습니다.")
	SetQuestNumStep(26,220)
	goto End_QuestNpc00026 
}
	else{
	D("잊지 마시오. 사이클롭스의 가죽 20장입니다.")
	EventMsg("사이클롭스의 가죽 20장을 구해온다.")		;Stay215
	SetQuestNumStep(26,215)
	goto End_QuestNpc00026 
}
}

CmpQuestNumStep(26,220)
if( yes==1 ){
	D("이것은 당신의 상징입니다. 이걸 가지고 베놈 던전의 다크 엘프를 찾아가보시오.")		;Stay495
	SetQuestNumStep(26,495)
	goto End_QuestNpc00026 
}

CmpQuestNumStep(26,295)
	if(yes==1){
	DualClassCheck(2,4)
	if(yes==1){
	D("당신은...")
	SetQuestNumStep(26,300)
	goto End_QuestNpc00026 
}
	else{
	D("찾아보도록 하죠.")		;Stay395
	SetQuestNumStep(26,395)
	goto End_QuestNpc00026 
}
}
 
CmpQuestNumStep(26,300)
if( yes==1 ){
	D("기도의 힘을 화살에 실어 날리는 워 세인트군요.")
	SetQuestNumStep(26,305)
	goto End_QuestNpc00026 
}

CmpQuestNumStep(26,305)
if( yes==1 ){
	D("북부 목동들이 소떼를 끌고 오다가 몬스터에게 습격당했답니다.")
	SetQuestNumStep(26,310)
	goto End_QuestNpc00026 
}

CmpQuestNumStep(26,310)
if( yes==1 ){
	D("자꾸 이래서는 평범한 사람들에게까지 피해가 갑니다.")
	SetQuestNumStep(26,315)
	goto End_QuestNpc00026 
}

CmpQuestNumStep(26,315)
if( yes==1 ){
	D("당신의 솜씨를 보여주시오.")
	EventMsg("다크 베어의 가죽 20장을 구해온다.")
	SetQuestNumStep(26,320)
	goto End_QuestNpc00026 
}

CmpQuestNumStep(26,320)
if( yes==1 ){
	CheckItemMulti(10244,20)
	if(yes==1){
	DeleteItemMulti(10244,20)
	D("이제는 당신을 믿을 수 있겠습니다.")
	SetQuestNumStep(26,325)
	goto End_QuestNpc00026 
}
	else{
	D("잊지 마시오. 다크 베어의 가죽 20장입니다.")
	EventMsg("다크 베어의 가죽 20장을 구해온다.")		;Stay320
	SetQuestNumStep(26,320)
	goto End_QuestNpc00026 
}
}

CmpQuestNumStep(26,325)
if( yes==1 ){
	D("이것은 당신의 상징입니다. 이걸 가지고 베놈 던전의 다크 엘프를 찾아가보시오.")		;Stay495
	SetQuestNumStep(26,495)
	goto End_QuestNpc00026 
}

CmpQuestNumStep(26,395)
	if(yes==1){
	DualClassCheck(2,3)
	if(yes==1){
	D("당신은...")
	SetQuestNumStep(26,400)
	goto End_QuestNpc00026 
}
	else{
	D("당신은 내가 기다리는 사람이 아니군요.")		;Stay0
	SetQuestNumStep(26,0)
	goto End_QuestNpc00026 
}
}
 
CmpQuestNumStep(26,400)
if( yes==1 ){
	D("화살 끝에 마나를 얹은 트리거 메이지군요.")
	SetQuestNumStep(26,405)
	goto End_QuestNpc00026 
}

CmpQuestNumStep(26,405)
if( yes==1 ){
	D("화살로 다크 베어를 쓰러뜨리는 것은 정말 어려운 일이지.")
	SetQuestNumStep(26,410)
	goto End_QuestNpc00026 
}

CmpQuestNumStep(26,410)
if( yes==1 ){
	D("생각해봐. 다크 베어는 상상도 할 수 없을 정도의 두꺼운 가죽으로 보호받고 있단 말이야.")
	SetQuestNumStep(26,415)
	goto End_QuestNpc00026 
}

CmpQuestNumStep(26,415)
if( yes==1 ){
	D("화살로 그 가죽을 뚫을 수 있다고?")
	SetQuestNumStep(26,420)
	goto End_QuestNpc00026 
}

CmpQuestNumStep(26,420)
if( yes==1 ){
	D("당신의 솜씨를 보여주시오.")
	EventMsg("다크 베어의 가죽 20장을 구해온다.")
	SetQuestNumStep(26,425)
	goto End_QuestNpc00026 
}

CmpQuestNumStep(26,425)
if( yes==1 ){
	CheckItemMulti(10244,20)
	if(yes==1){
	DeleteItemMulti(10244,20)
	D("이제는 당신을 믿을 수 있겠습니다.")
	SetQuestNumStep(26,430)
	goto End_QuestNpc00026 
}
	else{
	D("잊지 마시오. 다크 베어의 가죽 20장입니다.")
	EventMsg("다크 베어의 가죽 20장을 구해온다.")		;Stay425
	SetQuestNumStep(26,425)
	goto End_QuestNpc00026 
}
}

CmpQuestNumStep(26,430)
if( yes==1 ){
	D("이것은 당신의 상징입니다. 이걸 가지고 베놈 던전의 다크 엘프를 찾아가보시오.")		;Stay495
	SetQuestNumStep(26,495)
	goto End_QuestNpc00026 
}

CmpQuestNumStep(26,495)
	if(yes==1){
	UpDualClassItem(1)
	SetQuestNumStep(26,500)
	goto End_QuestNpc00026 
}
 
CmpQuestNumStep(26,500)
if( yes==1 ){
	EventMsg("듀얼 심볼 아이템을 받았습니다.")
	SetQuestNumStep(26,500)
	goto End_QuestNpc00026 
}

;EQuest26_Npc00026
:End_QuestNpc00026
end
@Npc00027	
;SQuest27_Npc00027
CmpQuestNumStep(27,0)
if( yes==1 ){
	sIsDual()
	if(yes==1){
	UpDualClassItem(0)
	if(yes == 0){
	D("듀얼 클래스인가?")
	SetQuestNumStep(27,5)
	goto End_QuestNpc00027 
}
	else{
	D("당신 정도와는 이야기하고 싶지 않군.")		;Stay0
	SetQuestNumStep(27,0)
	goto End_QuestNpc00027 
}
}
	else{
	D("너는 듀얼 클래스의 마법사가 아니잖아.")		;Stay0
	SetQuestNumStep(27,0)
	goto End_QuestNpc00027 
}
}

CmpQuestNumStep(27,5)
if( yes==1 ){
	DualClassCheck(3,0)
	if(yes==1){
	D("자네는...")
	SetQuestNumStep(27,10)
	goto End_QuestNpc00027 
}
	else{
	D("잠시만...")		;Stay95
	SetQuestNumStep(27,95)
	goto End_QuestNpc00027 
}
}

CmpQuestNumStep(27,10)
if( yes==1 ){
	D("갑옷을 입은 마나인 워록이군요.")
	SetQuestNumStep(27,15)
	goto End_QuestNpc00027 
}

CmpQuestNumStep(27,15)
if( yes==1 ){
	D("마나와 검 둘 다 잘 다룰 줄 아나?")
	SetQuestNumStep(27,20)
	goto End_QuestNpc00027 
}

CmpQuestNumStep(27,20)
if( yes==1 ){
	D("내 눈 앞에서 증명해봐.")
	SetQuestNumStep(27,25)
	goto End_QuestNpc00027 
}

CmpQuestNumStep(27,25)
if( yes==1 ){
	D("당신의 솜씨를 보여주시오.")
	EventMsg("다크 베어의 가죽 20장을 구해온다.")
	SetQuestNumStep(27,30)
	goto End_QuestNpc00027 
}

CmpQuestNumStep(27,30)
if( yes==1 ){
	CheckItemMulti(10244,20)
	if(yes==1){
	DeleteItemMulti(10244,20)
	D("대단하군.")
	SetQuestNumStep(27,35)
	goto End_QuestNpc00027 
}
	else{
	D("잊지 마시오. 다크 베어의 가죽 20장입니다.")
	EventMsg("다크 베어의 가죽 20장을 구해온다.")		;Stay30
	SetQuestNumStep(27,30)
	goto End_QuestNpc00027 
}
}

CmpQuestNumStep(27,35)
if( yes==1 ){
	D("이것은 당신의 지혜의 상징입니다. 이걸 가지고 베놈 던전의 다크 엘프를 찾아가보시오.")		;Stay395
	SetQuestNumStep(27,395)
	goto End_QuestNpc00027 
}

CmpQuestNumStep(27,95)
	if(yes==1){
	DualClassCheck(3,2)
	if(yes==1){
	D("자네는...")
	SetQuestNumStep(27,100)
	goto End_QuestNpc00027 
}
	else{
	D("나의 마나가...")		;Stay195
	SetQuestNumStep(27,195)
	goto End_QuestNpc00027 
}
}
 
CmpQuestNumStep(27,100)
if( yes==1 ){
	D("화살을 타고 전달되는 마나인 아크 마기군요.")
	SetQuestNumStep(27,105)
	goto End_QuestNpc00027 
}

CmpQuestNumStep(27,105)
if( yes==1 ){
	D("마법사만큼 과소비를 많이 하는 사람도 없지.")
	SetQuestNumStep(27,110)
	goto End_QuestNpc00027 
}

CmpQuestNumStep(27,110)
if( yes==1 ){
	D("사이클롭스의 가죽이 필요해.")
	SetQuestNumStep(27,115)
	goto End_QuestNpc00027 
}

CmpQuestNumStep(27,115)
if( yes==1 ){
	D("용도는 묻지 말고 좀 구해다줘.")
	EventMsg("사이클롭스의 가죽 20장을 구해온다.")
	SetQuestNumStep(27,120)
	goto End_QuestNpc00027 
}

CmpQuestNumStep(27,120)
if( yes==1 ){
	CheckItemMulti(10243,20)
	if(yes==1){
	DeleteItemMulti(10243,20)
	D("대단하군.")
	SetQuestNumStep(27,125)
	goto End_QuestNpc00027 
}
	else{
	D("잊지 마시오. 사이클롭스의 가죽 20장입니다.")
	EventMsg("사이클롭스의 가죽 20장을 구해온다.")		;Stay120
	SetQuestNumStep(27,120)
	goto End_QuestNpc00027 
}
}

CmpQuestNumStep(27,125)
if( yes==1 ){
	D("이것은 당신의 지혜의 상징입니다. 이걸 가지고 베놈 던전의 다크 엘프를 찾아가보시오.")		;Stay395
	SetQuestNumStep(27,395)
	goto End_QuestNpc00027 
}

CmpQuestNumStep(27,195)
	if(yes==1){
	DualClassCheck(3,1)
	if(yes==1){
	D("자네는...")
	SetQuestNumStep(27,200)
	goto End_QuestNpc00027 
}
	else{
	D("지금...")		;Stay295
	SetQuestNumStep(27,295)
	goto End_QuestNpc00027 
}
}
 
CmpQuestNumStep(27,200)
if( yes==1 ){
	D("어둠 속을 달리는 마나인 치가네군요.")
	SetQuestNumStep(27,205)
	goto End_QuestNpc00027 
}

CmpQuestNumStep(27,205)
if( yes==1 ){
	D("그런데 복장이 그게 뭔가.")
	SetQuestNumStep(27,210)
	goto End_QuestNpc00027 
}

CmpQuestNumStep(27,210)
if( yes==1 ){
	D("당신 같은 마법사에겐 다크 베어의 가죽으로 된 망토가 어울려.")
	SetQuestNumStep(27,215)
	goto End_QuestNpc00027 
}

CmpQuestNumStep(27,215)
if( yes==1 ){
	D("가죽을 좀 구해와봐.")
	EventMsg("다크 베어의 가죽 20장을 구해온다.")
	SetQuestNumStep(27,220)
	goto End_QuestNpc00027 
}

CmpQuestNumStep(27,220)
if( yes==1 ){
	CheckItemMulti(10244,20)
	if(yes==1){
	DeleteItemMulti(10244,20)
	D("대단하군.")
	SetQuestNumStep(27,225)
	goto End_QuestNpc00027 
}
	else{
	D("잊지 마시오. 다크 베어의 가죽 20장입니다.")
	EventMsg("다크 베어의 가죽 20장을 구해온다.")		;Stay220
	SetQuestNumStep(27,220)
	goto End_QuestNpc00027 
}
}

CmpQuestNumStep(27,225)
if( yes==1 ){
	D("이것은 당신의 지혜의 상징입니다. 이걸 가지고 베놈 던전의 다크 엘프를 찾아가보시오.")		;Stay395
	SetQuestNumStep(27,395)
	goto End_QuestNpc00027 
}

CmpQuestNumStep(27,295)
	if(yes==1){
	DualClassCheck(3,3)
	if(yes==1){
	D("자네는...")
	SetQuestNumStep(27,300)
	goto End_QuestNpc00027 
}
	else{
	D("전혀 반응하지 않는군.")		;Stay0
	SetQuestNumStep(27,0)
	goto End_QuestNpc00027 
}
}
 
CmpQuestNumStep(27,300)
if( yes==1 ){
	D("마나에 푹 빠져버린 그랜드 위저드군요.")
	SetQuestNumStep(27,305)
	goto End_QuestNpc00027 
}

CmpQuestNumStep(27,305)
if( yes==1 ){
	D("새로운 마법을 만드는 일에 동참하고 싶지 않습니까?")
	SetQuestNumStep(27,310)
	goto End_QuestNpc00027 
}

CmpQuestNumStep(27,310)
if( yes==1 ){
	D("제 연구를 도와주십시오.")
	SetQuestNumStep(27,315)
	goto End_QuestNpc00027 
}

CmpQuestNumStep(27,315)
if( yes==1 ){
	D("당신의 솜씨를 보여주시오.")
	EventMsg("다크 베어의 가죽 20장을 구해온다.")
	SetQuestNumStep(27,320)
	goto End_QuestNpc00027 
}

CmpQuestNumStep(27,320)
if( yes==1 ){
	CheckItemMulti(10244,20)
	if(yes==1){
	DeleteItemMulti(10244,20)
	D("대단하군.")
	SetQuestNumStep(27,325)
	goto End_QuestNpc00027 
}
	else{
	D("잊지 마시오. 다크 베어의 가죽 20장입니다.")
	EventMsg("다크 베어의 가죽 20장을 구해온다.")		;Stay320
	SetQuestNumStep(27,320)
	goto End_QuestNpc00027 
}
}

CmpQuestNumStep(27,325)
if( yes==1 ){
	D("이것은 당신의 지혜의 상징입니다. 이걸 가지고 베놈 던전의 다크 엘프를 찾아가보시오.")		;Stay395
	SetQuestNumStep(27,395)
	goto End_QuestNpc00027 
}

CmpQuestNumStep(27,395)
	if(yes==1){
	UpDualClassItem(1)
	ShowLearnDualMagic()
	SetQuestNumStep(27,400)
	goto End_QuestNpc00027 
}
 
CmpQuestNumStep(27,400)
if( yes==1 ){
	EventMsg("듀얼 심볼 아이템을 받았습니다.")
	SetQuestNumStep(27,400)
	goto End_QuestNpc00027 
}

;EQuest27_Npc00027
:End_QuestNpc00027
end
@Npc00028	
;SQuest28_Npc00028
CmpQuestNumStep(28,0)
if( yes==1 ){
	sIsDual()
	if(yes==1){
	UpDualClassItem(0)
	if(yes == 0){
	D("당신은 듀얼 클래스시군요.")
	SetQuestNumStep(28,5)
	goto End_QuestNpc00028 
}
	else{
	D("죄송하지만 따로 기다리는 사람이 있습니다.")		;Stay0
	SetQuestNumStep(28,0)
	goto End_QuestNpc00028 
}
}
	else{
	D("당신은 아직 듀얼 클래스까지 수련하지 못하셨군요.")		;Stay0
	SetQuestNumStep(28,0)
	goto End_QuestNpc00028 
}
}

CmpQuestNumStep(28,5)
if( yes==1 ){
	DualClassCheck(4,0)
	if(yes==1){
	D("형제는...")
	SetQuestNumStep(28,10)
	goto End_QuestNpc00028 
}
	else{
	D("당신은")		;Stay95
	SetQuestNumStep(28,95)
	goto End_QuestNpc00028 
}
}

CmpQuestNumStep(28,10)
if( yes==1 ){
	D("신의 은총이라는 이름의 갑옷을 입은 템플러군요.")
	SetQuestNumStep(28,15)
	goto End_QuestNpc00028 
}

CmpQuestNumStep(28,15)
if( yes==1 ){
	D("힐링 포션이라는 물건은 참 신기하지 않습니까?")
	SetQuestNumStep(28,20)
	goto End_QuestNpc00028 
}

CmpQuestNumStep(28,20)
if( yes==1 ){
	D("물론 그 재료가 트롤이라는 것을 생각해보면 그 놀라운 효과도 이해가 가지요.")
	SetQuestNumStep(28,25)
	goto End_QuestNpc00028 
}

CmpQuestNumStep(28,25)
if( yes==1 ){
	D("그런데 모험자 1명이 쓰는 힐링 포션을 만들려면 트롤이 얼마나 필요할까요? 계산이 잘 안 되는 표정이군요.")
	SetQuestNumStep(28,30)
	goto End_QuestNpc00028 
}

CmpQuestNumStep(28,30)
if( yes==1 ){
	D("그렇습니다. 사람들에게 알려진 것과 달리 이러한 포션의 재료로 트롤을 쓰지 않습니다.")
	SetQuestNumStep(28,35)
	goto End_QuestNpc00028 
}

CmpQuestNumStep(28,35)
if( yes==1 ){
	D("진짜 재료를 알고 싶지 않습니까?")
	EventMsg("사이클롭스의 가죽 20장을 구해온다.")
	SetQuestNumStep(28,40)
	goto End_QuestNpc00028 
}

CmpQuestNumStep(28,40)
if( yes==1 ){
	CheckItemMulti(10243,20)
	if(yes==1){
	DeleteItemMulti(10243,20)
	D("대단하군.")
	SetQuestNumStep(28,45)
	goto End_QuestNpc00028 
}
	else{
	D("잊지 마시오. 사이클롭스의 가죽 20장입니다.")
	EventMsg("사이클롭스의 가죽 20장을 구해온다.")		;Stay40
	SetQuestNumStep(28,40)
	goto End_QuestNpc00028 
}
}

CmpQuestNumStep(28,45)
if( yes==1 ){
	D("고급 힐링 포션의 진짜 재료는 사이클롭스입니다.")
	SetQuestNumStep(28,50)
	goto End_QuestNpc00028 
}

CmpQuestNumStep(28,50)
if( yes==1 ){
	D("그래서 숙련된 모험자들이 트롤대신 죽어라 사이클롭스만을 사냥하는 이유입니다.")
	SetQuestNumStep(28,55)
	goto End_QuestNpc00028 
}

CmpQuestNumStep(28,55)
if( yes==1 ){
	D("이것은 당신의 신앙의 상징입니다. 이걸 가지고 베놈 던전의 다크 엘프를 찾아가보시오.")		;Stay395
	SetQuestNumStep(28,395)
	goto End_QuestNpc00028 
}

CmpQuestNumStep(28,95)
	if(yes==1){
	DualClassCheck(4,2)
	if(yes==1){
	D("형제는...")
	SetQuestNumStep(28,100)
	goto End_QuestNpc00028 
}
	else{
	D("신을 믿지 않는군요.")		;Stay195
	SetQuestNumStep(28,195)
	goto End_QuestNpc00028 
}
}
 
CmpQuestNumStep(28,100)
if( yes==1 ){
	D("기도를 화살에 실어 날리는 어벤저군요.")
	SetQuestNumStep(28,105)
	goto End_QuestNpc00028 
}

CmpQuestNumStep(28,105)
if( yes==1 ){
	D("저는 몬스터를 제압하는 방법을 연구하고 있습니다.")
	SetQuestNumStep(28,110)
	goto End_QuestNpc00028 
}

CmpQuestNumStep(28,110)
if( yes==1 ){
	D("그를 위해 다크 베어의 가죽을 구해왔으면 합니다.")
	EventMsg("다크 베어의 가죽 20장을 구해온다.")
	SetQuestNumStep(28,115)
	goto End_QuestNpc00028 
}

CmpQuestNumStep(28,115)
if( yes==1 ){
	CheckItemMulti(10244,20)
	if(yes==1){
	DeleteItemMulti(10244,20)
	D("감사합니다.")
	SetQuestNumStep(28,120)
	goto End_QuestNpc00028 
}
	else{
	D("잊지 마시오. 다크 베어의 가죽 20장입니다.")
	EventMsg("다크 베어의 가죽 20장을 구해온다.")		;Stay115
	SetQuestNumStep(28,115)
	goto End_QuestNpc00028 
}
}

CmpQuestNumStep(28,120)
if( yes==1 ){
	D("이것은 당신의 신앙의 상징입니다. 이걸 가지고 베놈 던전의 다크 엘프를 찾아가보시오.")		;Stay395
	SetQuestNumStep(28,395)
	goto End_QuestNpc00028 
}

CmpQuestNumStep(28,195)
	if(yes==1){
	DualClassCheck(4,1)
	if(yes==1){
	D("형제는...")
	SetQuestNumStep(28,200)
	goto End_QuestNpc00028 
}
	else{
	D("잠시만...")		;Stay295
	SetQuestNumStep(28,295)
	goto End_QuestNpc00028 
}
}
 
CmpQuestNumStep(28,200)
if( yes==1 ){
	D("세상을 밝히기 위해 어둠 속으로 뛰어든 폴른이군요.")
	SetQuestNumStep(28,205)
	goto End_QuestNpc00028 
}

CmpQuestNumStep(28,205)
if( yes==1 ){
	D("힘든 선택을 하셨군요.")
	SetQuestNumStep(28,210)
	goto End_QuestNpc00028 
}

CmpQuestNumStep(28,210)
if( yes==1 ){
	D("당신의 신앙을 보여주십시오.")
	EventMsg("사이클롭스의 가죽 20장을 구해온다.")
	SetQuestNumStep(28,215)
	goto End_QuestNpc00028 
}

CmpQuestNumStep(28,215)
if( yes==1 ){
	CheckItemMulti(10243,20)
	if(yes==1){
	DeleteItemMulti(10243,20)
	D("감사합니다.")
	SetQuestNumStep(28,220)
	goto End_QuestNpc00028 
}
	else{
	D("잊지 마시오. 사이클롭스의 가죽 20장입니다.")
	EventMsg("사이클롭스의 가죽 20장을 구해온다.")		;Stay215
	SetQuestNumStep(28,215)
	goto End_QuestNpc00028 
}
}

CmpQuestNumStep(28,220)
if( yes==1 ){
	D("이것은 당신의 신앙의 상징입니다. 이걸 가지고 베놈 던전의 다크 엘프를 찾아가보시오.")		;Stay395
	SetQuestNumStep(28,395)
	goto End_QuestNpc00028 
}

CmpQuestNumStep(28,295)
	if(yes==1){
	DualClassCheck(4,4)
	if(yes==1){
	D("형제는...")
	SetQuestNumStep(28,300)
	goto End_QuestNpc00028 
}
	else{
	D("제가 잘못 본 것같군요.")		;Stay0
	SetQuestNumStep(28,0)
	goto End_QuestNpc00028 
}
}
 
CmpQuestNumStep(28,300)
if( yes==1 ){
	D("몸과 마음 모두를 신에게 바친 세인트군요.")
	SetQuestNumStep(28,305)
	goto End_QuestNpc00028 
}

CmpQuestNumStep(28,305)
if( yes==1 ){
	D("신 아래의 모든 형제 자매님들에게 부탁할 것이 있습니다.")
	SetQuestNumStep(28,310)
	goto End_QuestNpc00028 
}

CmpQuestNumStep(28,310)
if( yes==1 ){
	D("사이클롭스의 가죽 20장이 필요합니다.")
	EventMsg("사이클롭스의 가죽 20장을 구해온다.")
	SetQuestNumStep(28,315)
	goto End_QuestNpc00028 
}

CmpQuestNumStep(28,315)
if( yes==1 ){
	CheckItemMulti(10243,20)
	if(yes==1){
	DeleteItemMulti(10243,20)
	D("감사합니다.")
	SetQuestNumStep(28,320)
	goto End_QuestNpc00028 
}
	else{
	D("잊지 마시오. 사이클롭스의 가죽 20장입니다.")
	EventMsg("사이클롭스의 가죽 20장을 구해온다.")		;Stay315
	SetQuestNumStep(28,315)
	goto End_QuestNpc00028 
}
}

CmpQuestNumStep(28,320)
if( yes==1 ){
	D("이것은 당신의 신앙의 상징입니다. 이걸 가지고 베놈 던전의 다크 엘프를 찾아가보시오.")		;Stay395
	SetQuestNumStep(28,395)
	goto End_QuestNpc00028 
}

CmpQuestNumStep(28,395)
	if(yes==1){
	UpDualClassItem(1)
	ShowLearnDualMagic()
	SetQuestNumStep(28,400)
	goto End_QuestNpc00028 
}
 
CmpQuestNumStep(28,400)
if( yes==1 ){
	EventMsg("듀얼 심볼 아이템을 받았습니다.")
	SetQuestNumStep(28,400)
	goto End_QuestNpc00028 
}

;EQuest28_Npc00028
:End_QuestNpc00028
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
	MapMove("northern_w",6,261 )
	if( yes == 1 ) {
	EventMsg("<노던바넨>으로 이동합니다.")
}
	else {
	EventMsg("맵 이동에 실패했습니다.")
}
		
end
@Event00002	
 
 	SpellMapMove("기억을 증명하는 존재","sermenys_d1", 9, 9)
	if( yes == 1 ){
	EventMsg("<세르메니스 던전>으로 이동합니다.")
}
	else{
	EventMsg("주문을 외우셔야 이동할 수 있습니다.")
}
 
end
@Event00003		
	MapMove("venom1",73,27)
	if( yes == 1 )  {
	EventMsg(" <베놈 던전>으로 이동합니다. ")
}
	else  {
	EventMsg(" 맵 이동에 실패했습니다. ")
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








