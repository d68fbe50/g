
@sys00	; 처음 서버 Setting하는 함수.

	MaxNPC( 50 )
	MapName( "Hegmonia" )
	
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
;; 무기점
	random( 0, 3 )
        if( ran == 0 )
        {
		D( "이 곳은 <헤게모니아> 지역 입니다." )
        }
        if( ran == 1 )
        {
        	D( "이 곳은 무기와 방어구를 사고 파는 곳입니다." )
        }
        if( ran == 2 )
        {
	        D( "이 곳에는 뭐하러 오셨습니까?" )
        }
        CallSmallMenu( 0, 18 )
end
@Npc00002
;; 목공소
	random( 0, 3 )
        if( ran == 0 )
        {
		D( "이 곳은 <헤게모니아> 지역입니다." )
        }
        if( ran == 1 )
        {
        	D( "이 곳은 나무로 된 스태프 등을 사고 파는 곳입니다." )
        }
        if( ran == 2 )
        {
	        D( "이 곳은 위험한 곳입니다. 에델브로이의 은총이 있기를." )
        }
        CallSmallMenu( 0, 26 )
end
@Npc00003
;; 활제작소
	random( 0, 3 )
        if( ran == 0 )
        {
		D( "이 곳은 <헤게모니아> 지역입니다." )
        }
        if( ran == 1 )
        {
        	D( "이 곳은 활과 화살을 사고 파는 곳입니다." )
        }
        if( ran == 2 )
        {
	        D( "당신은 궁수입니까? 궁수라면 꼭 다시 들러주십시오." )
        }
        CallSmallMenu( 0, 27 )
end
@Npc00004	
;; 연금술소 (포션)
	random( 0, 3 )
        if( ran == 0 )
        {
		D( "이 곳은 <헤게모니아> 지역입니다." )
        }
        if( ran == 1 )
        {
        	D( "이 곳은 포션을 사고 파는 곳입니다." )
        }
        if( ran == 2 )
        {
	        D( "연금술을 아십니까? 대륙 곳곳에는 연금술사들이 적지 않습니다." )
        }
        CallSmallMenu( 0, 25 )
end
@Npc00005
;; 빵집
	random( 0, 3 )
        if( ran == 0 )
        {
		D( "이 곳은 <헤게모니아> 지역입니다." )
        }
        if( ran == 1 )
        {
        	D( "이 곳은 빵과 같은 음식을 사고 파는 곳입니다." )
        }
        if( ran == 2 )
        {
	        D( "여행길에 배가 고프지 않도록 음식을 항상 준비를 하셔야 합니다." )
        }
        CallSmallMenu( 0, 20 )
end
@Npc00006
;; 주점
	random( 0, 3 )
        if( ran == 0 )
        {
		D( "이 곳은 <헤게모니아> 지역입니다." )
        }
        if( ran == 1 )
        {
        	D( "이 곳은 술을 파는 곳입니다." )
        }
        if( ran == 2 )
        {
	        D( "술이란 인생의 희노애락과 함께 하는 벗이지." )
        }
        CallSmallMenu( 0, 57 )
end
@Npc00007
;; 여관
	random( 0, 3 )
        if( ran == 0 )
        {
		D( "이 곳은 <헤게모니아> 지역입니다." )
        }
        if( ran == 1 )
        {
        	D( "죽은자에게 부활의 권능을 행할수 있는 곳입니다." )
        }
        if( ran == 2 )
        {
	        D( "긴 여행길에 지친 나그네들이 많이 들렀다가는 곳입니다." )
        }
        CallSmallMenu( 0, 67 )
end
@Npc00008
;; 잡화점
	random( 0, 3 )
        if( ran == 0 )
        {
		D( "이 곳은 <헤게모니아> 지역입니다." )
        }
        if( ran == 1 )
        {
        	D( "이 곳은 잡다한 것들을 사고 파는 곳입니다." )
        }
        if( ran == 2 )
        {
	        D( "코스모스와 대폭풍의 에델브로이 이름으로." )
        }
        CallSmallMenu( 0, 60 )
end
@Npc00009
;; 점성술사
	random( 0, 3 )
        if( ran == 0 )
        {
		D( "이 곳은 <헤게모니아> 지역입니다." )
        }
        if( ran == 1 )
        {
        	D( "이 곳은 마법을 배울 수 있으며, 포션도 파는 곳입니다." )
        }
        if( ran == 2 )
        {
	        D( "대륙의 곳곳에는 우리 점성술사의 길드가 있습니다." )
        }
        CallSmallMenu( 0, 71 )
end
@Npc00010
;; 집시 무기점
	random( 0, 3 )
        if( ran == 0 )
        {
		D( "이 곳은 던전으로 가는 입구가 많은 곳입니다." )
        }
        if( ran == 1 )
        {
        	D( "던전에 들어가기 전에 장비를 갖추고 가십시오." )
        }
        if( ran == 2 )
        {
	        D( "위험합니다. 당신은 이 곳에 들어가려는 거요?" )
        }
        CallSmallMenu( 0, 18 )
end
@Npc00011
;; 집시 목공소
	random( 0, 3 )
        if( ran == 0 )
        {
		D( "이 곳은 던전으로 가는 입구가 많은 곳입니다." )
        }
        if( ran == 1 )
        {
        	D( "던전에 들어가려고요? 조심하세요." )
        }
        if( ran == 2 )
        {
	        D( "당신에게 에델브로이의 은총이 함게 하기를." )
        }
        CallSmallMenu( 0, 26 )
end
@Npc00012
;; 집시 활제작
	random( 0, 3 )
        if( ran == 0 )
        {
		D( "이 곳은 던전으로 가는 입구가 많은 곳입니다." )
        }
        if( ran == 1 )
        {
        	D( "무서운 언데드 괴물들도 좋은 활과 화살만 있다면 두렵지 않지.." )
        }
        if( ran == 2 )
        {
	        D( "던전에서 길을 잃어버리면 갈림길의 테페리에게 기도를 드리세요.." )
        }
        CallSmallMenu( 0, 27 )
end
@Npc00013
;; 집시 포션
	random( 0, 3 )
        if( ran == 0 )
        {
		D( "이 곳은 던전으로 가는 입구가 많은 곳입니다. " )
        }
        if( ran == 1 )
        {
        	D( "이 곳은 포션을 대륙의 시세 그대로 팔고 있습니다." )
        }
        if( ran == 2 )
        {
	        D( "던전에 들어가려면 포션을 한 가득 들고 가셔야 할 겁니다." )
        }
        CallSmallMenu( 0, 25 )
end
@Npc00014
;; 집시 빵집
	random( 0, 3 )
        if( ran == 0 )
        {
		D( "이 곳은 던전으로 가는 입구가 많은 곳입니다. " )
        }
        if( ran == 1 )
        {
        	D( "빵이 없으면 자유도 없네." )
        }
        if( ran == 2 )
        {
	        D( "당신은 빵을 선택할 것인가? 자유를 선택할 것인가?" )
        }
        CallSmallMenu( 0, 20 )
end
@Npc00015
;; 의류점
	random( 0, 3 )
        if( ran == 0 )
        {
		D( "이 곳은 <헤게모니아> 지역입니다." )
        }
        if( ran == 1 )
        {
        	D( "던전에 들어가더라도 옷은 입어야지?" )
        }
        if( ran == 2 )
        {
	        D( "좋은 옷은 좋은 방어력을 갖추고 있습니다." )
        }
        CallSmallMenu( 0, 24 )
end
@Npc00016
;; 정보자1
	random( 0, 3 )
        if( ran == 0 )
        {
		D( "안녕하세요. " )
        }
        if( ran == 1 )
        {
        	D( "저에게 중요한 정보가 있는데." )
        }
        if( ran == 2 )
        {
	        D( "요즘 이 곳의 소문을 듣고 찾아오는 사람이 많습니다." )
        }
end
@Npc00017
;; 정보자2
	random( 0, 3 )
        if( ran == 0 )
        {
		D( "당신은 이 곳에 무슨 일로 오셨나요?" )
        }
        if( ran == 1 )
        {
        	D( "저는 아무것도 모릅니다." )
        }
        if( ran == 2 )
        {
	        D( "당신은 누구십니까?" )
        }
end
@Npc00018
end
@Npc00019
end
@Npc00020
;SQuest81_Npc00020
CmpQuestNumStep( 81, 0 )
if( yes==1 ){
	SendSound(0,  1312)
	D("안녕하신가. 내 쌍둥이 동생을 보지 못했나?")
	SetQuestNumStep( 81, 5 )
	goto End_QuestNpc00020 
}

CmpQuestNumStep( 81, 5 )
if( yes==1 ){
	D("내 쌍둥이 동생은 하루 종일 잠만 잔다네. 엉덩이를 붙일 수 있는 곳이면 꾸벅꾸벅 졸지.")
	SetQuestNumStep( 81, 10 )
	goto End_QuestNpc00020 
}

CmpQuestNumStep( 81, 10 )
if( yes==1 ){
	D("내일이 세상의 종말이라 해도 어디 구석에 박혀 졸고 있을 거야.")
	SetQuestNumStep( 81, 15 )
	goto End_QuestNpc00020 
}

CmpQuestNumStep( 81, 15 )
if( yes==1 ){
	D("내 동생이 어디서 졸고 있는지 찾아서 이걸 전해주게. 잠을깨는 약이네.")
	SetQuestNumStep( 81, 20 )
	goto End_QuestNpc00020 
}

CmpQuestNumStep( 81, 20 )
if( yes==1 ){
	SetItemInvPC(0,  10217,  1)
	EventMsg("잠을 깨는 약을 받았습니다.")
	SetQuestNumStep( 81, 25 )
	goto End_QuestNpc00020 
}

CmpQuestNumStep( 81, 25 )
if( yes==1 ){
	D("내 동생은 주로 마을 밖 폐허가 된 집 안에서 잠을 잘 잔다네.")
	SetQuestNumStep( 81, 30 )
	goto End_QuestNpc00020 
}
CmpQuestNumStep( 81, 70 )
if( yes==1 ){
	D("그래. 내 동생을 발견했는가?")
	SendSound(0,  91)
	SetQuestNumStep( 81, 75 )
	goto End_QuestNpc00020 
}

CmpQuestNumStep( 81, 75 )
if( yes==1 ){
	IsInvHavePC(3014)
	if(yes==1){
	SetItemInvPC(3014,   0,   0)
	EventMsg("쌍둥이 동생한테 받은 '미트볼'을 형에게 줬습니다.")
	SetQuestNumStep( 81, 80 )
	goto End_QuestNpc00020 
}
	else{
	D("아직 발견 못했나 보군..  내 동생은 마을 주변 농장 근처에서 잠을 잘 잔다네..")		;Stay75
	SetQuestNumStep( 81, 75 )
	goto End_QuestNpc00020 
}
}

CmpQuestNumStep( 81, 80 )
if( yes==1 ){
	SendSound(0,  1308)
	D("그녀석 잔꾀를 냈군. 하하. 하여튼 고마우이. 미트볼이 그렇게 먹고 싶었다니까.")
	FameUp2(1,  10)
	EventMsg("고마움의 표시로 명성 10을 받았습니다.")		;End
	SetQuestNumStep( 81, 9999 )
	goto End_QuestNpc00020 
}

;EQuest81_Npc00020
:End_QuestNpc00020
end
@Npc00021
;SQuest81_Npc00021
CmpQuestNumStep( 81, 30 )
if( yes==1 ){
	SendSound(0,  1302)
	D("내 단잠을 깨우지말아. 지금 꿈에서 미녀가 나왔단 말이야. 어서 2부를 꾸어야 겠어.")
	SetQuestNumStep( 81, 35 )
	goto End_QuestNpc00021 
}

CmpQuestNumStep( 81, 35 )
if( yes==1 ){
	IsInvHavePC(10217)
	if(yes==1){
	SendSound(0,  2408)
	SetItemInvPC(10217,    0,    0)
	EventMsg("쌍둥이 동생에게 잠을 깨게 하는 약을 줬습니다.")
	SetQuestNumStep( 81, 40 )
	goto End_QuestNpc00021 
}
	else{
	SendSound(0,  1302)
	D("내 단잠을 깨우지 말란말이야.")		;Stay35
	SetQuestNumStep( 81, 35 )
	goto End_QuestNpc00021 
}
}

CmpQuestNumStep( 81, 40 )
if( yes==1 ){
	D("이거 뭐지? 주는거니까 받기는 하지만..")
	SendSound(0,  93)
	SetQuestNumStep( 81, 45 )
	goto End_QuestNpc00021 
}

CmpQuestNumStep( 81, 45 )
if( yes==1 ){
	D("어? 잠이 싹 달아났군. 이런....")
	SendSound(0,  1304)
	SetQuestNumStep( 81, 50 )
	goto End_QuestNpc00021 
}

CmpQuestNumStep( 81, 50 )
if( yes==1 ){
	D("아! 생각해보니 내 쌍둥이 형이 미트볼을 구해오라고 시켰는데, 깜빡하고 졸고 있었구만. 이거 큰일이네 흠..")
	SetQuestNumStep( 81, 55 )
	goto End_QuestNpc00021 
}

CmpQuestNumStep( 81, 55 )
if( yes==1 ){
	D("그래.. 자네가 내 쌍둥이 형에게 가서 이걸 전해주게. 내가 가져가면 아마 화를 낼거야.")
	SetQuestNumStep( 81, 60 )
	goto End_QuestNpc00021 
}

CmpQuestNumStep( 81, 60 )
if( yes==1 ){
	SetItemInvPC(0,   3014,  1)
	EventMsg("쌍둥이 동생에게서 미트볼을 받았습니다.")
	SetQuestNumStep( 81, 65 )
	goto End_QuestNpc00021 
}

CmpQuestNumStep( 81, 65 )
if( yes==1 ){
	D("아! 난 세상에서 쌍둥이 형이 제일 무섭다네. 그는 잠이 없는 사람이거든")
	SetQuestNumStep( 81, 70 )
	goto End_QuestNpc00021 
}

;EQuest81_Npc00021
:End_QuestNpc00021
end
@Npc00022
;SQuest82_Npc00022
CmpQuestNumStep( 82, 0 )
if( yes==1 ){
	D("배가 고파 움직일 수 없네요. 배가 고파 걸을 수조차 없습니다.")
	SendSound(0,  1312)
	SetQuestNumStep( 82, 5 )
	goto End_QuestNpc00022 
}

CmpQuestNumStep( 82, 5 )
if( yes==1 ){
	D("굶은지 며칠이 됐거든요.")
	SetQuestNumStep( 82, 10 )
	goto End_QuestNpc00022 
}

CmpQuestNumStep( 82, 10 )
if( yes==1 ){
	D("모든 음식을 먹고 싶지만 특히 소고기 스테이크가 먹고 싶어 미치겠습니다.")
	SetQuestNumStep( 82, 15 )
	goto End_QuestNpc00022 
}

CmpQuestNumStep( 82, 15 )
if( yes==1 ){
	IsInvHavePC(3015)
	if(yes == 1){
	SetItemInvPC(3015,   0,   0)
	EventMsg("소고기 스테이크를 배고픈 사람에게 줬습니다.")
	SetQuestNumStep( 82, 20 )
	goto End_QuestNpc00022 
}
	else{
	SendSound(0,  1303)
	D("소고기 스테이크가 먹고 싶어 미치겠습니다.")		;Stay15
	SetQuestNumStep( 82, 15 )
	goto End_QuestNpc00022 
}
}

CmpQuestNumStep( 82, 20 )
if( yes==1 ){
	D("정말 고맙습니다. 정말 친절하신 분이군요.")
	SendSound(0,  1308)
	SetQuestNumStep( 82, 25 )
	goto End_QuestNpc00022 
}

CmpQuestNumStep( 82, 25 )
if( yes==1 ){
	D("보답의 의미로 일곱 영웅 전설에 대해서 얘기해 주지요.")
	SetQuestNumStep( 82, 30 )
	goto End_QuestNpc00022 
}

CmpQuestNumStep( 82, 30 )
if( yes==1 ){
	D("국가를 세우던 일곱 영웅들이 있었습니다. 일곱 영웅들은 각기 독특한 능력을 지니고 있었습니다.")
	SetQuestNumStep( 82, 35 )
	goto End_QuestNpc00022 
}

CmpQuestNumStep( 82, 35 )
if( yes==1 ){
	D("전사, 도둑, 성직자, 마법사, 궁수, 엘프 그리고 드래곤라자.")
	SetQuestNumStep( 82, 40 )
	goto End_QuestNpc00022 
}

CmpQuestNumStep( 82, 40 )
if( yes==1 ){
	D("일곱 명의 영웅들은 어느 날 같은 계시를 받고 한 곳에 모였으며,")
	SetQuestNumStep( 82, 45 )
	goto End_QuestNpc00022 
}

CmpQuestNumStep( 82, 45 )
if( yes==1 ){
	D("과거 대전쟁의 굴레에서 벗어나기 위해 그들은 드래곤 로드에게 대항하기 시작했습니다.")
	SetQuestNumStep( 82, 50 )
	goto End_QuestNpc00022 
}

CmpQuestNumStep( 82, 50 )
if( yes==1 ){
	D("그들은 급기야 드래곤 로드를 잠들게 하였지요.")
	SetQuestNumStep( 82, 55 )
	goto End_QuestNpc00022 
}

CmpQuestNumStep( 82, 55 )
if( yes==1 ){
	D("그리고 그들은 찬란한 별이 되어 지금의 국가가 생기게 된 것입니다.")
	SetQuestNumStep( 82, 60 )
	goto End_QuestNpc00022 
}

CmpQuestNumStep( 82, 60 )
if( yes==1 ){
	D("그리고 그 일곱 별을 모을 수 있는 자신들의 후예를 찾는다 하였습니다.")
	SetQuestNumStep( 82, 65 )
	goto End_QuestNpc00022 
}

CmpQuestNumStep( 82, 65 )
if( yes==1 ){
	D("많은 시험과 과정이 기다리고 있으며, 그 첫 발걸음을 할 수 있는 것은 어디에 존재하는지는 아직 알려진 바가 없습니다.")
	SetQuestNumStep( 82, 70 )
	goto End_QuestNpc00022 
}

CmpQuestNumStep( 82, 70 )
if( yes==1 ){
	D("일곱 영웅의 후예라고 자처하던 자들은 하나 같이 영웅의 마지막 전투가 벌어졌던 곳으로 찾아갔으나.")
	SetQuestNumStep( 82, 75 )
	goto End_QuestNpc00022 
}

CmpQuestNumStep( 82, 75 )
if( yes==1 ){
	D("다시는 돌아오지 못 했다고 합니다.")
	SetQuestNumStep( 82, 80 )
	goto End_QuestNpc00022 
}

CmpQuestNumStep( 82, 80 )
if( yes==1 ){
	D("그곳은 위험하고 또 신비에 가려졌기 때문입니다.")
	SetQuestNumStep( 82, 85 )
	goto End_QuestNpc00022 
}

CmpQuestNumStep( 82, 85 )
if( yes==1 ){
	D("아.. 말을 많이 했더니 이번에는 맥주가 마시고 싶습니다.")
	SetQuestNumStep( 82, 90 )
	goto End_QuestNpc00022 
}

CmpQuestNumStep( 82, 90 )
if( yes==1 ){
	IsInvHavePC(3023)
	if(yes == 1){
	SetItemInvPC(3023,   0,   0)
	EventMsg("맥주를 목이 마른 사람에게 줬습니다.")
	SetQuestNumStep( 82, 95 )
	goto End_QuestNpc00022 
}
	else{
	SendSound(0,  1303)
	D("아... 말을 많이 했더니 이번에는 맥주가 마시고 싶습니다..")		;Stay90
	SetQuestNumStep( 82, 90 )
	goto End_QuestNpc00022 
}
}

CmpQuestNumStep( 82, 95 )
if( yes==1 ){
	D("정말 친절하신 분이군요.")
	SendSound(0,  1311)
	SetQuestNumStep( 82, 100 )
	goto End_QuestNpc00022 
}

CmpQuestNumStep( 82, 100 )
if( yes==1 ){
	D("영웅의 전설을 쫓는 것은 아주 보람찬 일이 될 것입니다.")
	SetQuestNumStep( 82, 105 )
	goto End_QuestNpc00022 
}

CmpQuestNumStep( 82, 105 )
if( yes==1 ){
	SendSound(0,  51)
	FameUp2(1,  10)
	EventMsg("명성 10 이 올라갔습니다.")		;End
	SetQuestNumStep( 82, 9999 )
	goto End_QuestNpc00022 
}

;EQuest82_Npc00022
:End_QuestNpc00022
end
@Npc00023
end
@Npc00024
;SQuest84_Npc00024
CmpQuestNumStep( 84, 0 )
if( yes==1 ){
	D("소문을 혹시 들으셨습니까?")
	SendSound(0,  91)
	SetQuestNumStep( 84, 5 )
	goto End_QuestNpc00024 
}

CmpQuestNumStep( 84, 5 )
if( yes==1 ){
	D("핸슨씨가 요즘 미친 사람처럼 아무에게나 자신의 모든 것을 가르치고 있다고 합니다.")
	SetQuestNumStep( 84, 10 )
	goto End_QuestNpc00024 
}

CmpQuestNumStep( 84, 10 )
if( yes==1 ){
	D("그 사람은 언제나 다른 사람을 괴롭히더니 갑자기 사람이 변했답니다.")
	SetQuestNumStep( 84, 15 )
	goto End_QuestNpc00024 
}

CmpQuestNumStep( 84, 15 )
if( yes==1 ){
	D("그 사람은 지금쯤 마을 북쪽 근처에 있을겁니다.")
	SetQuestNumStep( 84, 20 )
	goto End_QuestNpc00024 
}

;EQuest84_Npc00024
:End_QuestNpc00024
end
@Npc00025
;SQuest84_Npc00025
CmpQuestNumStep( 84, 20 )
if( yes==1 ){
	D("자네도 나에게 볼 일이 있어 왔나?")
	SendSound(0,  94)
	SetQuestNumStep( 84, 25 )
	goto End_QuestNpc00025 
}

CmpQuestNumStep( 84, 25 )
if( yes==1 ){
	D("난 자네에게 모든 것을 줄 수 있네. 단 한가지 부탁이 있다네.")
	SetQuestNumStep( 84, 30 )
	goto End_QuestNpc00025 
}

CmpQuestNumStep( 84, 30 )
if( yes==1 ){
	D("나의 부탁을 들어준다면 자네에게 모든 것을 물려주겠네. 어떤가? 들어주겠나?")
	SetQuestNumStep( 84, 35 )
	goto End_QuestNpc00025 
}

CmpQuestNumStep( 84, 35 )
if( yes==1 ){
	D("자네에게 부탁할 것은 그리 어려운 일이 아니네.")
	SetQuestNumStep( 84, 40 )
	goto End_QuestNpc00025 
}

CmpQuestNumStep( 84, 40 )
if( yes==1 ){
	D("웨스트 그레이드에 가면 '린다' 라는 여인이 있네.")
	SetQuestNumStep( 84, 45 )
	goto End_QuestNpc00025 
}

CmpQuestNumStep( 84, 45 )
if( yes==1 ){
	D("무척 아름다운 여인이야..")
	SendSound(0,  93)
	SetQuestNumStep( 84, 50 )
	goto End_QuestNpc00025 
}

CmpQuestNumStep( 84, 50 )
if( yes==1 ){
	D("첫 눈에 반한다, 뭐 그런 말이 사실인 것을 알게 해 준 여인이었어.")
	SetQuestNumStep( 84, 55 )
	goto End_QuestNpc00025 
}

CmpQuestNumStep( 84, 55 )
if( yes==1 ){
	D("자네도 소문을 들어서 알고 있을 테지만. 나에 대한 평판은 그리 좋은 것이 아닐세.")
	SetQuestNumStep( 84, 60 )
	goto End_QuestNpc00025 
}

CmpQuestNumStep( 84, 60 )
if( yes==1 ){
	D("나의 짓궃은 심술과 힘의 기운을 믿고 사람들을 괴롭혔으니까말이야.")
	SetQuestNumStep( 84, 65 )
	goto End_QuestNpc00025 
}

CmpQuestNumStep( 84, 65 )
if( yes==1 ){
	D("아마 그 여인도 나에 대해서 별로 좋지 않게 생각할 거네")
	SetQuestNumStep( 84, 70 )
	goto End_QuestNpc00025 
}

CmpQuestNumStep( 84, 70 )
if( yes==1 ){
	D("난 그게 마음에 걸려 그녀에게 어떤 말도 할 수 없었네.")
	SetQuestNumStep( 84, 75 )
	goto End_QuestNpc00025 
}

CmpQuestNumStep( 84, 75 )
if( yes==1 ){
	D("그녀에게 가 내 마음을 전하고 싶지만 요즘 들어 그 여인에게 근심이 있는지 차마 말을 걸지 못하고 있네..")
	SetQuestNumStep( 84, 80 )
	goto End_QuestNpc00025 
}

CmpQuestNumStep( 84, 80 )
if( yes==1 ){
	D("부탁이네만.. 그 여인에게 무슨 일이 있는지 알아봐 주겠는가?")
	SetQuestNumStep( 84, 85 )
	goto End_QuestNpc00025 
}
CmpQuestNumStep( 84, 125 )
if( yes==1 ){
	D("그녀에게 그런 일이 있었군..")
	SetQuestNumStep( 84, 130 )
	goto End_QuestNpc00025 
}

CmpQuestNumStep( 84, 130 )
if( yes==1 ){
	D("난 그런 것도 모르고 나의 감정만을 생각했어..")
	SetQuestNumStep( 84, 135 )
	goto End_QuestNpc00025 
}

CmpQuestNumStep( 84, 135 )
if( yes==1 ){
	D("그래도 그 여인의 근심을 알아봐줘서 고맙네.. 나의 성의이니 받아주게나..")
	FameUp2(1,   15)
	EventMsg("명성 15 가 올랐습니다.")
	SetQuestNumStep( 84, 140 )
	goto End_QuestNpc00025 
}

CmpQuestNumStep( 84, 140 )
if( yes==1 ){
	D("흠.. 그래도 걱정이군..")
	SetQuestNumStep( 84, 145 )
	goto End_QuestNpc00025 
}

CmpQuestNumStep( 84, 145 )
if( yes==1 ){
	D("자네에게 한 가지 더 부탁을 해도 될까?")
	SetQuestNumStep( 84, 150 )
	goto End_QuestNpc00025 
}

CmpQuestNumStep( 84, 150 )
if( yes==1 ){
	D("내 심정은 어떻게 해서든지 그녀의 근심을 없애주고 싶네...")
	SetQuestNumStep( 84, 155 )
	goto End_QuestNpc00025 
}

CmpQuestNumStep( 84, 155 )
if( yes==1 ){
	D("하지만 나는 어둠의 약을 구하는 방법은 알고 있지만 구할 수 있는 능력이 되지 않아..")
	SetQuestNumStep( 84, 160 )
	goto End_QuestNpc00025 
}

CmpQuestNumStep( 84, 160 )
if( yes==1 ){
	IsLevel(50)
	if(yes == 1){
	D("흠 그래 자네 정도의 능력이라면 가능할 거야..")
	SetQuestNumStep( 84, 165 )
	goto End_QuestNpc00025 
}
	else{
	D("흠.. 안되겠군.. 최소한 레벨 50 은 되야 한다네.. 자네의 능력이 높아지면 다시 찾아와 주게나..부탁이네..")		;Stay160
	SetQuestNumStep( 84, 160 )
	goto End_QuestNpc00025 
}
}

CmpQuestNumStep( 84, 165 )
if( yes==1 ){
	D("부탁을 들어준다니 정말 고맙네...")
	SetQuestNumStep( 84, 170 )
	goto End_QuestNpc00025 
}

CmpQuestNumStep( 84, 170 )
if( yes==1 ){
	D("그럼 얘기를 잘 들어보게... '뱀파이어'라고 들어본 적 있나?")
	SetQuestNumStep( 84, 175 )
	goto End_QuestNpc00025 
}

CmpQuestNumStep( 84, 175 )
if( yes==1 ){
	D("지하던전을 지키고 있으며 대마법사 리치의 신임을 얻고 있는 부하이기도 하지..")
	SetQuestNumStep( 84, 180 )
	goto End_QuestNpc00025 
}

CmpQuestNumStep( 84, 180 )
if( yes==1 ){
	D("그 뱀파이어가 어둠의 병을 치료할 수 있는 약인 '어둠의치료약'을 가지고 있다네..")
	SetQuestNumStep( 84, 185 )
	goto End_QuestNpc00025 
}

CmpQuestNumStep( 84, 185 )
if( yes==1 ){
	D("뱀파이어로부터 항상 '어둠의 치료약'을 구할 수 있는 것은 아니라서 아마 여러번 가봐야 할거야..")
	SetQuestNumStep( 84, 190 )
	goto End_QuestNpc00025 
}

CmpQuestNumStep( 84, 190 )
if( yes==1 ){
	D("뱀파이어는 월요일 22시, 수요일 20시, 금요일 18시에 주로 활동한다는 애기가 있으니 기회를 놓치지 말게나..")
	SetQuestNumStep( 84, 195 )
	goto End_QuestNpc00025 
}

CmpQuestNumStep( 84, 195 )
if( yes==1 ){
	D("꼭 부탁이네.. '어둠의 치료약'를 나에게 구해다 주게나..")
	SetQuestNumStep( 84, 200 )
	goto End_QuestNpc00025 
}
CmpQuestNumStep( 84, 200 )
if( yes==1 ){
	IsInvHavePC(10218)
	if(yes == 1){
	SetItemInvPC(10218,   0,   0)
	EventMsg("'어둠의 치료약'를 구해줬습니다.")
	SetQuestNumStep( 84, 205 )
	goto End_QuestNpc00025 
}
	else{
	D("뱀파이어는 월요일 22시, 수요일 20시, 금요일 18시에 지하던전에서 활동을 한다네...")		;Stay200
	SetQuestNumStep( 84, 200 )
	goto End_QuestNpc00025 
}
}

CmpQuestNumStep( 84, 205 )
if( yes==1 ){
	D("아니.. 벌써 '어둠의치료약'를 구해가지고 왔나?")
	SetQuestNumStep( 84, 210 )
	goto End_QuestNpc00025 
}

CmpQuestNumStep( 84, 210 )
if( yes==1 ){
	D("역시 내가 사람을 잘 못 보지는 않았군..")
	SetQuestNumStep( 84, 215 )
	goto End_QuestNpc00025 
}

CmpQuestNumStep( 84, 215 )
if( yes==1 ){
	D("정말 고맙네.. 드디어 그 여인을 도울 수 있는 일이 생겼어..")
	SetQuestNumStep( 84, 220 )
	goto End_QuestNpc00025 
}

CmpQuestNumStep( 84, 220 )
if( yes==1 ){
	D("내 고마움의 표시로 내가 소중히 하던 물건을 주겠네..")
	SetQuestNumStep( 84, 225 )
	goto End_QuestNpc00025 
}

CmpQuestNumStep( 84, 225 )
if( yes==1 ){
	sSetRareItemInvPc(9026,1,2,2,2)
	EventMsg("부탁의 대가로 아이템을 받았습니다.")
	SetQuestNumStep( 84, 230 )
	goto End_QuestNpc00025 
}

CmpQuestNumStep( 84, 230 )
if( yes==1 ){
	D("이 물건은 과거에 여행을 하던 도중 아비스 미궁에서 구하게 됐어지..")
	SetQuestNumStep( 84, 235 )
	goto End_QuestNpc00025 
}

CmpQuestNumStep( 84, 235 )
if( yes==1 ){
	D("사실 나에게는 너무 과분한 물건이기에 제대로 사용할 수도 없었다네..")
	SetQuestNumStep( 84, 240 )
	goto End_QuestNpc00025 
}

CmpQuestNumStep( 84, 240 )
if( yes==1 ){
	D("아마 자네라면 이 물건의 주인으로서 적당할 거야...")
	SetQuestNumStep( 84, 245 )
	goto End_QuestNpc00025 
}

CmpQuestNumStep( 84, 245 )
if( yes==1 ){
	D("내가 그 여인과 잘 될 수 있기를 꼭 빌어주게나...")
	SetQuestNumStep( 84, 250 )
	goto End_QuestNpc00025 
}

CmpQuestNumStep( 84, 250 )
if( yes==1 ){
	D("어둠의 병을 치료할 수 있는 약을 받고 기뻐할 그 여인을 생각하니.. 더이상 기다릴 수가 없어..")
	SetQuestNumStep( 84, 255 )
	goto End_QuestNpc00025 
}

CmpQuestNumStep( 84, 255 )
if( yes==1 ){
	D("그럼.. 자네에게도 신의 영광이 있기를 빌겠네..")
	SetQuestNumStep( 84, 255 )
	goto End_QuestNpc00025 
}

;EQuest84_Npc00025
:End_QuestNpc00025
end
@Npc00026
end
@Npc00027
end
@Npc00028
end
@Npc00029
;SQuest29_Npc00029
CmpQuestNumStep(29,0)
	if(yes==1){
	sIsDual()
	if(yes==1){
	D("아... 도저히 수면에 미래가 떠오르지 않는군요.")		;Stay10
	SetQuestNumStep(29,10)
	goto End_QuestNpc00029 
}
}
 
CmpQuestNumStep(29,10)
	if(yes==1){
	D("더욱 강해지기 위해 정진하는 그대에게 도움을 청합니다.")		;Stay20
	SetQuestNumStep(29,20)
	goto End_QuestNpc00029 
}
 
CmpQuestNumStep(29,20)
	if(yes==1){
	CmpQuestNumStep(72,106)
	if(yes==1){
	D("공포의 데스나이트")		;Stay100
	SetQuestNumStep(29,100)
	goto End_QuestNpc00029 
}
	else{
	CmpQuestNumStep(72,108)
	if(yes==1){
	D("블리츠...")		;Stay200
	SetQuestNumStep(29,200)
	goto End_QuestNpc00029 
}
	else{
	CmpQuestNumStep(73,106)
	if(yes==1){
	D("불꽃의 마신 이프리트...")		;Stay300
	SetQuestNumStep(29,300)
	goto End_QuestNpc00029 
}
	else{
	D("...")		;Stay0
	SetQuestNumStep(29,0)
	goto End_QuestNpc00029 
}
}
}
}
CmpQuestNumStep(29,100)
	if(yes==1){
	D("지하 던전에서 끝없는 공포의 부활만을 꿈꾸고 있는 데스나이트를 해치워주세요.")
	SetQuestNumStep(29,105)
	goto End_QuestNpc00029 
}
 
CmpQuestNumStep(29,105)
if( yes==1 ){
	D("그리고 증거로 데스나이트의 투구를 가져다주세요.")	
	SetQuestNumStep(29,110)
	goto End_QuestNpc00029 
}

CmpQuestNumStep(29,110)
if( yes==1 ){
	IsInvHavePC(10261)	;;데스나이트의 투구
	if(yes==1){
	D("임무에 성공하셨군요. 사례로 부탁받은 흐름의 조각을 드리겠습니다.")
	SetItemInvPC(10261,0,0)
	Qcount = Qcount + 1
	CallMenu(27)
	LogDualQuest(72,Qcount,"듀얼 1차 퀘스트",0)	;;듀얼 퀘스트 로그 파일
	SetQuestNumStep(29,115)
	goto End_QuestNpc00029 
}
	else{
	SendSound(0,1303)
	D("데스나이트를 쓰러뜨리고 데스나이트의 투구를 가져다주세요.")		;Stay110
	SetQuestNumStep(29,110)
	goto End_QuestNpc00029 
}
}

CmpQuestNumStep(29,115)
if( yes==1 ){
	EventMsg("임무를 성공적으로 수행하셨습니다.")
	if(Qcount>23){
	D("아... 타블렛을 다 완성하셨군요. 듀얼 등급을 올릴 수 있는 첫 번째 시험에 통과하셨습니다.")
	D("콜로서스 아레나의 은빛 기사를 찾아가세요.")		;Stay185
	SetQuestNumStep(72,185)
	SetQuestNumStep(29,0)
	goto End_QuestNpc00032 
}
	else{
	D("다음 임무 수행을 위해서는 콜로서스 아레나의 은빛 기사를 찾아가세요.")	;Stay105
	SetQuestNumStep(72,105)
	SetQuestNumStep(29,0)
	goto End_QuestNpc00032 
}
}
CmpQuestNumStep(29,200)
	if(yes==1){
	D("블리츠에게서 영롱한 보석이 나온다는 이야기가 있습니다.")
	SetQuestNumStep(29,205)
	goto End_QuestNpc00029 
}
 
CmpQuestNumStep(29,205)
if( yes==1 ){
	D("어둠 던전의 블리츠에게서 블리츠의 원석을 가져다주세요.")
	SetQuestNumStep(29,210)
	goto End_QuestNpc00029 
}

CmpQuestNumStep(29,210)
if( yes==1 ){
	IsInvHavePC(10262)	;;블리츠의 원석
	if(yes==1){
	D("임무에 성공하셨군요. 사례로 흐름의 조각을 드리겠습니다.")
	SetItemInvPC(10262,0,0)
	Qcount = Qcount + 1
	CallMenu(27)
	LogDualQuest(72,Qcount,"듀얼 1차 퀘스트",0)	;;듀얼 퀘스트 로그 파일
	SetQuestNumStep(29,215)
	goto End_QuestNpc00029 
}
	else{
	SendSound(0,1303)
	D("블리츠의 원석을 가져다주세요.")		;Stay210
	SetQuestNumStep(29,210)
	goto End_QuestNpc00029 
}
}

CmpQuestNumStep(29,215)
if( yes==1 ){
	EventMsg("임무를 성공적으로 수행하셨습니다.")
	if(Qcount>23){
	D("아... 타블렛을 다 완성하셨군요. 듀얼 등급을 올릴 수 있는 두 번째 시험에 통과하셨습니다.")
	D("콜로서스 아레나의 은빛 기사를 찾아가세요.")		;Stay185
	SetQuestNumStep(72,185)
	SetQuestNumStep(29,0)
	goto End_QuestNpc00032
}
	else{
	D("다음 임무 수행을 위해서 콜로서스 아레나의 은빛 기사를 찾아가세요.")	;Stay105
	SetQuestNumStep(72,105)
	SetQuestNumStep(29,0)
	goto End_QuestNpc00032 
}
}
CmpQuestNumStep(29,300)
	if(yes==1){
	D("이프리트의 불꽃 속에는 엄청난 힘이 숨겨져있다는데 그것을 시험해보려고 합니다.")
	SetQuestNumStep(29,305)
	goto End_QuestNpc00029 
}
 
CmpQuestNumStep(29,305)
if( yes==1 ){
	D("불의 던전의 이프리트에게서 불꽃을 가져다 주셨으면 합니다.")	
	SetQuestNumStep(29,310)
	goto End_QuestNpc00029 
}

CmpQuestNumStep(29,310)
if( yes==1 ){
	IsInvHavePC(10263)	;;이프리트의 불꽃
	if(yes==1){
	D("임무에 성공하셨군요. 사례로 흐름의 조각을 드리겠습니다.")
	SetItemInvPC(10263,0,0)
	Qcount = Qcount + 1
	CallMenu(27)
	LogDualQuest(73,Qcount,"듀얼 2차 퀘스트",0)	;;듀얼 퀘스트 로그 파일
	SetQuestNumStep(29,315)
	goto End_QuestNpc00029 
}
	else{
	SendSound(0,1303)
	D("이프리트의 불꽃을 가져다주세요.")		;Stay310
	SetQuestNumStep(29,310)
	goto End_QuestNpc00029 
}
}

CmpQuestNumStep(29,315)
if( yes==1 ){
	EventMsg("임무를 성공적으로 수행하셨습니다.")
	if(Qcount>23){
	D("아... 타블렛을 다 완성하셨군요. 듀얼 등급을 올릴 수 있는 첫 번째 시험에 통과하셨습니다.")
	D("웨스트 그레이드의 은빛 기사를 찾아가세요.")		;Stay185
	SetQuestNumStep(73,185)
	SetQuestNumStep(29,0)
	goto End_QuestNpc00032 
}
	else{
	D("다음 임무 수행을 위해서는 웨스트 그레이드의 은빛 기사를 찾아가세요.")	;Stay105
	SetQuestNumStep(73,105)
	SetQuestNumStep(29,0)
	goto End_QuestNpc00032 
}
}

;EQuest29_Npc00029
:End_QuestNpc00029
end

@Npc00030
end
@Npc00031
;SQuest71_Npc00031
CmpQuestNumStep( 71, 20 )
if( yes==1 ){
	IsInvHavePC(9050)
	if(yes==1){
	sGetNat()
	if(yes==3){
	MessageBox("펜던트를 가지고 계시군요. 그럼 에델브로이의 축복을 펜던트에 드리겠습니다. 바람속에 흩날리는 코스모스를..폭풍을 잠재우는 꽃잎의 영광을..이제 Colossus로 돌아가셔서 더 큰 영광을 위해 레더 점수 7000점이 되시고 황혼의 트로피를 받아오십시오.")
	SetQuestNumStep( 71, 25 )
	goto End_QuestNpc00031 
}
	if(yes==4){
	MessageBox("펜던트를 가지고 계시군요. 그럼 레티의 축복을 펜던트에 드리겠습니다. 칼날 위에 실을 수 있는 가장 거대한 이름의 영광에 의지하여..창조가 닿을 수 없는 미를 찬미하며..이제 Colossus로 돌아가셔서 더 큰 영광을 위해 황혼의 트로피를 받아오십시오.")
	SetQuestNumStep( 71, 25 )
	goto End_QuestNpc00031 
}
	if(yes==6){
	MessageBox("펜던트를 가지고 계시군요. 그럼 오렘의 축복을 펜던트에 드리겠습니다. 정의가 닿는 그 어느곳에서라도 피어오르는 장미를..열정의 꽃잎처럼 불타는 마음을..이제 Colossus로 돌아가셔서 더 큰 영광을 위해 황혼의 트로피를 받아오십시오.")
	SetQuestNumStep( 71, 25 )
	goto End_QuestNpc00031 
}
	else{
	D("국적이 없으시다니..어떻게 이렇게까지 오셨는지 이해가 가지 않는군요. 신을 섬기는 것은 국적이 필요하지 않습니다. 하지만, 영광은 국가의 특권이니, 국적을 받으시면 돌아오시길..")
	SetQuestNumStep( 71, 25 )
	goto End_QuestNpc00031 
}
}
	else{
	D("황혼 펜던트를 잃어버리셨나요? 무책임하셨습니다.. 그런 엄청난 실수를..")		;Stay20
	SetQuestNumStep( 71, 20 )
	goto End_QuestNpc00031 
}
}
CmpQuestNumStep( 71, 35 )
if( yes==1 ){
	IsInvHavePC(9049)
	if(yes==1){
	IsInvHavePC(9050)
	if(yes==1){
	MessageBox("황혼의 트로피를 받았군요. 축하드립니다. 당신은 이제 황혼의 숨결을 받으실 자격이 주워졌습니다. 대륙과 조국을 위해 Colossus의 의미를 영원히 지켜주십시오.")
	SetItemInvPC(9050,  9051,  500)
	if(yes==1){
	D("이제 황혼의 숨결이 부여되었습니다")
	SendSound(0,  0062)
	EventMsg("당신의 <황혼 펜던트>가 <황혼의 숨결>이 되었습니다.")
	SetQuestNumStep( 71, 40 )
	goto End_QuestNpc00031 
}
	else{
	D("배낭이 가득 차셨군요. 트로피를 넣을 공간이 부족합니다. 정리를 해주시길..")
	SetQuestNumStep( 71, 40 )
	goto End_QuestNpc00031 
}
}
	else{
	D("황혼 펜던트를 갖고 계시지 않으시군요? 이렇게 멀리 오셔서 잃어버린 것이라면 비극입니다. Colossus의 영혼이 당신을 선택하지 않았는지 영광은 오지 않는군요.")		;Stay35
	SetQuestNumStep( 71, 35 )
	goto End_QuestNpc00031 
}
}
	else{
	D("아레나의 새로운 영웅이시군요... 그런데, 황혼의 트로피는 어디에 두고 오셨습니까?")		;Stay35
	SetQuestNumStep( 71, 35 )
	goto End_QuestNpc00031 
}
}

CmpQuestNumStep( 71, 40 )
if( yes==1 ){
	D("하하! 대륙의 영광을 갖게 된 느낌이 어떤가요? 이제 황혼의 숨결을 품고, 대륙과 조국을 위해 Colossus의 의미를 지켜주시길 바랍니다..")
	SetQuestNumStep( 71, 40 )
	goto End_QuestNpc00031 
}

;EQuest71_Npc00031
:End_QuestNpc00031
end
@Npc00032
;SQuest74_Npc00032
CmpQuestNumStep(74,0)
if( yes==1 ){
	DualCheck(3)
	if(yes == 1){
	LogDualQuest(74,Qcount,"듀얼 3차 퀘스트",0)	;;20030617 듀얼 퀘스트 로그 파일을 남기기 위해 개굴이가 추가
	Qcount = 0
	GhostLv = 2
	SendSound(0, 1311)
	D("어서 오세요.. 기다리고 있었답니다..")
	SetQuestNumStep(74,5)
	goto End_QuestNpc00032 
}
	else{
	SendSound(0, 1303)
	D("듀얼 클래스 3등급만 자격이 주어진다네.. 좀 더 수련하고 오게.")		;Stay0
	SetQuestNumStep(74,0)
	goto End_QuestNpc00032 
}
}

CmpQuestNumStep(74,5)
if( yes==1 ){
	D("듀얼 클래스 3등급으로 승급 되신 것을 축하드립니다.")
	SetQuestNumStep(74,10)
	goto End_QuestNpc00032 
}

CmpQuestNumStep(74,10)
if( yes==1 ){
	D("힘든 임무를 마치고 듀얼 3등급이 되셨군요...")
	SetQuestNumStep(74,15)
	goto End_QuestNpc00032 
}

CmpQuestNumStep(74,15)
if( yes==1 ){
	D("총 5등급의 듀얼 클래스에서 3등급이 되셨습니다.")
	SendSound(0,  64)
	SetQuestNumStep(74,20)
	goto End_QuestNpc00032 
}

CmpQuestNumStep(74,20)
if( yes==1 ){
	D("듀얼 등급마다 올릴 수 있는 레벨이 제한돼 있으며 등급이 오를 때마다 많은 혜택을 받게 된 답니다.")
	SetQuestNumStep(74,25)
	goto End_QuestNpc00032 
}

CmpQuestNumStep(74,25)
if( yes==1 ){
	D("듀얼 등급을 올리기 위해서는 그 전과 같이 총 3가지의 시험에 통과하셔야 합니다..")
	SetQuestNumStep(74,30)
	goto End_QuestNpc00032 
}

CmpQuestNumStep(74,30)
if( yes==1 ){
	D("우선 첫 번째는 제가 한 장의 타블렛을 드릴 것입니다.")
	SetQuestNumStep(74,35)
	goto End_QuestNpc00032 
}

CmpQuestNumStep(74,35)
if( yes==1 ){
	D("이 타블렛 안에 24개의 ‘흐름의 조각’을 채워놓으셔야 합니다.")
	SetQuestNumStep(74,40)
	goto End_QuestNpc00032 
}

CmpQuestNumStep(74,40)
if( yes==1 ){
	D("제가 드리는 임무 하나를 해결할 때마다 ‘흐름의 조각’ 하나를 얻게 된답니다.")
	SetQuestNumStep(74,45)
	goto End_QuestNpc00032 
}

CmpQuestNumStep(74,45)
if( yes==1 ){
	MessageBox("24개의 ‘흐름의 조각’을 타블렛 안에 채워놓는다. 타블렛은 임무를 수행하게 되면 받게 된다.")
	SendSound(0,   64)
	SetQuestNumStep(74,50)
	goto End_QuestNpc00032 
}

CmpQuestNumStep(74,50)
if( yes==1 ){
	D("두 번째는 대미궁의 몬스터 정벌에 나가 공을 세워야 합니다.")
	SetQuestNumStep(74,55)
	goto End_QuestNpc00032 
}

CmpQuestNumStep(74,55)
if( yes==1 ){
	D("공을 세웠다는 증표로 드래곤을 죽이게 되면 나오는 '레드 드래곤의 비늘’을 가져오시면 됩니다.")
	SetQuestNumStep(74,60)
	goto End_QuestNpc00032 
}

CmpQuestNumStep(74,60)
if( yes==1 ){
	MessageBox("대미궁의 드래곤을 죽여 '레드 드래곤의 비늘’을 가져온다.")
	SendSound(0,   64)
	SetQuestNumStep(74,65)
	goto End_QuestNpc00032 
}

CmpQuestNumStep(74,65)
if( yes==1 ){
	D("세 번째 시험은 레벨이 135 가 될 때까지 수련을 하셔야 하며, 레더점수가 80,000점 이거나 명성이 4,000 이 되셔야 합니다. ")
	SetQuestNumStep(74,70)
	goto End_QuestNpc00032 
}

CmpQuestNumStep(74,70)
if( yes==1 ){
	MessageBox("첫 번째 레벨 135가 될 때까지 수련을 한다. 두 번째 레더 점수가 80,000점 이거나 명성이 4,000 이 된다.")
	SendSound(0,   64)
	SetQuestNumStep(74,75)
	goto End_QuestNpc00032 
}

CmpQuestNumStep(74,75)
if( yes==1 ){
	D("대미궁의 몬스터 정벌에 대해서는 대미궁 근처에 가면 대미궁 정벌군 대장님이 계실것입니다.")
	SetQuestNumStep(74,80)
	goto End_QuestNpc00032 
}

CmpQuestNumStep(74,80)
if( yes==1 ){
	D("그분에게서 더 자세한 이야기를 들으시면 됩니다.")
	SetQuestNumStep(74,85)
	goto End_QuestNpc00032 
}
CmpQuestNumStep(74,85)
if( yes==1 ){
	D("그럼 모든 준비가 다 되셨으면 이제부터 임무를 드리도록 하겠습니다.")
	SetQuestNumStep(74,90)
	goto End_QuestNpc00032 
}

CmpQuestNumStep(74,90)
if( yes==1 ){
	D("우선 타블렛을 받으시기 바랍니다. 타블렛은 귀중한 물건이기 때문에 소중히 하셔야 합니다.")
	SetQuestNumStep(74,95)
	goto End_QuestNpc00032 
}

CmpQuestNumStep(74,95)
if( yes==1 ){
	SetItemInvPC(0, 10179, 500)
	EventMsg("'타블렛'을 받았습니다.")
	SetQuestNumStep(74,100)
	goto End_QuestNpc00032 
}

CmpQuestNumStep(74,100)
if( yes==1 ){
	D("임무는 총 4종류가 있으며 수시로 주어지는 임무가 바뀌게 됩니다. 그 전과 같으므로 쉬우실 것입니다.")
	SetQuestNumStep(74,105)
	goto End_QuestNpc00032 
}
CmpQuestNumStep(74,105)
if( yes==1 ){
	random(0,5)
	if(ran==0){
	SendSound(0,  64)
	D("이번 임무는 바이서스 기밀 문서를 찾아오는 일입니다.")		;Stay110
	SetQuestNumStep(74,110)
	goto End_QuestNpc00032 
}
	if(ran==1){
	SendSound(0,  64)
	D("이번 임무는 자이펀 기밀 문서를 찾아오는 일입니다.")		;Stay130
	SetQuestNumStep(74,130)
	goto End_QuestNpc00032 
}
	if(ran==2){
	SendSound(0,  64)
	D("이번 임무는 일스 기밀 문서를 찾아오는 일입니다.")		;Stay150
	SetQuestNumStep(74,150)
	goto End_QuestNpc00032 
}
	if(ran>2){
	SendSound(0,  64)
	D("이번 임무는 국지전에서 공을 세우는 일입니다.")		;Stay170
	SetQuestNumStep(74,170)
	goto End_QuestNpc00032 
}
}
CmpQuestNumStep(74, 110)
	if(yes == 1){
	D("기밀 문서는 대초원에서 목격 됐다고 합니다. 아마 듀얼 에틴을 잡으면 구할 수 있을 겁니다.")
	SetQuestNumStep(74,115)
	goto End_QuestNpc00032 
}
 
CmpQuestNumStep(74,115)
if( yes==1 ){
	D("그 지역에 있는 몬스터를 잡으면 바이서스 기밀 문서를 얻을 수 있을 것입니다.")
	SetQuestNumStep(74,120)
	goto End_QuestNpc00032 
}

CmpQuestNumStep(74,120)
if( yes==1 ){
	IsInvHavePC(10176)
	if(yes == 1){
	D("임무에 성공하셨군요..흐름의 조각 하나를 드리겠습니다.")
	SetItemInvPC(10176, 0, 0)
	Qcount = Qcount + 1
	CallMenu(27)
	LogDualQuest(74,Qcount,"듀얼 3차 퀘스트",0)	;;20030617 듀얼 퀘스트 로그 파일을 남기기 위해 개굴이가 추가
	SetQuestNumStep(74,125)
	goto End_QuestNpc00032 
}
	else{
	SendSound(0, 1303)
	D("대초원의 듀얼 에틴을 죽여 바이서스 기밀 문서를 가져오시기 바랍니다.")		;Stay120
	SetQuestNumStep(74,120)
	goto End_QuestNpc00032 
}
}

CmpQuestNumStep(74,125)
if( yes==1 ){
	EventMsg("임무를 성공적으로 수행하셨습니다.")
	if(Qcount>23){
	D("아.. 타블렛을 다 완성하셨군요.. 듀얼 등급을 올릴 수 있는 첫 번째 시험에 통과하셨습니다.")		;Stay185
	SetQuestNumStep(74,185)
	goto End_QuestNpc00032 
}
	else{
	EventMsg("다음 임무가 주어집니다.")		;Stay105
	SetQuestNumStep(74,105)
	goto End_QuestNpc00032 
}
}
CmpQuestNumStep(74, 130)
	if(yes == 1){
	D("기밀 문서는 대초원에서 목격 됐다고 합니다. 아마 듀얼 에틴을 잡으면 구할 수 있을 겁니다.")
	SetQuestNumStep(74,135)
	goto End_QuestNpc00032 
}
 
CmpQuestNumStep(74,135)
if( yes==1 ){
	D("그 지역에 있는 몬스터를 잡으면 자이펀 기밀 문서를 얻을 수 있을 것입니다.")
	SetQuestNumStep(74,140)
	goto End_QuestNpc00032 
}

CmpQuestNumStep(74,140)
if( yes==1 ){
	IsInvHavePC(10177)
	if(yes == 1){
	D("임무에 성공하셨군요..흐름의 조각 하나를 드리겠습니다.")
	SetItemInvPC(10177,  0,  0)
	Qcount = Qcount + 1
	CallMenu(27)
	LogDualQuest(74,Qcount,"듀얼 3차 퀘스트",0)	;;20030617 듀얼 퀘스트 로그 파일을 남기기 위해 개굴이가 추가	
	SetQuestNumStep(74,145)
	goto End_QuestNpc00032 
}
	else{
	SendSound(0, 1303)
	D("대초원의 듀얼 에틴을 죽여 자이펀 기밀 문서를 가져오시기 바랍니다.")		;Stay140
	SetQuestNumStep(74,140)
	goto End_QuestNpc00032 
}
}

CmpQuestNumStep(74,145)
if( yes==1 ){
	EventMsg("임무를 성공적으로 수행하셨습니다.")
	if(Qcount>23){
	D("아.. 타블렛을 다 완성하셨군요.. 듀얼 등급을 올릴 수 있는 첫 번째 시험에 통과하셨습니다.")		;Stay185
	SetQuestNumStep(74,185)
	goto End_QuestNpc00032 
}
	else{
	EventMsg("다음 임무가 주어집니다.")		;Stay105
	SetQuestNumStep(74,105)
	goto End_QuestNpc00032 
}
}
CmpQuestNumStep(74, 150)
	if(yes == 1){
	D("기밀 문서는 대초원에서 목격 됐다고 합니다. 아마 듀얼 에틴을 잡으면 구할 수 있을 겁니다.")
	SetQuestNumStep(74,155)
	goto End_QuestNpc00032 
}
 
CmpQuestNumStep(74,155)
if( yes==1 ){
	D("그 지역에 있는 몬스터를 잡으면 일스 기밀 문서를 얻을 수 있을 것입니다.")
	SetQuestNumStep(74,160)
	goto End_QuestNpc00032 
}

CmpQuestNumStep(74,160)
if( yes==1 ){
	IsInvHavePC(10178)
	if(yes == 1){
	D("임무에 성공하셨군요..흐름의 조각 하나를 드리겠습니다.")
	SetItemInvPC(10178,  0,  0)
	Qcount = Qcount + 1
	CallMenu(27)
	LogDualQuest(74,Qcount,"듀얼 3차 퀘스트",0)	;;20030617 듀얼 퀘스트 로그 파일을 남기기 위해 개굴이가 추가	
	SetQuestNumStep(74,165)
	goto End_QuestNpc00032 
}
	else{
	SendSound(0, 1303)
	D("대초원의 듀얼 에틴을 죽여 일스 기밀 문서를 가져오시기 바랍니다.")		;Stay160
	SetQuestNumStep(74,160)
	goto End_QuestNpc00032 
}
}

CmpQuestNumStep(74,165)
if( yes==1 ){
	EventMsg("임무를 성공적으로 수행하셨습니다.")
	if(Qcount>23){
	D("아.. 타블렛을 다 완성하셨군요.. 듀얼 등급을 올릴 수 있는 첫 번째 시험에 통과하셨습니다.")		;Stay185
	SetQuestNumStep(74,185)
	goto End_QuestNpc00032 
}
	else{
	EventMsg("다음 임무가 주어집니다.")		;Stay105
	SetQuestNumStep(74,105)
	goto End_QuestNpc00032 
}
}
CmpQuestNumStep(74, 170)
	if(yes == 1){
	D("국지전에 참여해 명성 50 이상을 얻어 오셔야 합니다.")
	SetQuestNumStep(74,175)
	goto End_QuestNpc00032 
}
 
CmpQuestNumStep(74,175)
if( yes==1 ){
	EventMsg("......")
	if(KillDualCount>49){
	D("임무에 성공하셨군요..흐름의 조각 하나를 드리겠습니다.")
	KillDualCount = 0
	Qcount = Qcount + 1
	CallMenu(27)
	LogDualQuest(74,Qcount,"듀얼 3차 퀘스트",0)	;;20030617 듀얼 퀘스트 로그 파일을 남기기 위해 개굴이가 추가	
	SetQuestNumStep(74,180)
	goto End_QuestNpc00032 
}
	else{
	SendSound(0, 1303)
	D("명성이 부족합니다. 국지전에 참여해 명성 50 이상을 얻어 오셔야 합니다.")		;Stay175
	SetQuestNumStep(74,175)
	goto End_QuestNpc00032 
}
}

CmpQuestNumStep(74,180)
if(yes==1)
{
	EventMsg("임무를 성공적으로 수행하셨습니다.")
	if(Qcount>23)
	{
	D("아.. 타블렛을 다 완성하셨군요.. 듀얼 등급을 올릴 수 있는 첫 번째 시험에 통과하셨습니다.")		;Stay185
	SetQuestNumStep(74,185)
	goto End_QuestNpc00032 
	}
	else
	{
	EventMsg("다음 임무가 주어집니다.")		;Stay105
	SetQuestNumStep(74,105)
	goto End_QuestNpc00032 
	}
}
CmpQuestNumStep(74,185)
	if(yes==1)
	{
	D("듀얼 등급을 올리기 위해서는 3가지의 시험을 통과하셔야 합니다.")
	SendSound(0, 64)
	SetQuestNumStep(74,190)
	goto End_QuestNpc00032 
}
 
CmpQuestNumStep(74,190)
if( yes==1 ){
	D("첫 번째 시험인 타블렛 한 장을 완성하는 시험은 통과하셨습니다.")
	SetQuestNumStep(74,195)
	goto End_QuestNpc00032 
}

CmpQuestNumStep(74,195)
if( yes==1 ){
	D("다음 시험은 대미궁에 있는 드래곤을 죽여 ‘레드 드래곤의 비늘’을 가져 오셔야 합니다.")
	SetQuestNumStep(74,200)
	goto End_QuestNpc00032 
}

CmpQuestNumStep(74,200)
if( yes==1 ){
	IsInvHavePC(10075)
	if(yes == 1){
	SendSound(0, 1310)
	SetItemInvPC(10075,   0,   0)
	D("이렇게 단 시간내에 대미궁 정벌에 성공을 하시다니 정말 대단하십니다..")
	SetQuestNumStep(74,205)
	goto End_QuestNpc00032 
}
	else{
	SendSound(0, 1303)
	D("대미궁에 있는 드래곤을 죽여 '레드 드래곤의 비늘'을 가져 오셔야 합니다.")		;Stay200
	SetQuestNumStep(74,200)
	goto End_QuestNpc00032 
}
}

CmpQuestNumStep(74,205)
if( yes==1 ){
	D("세 번째 시험은 레벨이 135 가 될 때까지 수련을 하셔야 하며, 레더점수가 80,000점 이거나 명성이 4,000 이 되셔야 합니다. ")
	SendSound(0, 64)
	SetQuestNumStep(74,210)
	goto End_QuestNpc00032 
}

CmpQuestNumStep(74,210)
if( yes==1 ){
	CallSmallMenu(200, 1190)
	SetQuestNumStep(74,215)
	goto End_QuestNpc00032 
}

CmpQuestNumStep(74,215)
if( yes==1 ){
	DualCheck(4)
	if(yes==1){
	SendSound(0, 1311)
	Qcount = 0
	GhostLv = GhostLv + 1
	D("듀얼 4등급이 되신 거를 축하드립니다.")		;Stay220
	SetQuestNumStep(74,220)
	goto End_QuestNpc00032 
}
	else{
	D("세번째 시험을 통과하지 못하셨군요..좀 더 수련을 하셔야 합니다")		;Stay210
	SetQuestNumStep(74,210)
	goto End_QuestNpc00032 
}
}
CmpQuestNumStep(74, 220)
	if(yes == 1){
	D("저의 임무는 여기까지가 끝입니다. 듀얼 5등급은 이제까지와 달리 어려운 임무가 주어질 것입니다.")
	SetQuestNumStep(74,225)
	goto End_QuestNpc00032 
}
 
CmpQuestNumStep(74,225)
if( yes==1 ){
	D("대미궁 근처에 있는 대미궁 정벌 대장님에게 가시면 상세히 알려드릴 것입니다.")
	SetQuestNumStep(74,230)
	goto End_QuestNpc00032 
}

CmpQuestNumStep(74,230)
if( yes==1 ){
	SendSound(0, 51)
	D("아 잊은게 있었군요.. 이 아이템은 듀얼 4등급까지 오른 사람에게 주는 것입니다.")
	sSetRareItemInvPc(8042,1,2,2,20)
	SetQuestNumStep(74,235)
	LogDualQuest(74,Qcount,"듀얼 3차 퀘스트",1)	;;20030617 듀얼 퀘스트 로그 파일을 남기기 위해 개굴이가 추가
	goto End_QuestNpc00032 
}

CmpQuestNumStep(74,235)
if( yes==1 ){
	D("그럼.. 신의 가호가 있기를...")
	SetQuestNumStep(74,240)
	goto End_QuestNpc00032 
}

;EQuest74_Npc00032
:End_QuestNpc00032
end
@Npc00033
;SQuest75_Npc00033
CmpQuestNumStep(75,0) ;;20040213 기존 퀘스트 수정 시작_개굴이
if(yes==1)
{
	DualCheck(4)
	if(yes==1)
	{
	D("기다리고 있었습니다..")
	SendSound(0,91)
	LogDualQuest(75,Qcount,"dual 4_5 quest",0)	;;20040213 frog's dual quest log
	SetQuestNumStep(75,5)
	goto End_QuestNpc00033 
	}
	else
	{
	SendSound(0,1303)
	D("대미궁에는 드래곤과 많은 몬스터들이 살고 있어... 일반 사람이 가기에는 너무 위험한 곳이야.")		;Stay0
	SetQuestNumStep(75,0)
	goto End_QuestNpc00033 
	}
}

CmpQuestNumStep(75,5)
if( yes==1 )
{
	D("이제는 듀얼의 최고 단계인 5등급만이 남아있습니다.")
	SetQuestNumStep( 75, 10 )
	goto End_QuestNpc00033 
}

CmpQuestNumStep(75,10)
if( yes==1 )
{
	D("듀얼 5등급이 되기 위해서는 이제까지 주어졌던 것과 격이 다른 임무를 수행해야 합니다.")
	SetQuestNumStep(75,15)
	goto End_QuestNpc00033 
}

CmpQuestNumStep(75,15)
if( yes==1 )
{
	D("듀얼 5등급은 '드래곤 슬레이어'라고 불립니다.")
	SendSound(0,64)
	SetQuestNumStep(75,20)
	goto End_QuestNpc00033 
}

CmpQuestNumStep(75,20)
if( yes==1 )
{
	D("드래곤 로드에게서 인정을 받지 않고서는 드래곤 슬레이어가 될 수 없습니다.")
	SetQuestNumStep(75,25)
	goto End_QuestNpc00033 
}

CmpQuestNumStep(75,25)
if( yes==1 )
{
	D("드래곤 로드를 만나기 위해서는 레드 드래곤을 물리쳐야 한다는 것은 알고 있지만...")
	SetQuestNumStep(75,30)
	goto End_QuestNpc00033 
}

CmpQuestNumStep(75,30)	;;20040213 existing quest
if( yes==1 )
{
	D("드래곤 로드에게서 어떤 방식으로 인정을 받아야 하는지는 아무도 모른답니다.")
	SetQuestNumStep( 75, 35 )
	goto End_QuestNpc00033 
}

CmpQuestNumStep(75,35)	;;20040213 modify quest
if( yes==1 )
{
	D("웃흥... 그렇다면 내가 아빠를 만날 수 있는 방법을 알려주지!")
	SetQuestNumStep(75,40)
	goto End_QuestNpc00033 
}

CmpQuestNumStep(75,40)	;;Ayrpesas_pessy_With way of talking of the case female child who will translate
if( yes==1 )
{
	D("갑자기 목소리가 달라졌다고 해서 놀라지 마. 내 이름은 아일페사스. 펫시라고 불러도 좋아~")
	SetQuestNumStep(75,45)
	goto End_QuestNpc00033 
}

CmpQuestNumStep(75,45)	;;Dragon lord_With way of talking of the case dignified old man who will translate
if( yes==1 )
{
	D("장난이 너무 지나치구나.")
	SetQuestNumStep(75,50)
	goto End_QuestNpc00033 
}

CmpQuestNumStep(75,50)	;;Ayrpesas_Pessy
if( yes==1 )
{
	D("무슨 소리에요? 장난이 아니라 배운대로 정중하게 제 소개를 하는 것이라구요.")
	SetQuestNumStep(75,55)
	goto End_QuestNpc00033 
}

CmpQuestNumStep(75,55)	;;dragon lord
if( yes==1 )
{
	D("조용히 해라. 너무 놀라지 말게. 나는 지금 이 기사의 몸을 빌려 얘기하고 있는 것이니까.")
	SetQuestNumStep(75,60)
	goto End_QuestNpc00033 
}

CmpQuestNumStep(75,60)	;;dragon lorod
if( yes==1 )
{
	D("석양의 감시자 아무르타트가 드디어 자신의 역할을 수행하겠다고 나섰다.")
	SetQuestNumStep(75,65)
	goto End_QuestNpc00033 
}

CmpQuestNumStep(75,65)	;;dragon lord
if( yes==1 )
{
	D("딱히 그녀를 말리고 싶은 마음은 없지만 너무 지나쳐도 곤란하다고 생각하네.")
	SetQuestNumStep(75,70)
	goto End_QuestNpc00033 
}

CmpQuestNumStep(75,70)	;;dragon lord
if( yes==1 )
{
	D("드래곤 로드의 이름으로 네게 명령한다. 그녀가 너무 지나치게 행동하는 것을 막도록 해라.")
	SetQuestNumStep(75,75)
	goto End_QuestNpc00033 
}

CmpQuestNumStep(75,75)	;;dragon lord
if( yes==1 )
{
	D("그 증거로 그녀의 검을 내게 가져와라. 그때까지 너를, 이 세상을 지켜보겠다.")
	SetQuestNumStep(75,80)
	goto End_QuestNpc00033 
}

CmpQuestNumStep(75,80)	;;Ayrpesas_Pessy
if( yes==1 )
{
	D("그럼 수고해요~ 리타 언니의 검을 가져오려면 꽤나 노력해야할 거에요~")
	SetQuestNumStep(75,85)
	goto End_QuestNpc00033 
}

CmpQuestNumStep(75,85)	;;silver knight
if( yes==1 )
{
	D("어... 어라? 내가 선 채로 잠이 든건가? 왜 이렇게 머리가 멍하지...")
	SetQuestNumStep(75,90)
	goto End_QuestNpc00033 
}

CmpQuestNumStep(75,90)
if(yes == 1)
{
	SendSound(0,1311)
	D("믿어지지 않는군요. 드래곤 로드와 이야기를 하다니..")
	SetQuestNumStep(75,95)
	goto End_QuestNpc00033 
}

CmpQuestNumStep(75,95)
if(yes == 1)
{
	SendSound(0,1311)
	D("하지만 그것만으로는 증거가 될 수 없습니다. 드래곤 로드가 말한 것처럼 아무르타트의 검을 가져오길 바랍니다.")
	SetQuestNumStep(75,100)
	goto End_QuestNpc00033 
}

CmpQuestNumStep(75,100)
if(yes == 1)
{
	IsInvHavePC(10289)	;;20040303 아무르타트의 검
	if(yes==1)
	{
		D("이것이 석양의 감시자 아무르타트가 가지고 있던 검입니까?")
		DeleteItemMulti(10289,1)
		EventMsg("은빛 기사에게 아무르타트의 검을 건네주었습니다.")
		LogForScript(75,"dual 4_5 quest-quest delete rita's long sword")
		SetQuestNumStep(75,105)
		goto End_QuestNpc00033 
	}
	else
	{
		EventMsg("드래곤 슬레이어가 되기 위해서는 아무르타트의 검을 가져와야 합니다.")		
		SetQuestNumStep(75,100)
		goto End_QuestNpc00033 
	}
}
 
CmpQuestNumStep(75,105)
if( yes==1 )
{
	D("이것으로 드래곤 로드에게 인정을 받았다는 것을 믿도록 하겠습니다.")
	SetQuestNumStep(75,110)
	goto End_QuestNpc00033 
}

CmpQuestNumStep( 75, 110 )
if( yes==1 )
{
	D("그렇다면 이제는 드래곤 슬레이어가 될 수 있는지 능력을 알아봐야 한답니다.")
	SetQuestNumStep( 75, 115 )
	goto End_QuestNpc00033 
}

CmpQuestNumStep( 75, 115 )
if( yes==1 )
{
	SendSound(0,  64)
	D("레벨 150, 명성 5,000, 레더 90,000이 드래곤 슬레이어가 될 수 있는 최소한의 능력입니다.")
	SetQuestNumStep( 75, 120 )
	goto End_QuestNpc00033 
}

CmpQuestNumStep( 75, 120 )
if( yes==1 )
{
	D("그전 듀얼 등급과는 달리 레벨, 명성, 레더를 전부 만족시키셔야 한답니다.")
	SetQuestNumStep( 75, 125 )
	goto End_QuestNpc00033 
}

CmpQuestNumStep( 75, 125 )
if( yes==1 )
{
	D("드래곤 슬레이어라는 호칭은 이처럼 쉽게 획득할 수가 없죠..")
	SetQuestNumStep( 75, 130 )
	goto End_QuestNpc00033 
}

CmpQuestNumStep( 75, 130 )
if( yes==1 )
{
	D("그럼 드래곤 슬레이어 능력이 되는지 확인해 보겠습니다.")
	SetQuestNumStep( 75, 135 )
	goto End_QuestNpc00033 
}

CmpQuestNumStep( 75, 135 )
if( yes==1 )
{
	CallSmallMenu(200,  1190)
	EventMsg("드래곤 슬레이어가 될 수 있는지의 능력을 확인합니다.")
	SetQuestNumStep( 75, 140 )
	goto End_QuestNpc00033 
}

CmpQuestNumStep( 75, 140 )
if( yes==1 )
{
	DualCheck(5)
	if(yes == 1)
	{
		SendSound(0, 51)
		D("진정한 드래곤 슬레이어가 되셨습니다.")
		SetQuestNumStep( 75, 145 )
		goto End_QuestNpc00033 
	}
	else
	{
	SendSound(0,1303)
	D("드래곤 슬레이어가 되기에는 아직 능력이 부족합니다.")
	SetQuestNumStep( 75, 140 )
	goto End_QuestNpc00033 
	}
}

CmpQuestNumStep( 75, 145 )
if( yes==1 )
{
	D("이제부터 새로운 모험이 다시 시작될 것입니다.")
	SetQuestNumStep( 75, 150 )
	goto End_QuestNpc00033 
}

CmpQuestNumStep(75,150)
if( yes==1 )
{
	D("드래곤 슬레이어에게는 마법의 가을이 오게 될 것입니다.")
	SetQuestNumStep(75,155)
	goto End_QuestNpc00033 
}

CmpQuestNumStep(75,155)
if( yes==1 )
{
	D("그것을 일단 기다리며 새로운 마음가짐으로 여행을 시작하시기 바랍니다.")
	SetQuestNumStep( 75, 160 )
	goto End_QuestNpc00033 
}

CmpQuestNumStep( 75, 160 )
if( yes==1 ){
	D("영웅은 쉽게 모습을 드러내지 않으며 중요한 상황에 나타나 도움을 준답니다.")
	SetQuestNumStep( 75, 165 )
	goto End_QuestNpc00033 
}

CmpQuestNumStep( 75, 165 )
if( yes==1 )
{
	D("우선 이 아이템을 받으시기 바랍니다.")
	EventMsg("은빛 기사에게서 선물을 받았습니다.")
	sSetRareItemInvPc(8039,1,3,3,20)
	sSetRareItemInvPc(8043,1,3,3,6)
	SetQuestNumStep(75,170)
	goto End_QuestNpc00033 
}

CmpQuestNumStep(75,170)
if( yes==1 )
{
	SendSound(0,1308)
	D("마법의 가을이 오면 드래곤 슬레이어의 모험이 다시 시작될 것입니다.")
	SetQuestNumStep(75, 9999)
	goto End_QuestNpc00033 
}
;EQuest75_Npc00033
:End_QuestNpc00033
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
;; 대초원
	MapMove( "big_g", 327,19 )
	if( yes == 1 )
	{
		EventMsg("<대초원>으로 이동합니다.")
	}
	else
	{
		EventMsg("맵 이동에 실패했습니다.")
	}
end
@Event00002
	MoveDungeon("Undead_1",190,222)
end
@Event00003
	MoveDungeon("bigmaze_1",28,701)
end
@Event00004
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
@Event00005
;; 불의던전 1층
	MapMove( "Firedun2", 204,198 )
	if( yes == 1 )
	{
		EventMsg("<불의던전>으로 이동합니다.")
	}
	else
	{
		EventMsg("맵 이동에 실패했습니다.")
	}
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
