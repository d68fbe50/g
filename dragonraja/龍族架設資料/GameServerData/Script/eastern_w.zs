
@sys00	; 처음 서버 Setting하는 함수.

	MaxNPC( 50 )
	
	MapName( "eastern_w" )
	
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
CmpQuestNumStep( 88, 130 )
if( yes==1 ){
	D("나는 피올라의 첫째 아들.")
	SetQuestNumStep( 88, 135 )
	goto End_QuestNpc00021 
}

CmpQuestNumStep( 88, 135 )
if( yes==1 ){
	D("자네가 정말로 나의 모든 동생을 만났단 말인가?")
	SetQuestNumStep( 88, 140 )
	goto End_QuestNpc00021 
}

CmpQuestNumStep( 88, 140 )
if( yes==1 ){
	D("어때? 그들은 잘 지내고 있나?")
	SetQuestNumStep( 88, 145 )
	goto End_QuestNpc00021 
}

CmpQuestNumStep( 88, 145 )
if( yes==1 ){
	D("한번 만날려고 해도 우리 형제들은 이상하게 서로 만나지지 않아서 말야..")
	SetQuestNumStep( 88, 150 )
	goto End_QuestNpc00021 
}

CmpQuestNumStep( 88, 150 )
if( yes==1 ){
	D("이런식의 이벤트가 아니면 서로의 안부를 들을 수가 없지..")
	SetQuestNumStep( 88, 155 )
	goto End_QuestNpc00021 
}

CmpQuestNumStep( 88, 155 )
if( yes==1 ){
	D("그래도 무사히 우리 모든 형제를 다 만났군..")
	SetQuestNumStep( 88, 160 )
	goto End_QuestNpc00021 
}

CmpQuestNumStep( 88, 160 )
if( yes==1 ){
	D("이거는 이번 이벤트를 마친 거에 대한 상금과 보물이네..")
	EventMsg("이벤트 상금과 보물을 받았습니다.")
	SetItemInvPC(0,  10123,  100000)
	SetItemInvPC(0,  4013,  1)
	SetQuestNumStep( 88, 165 )
	goto End_QuestNpc00021 
}

CmpQuestNumStep( 88, 165 )
if( yes==1 ){
	D("그럼 나중에도 우리 형제의 안부를 전해주면 고맙겠네..")
	SetQuestNumStep( 88, 165 )
	goto End_QuestNpc00021 
}

;EQuest88_Npc00021
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
;SQuest33_Npc00033
CmpQuestNumStep(33,0)
if( yes==1 ){
	IsLevel(10)
	if(yes==1){
	D("길가는 모험자시여. 힘들고 지친 드워프에게 따뜻한 도움의 손길을 건네주오.")
	LogForScript(33,"저레벨 이펙트 무기 퀘스트 시작")
	SetQuestNumStep(33,5)
	goto End_QuestNpc00033 
}
	else{
	D("너무 배가 고파 말할 힘도 없군...")		;Stay0
	SetQuestNumStep(33,0)
	goto End_QuestNpc00033 
}
}

CmpQuestNumStep(33,5)
if( yes==1 ){
	D("너무 너무 배가 고파 발바닥이 땅에 붙었어.")
	SetQuestNumStep(33,10)
	goto End_QuestNpc00033 
}

CmpQuestNumStep(33,10)
if( yes==1 ){
	D("드워프가 아무리 바위와 흙을 벗삼아 산다고 하지만 이건 너무하다구.")
	SetQuestNumStep(33,15)
	goto End_QuestNpc00033 
}

CmpQuestNumStep(33,15)
if( yes==1 ){
	D("그러니 빵 하나만 줘.")
	SetQuestNumStep(33,20)
	goto End_QuestNpc00033 
}

CmpQuestNumStep(33,20)
if( yes==1 ){
	IsInvHavePC(3007)
	if(yes==1){
	DeleteItemMulti(3007,1)
	EventMsg("빵을 건네주었습니다.")
	SetQuestNumStep(33,25)
	goto End_QuestNpc00033 
}
	else{
	D("예전같으면 빵 한 개가 아니라 한 광주리씩 먹었을 나야. 너무 야박하게 굴지마.")		;Stay20
	SetQuestNumStep(33,20)
	goto End_QuestNpc00033 
}
}

CmpQuestNumStep(33,25)
if( yes==1 ){
	D("고마워.")
	LogForScript(33,"드워프에게 빵을 건네줌")
	SetQuestNumStep(33,30)
	goto End_QuestNpc00033 
}

CmpQuestNumStep(33,30)
if( yes==1 ){
	D("이런 이런... 고픈 배에 빵을 집어넣었더니 놀랐는지 오히려 배가 더 고파지는군.")
	SetQuestNumStep(33,35)
	goto End_QuestNpc00033 
}

CmpQuestNumStep(33,35)
if( yes==1 ){
	D("불쌍한 드워프에게 손을 내민 김에 한 번만 더 도와줘.")
	SetQuestNumStep(33,40)
	goto End_QuestNpc00033 
}

CmpQuestNumStep(33,40)
if( yes==1 ){
	D("스테이크하고 으음... 시원한 맥주 좀 부탁해.")
	SetQuestNumStep(33,45)
	goto End_QuestNpc00033 
}

CmpQuestNumStep(33,45)
if( yes==1 ){
	D("스테이크는 크고 두툼한 쇠고기로 5인분만. 물론 레어.")
	SetQuestNumStep(33,50)
	goto End_QuestNpc00033 
}

CmpQuestNumStep(33,50)
if( yes==1 ){
	D("그리고 맥주도 5잔 부탁해. 시원하게 해서 가져다줘.")
	SetQuestNumStep(33,55)
	goto End_QuestNpc00033 
}

CmpQuestNumStep(33,55)
if( yes==1 ){
	CheckItemMulti(3015,5)
	if(yes==1){
	CheckItemMulti(3023,5)
	if(yes==1){
	DeleteItemMulti(3015,5)
	EventMsg("스테이크 5인분을 씹지도 않고 삼켰습니다.")
	DeleteItemMulti(3023,5)
	EventMsg("맥주 5잔을 숨도 쉬지 않고 마셨습니다.")
	D("잘 먹고 잘 마셨어. 이제야 힘이 솟는군.")
	SetQuestNumStep(33,60)
	goto End_QuestNpc00033 
}
	else{
	D("이봐 나도 돈은 있어. crit이 아닌 cell이라서 그렇지...")		;Stay55
	SetQuestNumStep(33,55)
	goto End_QuestNpc00033 
}
}
	else{
	D("스테이크 5인분이 얼마나 한다고... 너무 째째하게 굴지마.")		;Stay50
	SetQuestNumStep(33,50)
	goto End_QuestNpc00033 
}
}

CmpQuestNumStep(33,60)
if( yes==1 ){
	D("감사의 표시로 이걸 주지.")
	LogForScript(33,"맥주와 스테이크를 건네줌")
	SetQuestNumStep(33,65)
	goto End_QuestNpc00033 
}
CmpQuestNumStep(33,65)
if( yes==1 ){
	IsLevel(30)
	if(yes==1){
	D("싸구려 맥주를 마셨더니 집에서 만들어 마시던 맥주 생각만 나는군.")
	D("그래도 집 생각이 나게 도와주니 고맙군.")
	SetQuestNumStep(33,70)
	goto End_QuestNpc00033 
}
	else{
	SetItemInvPC(0,5004,1)
	EventMsg("곡괭이 1개를 받았습니다.")
	D("이걸로 땅을 파면 지금까지 쓰던 것보다 훨씬 잘 파져.")
	D("지금 이게 평범한 곡괭이가 아닐까 의심하나본데 드워프를 믿으라구.")		;Stay0
	LogForScript(33,"30레벨이 안 되서 곡괭이만 받음")
	SetQuestNumStep(33,0)
	goto End_QuestNpc00033 
}
}

CmpQuestNumStep(33,70)
if( yes==1 ){
	D("사실 난 집없는 드워프야.")
	SetQuestNumStep(33,75)
	goto End_QuestNpc00033 
}

CmpQuestNumStep(33,75)
if( yes==1 ){
	D("너무 무서워서 너무 무서운 것들을 봐서 모든 것을 버리고 도망쳤어.")
	SetQuestNumStep(33,80)
	goto End_QuestNpc00033 
}

CmpQuestNumStep(33,80)
if( yes==1 ){
	D("그렇게 도망다니다가 조금이나마 용기를 찾아 여기까지 왔어.")
	SetQuestNumStep(33,85)
	goto End_QuestNpc00033 
}

CmpQuestNumStep(33,85)
if( yes==1 ){
	D("하지만 저 멀리 서있는 탑을 보니까 도저히 발을 뗄 수가 없어.")
	SetQuestNumStep(33,90)
	goto End_QuestNpc00033 
}

CmpQuestNumStep(33,90)
if( yes==1 ){
	D("술을 마셔서 공포스러웠던 기억을 잊을라치면 오히려 악몽만 꿔.")
	SetQuestNumStep(33,95)
	goto End_QuestNpc00033 
}

CmpQuestNumStep(33,95)
if( yes==1 ){
	D("나처럼 쓸모없는 드워프에게 인정을 베풀어주는 것을 보면 당신은 좋은 사람일거야.")
	SetQuestNumStep(33,100)
	goto End_QuestNpc00033 
}

CmpQuestNumStep(33,100)
if( yes==1 ){
	D("그렇다면 이걸 줄테니 부탁 하나만 할게.")
	SetQuestNumStep(33,105)
	goto End_QuestNpc00033 
}

CmpQuestNumStep(33,105)
if( yes==1 ){
	SetItemInvPC(0,5004,1)
	EventMsg("곡괭이 1개를 받았습니다.")
	LogForScript(33,"드워프의 이야기를 듣고 곡괭이를 받음")
	SetQuestNumStep(33,110)
	goto End_QuestNpc00033 
}

CmpQuestNumStep(33,110)
if( yes==1 ){
	D("이건 내 곡괭이야.")
	SetQuestNumStep(33,115)
	goto End_QuestNpc00033 
}

CmpQuestNumStep(33,115)
if( yes==1 ){
	D("램프 불빛에 눈이 멀고, 싼 술에 취해 나자빠진 드워프가 아니라면 누가 쓰던 것인지 알아볼거야.")
	SetQuestNumStep(33,120)
	goto End_QuestNpc00033 
}

CmpQuestNumStep(33,120)
if( yes==1 ){
	D("이걸 가지고 저 탑으로 가줘.")
	SetQuestNumStep(33,125)
	goto End_QuestNpc00033 
}

CmpQuestNumStep(33,125)
if( yes==1 ){
	D("그리고 우리 종족의 원한을 풀어줘.")
	LogForScript(33,"시커의 탑으로 이동")
	SetQuestNumStep(33,195)
	goto End_QuestNpc00033 
}

;EQuest33_Npc00033
:End_QuestNpc00033
end
@Npc00034	
end
@Npc00035	
;SQuest35_Npc00035
CmpQuestNumStep(35,0)
if( yes==1 ){
	IsLevel(10)
	if(yes==1){
	D("뭐야? 여자 드워프 처음 봐?")
	SetQuestNumStep(35,5)
	goto End_QuestNpc00035 
}
	else{
	EventMsg("...")		;Stay0
	SetQuestNumStep(35,0)
	goto End_QuestNpc00035 
}
}

CmpQuestNumStep(35,5)
if( yes==1 ){
	D("왜 믿을 수 없다는 눈으로 쳐다보는데?")
	SetQuestNumStep(35,10)
	goto End_QuestNpc00035 
}

CmpQuestNumStep(35,10)
if( yes==1 ){
	D("수염도 안 난 귀여운 어린 여자아이가 여자 드워프라고?")
	SetQuestNumStep(35,15)
	goto End_QuestNpc00035 
}

CmpQuestNumStep(35,15)
if( yes==1 ){
	D("누가 그런 거짓말을 하는거야?")
	SetQuestNumStep(35,20)
	goto End_QuestNpc00035 
}

CmpQuestNumStep(35,20)
if( yes==1 ){
	D("드워프는 여자라도 수염이 수북하게 난단 말이야!")
	SetQuestNumStep(35,25)
	goto End_QuestNpc00035 
}
CmpQuestNumStep(35,25)
if( yes==1 ){
	sIsDual()
	if(yes==1){
	D("좋은 정보 하나 알려주지.")
	SetQuestNumStep(35,30)
	goto End_QuestNpc00035 
}
	else{
	D("아직 넌 애송이군.")		;Stay25
	SetQuestNumStep(35,25)
	goto End_QuestNpc00035 
}
}

CmpQuestNumStep(35,30)
if( yes==1 ){
	D("이 탑 안에 내가 쓰던 방이 있어.")
	SetQuestNumStep(35,35)
	goto End_QuestNpc00035 
}

CmpQuestNumStep(35,35)
if( yes==1 ){
	D("그 방에 들어가려면 열쇠가 필요하지.")
	SetQuestNumStep(35,40)
	goto End_QuestNpc00035 
}

CmpQuestNumStep(35,40)
if( yes==1 ){
	D("그걸 구하려면 고생 좀 할거야.")
	SetQuestNumStep(35,0)
	goto End_QuestNpc00035 
}

;EQuest35_Npc00035
:End_QuestNpc00035
end
@Npc00036	
end
@Npc00037	
;SQuest37_Npc00037
CmpQuestNumStep(37,0)
if( yes==1 ){
	D("도대체 나는, 우리 일족은, 드워프들은 뭐를 한 거지?")
	SetQuestNumStep(37,5)
	goto End_QuestNpc00037 
}

CmpQuestNumStep(37,5)
if( yes==1 ){
	D("당신은 저 탑이 보이는가?")
	SetQuestNumStep(37,10)
	goto End_QuestNpc00037 
}

CmpQuestNumStep(37,10)
if( yes==1 ){
	D("보인다고?")
	SetQuestNumStep(37,15)
	goto End_QuestNpc00037 
}

CmpQuestNumStep(37,15)
if( yes==1 ){
	D("나는 보이지 않아.")
	SetQuestNumStep(37,20)
	goto End_QuestNpc00037 
}

CmpQuestNumStep(37,20)
if( yes==1 ){
	D("온통 암흑뿐이야.")
	SetQuestNumStep(37,25)
	goto End_QuestNpc00037 
}

CmpQuestNumStep(37,25)
if( yes==1 ){
	D("부탁이야. 나는 저 탑이 보고 싶어!")
	SetQuestNumStep(37,30)
	goto End_QuestNpc00037 
}

CmpQuestNumStep(37,30)
if( yes==1 ){
	IsInvHavePC(4026)
	if(yes==1){
	D("이건 뭐지? 마시라고?")
	EventMsg("시력 회복 포션 1개를 건네주었습니다.")
	DeleteItemMulti(4026,1)
	SetQuestNumStep(37,35)
	goto End_QuestNpc00037 
}
	else{
	D("내 시력은 되돌아오지 않는 것인가.")		;Stay30
	SetQuestNumStep(37,30)
	goto End_QuestNpc00037 
}
}

CmpQuestNumStep(37,35)
if( yes==1 ){
	D("아아~ 이제야 탑이 보이는구나.")
	SetQuestNumStep(37,40)
	goto End_QuestNpc00037 
}
CmpQuestNumStep(37,40)
if( yes==1 ){
	sIsDual()
	if(yes==1){
	D("원래 나는 장님이 아니었어.")
	SetQuestNumStep(37,45)
	goto End_QuestNpc00037 
}
	else{
	D("시력은 되돌아왔지만 옛 동료들은 돌아오지 않는군.")		;Stay40
	SetQuestNumStep(37,40)
	goto End_QuestNpc00037 
}
}

CmpQuestNumStep(37,45)
if( yes==1 ){
	D("공사가 끝나는 날 나는 빛나는 날개를 가진 것들에게 공격당했고...")
	SetQuestNumStep(37,50)
	goto End_QuestNpc00037 
}

CmpQuestNumStep(37,50)
if( yes==1 ){
	D("그 날 이후 눈이 보이지 않게 되었어.")
	SetQuestNumStep(37,55)
	goto End_QuestNpc00037 
}

CmpQuestNumStep(37,55)
if( yes==1 ){
	D("그래 날개야 날개.")
	SetQuestNumStep(37,60)
	goto End_QuestNpc00037 
}

CmpQuestNumStep(37,60)
if( yes==1 ){
	D("날개가 무슨 뜻인지는 잘 생각해봐.")
	SetQuestNumStep(37,45)
	goto End_QuestNpc00037 
}

;EQuest37_Npc00037
:End_QuestNpc00037
end
@Npc00038   
;SQuest38_Npc00038
CmpQuestNumStep(38,0)
if( yes==1 ){
	D("배고파. 배고파~ 배고파!")
	SetQuestNumStep(38,5)
	goto End_QuestNpc00038 
}

CmpQuestNumStep(38,5)
if( yes==1 ){
	D("목말라. 목말라~ 목말라!")
	SetQuestNumStep(38,10)
	goto End_QuestNpc00038 
}

CmpQuestNumStep(38,10)
if( yes==1 ){
	D("나에게 아직 집이 있던 시절에는 배고프다는 얘기나 목마르다는 얘기를 떠들어댄 적이 없었어.")
	SetQuestNumStep(38,15)
	goto End_QuestNpc00038 
}

CmpQuestNumStep(38,15)
if( yes==1 ){
	D("배가 고프고 목이 마르면 저장고에 들어가 햄을 베어먹고 맥주를 마셨지.")
	SetQuestNumStep(38,20)
	goto End_QuestNpc00038 
}

CmpQuestNumStep(38,20)
if( yes==1 ){
	D("그런 나의 집을, 나의 저장고를... 이제는 들어갈 수 없다니 눈물이 앞을 가리는군.")
	SetQuestNumStep(38,25)
	goto End_QuestNpc00038 
}

CmpQuestNumStep(38,25)
if( yes==1 ){
	D("그러니 나에게 맥주 한 잔만 사줘.")
	SetQuestNumStep(38,30)
	goto End_QuestNpc00038 
}

CmpQuestNumStep(38,30)
if( yes==1 ){
	IsInvHavePC(3023)
	if(yes==1){
	D("드워프의 맥주만 못하지만 그래도 맥주군.")
	SetQuestNumStep(38,35)
	goto End_QuestNpc00038 
}
	else{
	D("겨우 맥주 한 잔이라구.")		;Stay30
	SetQuestNumStep(38,30)
	goto End_QuestNpc00038 
}
}
CmpQuestNumStep(38,35)
if( yes==1 ){
	DeleteItemMulti(3023,1)
	EventMsg("맥주 1잔을 건네주었습니다.")
	SetQuestNumStep(38,40)
	goto End_QuestNpc00038 
}

CmpQuestNumStep(38,40)
if( yes==1 ){
	sIsDual()
	if(yes==1){
	D("맥주 한 잔짜리 정보를 주지.")
	SetQuestNumStep(38,45)
	goto End_QuestNpc00038 
}
	else{
	D("맥주 고마웠어.")		;Stay0
	SetQuestNumStep(38,0)
	goto End_QuestNpc00038 
}
}

CmpQuestNumStep(38,45)
if( yes==1 ){
	D("이 탑 여기저기에는 한 남자가 마법을 걸어서 들어갈 수 없는 곳이 있다더군.")
	SetQuestNumStep(38,50)
	goto End_QuestNpc00038 
}

CmpQuestNumStep(38,50)
if( yes==1 ){
	D("그 방에 들어가기 위해서는 열쇠가 필요하지.")
	SetQuestNumStep(38,55)
	goto End_QuestNpc00038 
}

CmpQuestNumStep(38,55)
if( yes==1 ){
	D("몬스터 중에서도 지위가 높은 몬스터들이 그 열쇠를 가지고 다닌다더군.")
	SetQuestNumStep(38,45)
	goto End_QuestNpc00038 
}

;EQuest38_Npc00038
:End_QuestNpc00038
end
@Npc00039	
;SQuest39_Npc00039
CmpQuestNumStep(39,0)
if( yes==1 ){
	D("너의 신발을 보여주겠나?")
	SetQuestNumStep(39,5)
	goto End_QuestNpc00039 
}

CmpQuestNumStep(39,5)
if( yes==1 ){
	D("잠깐. 신발 바닥만 보여줘.")
	SetQuestNumStep(39,10)
	goto End_QuestNpc00039 
}

CmpQuestNumStep(39,10)
if( yes==1 ){
	IsClassPC(1)
	if(yes==1){
	D("역시 그렇군.")
	SetQuestNumStep(39,15)
	goto End_QuestNpc00039 
}
	else{
	D("아냐. 내가 사람을 잘못 봤어.")		;Stay0
	SetQuestNumStep(39,0)
	goto End_QuestNpc00039 
}
}

CmpQuestNumStep(39,15)
if( yes==1 ){
	D("너는 손버릇이 나쁜 사람이군.")
	SetQuestNumStep(39,20)
	goto End_QuestNpc00039 
}

CmpQuestNumStep(39,20)
if( yes==1 ){
	D("너를 위해 좋은 선물을 하나 주겠다.")
	SetQuestNumStep(39,25)
	goto End_QuestNpc00039 
}

CmpQuestNumStep(39,25)
if( yes==1 ){
	D("나는 구석진 곳을 좋아해.")
	SetQuestNumStep(39,30)
	goto End_QuestNpc00039 
}

CmpQuestNumStep(39,30)
if( yes==1 ){
	D("그래서 이 탑을 만들 때 설계도를 살짝 고쳤어.")
	SetQuestNumStep(39,35)
	goto End_QuestNpc00039 
}

CmpQuestNumStep(39,35)
if( yes==1 ){
	D("내 이름은 버터핑거.")
	SetQuestNumStep(39,40)
	goto End_QuestNpc00039 
}

CmpQuestNumStep(39,40)
if( yes==1 ){
	D("너라면 이 정도만 얘기해도 무슨 뜻인지 잘 알거야.")
	SetQuestNumStep(39,15)
	goto End_QuestNpc00039 
}

;EQuest39_Npc00039
:End_QuestNpc00039
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
	MapMove("northern_w",531,355)
	if( yes == 1 ){
	EventMsg(" <노던바넨>으로 이동합니다. ")
}
	else{
	EventMsg(" 맵 이동에 실패했습니다. ")
}
end
@Event00002	
	SpellMapMove("존재를 증명하는 기억","sermenys_d1", 474, 11)
	if( yes == 1 ){
	EventMsg(" <세르메니스 던전>으로 이동합니다. ")
}
	else{
	EventMsg("주문을 외우셔야 이동할 수 있습니다.")
}
end
@Event00003
	MapMove("sky1",50,73)
	if( yes == 1 ){
	EventMsg("<노커의 탑>으로 이동합니다.")
}
	else{
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








