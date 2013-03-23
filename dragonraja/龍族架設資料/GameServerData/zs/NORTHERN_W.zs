
@sys00	; 처음 서버 Setting하는 함수.

	MaxNPC( 50 )
	MapName( "northern_w" )

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
;; 빵집
	random( 0, 3 )
        if( ran == 0 )
        {
		D( "이 곳은 <노던바넨> 지역입니다." )
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
@Npc00002
;; 목공소
	random( 0, 3 )
        if( ran == 0 )
        {
		D( "이 곳은 <노던바넨> 지역입니다." )
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
		D( "이 곳은 <노던바넨> 지역입니다." )
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
;; 대장간
  random(0,3)
        if( ran == 0 )
        {
        D( "돈만준다면  철을 이용해서 만들수 있는 것은 뭐든지 팔지. 또한 그 기술도 가르쳐 주지." );
        }
        if( ran == 1 )
        {
        D( "철광석을 얻기 위해서는 곡괭이와 mining 스킬이 있어야만 해. 이곳에서 그 기술을 가르쳐주지.")
        }
        if( ran == 2 )
        {
        D( "전쟁때문에 여기저기에서 암살이나 범죄가 끊이지 않아. 조심하게나...")  
        }
        CallSmallMenu( 0, 18 ); 대장간
end
@Npc00005
;; 의류점
	random( 0, 3 )
        if( ran == 0 )
        {
		D( "이 곳은 <노던바넨> 지역입니다." )
        }
        if( ran == 1 )
        {
        	D( "던전에 들어가더라도 옷은 입어야지요?" )
        }
        if( ran == 2 )
        {
	        D( "좋은 옷은 좋은 방어력을 갖추고 있습니다." )
        }
        CallSmallMenu( 0, 24 )
end
@Npc00006
;; 은행
        random( 0, 2 )
        if( ran == 0 )
        {
	        D( "어서 오세요 이곳은 은행입니다. 예금,출금,대출, 경매가 가능하죠 " );
        }
        if( ran == 1 )
        {
	        D( "다른 은행과 연결되 있어서 여기서도 당신의 물건을 찾을수 있을겁니다." );
        }
        CallSmallMenu( 0, 13 ); 은행
end
@Npc00007
;; 포탈NPC
	random( 0, 3 )
	if( ran == 0 )
	{
		D( "어느 곳으로 이동하시겠습니까? 포탈이동을 하려면, 약간의 이용료를 지불하셔야 합니다." )
	}
	if( ran == 1 )
	{
		D( "이젠 더 편리하게 포탈이동을 할 수 있지만, 전쟁 중 국가 자원을 유지하기 위해 작은 이용료를 지불하셔야합니다." )
	}
	if( ran == 2 )
	{
		D( "언제든 찾아오시면 원하시는 곳으로 이동해 드리겠습니다. 작은 이용료가 있지만, 예전보다는 훨씬 편할 것입니다." )
	}
        IsLevel(11)
        if( yes == 1)
        {
		CallMenu( 39 )
        }
        else
        {
        	EventMsg("이 포탈은 레벨 11부터 사용할 수 있습니다..")
        	SendSound(0,2061)
	}
end
@Npc00008
;; 연금술소 (포션)
	random( 0, 3 )
        if( ran == 0 )
        {
		D( "이 곳은 <노던바넨> 지역입니다." )
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
;SQuest85_Npc00021
CmpQuestNumStep(85,0)
if( yes==1 ){
	IsLevel(40)
	if(yes==1){
	D("저는 황폐한 땅 웨스트 바넨을 일구려고 합니다.")
	SetQuestNumStep(85,5)
	goto End_QuestNpc00021 
}
	else{
	D("부탁을 드릴게 있지만 어려운 일이라 레벨이 40은 되셔야 합니다.")
	EventMsg("...")		;Stay0
	SetQuestNumStep(85,0)
	goto End_QuestNpc00021 
}
}

CmpQuestNumStep(85,5)
if( yes==1 ){
	D("하지만 황폐한 땅을 일구려고 하면 고약한 예티와 메티가 나타나 저의 일을 방해하곤 합니다.")
	SetQuestNumStep(85,10)
	goto End_QuestNpc00021 
}

CmpQuestNumStep(85,10)
if( yes==1 ){
	D("도저히 땅을 일굴 수가 없습니다.")
	SetQuestNumStep(85,15)
	goto End_QuestNpc00021 
}

CmpQuestNumStep(85,15)
if( yes==1 ){
	D("웨스트 바넨에 가서 저의 일을 조금 도와주십시오.")
	SetQuestNumStep(85,20)
	goto End_QuestNpc00021 
}

CmpQuestNumStep(85,20)
if( yes==1 ){
	D("저의 일을 돕는 것은 단순합니다.")
	SetQuestNumStep(85,25)
	goto End_QuestNpc00021 
}

CmpQuestNumStep(85,25)
if( yes==1 ){
	D("예티와 메티를 사냥하는 것입니다.")
	SetQuestNumStep(85,30)
	goto End_QuestNpc00021 
}

CmpQuestNumStep(85,30)
if( yes==1 ){
	D("그 증표로 저에게 예티의 가죽 20개를 가지고 오십시오. 그 답례는 잊지 않겠습니다.")
	SetQuestNumStep(85,35)
	goto End_QuestNpc00021 
}

CmpQuestNumStep(85,35)
if( yes==1 ){
	CheckItemMulti(10226, 20)
	if(yes==1){
	DeleteItemMulti(10226, 20)
	EventMsg("예티의 가죽 20개를 건내준다.")
	SetQuestNumStep(85,40)
	goto End_QuestNpc00021 
}
	else{
	D("예티의 가죽 20개를 가지고 오십시오.인첸트 예티에게서 구하실 수 있습니다.")
	EventMsg("...")		;Stay35
	SetQuestNumStep(85,35)
	goto End_QuestNpc00021 
}
}

CmpQuestNumStep(85,40)
if( yes==1 ){
	D("드릴 건 별로 없지만 저의 감사의 표시입니다.")
	SetItemInvPC(0, 9006, 1)
	EventMsg("감사의 표시로 아이템을 받았습니다")		;Stay0
	SetQuestNumStep(85,0)
	goto End_QuestNpc00021 
}

;EQuest85_Npc00021
:End_QuestNpc00021
end
@Npc00022
;SQuest86_Npc00022
CmpQuestNumStep(86,0)
if( yes==1 ){
	IsLevel(50)
	if(yes==1){
	D("저는 이 척박한 바넨에서 땅을 일구고 씨를 뿌리는 일을 포기하고 말았습니다.")
	SetQuestNumStep(86,5)
	goto End_QuestNpc00022 
}
	else{
	D("부탁을 드릴게 있지만 어려운 일이라 레벨이 50은 되셔야 합니다.")
	EventMsg("..")		;Stay0
	SetQuestNumStep(86,0)
	goto End_QuestNpc00022 
}
}

CmpQuestNumStep(86,5)
if( yes==1 ){
	D("예티와 메티의 심술 때문만이 아니라는 것을 알게 되었습니다.")
	SetQuestNumStep(86,10)
	goto End_QuestNpc00022 
}

CmpQuestNumStep(86,10)
if( yes==1 ){
	D("어둠과 추운 날씨로 인해 농작물이 자라지 못하다는 것을 깨닫게 된 것이지요.")
	SetQuestNumStep(86,15)
	goto End_QuestNpc00022 
}

CmpQuestNumStep(86,15)
if( yes==1 ){
	D("저는 참 어리석은 사람입니다. 이런 간단한 상식 조차 깨닫지 못하고 있었다니...")
	SetQuestNumStep(86,20)
	goto End_QuestNpc00022 
}

CmpQuestNumStep(86,20)
if( yes==1 ){
	D("그래서 저는 가축을 키울 생각을 하게 되었습니다.")
	SetQuestNumStep(86,25)
	goto End_QuestNpc00022 
}

CmpQuestNumStep(86,25)
if( yes==1 ){
	D("하지만 가축을 키우기 위해서는 몬스터에게 안전하고 물을 쉽게 구할 수 있는 장소가 필요합니다.")
	SetQuestNumStep(86,30)
	goto End_QuestNpc00022 
}

CmpQuestNumStep(86,30)
if( yes==1 ){
	D("마침 노던 바넨에는 얼음호수 지역이 있어 그 장소라면 적당합니다.")
	SetQuestNumStep(86,35)
	goto End_QuestNpc00022 
}

CmpQuestNumStep(86,35)
if( yes==1 ){
	D("하지만, 그 곳 역시 몬스터들이 자리를 잡고 있습니다.")
	SetQuestNumStep(86,40)
	goto End_QuestNpc00022 
}

CmpQuestNumStep(86,40)
if( yes==1 ){
	D("그 곳을 안전한 장소로 만들어 주십시오.")
	SetQuestNumStep(86,45)
	goto End_QuestNpc00022 
}

CmpQuestNumStep(86,45)
if( yes==1 ){
	D("물론 그 증표로 메티의 가죽 20개를 가지고 오십시오.")
	SetQuestNumStep(86,50)
	goto End_QuestNpc00022 
}

CmpQuestNumStep(86,50)
if( yes==1 ){
	CheckItemMulti(10228,20)
	if(yes==1){
	EventMsg("메티의 가죽 20개를 건내줬습니다.")
	DeleteItemMulti(10228,20)
	SetQuestNumStep(86,55)
	goto End_QuestNpc00022 
}
	else{
	D("메티의 가죽 20개를 가지고 오십시오. 광분 메티에게서 구하실 수 있습니다.")
	EventMsg("..")		;Stay50
	SetQuestNumStep(86,50)
	goto End_QuestNpc00022 
}
}

CmpQuestNumStep(86,55)
if( yes==1 ){
	D("드릴 건 별로 없지만 저의 감사의 표시입니다.")
	SetItemInvPC(0, 3101, 1)
	SetItemInvPC(0, 1046, 1)
	EventMsg("감사의 표시로 아이템을 받았습니다")		;Stay0
	SetQuestNumStep(86,0)
	goto End_QuestNpc00022 
}

;EQuest86_Npc00022
:End_QuestNpc00022
end
@Npc00023
;SQuest87_Npc00023
CmpQuestNumStep(87,0)
if( yes==1 ){
	IsLevel(50)
	if(yes == 1){
	D("노던 바넨의 북서쪽에는 돌이 많은 산 지역이 있습니다.")
	SetQuestNumStep(87,5)
	goto End_QuestNpc00023 
}
	else{
	D("만약 당신이 레벨이 50이 넘는다면 부탁할게 있었는데...아직 무리겠군요..")
	EventMsg("...")		;Stay0
	SetQuestNumStep(87,0)
	goto End_QuestNpc00023 
}
}

CmpQuestNumStep(87,5)
if( yes==1 ){
	D("그곳에 가면 JD를 만날 수 있습니다. ")
	SetQuestNumStep(87,10)
	goto End_QuestNpc00023 
}

CmpQuestNumStep(87,10)
if( yes==1 ){
	D("그는 돌에서 보석을 캐는 일을 하는데, 매우 부지런하여 하루 종일 그곳에서 일을 합니다.")
	SetQuestNumStep(87,15)
	goto End_QuestNpc00023 
}

CmpQuestNumStep(87,15)
if( yes==1 ){
	D("하지만 그는 매우 가난합니다.")
	SetQuestNumStep(87,20)
	goto End_QuestNpc00023 
}

CmpQuestNumStep(87,20)
if( yes==1 ){
	D("그는 열심히 일을 하지만, 그 산에서는 보석이 잘 나오지 않기 때문입니다.")
	SetQuestNumStep(87,25)
	goto End_QuestNpc00023 
}

CmpQuestNumStep(87,25)
if( yes==1 ){
	D("저는 그가 안쓰러워 가끔 그에게 식량을 보내주고는 한답니다.")
	SetQuestNumStep(87,30)
	goto End_QuestNpc00023 
}

CmpQuestNumStep(87,30)
if( yes==1 ){
	D("하지만, 산으로 가는 중간에 몬스터들이 있어 나로서는 늘 부탁을 하는 형편입니다.")
	SetQuestNumStep(87,35)
	goto End_QuestNpc00023 
}

CmpQuestNumStep(87,35)
if( yes==1 ){
	D("이 식량을 전해주시겠습니까?")
	SetQuestNumStep(87,40)
	goto End_QuestNpc00023 
}

CmpQuestNumStep(87,40)
if( yes==1 ){
	SetItemInvPC(0, 3025, 1)
	EventMsg("JD에게 전해줄 '피자' 아이템을 받았습니다.")
	SetQuestNumStep(87,45)
	goto End_QuestNpc00023 
}

CmpQuestNumStep(87,45)
if( yes==1 ){
	D("JD는 노던 바넨의 북서쪽에 있는 돌이 많은 산 지역에 가시면 만들 수 있습니다.")
	SetQuestNumStep(87,50)
	goto End_QuestNpc00023 
}
CmpQuestNumStep(87,90)
if( yes==1 ){
	D("JD는 지금도 일을 열심히 하겠죠? 제 부탁을 들어주셔서 감사합니다.")
	SetQuestNumStep(87,95)
	goto End_QuestNpc00023 
}

CmpQuestNumStep(87,95)
if( yes==1 ){
	D("저의 감사의 표시로 이것을 받으시기 바랍니다.")
	SetItemInvPC(0, 10123, 100000)
	SetQuestNumStep(87,100)
	goto End_QuestNpc00023 
}

CmpQuestNumStep(87,100)
if( yes==1 ){
	IsInvHavePC(1021)
	if(yes == 1){
	EventMsg("JD에게서 받은 '황옥' 아이템을 건내줬습니다.")
	SetItemInvPC(1021, 0, 0)
	SetQuestNumStep(87,105)
	goto End_QuestNpc00023 
}
	else{
	D("루트에리노의 무한한 영광이 따르길 바라겠습니다.")		;End
	SetQuestNumStep(87,9999)
	goto End_QuestNpc00023 
}
}

CmpQuestNumStep(87,105)
if( yes==1 ){
	D("이것은 황옥이군요.")
	SetQuestNumStep(87,110)
	goto End_QuestNpc00023 
}

CmpQuestNumStep(87,110)
if( yes==1 ){
	D("이곳 바넨에서는 매우 귀한 보석 중의 하나랍니다.")
	SetQuestNumStep(87,115)
	goto End_QuestNpc00023 
}

CmpQuestNumStep(87,115)
if( yes==1 ){
	D("JD는 없는 형편에 이런것까지 챙겨주다니..")
	EventMsg("명성 10을 얻었습니다.")
	FameUp2(1, 10)
	SetQuestNumStep(87,120)
	goto End_QuestNpc00023 
}

CmpQuestNumStep(87,120)
if( yes==1 ){
	D("루트에리노의 무한한 영광이 따르길 바라겠습니다.")
	SetQuestNumStep(87,120)
	goto End_QuestNpc00023 
}

;EQuest87_Npc00023
:End_QuestNpc00023
end
@Npc00024
;SQuest87_Npc00024
CmpQuestNumStep(87,50)
if( yes==1 ){
	D("오늘도 보석은 나오지 않는군. 아무리 열심히 일을 해도 보석을 찾을 수 없어..")
	SetQuestNumStep(87,55)
	goto End_QuestNpc00024 
}

CmpQuestNumStep(87,55)
if( yes==1 ){
	IsInvHavePC(3025)
	if(yes==1){
	EventMsg("JD에게 '피자' 아이템을 건내줬습니다.")
	SetItemInvPC(3025, 0, 0)
	SetQuestNumStep(87,60)
	goto End_QuestNpc00024 
}
	else{
	D("보석도 나오지 않고... 일을 열심히 했더니 허기가 지는군..")
	EventMsg("...")		;Stay55
	SetQuestNumStep(87,55)
	goto End_QuestNpc00024 
}
}

CmpQuestNumStep(87,60)
if( yes==1 ){
	D("고맙네.. 무척이나 배가 고팠는데....")
	SetQuestNumStep(87,65)
	goto End_QuestNpc00024 
}

CmpQuestNumStep(87,65)
if( yes==1 ){
	D("이 음식을 'Paul'이 줬다는건가..번번이 도움만 받는군..")
	SetQuestNumStep(87,70)
	goto End_QuestNpc00024 
}

CmpQuestNumStep(87,70)
if( yes==1 ){
	D("이건 내가 얼마 전에 캔 것인데 나도 무엇인지 알 수가 없네..")
	SetQuestNumStep(87,75)
	goto End_QuestNpc00024 
}

CmpQuestNumStep(87,75)
if( yes==1 ){
	D("미안하지만 이것을 'Paul'에게 갔다주겠나?")
	SetQuestNumStep(87,80)
	goto End_QuestNpc00024 
}

CmpQuestNumStep(87,80)
if( yes==1 ){
	SetItemInvPC(0, 1021, 1)
	EventMsg("'Paul'에게 전해줄 '황옥' 아이템을 받았습니다.")
	SetQuestNumStep(87,85)
	goto End_QuestNpc00024 
}

CmpQuestNumStep(87,85)
if( yes==1 ){
	D("고맙네.. 나는 보석을 캐는 광부라네.. 그저 묵묵히 보석을 캘뿐이지..")
	SetQuestNumStep(87,90)
	goto End_QuestNpc00024 
}

;EQuest87_Npc00024
:End_QuestNpc00024
end
@Npc00025
;SQuest88_Npc00025
CmpQuestNumStep( 88, 0 )
if( yes==1 ){
	IsLevel(45)
	if(yes == 1){
	D("나는 피올라의 둘째 아들.")
	SetQuestNumStep( 88, 5 )
	goto End_QuestNpc00025 
}
	else{
	D("지금 이벤트를 준비하고 있다네.. 레벨 45가 되면 오게나..")
	EventMsg("...")		;Stay0
	SetQuestNumStep( 88, 0 )
	goto End_QuestNpc00025 
}
}

CmpQuestNumStep( 88, 5 )
if( yes==1 ){
	D("우리 형제는 다섯 쌍동이인데, 우리 형제는 같이 한 자리에 만날 일이 전혀 없네.")
	SetQuestNumStep( 88, 10 )
	goto End_QuestNpc00025 
}

CmpQuestNumStep( 88, 10 )
if( yes==1 ){
	D("그래서, 사람들은 우리를 이상하게 생각한다네..")
	SetQuestNumStep( 88, 15 )
	goto End_QuestNpc00025 
}

CmpQuestNumStep( 88, 15 )
if( yes==1 ){
	D("나는 노던 바넨에서 보고 내 동생을 웨스트 바넨에서 봤는데 또 이스트 바넨에서 나의 형을 보기 때문이지..")
	SetQuestNumStep( 88, 20 )
	goto End_QuestNpc00025 
}

CmpQuestNumStep( 88, 20 )
if( yes==1 ){
	D("그래서 난 하나의 멋진 이벤트를 준비했네..")
	SetQuestNumStep( 88, 25 )
	goto End_QuestNpc00025 
}

CmpQuestNumStep( 88, 25 )
if( yes==1 ){
	D("우리 형제를 모두 구분해서 만나는 사람에게는 큰 상금과 보물을 주겠다고 말이야.. 하하하..")
	SetQuestNumStep( 88, 30 )
	goto End_QuestNpc00025 
}

CmpQuestNumStep( 88, 30 )
if( yes==1 ){
	D("어떤가? 내 형제를 모두 만나 보게..")
	SetQuestNumStep( 88, 35 )
	goto End_QuestNpc00025 
}

CmpQuestNumStep( 88, 35 )
if( yes==1 ){
	D("간단한 힌트를 주지.. 내 형제 중에 한명은 마을 중앙에서 볼 수 있을 거네..")
	SetQuestNumStep( 88, 40 )
	goto End_QuestNpc00025 
}

;EQuest88_Npc00025
:End_QuestNpc00025
end
@Npc00026
;SQuest88_Npc00026
CmpQuestNumStep( 88, 40 )
if( yes==1 ){
	D("나는 피올라의 막내 아들.")
	SetQuestNumStep( 88, 45 )
	goto End_QuestNpc00026 
}

CmpQuestNumStep( 88, 45 )
if( yes==1 ){
	D("둘째 형이 이상한 이벤트를 한 거 같군..")
	SetQuestNumStep( 88, 50 )
	goto End_QuestNpc00026 
}

CmpQuestNumStep( 88, 50 )
if( yes==1 ){
	D("그럼 이제 세 명이 남은 건가...")
	SetQuestNumStep( 88, 55 )
	goto End_QuestNpc00026 
}

CmpQuestNumStep( 88, 55 )
if( yes==1 ){
	D("나머지 세 명은 그리 쉽게 찾을 수는 없을 거야.. 워낙 위험한 지역에서 살고 있거든..")
	SetQuestNumStep( 88, 60 )
	goto End_QuestNpc00026 
}

CmpQuestNumStep( 88, 60 )
if( yes==1 ){
	D("노던 바넨의 유적 지역에 가면 나의 형을 만날 수 있을 거네..")
	SetQuestNumStep( 88, 65 )
	goto End_QuestNpc00026 
}

;EQuest88_Npc00026
:End_QuestNpc00026
end
@Npc00027
;SQuest88_Npc00027
CmpQuestNumStep( 88, 65 )
if( yes==1 ){
	D("나는 피올라의 셋째 아들.")
	SetQuestNumStep( 88, 70 )
	goto End_QuestNpc00027 
}

CmpQuestNumStep( 88, 70 )
if( yes==1 ){
	D("둘째 형이 또 엉뚱한 이벤트를 했나보군..")
	SetQuestNumStep( 88, 75 )
	goto End_QuestNpc00027 
}

CmpQuestNumStep( 88, 75 )
if( yes==1 ){
	D("그래도 이런 식으로 해서 우리 형제들의 소식을 들을 수 있어 기쁘다네..")
	SetQuestNumStep( 88, 80 )
	goto End_QuestNpc00027 
}

CmpQuestNumStep( 88, 80 )
if( yes==1 ){
	D("만나는 나의 형제들에게 나의 안부를 좀 전해주게..")
	SetQuestNumStep( 88, 85 )
	goto End_QuestNpc00027 
}

CmpQuestNumStep( 88, 85 )
if( yes==1 ){
	D("이번에 만나야 할 동생은 아주 먼 곳에 있지... 흠.. 나도 기억이 가물가물 하군..")
	SetQuestNumStep( 88, 90 )
	goto End_QuestNpc00027 
}

CmpQuestNumStep( 88, 90 )
if( yes==1 ){
	D("웨스턴 바넨에 가면 희귀하게 생긴 나무가 있을 거야.. 그 근처를 찾아보게..")
	SetQuestNumStep( 88, 95 )
	goto End_QuestNpc00027 
}

;EQuest88_Npc00027
:End_QuestNpc00027
end
@Npc00028
;SQuest89_Npc00028
CmpQuestNumStep(89,0)
if( yes==1 ){
	IsLevel(50)
	if(yes == 1){
	D("제 못난 아들이 있습니다.")
	SetQuestNumStep(89,5)
	goto End_QuestNpc00028 
}
	else{
	D("제 아들을 도와주세요.. 하지만 레벨 50은 되야 저를 도와주실 수 있습니다.")
	EventMsg("...")		;Stay0
	SetQuestNumStep(89,0)
	goto End_QuestNpc00028 
}
}

CmpQuestNumStep(89,5)
if( yes==1 ){
	D("그 녀석은 바넨의 한 처녀를 사랑하고 있었습니다.")
	SetQuestNumStep(89,10)
	goto End_QuestNpc00028 
}

CmpQuestNumStep(89,10)
if( yes==1 ){
	D("이들 녀석은 매우 소극적이어서 자신의 마음을 밝히지도 못하고 있었습니다.")
	SetQuestNumStep(89,15)
	goto End_QuestNpc00028 
}

CmpQuestNumStep(89,15)
if( yes==1 ){
	D("그러던 얼마전 그 처녀는 레너스 시로 시집을 갔지요.")
	SetQuestNumStep(89,20)
	goto End_QuestNpc00028 
}

CmpQuestNumStep(89,20)
if( yes==1 ){
	D("녀석은 지금 그 처녀를 잊지 못하고 바넨의 위험한 지역을 떠돌고 있습니다.")
	SetQuestNumStep(89,25)
	goto End_QuestNpc00028 
}

CmpQuestNumStep(89,25)
if( yes==1 ){
	D("저를 도와주십시오.")
	SetQuestNumStep(89,30)
	goto End_QuestNpc00028 
}

CmpQuestNumStep(89,30)
if( yes==1 ){
	D("'망각의 약' 이라는 것이 있습니다.")
	SetQuestNumStep(89,35)
	goto End_QuestNpc00028 
}

CmpQuestNumStep(89,35)
if( yes==1 ){
	D("그 약을 먹으면 자신의 가장 슬픈 기억을 잊을 수 있다고 합니다.")
	SetQuestNumStep(89,40)
	goto End_QuestNpc00028 
}

CmpQuestNumStep(89,40)
if( yes==1 ){
	D("제가 그 약 제조 방법을 알고 있지만, 재료를 구하기가 어렵습니다.")
	SetQuestNumStep(89,45)
	goto End_QuestNpc00028 
}

CmpQuestNumStep(89,45)
if( yes==1 ){
	D("그 재료를 구해와 주시겠습니까")
	SetQuestNumStep(89,50)
	goto End_QuestNpc00028 
}

CmpQuestNumStep(89,50)
if( yes==1 ){
	D("재료는 '헬하운드 뼈' 10개와 '에리히 롬프의 책'입니다.")
	SetQuestNumStep(89,55)
	goto End_QuestNpc00028 
}

CmpQuestNumStep(89,55)
if( yes==1 ){
	D("'헬하운드 뼈'는 세르메니스 던전에 있는 헬하운드를 죽이면 얻을 수 있습니다.")
	SetQuestNumStep(89,60)
	goto End_QuestNpc00028 
}

CmpQuestNumStep(89,60)
if( yes==1 ){
	D("'에리히 롬프'의 책은 노던 바넨 빙산 지역에 있는 마법사에게 물어보시면 알려 줄 겁니다.")
	SetQuestNumStep(89,65)
	goto End_QuestNpc00028 
}

CmpQuestNumStep(89,65)
if( yes==1 ){
	CheckItemMulti(10229, 10)
	if(yes == 1){
	IsInvHavePC(10225)
	if(yes == 1){
	EventMsg("헬하운드의 뼈와 에리히 롬프의 책을 건내줬습니다.")
	SetItemInvPC(10225,  0,  0)
	DeleteItemMulti(10229, 10)
	SetQuestNumStep(89,70)
	goto End_QuestNpc00028 
}
	else{
	D("에리히 롬프의 책은 노던 바넨 빙산 지역에 있는 마법사가 알고 있습니다.")
	EventMsg("....")		;Stay65
	SetQuestNumStep(89,65)
	goto End_QuestNpc00028 
}
}
	else{
	D("'헬하운드뼈'는 세르메니스던전에 있는 헬하운드를 죽이면 구할 수 있습니다. 10개를 구해세요.")
	EventMsg("...")		;Stay65
	SetQuestNumStep(89,65)
	goto End_QuestNpc00028 
}
}

CmpQuestNumStep(89,70)
if( yes==1 ){
	D("전부 다 구해오셨군요.. 정말로 감사드립니다.")
	SetQuestNumStep(89,75)
	goto End_QuestNpc00028 
}

CmpQuestNumStep(89,75)
if( yes==1 ){
	D("'망각의 약'을 바로 만들도록 하겠습니다. 잠시만 기다려주세요..")
	SetQuestNumStep(89,80)
	goto End_QuestNpc00028 
}

CmpQuestNumStep(89,80)
if( yes==1 ){
	D("이 약을 저의 아들에게 전해주시겠습니까.")
	EventMsg("'망각의 약'을 받았습니다.")
	SetItemInvPC(0, 10231, 1)
	SetQuestNumStep(89,85)
	goto End_QuestNpc00028 
}

CmpQuestNumStep(89,85)
if( yes==1 ){
	D("제 아들은 웨스트 바넨에 왼쪽 밑으로 내려가면 커다란 나무 근처에 있을 것입니다.")
	SetQuestNumStep(89,90)
	goto End_QuestNpc00028 
}
CmpQuestNumStep(89,200)
if( yes==1 ){
	D("감사드립니다.. 아들의 나쁜 기억은 전부 없어졌을 것입니다.")
	SetQuestNumStep(89,205)
	goto End_QuestNpc00028 
}

CmpQuestNumStep(89,205)
if( yes==1 ){
	D("대신 언제 집으로 돌아올지를 모르겠군요...")
	SetQuestNumStep(89,210)
	goto End_QuestNpc00028 
}

CmpQuestNumStep(89,210)
if( yes==1 ){
	D("저의 감사의 표시로 무언가를 드려야 하는데.. 저에게는 특별히 드릴 것이 없답니다.")
	SetQuestNumStep(89,215)
	goto End_QuestNpc00028 
}

CmpQuestNumStep(89,215)
if( yes==1 ){
	D("대신 저에게는 무기를 변형시킬 수 있는 기술이 있습니다.")
	SetQuestNumStep(89,220)
	goto End_QuestNpc00028 
}

CmpQuestNumStep(89,220)
if( yes==1 ){
	D("마침.. 망각의 약을 만들고 남은 재료가 있으니.. 이것으로 원하시는 무기를 변형시켜드리겠습니다.")
	SetQuestNumStep(89,225)
	goto End_QuestNpc00028 
}

CmpQuestNumStep(89,225)
if( yes==1 ){
	D("바넨에는 과거부터 무기를 변형시킬 수 있는 기술자들이 많다고 합니다..")
	SetQuestNumStep(89,230)
	goto End_QuestNpc00028 
}

CmpQuestNumStep(89,230)
if( yes==1 ){
	D("하지만 저는 아직 실력이 좋지 않아 '공격력'만 올려드릴 수가 있습니다.")
	SetQuestNumStep(89,235)
	goto End_QuestNpc00028 
}

CmpQuestNumStep(89,235)
if( yes==1 ){
	D("변형시키기 원하는 무기를 오른손에 들어주시기 바랍니다.")
	SetQuestNumStep(89,240)
	goto End_QuestNpc00028 
}

CmpQuestNumStep(89,240)
if( yes==1 ){
	D("그러면 제가 선택한 그 무기의 공격력을 올려드리겠습니다.")
	SetQuestNumStep(89,245)
	goto End_QuestNpc00028 
}

CmpQuestNumStep(89,245)
if( yes==1 ){
	D("그럼 신중하게 무기를 고르신 후 저에게 말씀해 주세요..")
	SetQuestNumStep(89,250)
	goto End_QuestNpc00028 
}

CmpQuestNumStep(89,250)
if( yes==1 ){
	UpRareInEquip(0,1,3,3,101)
	if(yes ==  1){
	EventMsg("새로운 무기가 생겼습니다.")
	SetQuestNumStep(89,255)
	goto End_QuestNpc00028 
}
	else{
	D("오른손에 무기를 올려 놓으시기 바랍니다.")
	EventMsg("...")		;Stay250
	SetQuestNumStep(89,250)
	goto End_QuestNpc00028 
}
}

CmpQuestNumStep(89,255)
if( yes==1 ){
	D("무기를 잘 활용하시기 바랍니다. 저의 아들을 도와주신 거에 다시 감사드립니다.")
	SetQuestNumStep(89,255)
	goto End_QuestNpc00028 
}

;EQuest89_Npc00028
:End_QuestNpc00028
end
@Npc00029
;SQuest90_Npc00029
CmpQuestNumStep(90,0)
if( yes==1 ){
	IsLevel(40)
	if(yes == 1){
	D("루트에리노의 전설을 들어 보았나?")
	SetQuestNumStep(90,5)
	goto End_QuestNpc00029 
}
	else{
	D("레벨 40이 되기전까지 이곳에 돌아다니는 것은 위험하네..")
	EventMsg("...")		;Stay0
	SetQuestNumStep(90,0)
	goto End_QuestNpc00029 
}
}

CmpQuestNumStep(90,5)
if( yes==1 ){
	D("나는 루트에리노의 전설을 믿네..")
	SetQuestNumStep(90,10)
	goto End_QuestNpc00029 
}

CmpQuestNumStep(90,10)
if( yes==1 ){
	D("루트에리노가 스무 살 되던 해 이곳 바넨에 왔네..")
	SetQuestNumStep(90,15)
	goto End_QuestNpc00029 
}

CmpQuestNumStep(90,15)
if( yes==1 ){
	D("그는 결계석으로 막힌 세르메니스의 던전에 들어간 최초의 사람이었고")
	SetQuestNumStep(90,20)
	goto End_QuestNpc00029 
}

CmpQuestNumStep(90,20)
if( yes==1 ){
	D("그 결계석을 부수었다고 하네.. 혼자서 말이야..")
	SetQuestNumStep(90,25)
	goto End_QuestNpc00029 
}

CmpQuestNumStep(90,25)
if( yes==1 ){
	D("그리고 새롭게 결계를 했는데 자신의 후인이 오기 전에는 그 결계가 풀리지 않는다고 하지..")
	SetQuestNumStep(90,30)
	goto End_QuestNpc00029 
}

CmpQuestNumStep(90,30)
if( yes==1 ){
	D("사실 난 루트에리노가 결계해 놓은 세르메니스 던전에는 들어갈 염두가 나지를 않네..")
	SetQuestNumStep(90,35)
	goto End_QuestNpc00029 
}

CmpQuestNumStep(90,35)
if( yes==1 ){
	D("그곳에는 무서운 몬스터들이 가득하다고 하니까..")
	SetQuestNumStep(90,40)
	goto End_QuestNpc00029 
}

CmpQuestNumStep(90,40)
if( yes==1 ){
	D("그 몬스터들은 루트에리노가 부순 결계석을 삼키어 더욱 강해졌다고 하네..")
	SetQuestNumStep(90,45)
	goto End_QuestNpc00029 
}

CmpQuestNumStep(90,45)
if( yes==1 ){
	D("난 그 결계석에 관심이 있네..")
	SetQuestNumStep(90,50)
	goto End_QuestNpc00029 
}

CmpQuestNumStep(90,50)
if( yes==1 ){
	D("그 결계석을 다섯 개만 모아도 30년을 더 살 수 있다는 거야..")
	SetQuestNumStep(90,55)
	goto End_QuestNpc00029 
}

CmpQuestNumStep(90,55)
if( yes==1 ){
	D("만일 자네가 그 결계석 다섯 개를 모아주면 '에리히 롬프의 책'을 주겠네..")
	SetQuestNumStep(90,60)
	goto End_QuestNpc00029 
}

CmpQuestNumStep(90,60)
if( yes==1 ){
	D("사실 그런 귀한 물건보다 생명이 더 중요하지 않은가..")
	SetQuestNumStep(90,65)
	goto End_QuestNpc00029 
}

CmpQuestNumStep(90,65)
if( yes==1 ){
	D("명심하게.. 결계석의 조각 다섯 개이네..")
	SetQuestNumStep(90,70)
	goto End_QuestNpc00029 
}

CmpQuestNumStep(90,70)
if( yes==1 ){
	D("듣기로는 이스턴 바넨의 세르메니스 던전 입구 근처에 있는 아주 강한 몬스터가 가지고 있다고 하지..")
	SetQuestNumStep(90,75)
	goto End_QuestNpc00029 
}

CmpQuestNumStep(90,75)
if( yes==1 ){
	CheckItemMulti(10232, 5)
	if(yes == 1){
	DeleteItemMulti(10232, 5)
	EventMsg("'결계석의 조각' 5개를 건내줬습니다.")
	SetQuestNumStep(90,80)
	goto End_QuestNpc00029 
}
	else{
	D("결계석의 조각 5개를 가져와 주게...")
	EventMsg("...")		;Stay75
	SetQuestNumStep(90,75)
	goto End_QuestNpc00029 
}
}

CmpQuestNumStep(90,80)
if( yes==1 ){
	D("이제 난 장수할 수 있을 것이네..")
	SetQuestNumStep(90,85)
	goto End_QuestNpc00029 
}

CmpQuestNumStep(90,85)
if( yes==1 ){
	D("자네에게 '에리히 롬프의 책'을 주겠네.. 아주 귀한 물건이니 소중하게 다루게나..")
	SetQuestNumStep(90,90)
	goto End_QuestNpc00029 
}

CmpQuestNumStep(90,90)
if( yes==1 ){
	EventMsg("'에리히 롬프의 책'을 받았습니다.")
	SetItemInvPC(0,10225,1)
	SetQuestNumStep(90,95)
	goto End_QuestNpc00029 
}

CmpQuestNumStep(90,95)
if( yes==1 ){
	D("만약 '결계석의 조각'을 구하게 된다면 나에게 갖다주게나..")
	EventMsg("...")		;Stay0
	SetQuestNumStep(90,0)
	goto End_QuestNpc00029 
}

;EQuest90_Npc00029
:End_QuestNpc00029
end
@Npc00030
;SQuest76_Npc00030
CheckQuestMode()
if( yes==1 ){
CmpQuestNumStep(76,0)
if( yes==1 ){
	IsLevel(50)
	if(yes == 1){
	D("나는 이곳 바넨의 일을 주관하고 있는 '빌모어' 라고 하오.")
	SetQuestNumStep(76,5)
	goto End_QuestNpc00030 
}
	else{
	D("자네 레벨로 이곳에 돌아다니는 것은 위험할 것이네..")
	EventMsg("...")		;Stay0
	SetQuestNumStep(76,0)
	goto End_QuestNpc00030 
}
}

CmpQuestNumStep(76,5)
if( yes==1 ){
	D("바넨에 대해서 알고 싶으면 나를 찾아오면 될 것이오.")
	SetQuestNumStep(76,10)
	goto End_QuestNpc00030 
}

CmpQuestNumStep(76,10)
if( yes==1 ){
	D("퀘스트에 대해서 궁금한 것이 있다면 '/퀘스트 바넨'이라고 날 부르길 바라오. ")
	SetQuestNumStep(76,15)
	goto End_QuestNpc00030 
}

CmpQuestNumStep(76,15)
if( yes==1 ){
	D("나에게 또 물어보고 싶은 말이 있는가?")
	SetQuestNumStep(76,20)
	goto End_QuestNpc00030 
}

CmpQuestNumStep(76,20)
if( yes==1 ){
	D("혹시 바넨에 대해서 알고 싶은 것이 있다면 나에게 물어보게.")
	SetQuestNumStep(76,25)
	goto End_QuestNpc00030 
}

CmpQuestNumStep(76,25)
if( yes==1 ){
	D("바넨이 발견된 시기는 아직 정확하게 밝혀지지 않고 있네.")
	SetQuestNumStep(76,30)
	goto End_QuestNpc00030 
}

CmpQuestNumStep(76,30)
if( yes==1 ){
	D("에리히 롬프의 '알려지지 않은 땅에 대한 기록과 발견'")
	SetQuestNumStep(76,35)
	goto End_QuestNpc00030 
}

CmpQuestNumStep(76,35)
if( yes==1 ){
	D("이라는 책에 따르면")
	SetQuestNumStep(76,40)
	goto End_QuestNpc00030 
}

CmpQuestNumStep(76,40)
if( yes==1 ){
	D("과거 어린 루트에리노는 고난을 겪어 이곳 바넨으로 오게 되었고")
	SetQuestNumStep(76,45)
	goto End_QuestNpc00030 
}

CmpQuestNumStep(76,45)
if( yes==1 ){
	D("이곳에서 자신의 운명을 결정하고 성장하였다고 하네..")
	SetQuestNumStep(76,50)
	goto End_QuestNpc00030 
}

CmpQuestNumStep(76,50)
if( yes==1 ){
	D("그리고 모험의 길을 떠나 '7 전사'들을 만났다고 하지.")
	SetQuestNumStep(76,55)
	goto End_QuestNpc00030 
}

CmpQuestNumStep(76,55)
if( yes==1 ){
	D("어찌보면 이곳 바넨은 고난의 땅인 동시에 기회의 땅인지도 모르네.")
	SetQuestNumStep(76,60)
	goto End_QuestNpc00030 
}

CmpQuestNumStep(76,60)
if( yes==1 ){
	D("많은 위험이 존재하지만 그것을 극복했을 때는 분명 보상이 준비되어 있다는 것일세.")
	SetQuestNumStep(76,65)
	goto End_QuestNpc00030 
}

CmpQuestNumStep(76,65)
if( yes==1 ){
	D("만일 그러한 기회를 잡고 싶다면 알고 싶은 것을 물어보게.")
	SetQuestNumStep(76,70)
	goto End_QuestNpc00030 
}

CmpQuestNumStep(76,70)
if( yes==1 ){
	D("바넨은 자네가 알고 있다시피 어둠이 지배하는 곳이네.")
	SetQuestNumStep(76,75)
	goto End_QuestNpc00030 
}

CmpQuestNumStep(76,75)
if( yes==1 ){
	D("이는 세르메니스 던전에 자리를 잡고 있는 스틱스의 저주가 걸려 있기 때문이네.")
	SetQuestNumStep(76,80)
	goto End_QuestNpc00030 
}

CmpQuestNumStep(76,80)
if( yes==1 ){
	D("스틱스를 없애기 위해 많은 영웅과 모험가들이 도전을 했으나")
	SetQuestNumStep(76,85)
	goto End_QuestNpc00030 
}

CmpQuestNumStep(76,85)
if( yes==1 ){
	D("아직 어둠이 걷히지 않은 것으로 보아 스틱스를 없애지 못한 것 같네..")
	SetQuestNumStep(76,90)
	goto End_QuestNpc00030 
}

CmpQuestNumStep(76,90)
if( yes==1 ){
	D("혹시 세르메니스에 대해서 알고 싶은가?")
	SetQuestNumStep(76,95)
	goto End_QuestNpc00030 
}

CmpQuestNumStep(76,95)
if( yes==1 ){
	D("세르메니스 던전은 매우 넗어 이스턴 바넨을 통할 수도, 웨스턴 바넨을 통해서 갈 수도 있네.")
	SetQuestNumStep(76,100)
	goto End_QuestNpc00030 
}

CmpQuestNumStep(76,100)
if( yes==1 ){
	D("하지만 세르메니스 던전을 들어갈 수 있는 방법을 알고 있는 것은 이스턴 바넨뿐이네.")
	SetQuestNumStep(76,105)
	goto End_QuestNpc00030 
}

CmpQuestNumStep(76,105)
if( yes==1 ){
	D("이스턴 바넨을 통해서 세르메니스 던전에 들어가기 위해서는")
	SetQuestNumStep(76,110)
	goto End_QuestNpc00030 
}

CmpQuestNumStep(76,110)
if( yes==1 ){
	D("에리히 롬프의 저서인 '알려지지 않은 땅에 대한 기록과 발견'")
	SetQuestNumStep(76,115)
	goto End_QuestNpc00030 
}

CmpQuestNumStep(76,115)
if( yes==1 ){
	D("에 적혀져 있는 주문을 외워야만 하네.")
	SetQuestNumStep(76,120)
	goto End_QuestNpc00030 
}

CmpQuestNumStep(76,120)
if( yes==1 ){
	D("그 주문은 고대 언어로 적혀져 있어 아마 자네는 해석하지 못할 것이네..")
	SetQuestNumStep(76,125)
	goto End_QuestNpc00030 
}

CmpQuestNumStep(76,125)
if( yes==1 ){
	D("만약 세르메니스 던전에 들어가고 싶다면 에리히 롬프의 책을 갖고 오게..")
	SetQuestNumStep(76,130)
	goto End_QuestNpc00030 
}

CmpQuestNumStep(76,130)
if( yes==1 ){
	D("내가 주문을 해석해 주겠네..")
	SetQuestNumStep(76,135)
	goto End_QuestNpc00030 
}

CmpQuestNumStep(76,135)
if( yes==1 ){
	D("에리히 롬프의 책은 노던 바넨 빙산 지역에 있는 마법사가 알고 있네..")
	SetQuestNumStep(76,140)
	goto End_QuestNpc00030 
}

CmpQuestNumStep(76,140)
if( yes==1 ){
	IsInvHavePC(10225)
	if(yes == 1){
	SetItemInvPC(10225,  0,  0)
	EventMsg("'에리히 롬프의 책'을 건내줬습니다.")
	SetQuestNumStep(76,145)
	goto End_QuestNpc00030 
}
	else{
	D("에리히 롬프의 책은 노던 바넨 빙산 지역에 있는 마법사가 알고 있네..")
	EventMsg("...")		;Stay140
	SetQuestNumStep(76,140)
	goto End_QuestNpc00030 
}
}

CmpQuestNumStep(76,145)
if( yes==1 ){
	D("세르메니스 던전을 여는 주문은 다음과 같네..")
	SetQuestNumStep(76,150)
	goto End_QuestNpc00030 
}

CmpQuestNumStep(76,150)
if( yes==1 ){
	D("'존재를 증명하는 기억'")
	SetQuestNumStep(76,155)
	goto End_QuestNpc00030 
}

CmpQuestNumStep(76,155)
if( yes==1 ){
	D("이스턴 바넨에 있는 세르메니스 던전 입구에서 이 주문을 외운다면 세르메니스 던전으로 들어갈 수 있을 것이네.")
	SetQuestNumStep(76,160)
	goto End_QuestNpc00030 
}

CmpQuestNumStep(76,160)
if( yes==1 ){
	D("잘 기억해 두게.. '존재를 증명하는 기억'")
	LogForScript(76,"이스트 바넨의 세르메니스 던전 입구로")
	SetQuestNumStep(76,165)
	goto End_QuestNpc00030 
}
CmpQuestNumStep(76,190)
if( yes==1 ){
	D("루트에리노의 결계는 약한 사람이 스틱스를 만나")
	SetQuestNumStep(76,195)
	goto End_QuestNpc00030 
}

CmpQuestNumStep(76,195)
if( yes==1 ){
	D("해를 입는 것을 방지한 루트에리노 대왕의 측은지심에서 비롯된 것이네.")
	SetQuestNumStep(76,200)
	goto End_QuestNpc00030 
}

CmpQuestNumStep(76,200)
if( yes==1 ){
	D("난 우연히 망각의 뼈를 얻을 수 있었는데 망각의 뼈를 얻는 것은 ")
	SetQuestNumStep(76,205)
	goto End_QuestNpc00030 
}

CmpQuestNumStep(76,205)
if( yes==1 ){
	D("그리 쉬운 일이 아닐테니..")
	SetQuestNumStep(76,210)
	goto End_QuestNpc00030 
}

CmpQuestNumStep(76,210)
if( yes==1 ){
	D("나에게 예티의 뼈 30개를 가지고 온다면 자네에게 망각의 뼈를 주겠네.")
	SetQuestNumStep(76,215)
	goto End_QuestNpc00030 
}

CmpQuestNumStep(76,215)
if( yes==1 ){
	CheckItemMulti(10227,  30)
	if(yes == 1){
	EventMsg("'예티의 뼈'를 건내줬습니다.")
	DeleteItemMulti(10227,  30)
	SetQuestNumStep(76,220)
	goto End_QuestNpc00030 
}
	else{
	D("나에게 예티의 뼈 30개를 가지고 온다면 자네에게 망각의 뼈를 주겠네.")
	EventMsg("...")		;Stay215
	SetQuestNumStep(76,215)
	goto End_QuestNpc00030 
}
}

CmpQuestNumStep(76,220)
if( yes==1 ){
	D("망각의 뼈는 매우 중요하지만 자네를 위해서 예티의 뼈와 바꾸어주겠네.")
	SetQuestNumStep(76,225)
	goto End_QuestNpc00030 
}

CmpQuestNumStep(76,225)
if( yes==1 ){
	EventMsg("'망각의 뼈'를 받았습니다.")
	SetItemInvPC(0, 10230, 1)
	LogForScript(76,"빌모어에게서 망각의 뼈를 받음")
	SetQuestNumStep(76,230)
	goto End_QuestNpc00030 
}

CmpQuestNumStep(76,230)
if( yes==1 ){
	D("하지만 주의할 점이 있으니 루트에리노는 웨스턴 바넨을 통해서 세르메니스 던전으로 들어갔네.")
	SetQuestNumStep(76,235)
	goto End_QuestNpc00030 
}

CmpQuestNumStep(76,235)
if( yes==1 ){
	D("그래서 오직 웨스턴 바넌을 통해서만 들어가야만 루트에리노의 결계를 풀 수 있을 것이네.")
	SetQuestNumStep(76,240)
	goto End_QuestNpc00030 
}

CmpQuestNumStep(76,240)
if( yes==1 ){
	D("주문은 '기억을 증명하는 존재' 이네..")
	SetQuestNumStep(76,245)
	goto End_QuestNpc00030 
}

CmpQuestNumStep(76,245)
if( yes==1 ){
	D("자네에게 행운이 따르기를 빌겠네.")
	SetQuestNumStep(76,250)
	goto End_QuestNpc00030 
}

CmpQuestNumStep(76,250)
if( yes==1 ){
	D("잊지 말게.. '기억을 증명하는 존재'")
	LogForScript(76,"웨스트 바넨의 세르메니스 던전 입구로")
	SetQuestNumStep(76,255)
	goto End_QuestNpc00030 
}
CmpQuestNumStep(76,305)
if( yes==1 ){
	D("'스틱스'가 다시 사라졌군요..")
	SetQuestNumStep(76,310)
	goto End_QuestNpc00030 
}

CmpQuestNumStep(76,310)
if( yes==1 ){
	D("하지만 '스틱스'는 영원히 사라지지 않을 것입니다.")
	SetQuestNumStep(76,315)
	goto End_QuestNpc00030 
}

CmpQuestNumStep(76,315)
if( yes==1 ){
	D("어쩌면 영원히 못 없앨지도 모릅니다. 그렇다고 보고만 있을 수는 없습니다.")
	SetQuestNumStep(76,320)
	goto End_QuestNpc00030 
}

CmpQuestNumStep(76,320)
if( yes==1 ){
	D("'스틱스'가 나타난다면 다시 한번 도와주세요..")
	SetQuestNumStep(76,325)
	goto End_QuestNpc00030 
}

CmpQuestNumStep(76,325)
if( yes==1 ){
	IsInvHavePC(10146)
	if(yes == 1){
	CmpQuestNumStep(77, 100)
	if(yes == 1){
	SetItemInvPC(10146,0,0)
	sSetRareItemInvPc(9089,1,2,2,12)
	EventMsg("보답으로 '별의 문장'을 받았습니다.")		;Stay0
	LogForScript(76,"저주받은 뼈를 주고 별의 문장을 받음")
	SetQuestNumStep(76,0)
	goto End_QuestNpc00030 
}
	else{
	SetItemInvPC(10146,0,0)
	sSetRareItemInvPc(9089,1,2,2,2)
	SetQuestNumStep(77, 100)
	EventMsg("보답으로 '별의 문장'을 받았습니다.")		;Stay0
	LogForScript(76,"퀘스트 반복했지만 기획자의 은총으로 별의 문장을 받음")
	SetQuestNumStep(76,0)
	goto End_QuestNpc00030 
}
}
	else{
	sSetRareItemInvPc(3013,1,3,3,10)
	EventMsg("보답으로 '아이템'을 받았습니다.")		;Stay0
	LogForScript(76,"저주받은 뼈가 없는 관계로 여전히 햄버거 받음")
	SetQuestNumStep(76,0)
	goto End_QuestNpc00030 
}
}

}else{;EQuest76_Npc00030
}:End_QuestNpc00030
end
@Npc00031
;SQuest92_Npc00031
CmpQuestNumStep(92,0)
if( yes==1 ){
	IsLevel(60)
	if(yes == 1){
	D("이런 슬픈 일이 있습니까?")
	SetQuestNumStep(92,5)
	goto End_QuestNpc00031 
}
	else{
	D("제발 수련을 더 쌓아 저의 부탁을 들어주십시요. 레벨 60은 되셔야 합니다.")
	EventMsg("...")		;Stay0
	SetQuestNumStep(92,0)
	goto End_QuestNpc00031 
}
}

CmpQuestNumStep(92,5)
if( yes==1 ){
	D("나의 절친한 친구가 사악한 무리들에게 죽임을 당하였습니다.")
	SetQuestNumStep(92,10)
	goto End_QuestNpc00031 
}

CmpQuestNumStep(92,10)
if( yes==1 ){
	D("바로 라바입니다.")
	SetQuestNumStep(92,15)
	goto End_QuestNpc00031 
}

CmpQuestNumStep(92,15)
if( yes==1 ){
	D("라바는 자신이 죽인 사람의 얼굴로 변장하는 괴물입니다.")
	SetQuestNumStep(92,20)
	goto End_QuestNpc00031 
}

CmpQuestNumStep(92,20)
if( yes==1 ){
	D("그 사악한 괴물에 달려 있을 제 친구를 생각하면 밤에도 잠이 오지 않습니다.")
	SetQuestNumStep(92,25)
	goto End_QuestNpc00031 
}

CmpQuestNumStep(92,25)
if( yes==1 ){
	D("저에게 라바의 얼굴을 가져다 주십시오..")
	SetQuestNumStep(92,30)
	goto End_QuestNpc00031 
}

CmpQuestNumStep(92,30)
if( yes==1 ){
	D("그래야 저는 편히 잠들 수 있습니다.")
	SetQuestNumStep(92,35)
	goto End_QuestNpc00031 
}

CmpQuestNumStep(92,35)
if( yes==1 ){
	IsInvHavePC(10233)
	if(yes == 1){
	SetItemInvPC(10233,  0,  0)
	EventMsg("'라바의 얼굴'을 건내줬습니다.")
	SetQuestNumStep(92,40)
	goto End_QuestNpc00031 
}
	else{
	D("라바의 얼굴을 가져다 주십시오.")
	EventMsg("...")		;Stay35
	SetQuestNumStep(92,35)
	goto End_QuestNpc00031 
}
}

CmpQuestNumStep(92,40)
if( yes==1 ){
	D("죄송하지만 이건 제 친구의 얼굴이 아닙니다.")
	SetQuestNumStep(92,45)
	goto End_QuestNpc00031 
}

CmpQuestNumStep(92,45)
if( yes==1 ){
	D("제 친구를 죽인 라바가 아닙니다. ")
	SetQuestNumStep(92,50)
	goto End_QuestNpc00031 
}

CmpQuestNumStep(92,50)
if( yes==1 ){
	D("다시 라바의 얼굴을 가져다 주십시오...")
	SetQuestNumStep(92,55)
	goto End_QuestNpc00031 
}

CmpQuestNumStep(92,55)
if( yes==1 ){
	IsInvHavePC(10233)
	if(yes == 1){
	SetItemInvPC(10233,  0,  0)
	EventMsg("'라바의 얼굴'을 건내줬습니다.")
	SetQuestNumStep(92,60)
	goto End_QuestNpc00031 
}
	else{
	D("라바의 얼굴을 가져다 주십시오.")
	EventMsg("...")		;Stay55
	SetQuestNumStep(92,55)
	goto End_QuestNpc00031 
}
}

CmpQuestNumStep(92,60)
if( yes==1 ){
	D("이것도 제 친구의 얼굴이 아닙니다.")
	SetQuestNumStep(92,65)
	goto End_QuestNpc00031 
}

CmpQuestNumStep(92,65)
if( yes==1 ){
	IsInvHavePC(10233)
	if(yes == 1){
	SetItemInvPC(10233,  0,  0)
	EventMsg("'라바의 얼굴'을 건내줬습니다.")
	SetQuestNumStep(92,70)
	goto End_QuestNpc00031 
}
	else{
	D("라바의 얼굴을 가져다 주십시오.")
	EventMsg("...")		;Stay65
	SetQuestNumStep(92,65)
	goto End_QuestNpc00031 
}
}

CmpQuestNumStep(92,70)
if( yes==1 ){
	D("이것도 아닙니다. 제 친구를 죽인 라바는 어디 있는 건지..")
	SetQuestNumStep(92,75)
	goto End_QuestNpc00031 
}

CmpQuestNumStep(92,75)
if( yes==1 ){
	IsInvHavePC(10233)
	if(yes == 1){
	SetItemInvPC(10233,  0,  0)
	EventMsg("'라바의 얼굴'을 건내줬습니다.")
	SetQuestNumStep(92,80)
	goto End_QuestNpc00031 
}
	else{
	D("라바의 얼굴을 가져다 주십시오.")
	EventMsg("...")		;Stay75
	SetQuestNumStep(92,75)
	goto End_QuestNpc00031 
}
}

CmpQuestNumStep(92,80)
if( yes==1 ){
	D("아니.. 에델브로이의 축복 속에 영원한 안식을...")
	SetQuestNumStep(92,85)
	goto End_QuestNpc00031 
}

CmpQuestNumStep(92,85)
if( yes==1 ){
	D("고맙습니다. 제 친구의 얼굴입니다.")
	SetQuestNumStep(92,90)
	goto End_QuestNpc00031 
}

CmpQuestNumStep(92,90)
if( yes==1 ){
	D("이 라바의 얼굴을 친구라 생각하여 양지바른 곳에 묻어야 겠습니다.")
	SetQuestNumStep(92,95)
	goto End_QuestNpc00031 
}

CmpQuestNumStep(92,95)
if( yes==1 ){
	D("그리고 저는 편히 잘 수 있겠군요..")
	SetQuestNumStep(92,100)
	goto End_QuestNpc00031 
}

CmpQuestNumStep(92,100)
if( yes==1 ){
	D("고맙습니다. 보답을 하기 위해 현재 쓰고 있는 모자에 능력을 부여해 드리겠습니다.")
	SetQuestNumStep(92,105)
	goto End_QuestNpc00031 
}

CmpQuestNumStep(92,105)
if( yes==1 ){
	D("저에게는 보잘 것 없지만 모자에 마법 저항능력을 올려드릴 수가 있습니다.")
	SetQuestNumStep(92,110)
	goto End_QuestNpc00031 
}

CmpQuestNumStep(92,110)
if( yes==1 ){
	D("대신 레어, 하이와 같이 능력이 있는 모자는 안되며 평범한 모자이여야 합니다.")
	SetQuestNumStep(92,115)
	goto End_QuestNpc00031 
}

CmpQuestNumStep(92,115)
if( yes==1 ){
	D("결정되셨으면 저에게 말씀해 주세요..")
	SetQuestNumStep(92,120)
	goto End_QuestNpc00031 
}

CmpQuestNumStep(92,120)
if( yes==1 ){
	UpRareInEquip(2,1,2,2,17)
	if(yes == 1){
	EventMsg("새로운 모자가 생겼습니다.")
	SetQuestNumStep(92,125)
	goto End_QuestNpc00031 
}
	else{
	D("일반 모자를 착용하신 후에 저에게 말씀해 주세요.")
	EventMsg("...")		;Stay120
	SetQuestNumStep(92,120)
	goto End_QuestNpc00031 
}
}

CmpQuestNumStep(92,125)
if( yes==1 ){
	D("이 모자를 잘 활용하시기 바랍니다.")
	SetQuestNumStep(92,125)
	goto End_QuestNpc00031 
}

;EQuest92_Npc00031
:End_QuestNpc00031
end
@Npc00032
;SQuest91_Npc00032
CmpQuestNumStep(91,0)
if( yes==1 ){
	D("자네 혹시 전투 기술서를 가지고 있나?")
	SetQuestNumStep(91,5)
	goto End_QuestNpc00032 
}

CmpQuestNumStep(91,5)
if( yes==1 ){
	D("나는 젊었을 때 많은 모험을 통해 많은 스킬들을 배우고 익혔네.")
	SetQuestNumStep(91,10)
	goto End_QuestNpc00032 
}

CmpQuestNumStep(91,10)
if( yes==1 ){
	D("그래서 나는 전투 기술서에 있는 모든 스킬을 몸으로 익히고 있네..")
	SetQuestNumStep(91,15)
	goto End_QuestNpc00032 
}

CmpQuestNumStep(91,15)
if( yes==1 ){
	D("어떤가? 대단하지 않은가?")
	SetQuestNumStep(91,20)
	goto End_QuestNpc00032 
}

CmpQuestNumStep(91,20)
if( yes==1 ){
	D("그뿐만이 아니네..")
	SetQuestNumStep(91,25)
	goto End_QuestNpc00032 
}

CmpQuestNumStep(91,25)
if( yes==1 ){
	D("잘 못 배워 몸에 익은 스킬들을 깨끗이 잊어버리게 할 수도 있네..")
	SetQuestNumStep(91,30)
	goto End_QuestNpc00032 
}

CmpQuestNumStep(91,30)
if( yes==1 ){
	D("어떤가? 대단하지 않은가?")
	SetQuestNumStep(91,35)
	goto End_QuestNpc00032 
}

CmpQuestNumStep(91,35)
if( yes==1 ){
	D("하지만 배운 스킬을 취소하기 위해서는 재료들이 필요하네..")
	SetQuestNumStep(91,40)
	goto End_QuestNpc00032 
}

CmpQuestNumStep(91,40)
if( yes==1 ){
	D("공짜는 없으니까 말이네..")
	SetQuestNumStep(91,45)
	goto End_QuestNpc00032 
}

CmpQuestNumStep(91,45)
if( yes==1 ){
	D("에리히롬프의책 2권, 사드오닉스2개, 축복의잎사귀2개를 가져오게나..")
	SetQuestNumStep(91,50)
	goto End_QuestNpc00032 
}

CmpQuestNumStep(91,50)
if( yes==1 ){
	CheckItemMulti(10225,  2)
	if(yes == 1){
	CheckItemMulti(1046, 2)
	if(yes == 1){
	CheckItemMulti(1047,  2)
	if(yes == 1){
	DeleteItemMulti(10225,  2)
	DeleteItemMulti(1046,  2)
	DeleteItemMulti(1047,  2)
	EventMsg("전투스킬 초기화를 위한 재료를 건내줬습니다.")
	SetQuestNumStep(91,55)
	goto End_QuestNpc00032 
}
	else{
	D("에리히롬프의 책 2권, 사드오닉스 2개, 축복의잎사귀 2개가 필요하네..")
	EventMsg("...")		;Stay50
	SetQuestNumStep(91,50)
	goto End_QuestNpc00032 
}
}
	else{
	D("에리히롬프의 책 2권, 사드오닉스 2개, 축복의잎사귀 2개가 필요하네..")
	EventMsg("...")		;Stay50
	SetQuestNumStep(91,50)
	goto End_QuestNpc00032 
}
}
	else{
	D("에리히롬프의 책 2권, 사드오닉스 2개, 축복의잎사귀 2개가 필요하네..")
	EventMsg("...")		;Stay50
	SetQuestNumStep(91,50)
	goto End_QuestNpc00032 
}
}

CmpQuestNumStep(91,55)
if( yes==1 ){
	D("스킬을 취소하고 새롭게 스킬을 배울 수 있는 재료들을 갖고 왔군. 좋아..")
	SetQuestNumStep(91,60)
	goto End_QuestNpc00032 
}

CmpQuestNumStep(91,60)
if( yes==1 ){
	D("전투스킬을 초기화할터이니 이번에는 신중에게 전투스킬을 선택하게..")
	SetQuestNumStep(91,65)
	goto End_QuestNpc00032 
}

CmpQuestNumStep(91,65)
if( yes==1 ){
	ResetCombatSkill()
	EventMsg("전투스킬이 초기화됐습니다.")
	SetQuestNumStep(91,70)
	goto End_QuestNpc00032 
}

CmpQuestNumStep(91,70)
if( yes==1 ){
	D("전투스킬을 초기화해야 할 경우가 생기면 다시 나에게 찾아오게나..")
	EventMsg("...")		;Stay0
	SetQuestNumStep(91,0)
	goto End_QuestNpc00032 
}

;EQuest91_Npc00032
:End_QuestNpc00032
end
@Npc00033
;SQuest93_Npc00033
CmpQuestNumStep( 93, 0 )
if( yes==1 ){
	IsLevel(105)
	if(yes == 1){
	D("제가 읽은 에리히 롬프의 '알려지지 않는 땅에 대한 기록과 발견'에 의하면")
	SetQuestNumStep( 93, 5 )
	goto End_QuestNpc00033 
}
	else{
	D("레벨 105 이상이 되면 오시기 바랍니다.")
	EventMsg("...")		;Stay0
	SetQuestNumStep( 93, 0 )
	goto End_QuestNpc00033 
}
}

CmpQuestNumStep( 93, 5 )
if( yes==1 ){
	D("어떤 몬스터에게서 익스트림 스톤을 만들 수 있는 여러 재료들을 얻을 수 있다고 합니다..")
	SetQuestNumStep( 93, 10 )
	goto End_QuestNpc00033 
}

CmpQuestNumStep( 93, 10 )
if( yes==1 ){
	D("불행하게도 저는 익스트림 스톤을 만드는 방법을 알고 있으나..")
	SetQuestNumStep( 93, 15 )
	goto End_QuestNpc00033 
}

CmpQuestNumStep( 93, 15 )
if( yes==1 ){
	D("재료에 대해서는 알지 못합니다..")
	SetQuestNumStep( 93, 20 )
	goto End_QuestNpc00033 
}

CmpQuestNumStep( 93, 20 )
if( yes==1 ){
	D("저와 함께 동문수학을 했던 '마그나시안'은 그 재료에 대해서 알고 있을 텐데..")
	SetQuestNumStep( 93, 25 )
	goto End_QuestNpc00033 
}

CmpQuestNumStep( 93, 25 )
if( yes==1 ){
	D("그는 세르메니스 던전에 들어간 후 소식이 없습니다.")
	SetQuestNumStep( 93, 30 )
	goto End_QuestNpc00033 
}

CmpQuestNumStep( 93, 30 )
if( yes==1 ){
	D("만일 저에게 익스트림 스톤을 만들 수 있는 재료를 구해오시면 제가 익스트림스톤을 만들어 드리겠습니다.")
	SetQuestNumStep( 93, 35 )
	goto End_QuestNpc00033 
}
CmpQuestNumStep( 93, 85 )
if( yes==1 ){
	D("'마그나시안'은 만나고 왔습니까..")
	SetQuestNumStep( 93, 90 )
	goto End_QuestNpc00033 
}

CmpQuestNumStep( 93, 90 )
if( yes==1 ){
	CheckItemMulti(1046,   5)
	if(yes == 1){
	CheckItemMulti(1047,   10)
	if(yes == 1){
	CheckItemMulti(9089,   1)
	if(yes == 1){
	EventMsg("재료를 건내줬습니다.")
	DeleteItemMulti(1046,   5)
	DeleteItemMulti(1047,   10)
	DeleteItemMulti(9089,   1)
	SetQuestNumStep( 93, 95 )
	goto End_QuestNpc00033 
}
	else{
	D("'마그나시안'이 말한 재료는 이게 전부가 아닌거 같습니다.")
	EventMsg("...")		;Stay90
	SetQuestNumStep( 93, 90 )
	goto End_QuestNpc00033 
}
}
	else{
	D("'마그나시안'이 말한 재료는 이게 전부가 아닌거 같습니다.")
	EventMsg("...")		;Stay90
	SetQuestNumStep( 93, 90 )
	goto End_QuestNpc00033 
}
}
	else{
	D("'마그나시안'이 말한 재료는 이게 전부가 아닌거 같습니다.")
	EventMsg("...")		;Stay90
	SetQuestNumStep( 93, 90 )
	goto End_QuestNpc00033 
}
}

CmpQuestNumStep( 93, 95 )
if( yes==1 ){
	D("익스트림 스톤을 만들 수 있는 재료를 구해 오셨군요..")
	SetQuestNumStep( 93, 100 )
	goto End_QuestNpc00033 
}

CmpQuestNumStep( 93, 100 )
if( yes==1 ){
	D("제가 익스트림 스톤을 만드는 동안 잠깐 기다려 주십시오.")
	SetQuestNumStep( 93, 105 )
	goto End_QuestNpc00033 
}

CmpQuestNumStep( 93, 105 )
if( yes==1 ){
	D("익스트림 스톤을 받기 위해서는 당신의 경험과 노력의 힘을 저에게 나누어주셔야 합니다.")
	SetQuestNumStep( 93, 110 )
	goto End_QuestNpc00033 
}

CmpQuestNumStep( 93, 110 )
if( yes==1 ){
	D("그러기 위해서는 당신의 명성 200이 필요합니다.")
	SetQuestNumStep( 93, 115 )
	goto End_QuestNpc00033 
}

CmpQuestNumStep( 93, 115 )
if( yes==1 ){
	FameCheck(1200)
	if(yes == 0){
	D("명성이 1200은 되셔야 합니다.")
	EventMsg("...")		;Stay115
	SetQuestNumStep( 93, 115 )
	goto End_QuestNpc00033 
}
	else{
	FameDown2(1,  200)
	EventMsg("명성 200이 줄었습니다.")
	SetQuestNumStep( 93, 120 )
	goto End_QuestNpc00033 
}
}

CmpQuestNumStep( 93, 120 )
if( yes==1 ){
	D("익스트림 스톤이 만들어졌습니다.")
	SetQuestNumStep( 93, 125 )
	goto End_QuestNpc00033 
}

CmpQuestNumStep( 93, 125 )
if( yes==1 ){
	EventMsg("익스트림 스톤을 받았습니다.")
	SetItemInvPC(0,  4028,  1)
	SetQuestNumStep( 93, 130 )
	goto End_QuestNpc00033 
}

CmpQuestNumStep( 93, 130 )
if( yes==1 ){
	D("익스트림 스톤을 잘 사용하시기 바랍니다.")
	SetQuestNumStep( 93, 135 )
	goto End_QuestNpc00033 
}

;EQuest93_Npc00033
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
;;웨스턴 바넨
  MapMove( "Western_w", 524,19 )
	if( yes == 1 )
	{
		EventMsg("<웨스턴 바넨>으로 이동합니다.")
	}
	else
	{
		EventMsg("맵 이동에 실패했습니다.")
	}
end
@Event00002
;;이스턴 바넨
  MapMove( "eastern_w", 12,11 )
	if( yes == 1 )
	{
		EventMsg("<이스턴 바넨>으로 이동합니다.")
	}
	else
	{
		EventMsg("맵 이동에 실패했습니다.")
	}
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


