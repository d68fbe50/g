
@sys00	; 처음 서버 Setting하는 함수.

	MaxNPC( 50 )
	MapName( "W_glade" )

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
;; 활제작소
	random( 0, 3 )
        if( ran == 0 )
        {
		D( "이 곳은 <웨스트 그레이드> 지역입니다." )
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
@Npc00002
;; 목공소
	random( 0, 3 )
        if( ran == 0 )
        {
		D( "이 곳은 <웨스트 그레이드> 지역입니다." )
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
;; 무기점
	random( 0, 3 )
        if( ran == 0 )
        {
		D( "이 곳은 <웨스트 그레이드> 지역 입니다." )
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
@Npc00004
;; 연금술소 (포션)
	random( 0, 3 )
        if( ran == 0 )
        {
		D( "이 곳은 <웨스트 그레이드> 지역입니다." )
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
		D( "이 곳은 <웨스트 그레이드> 지역입니다." )
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
;; 의류점
	random( 0, 3 )
        if( ran == 0 )
        {
		D( "이 곳은 <웨스트 그레이드> 지역입니다." )
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
end
@Npc00009
end

@Npc00010
;SQuest83_Npc00010
CmpQuestNumStep( 83, 0 )
if( yes==1 ){
	D("아무 쓸모 없는 물건들도 모이면 아주 중요한 것이 될 수 있습니다.")
	SendSound(0,  92)
	SetQuestNumStep( 83, 5 )
	goto End_QuestNpc00010 
}

CmpQuestNumStep( 83, 5 )
if( yes==1 ){
	D("바로 자수정이 그러할 수 있습니다.")
	SetQuestNumStep( 83, 10 )
	goto End_QuestNpc00010 
}

CmpQuestNumStep( 83, 10 )
if( yes==1 ){
	D("자수정 2개를 모으면 아주 유용한 물건이 됩니다.")
	SetQuestNumStep( 83, 15 )
	goto End_QuestNpc00010 
}

CmpQuestNumStep( 83, 15 )
if( yes==1 ){
	D("저에게 자수정 2개를 구해주세요.")
	SetQuestNumStep( 83, 20 )
	goto End_QuestNpc00010 
}

CmpQuestNumStep( 83, 20 )
if( yes==1 ){
	IsInvHavePC(1017)
	if(yes==1){
	SetItemInvPC(1017,  0,  0)
	EventMsg("자수정 1개를 구해줬습니다.")
	SetQuestNumStep( 83, 25 )
	goto End_QuestNpc00010 
}
	else{
	D("자수정 2개를 구해주세요.")		;Stay20
	SetQuestNumStep( 83, 20 )
	goto End_QuestNpc00010 
}
}

CmpQuestNumStep( 83, 25 )
if( yes==1 ){
	D("자수정 1개를 받았습니다. 1개를 더 구해주세요.")
	SetQuestNumStep( 83, 30 )
	goto End_QuestNpc00010 
}

CmpQuestNumStep( 83, 30 )
if( yes==1 ){
	IsInvHavePC(1017)
	if(yes==1){
	SetItemInvPC(1017,  0,  0)
	EventMsg("자수정 2개를 다 구해줬습니다.")
	SetQuestNumStep( 83, 35 )
	goto End_QuestNpc00010 
}
	else{
	D("자수정 1개를 더 구해 주세요")		;Stay30
	SetQuestNumStep( 83, 30 )
	goto End_QuestNpc00010 
}
}

CmpQuestNumStep( 83, 35 )
if( yes==1 ){
	D("자수정은 원래 태어날 때부터 짝이 있습니다. ")
	SetQuestNumStep( 83, 40 )
	goto End_QuestNpc00010 
}

CmpQuestNumStep( 83, 40 )
if( yes==1 ){
	D("하지만 운명적으로 서로 헤어지게 마련이며 그 짝을 찾을 때 더욱 빛나기 마련입니다. ")
	SetQuestNumStep( 83, 45 )
	goto End_QuestNpc00010 
}

CmpQuestNumStep( 83, 45 )
if( yes==1 ){
	D("가져오신 자수정은 짝이 맞지 않습니다. 다시 자수정을 하나 찾아와 주세요.")
	SetQuestNumStep( 83, 50 )
	goto End_QuestNpc00010 
}

CmpQuestNumStep( 83, 50 )
if( yes==1 ){
	IsInvHavePC(1017)
	if(yes==1){
	SetItemInvPC(1017,  0,  0)
	EventMsg("자수정을 한 개 더 구해왔습니다.")
	SetQuestNumStep( 83, 55 )
	goto End_QuestNpc00010 
}
	else{
	D("자수정 하나를 더 구해오세요.")		;Stay50
	SetQuestNumStep( 83, 50 )
	goto End_QuestNpc00010 
}
}

CmpQuestNumStep( 83, 55 )
if( yes==1 ){
	D("자수정이 제 짝을 찾았습니다.")
	SetQuestNumStep( 83, 60 )
	goto End_QuestNpc00010 
}

CmpQuestNumStep( 83, 60 )
if( yes==1 ){
	D("빛나는 자수정은 피로한 몸을 회복시켜주며 황폐해진 마음을 다스려줍니다.")
	SetQuestNumStep( 83, 65 )
	goto End_QuestNpc00010 
}

CmpQuestNumStep( 83, 65 )
if( yes==1 ){
	FameUp2(1,  10)
	EventMsg("명성 10 이 올라갑니다.")
	SendSound(0,  51)
	SetQuestNumStep( 83, 70 )
	goto End_QuestNpc00010 
}

CmpQuestNumStep( 83, 70 )
if( yes==1 ){
	D("자수정은 이 효능 외에도 다른 효능을 가지고 있습니다.")
	SetQuestNumStep( 83, 75 )
	goto End_QuestNpc00010 
}

CmpQuestNumStep( 83, 75 )
if( yes==1 ){
	D("녹주석과 자수정이 결합하면 놀라운 효능을 발휘합니다.")
	SetQuestNumStep( 83, 80 )
	goto End_QuestNpc00010 
}

CmpQuestNumStep( 83, 80 )
if( yes==1 ){
	D("저에게 녹주석을 구해주십시오.")
	SetQuestNumStep( 83, 85 )
	goto End_QuestNpc00010 
}

CmpQuestNumStep( 83, 85 )
if( yes==1 ){
	IsInvHavePC(1020)
	if(yes==1){
	SetItemInvPC(1020,   0,   0)
	EventMsg("녹주석 1 개를 구해줬습니다.")
	SetQuestNumStep( 83, 90 )
	goto End_QuestNpc00010 
}
	else{
	D("녹주석 한 개를 구해주십시오.")		;Stay85
	SetQuestNumStep( 83, 85 )
	goto End_QuestNpc00010 
}
}

CmpQuestNumStep( 83, 90 )
if( yes==1 ){
	D("녹주석과 자수정이 결합하면 모든 빛이 사라지지만 매우 단단하게 변합니다.")
	SetQuestNumStep( 83, 95 )
	goto End_QuestNpc00010 
}

CmpQuestNumStep( 83, 95 )
if( yes==1 ){
	D("이는 곧 깊은 사고와 현명한 판단을 하는 데 큰 도움이 됩니다.")
	SetQuestNumStep( 83, 100 )
	goto End_QuestNpc00010 
}

CmpQuestNumStep( 83, 100 )
if( yes==1 ){
	SendSound(0,  51)
	FameUp2(1,  10)
	EventMsg("명성이 10 이 올라갑니다.")		;End
	SetQuestNumStep( 83, 9999 )
	goto End_QuestNpc00010 
}

;EQuest83_Npc00010
:End_QuestNpc00010
end
@Npc00011
;SQuest84_Npc00011
CmpQuestNumStep( 84, 85 )
if( yes==1 ){
	D("어렸을 때 들었던 옛 이야기를 기억하는지요.")
	SendSound(0,  96)
	SetQuestNumStep( 84, 90 )
	goto End_QuestNpc00011 
}

CmpQuestNumStep( 84, 90 )
if( yes==1 ){
	D("잠만 자는 숲 속의 공주 얘기를 들어 본 적이 있는지요.")
	SetQuestNumStep( 84, 95 )
	goto End_QuestNpc00011 
}

CmpQuestNumStep( 84, 95 )
if( yes==1 ){
	D("저의 어머니는 그 공주처럼 잠만 자고 있습니다.")
	SetQuestNumStep( 84, 100 )
	goto End_QuestNpc00011 
}

CmpQuestNumStep( 84, 100 )
if( yes==1 ){
	D("깊은 잠에서 깨어나지를 않고 있습니다.")
	SetQuestNumStep( 84, 105 )
	goto End_QuestNpc00011 
}

CmpQuestNumStep( 84, 105 )
if( yes==1 ){
	D("어머니의 잠이 깊을수록 저의 시름도 깊어진답니다.")
	SetQuestNumStep( 84, 110 )
	goto End_QuestNpc00011 
}

CmpQuestNumStep( 84, 110 )
if( yes==1 ){
	D("시름이 깊어질수록 세상의 모든 일은 나와 상관없이 돌아가게 됐어요.")
	SetQuestNumStep( 84, 115 )
	goto End_QuestNpc00011 
}

CmpQuestNumStep( 84, 115 )
if( yes==1 ){
	D("사람들의 말에 따르면 어머니는 어둠의 병을 얻었다고 합니다.")
	SetQuestNumStep( 84, 120 )
	goto End_QuestNpc00011 
}

CmpQuestNumStep( 84, 120 )
if( yes==1 ){
	D("혹시 어머니의 병을 고칠 수 있는 약을 구할 방법이 없을까요?")
	SetQuestNumStep( 84, 125 )
	goto End_QuestNpc00011 
}

;EQuest84_Npc00011
:End_QuestNpc00011
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
;SQuest71_Npc00031
CmpQuestNumStep( 71, 10 )
if( yes==1 ){
	sGetNat()
	if(yes==3){
	MessageBox("축하하네..하지만 '황혼의 숨결'의 영광이 없으면 트로피 같은 것이 무슨 뜻이 있겠나. 이라무스의 '425,119' 주위의 포탈로 가서 몬스터들과 싸워 황혼 펜던트를 찾으면 돌아오게나.")
	SetQuestNumStep( 71, 15 )
	goto End_QuestNpc00031 
}
	if(yes==4){
	MessageBox("축하하네..하지만 '황혼의 숨결'의 영광이 없으면 트로피 같은 것이 무슨 뜻이 있겠나. 타이넨의 '170,582' 주위의 포탈로 가서 몬스터들과 싸워 황혼 펜던트를 찾으면 돌아오게나.")
	SetQuestNumStep( 71, 15 )
	goto End_QuestNpc00031 
}
	if(yes==6){
	MessageBox("축하하네..하지만 '황혼의 숨결'의 영광이 없으면 트로피 같은 것이 무슨 뜻이 있겠나. 붉은 산맥의 '292,117' 주위의 포탈로 가서 몬스터들과 싸워 황혼 펜던트를 찾으면 돌아오게나.")
	SetQuestNumStep( 71, 15 )
	goto End_QuestNpc00031 
}
	else{
	D("이런! 국적이 없는 사람치고 꽤 멀리도 왔군. 미안하지만 자네는 영웅의 영광을 찾지 못하네..영광은 신들이 내리는 축복이자 국가가 주는 특권이네..국적을 결정하고 오게나..")
	SetQuestNumStep( 71, 15 )
	goto End_QuestNpc00031 
}
}

CmpQuestNumStep( 71, 15 )
if( yes==1 ){
	IsInvHavePC(9050)
	if(yes==1){
	MessageBox("<황혼 펜던트>를 찾았군. 하지만 진정한 시험은 이제부터야. 헤게모니아 '54,444'의 근처로 가면, 당신을 도와줄 사람이 있을걸세..")
	SetQuestNumStep( 71, 20 )
	goto End_QuestNpc00031 
}
	else{
	D("자네 얼굴을 보니 황혼 펜던트를 아직도 못 찾은 모양이군..열심히 해보게나..")		;Stay15
	SetQuestNumStep( 71, 15 )
	goto End_QuestNpc00031 
}
}

;EQuest71_Npc00031
:End_QuestNpc00031
end
@Npc00032
;SQuest73_Npc00032
CmpQuestNumStep( 73, 0 )
if( yes==1 ){
	DualCheck(2)
	if(yes == 1){
	LogDualQuest(73,Qcount,"듀얼 2차 퀘스트",0)	;;20030617 듀얼 퀘스트 로그 파일을 남기기 위해 개굴이가 추가
	Qcount = 0
	GhostLv = 1
	SendSound(0,  1311)
	D("어서 오세요.. 기다리고 있었답니다..")
	SetQuestNumStep( 73, 5 )
	goto End_QuestNpc00032 
}
	else{
	SendSound(0,  1303)
	D("듀얼 클래스 2등급만 자격이 주어진다네.. 좀 더 수련을 한 후에 오게..")		;Stay0
	SetQuestNumStep( 73, 0 )
	goto End_QuestNpc00032 
}
}

CmpQuestNumStep( 73, 5 )
if( yes==1 ){
	D("듀얼 클래스 2등급으로 승급 되신 것을 축하드립니다.")
	SetQuestNumStep( 73, 10 )
	goto End_QuestNpc00032 
}

CmpQuestNumStep( 73, 10 )
if( yes==1 ){
	D("힘든 임무를 마치고 듀얼 2등급이 되셨군요...")
	SetQuestNumStep( 73, 15 )
	goto End_QuestNpc00032 
}

CmpQuestNumStep( 73, 15 )
if( yes==1 ){
	D("총 5등급의 듀얼 클래스에서 2등급이 되셨습니다.")
	SendSound(0,   64)
	SetQuestNumStep( 73, 20 )
	goto End_QuestNpc00032 
}

CmpQuestNumStep( 73, 20 )
if( yes==1 ){
	D("듀얼 등급마다 올릴 수 있는 레벨이 제한돼 있으며 등급이 오를 때마다 많은 혜택을 받게 된 답니다.")
	SetQuestNumStep( 73, 25 )
	goto End_QuestNpc00032 
}

CmpQuestNumStep( 73, 25 )
if( yes==1 ){
	D("듀얼 등급을 올리기 위해서는 그 전과 같이 총 3가지의 시험에 통과하셔야 합니다..")
	SetQuestNumStep( 73, 30 )
	goto End_QuestNpc00032 
}

CmpQuestNumStep( 73, 30 )
if( yes==1 ){
	D("우선 첫 번째는 제가 한 장의 타블렛을 드릴 것입니다.")
	SetQuestNumStep( 73, 35 )
	goto End_QuestNpc00032 
}

CmpQuestNumStep( 73, 35 )
if( yes==1 ){
	D("이 타블렛 안에 24개의 ‘흐름의 조각’을 채워놓으셔야 합니다.")
	SetQuestNumStep( 73, 40 )
	goto End_QuestNpc00032 
}

CmpQuestNumStep( 73, 40 )
if( yes==1 ){
	D("제가 드리는 임무 하나를 해결할 때마다 ‘흐름의 조각’ 하나를 얻게 된답니다.")
	SetQuestNumStep( 73, 45 )
	goto End_QuestNpc00032 
}

CmpQuestNumStep( 73, 45 )
if( yes==1 ){
	MessageBox("24개의 ‘흐름의 조각’을 타블렛 안에 채워놓는다. 타블렛은 임무를 수행하게 되면 받게 된다.")
	SendSound(0,    64)
	SetQuestNumStep( 73, 50 )
	goto End_QuestNpc00032 
}

CmpQuestNumStep( 73, 50 )
if( yes==1 ){
	D("두 번째는 언데드 던전의 몬스터 정벌에 나가 공을 세워야 합니다.")
	SetQuestNumStep( 73, 55 )
	goto End_QuestNpc00032 
}

CmpQuestNumStep( 73, 55 )
if( yes==1 ){
	D("공을 세웠다는 증표로 리치를 죽이게 되면 나오는 ‘리치의 눈알’을 가져오시면 됩니다.")
	SetQuestNumStep( 73, 60 )
	goto End_QuestNpc00032 
}

CmpQuestNumStep( 73, 60 )
if( yes==1 ){
	MessageBox("언데드 던전의 리치를 죽여 ‘리치의 눈알’을 가져온다.")
	SendSound(0,    64)
	SetQuestNumStep( 73, 65 )
	goto End_QuestNpc00032 
}

CmpQuestNumStep( 73, 65 )
if( yes==1 ){
	D("세 번째 시험은 레벨이 120 가 될 때까지 수련을 하셔야 하며, 레더점수가 70,000점 이거나 명성이 3,000 이 되셔야 합니다. ")
	SetQuestNumStep( 73, 70 )
	goto End_QuestNpc00032 
}

CmpQuestNumStep( 73, 70 )
if( yes==1 ){
	MessageBox("첫 번째 레벨 120가 될 때까지 수련을 한다. 두 번째 레더 점수가 70,000점 이거나 명성이 3,000 이 된다.")
	SendSound(0,    64)
	SetQuestNumStep( 73, 75 )
	goto End_QuestNpc00032 
}

CmpQuestNumStep( 73, 75 )
if( yes==1 ){
	D("언데드 던전의 경우 영원히 죽지 않는 언데드 몬스터와 대마법사 리치가 살고 있는 곳입니다.")
	SetQuestNumStep( 73, 80 )
	goto End_QuestNpc00032 
}

CmpQuestNumStep( 73, 80 )
if( yes==1 ){
	D("무수한 마법 공격에 대비하시는 것이 좋으실 겁니다.")
	SetQuestNumStep( 73, 85 )
	goto End_QuestNpc00032 
}
CmpQuestNumStep( 73, 85 )
if( yes==1 ){
	D("그럼 모든 준비가 다 되셨으면 이제부터 임무를 드리도록 하겠습니다.")
	SetQuestNumStep( 73, 90 )
	goto End_QuestNpc00032 
}

CmpQuestNumStep( 73, 90 )
if( yes==1 ){
	D("우선 타블렛을 받으시기 바랍니다. 타블렛은 귀중한 물건이기 때문에 소중히 하셔야 합니다.")
	SetQuestNumStep( 73, 95 )
	goto End_QuestNpc00032 
}

CmpQuestNumStep( 73, 95 )
if( yes==1 ){
	SetItemInvPC(0,  10179,  500)
	EventMsg("'타블렛'을 받았습니다.")
	SetQuestNumStep( 73, 100 )
	goto End_QuestNpc00032 
}

CmpQuestNumStep( 73, 100 )
if( yes==1 ){
	D("임무는 총 5종류가 있으며 수시로 주어지는 임무가 바뀌게 됩니다. 그 전과 같으므로 쉬우실 것입니다.")
	SetQuestNumStep( 73, 105 )
	goto End_QuestNpc00032 
}
CmpQuestNumStep(73,105)
if( yes==1 ){
	random(0,6)
	if(ran==0){
	SendSound(0,64)
	D("이번 임무는 바이서스 기밀 문서를 찾아오는 일입니다.")		;Stay110
	SetQuestNumStep( 73, 110 )
	goto End_QuestNpc00032 
}
	if(ran==1){
	SendSound(0,64)
	D("이번 임무는 자이펀 기밀 문서를 찾아오는 일입니다.")		;Stay130
	SetQuestNumStep( 73, 130 )
	goto End_QuestNpc00032 
}
	if(ran==2){
	SendSound(0,64)
	D("이번 임무는 일스 기밀 문서를 찾아오는 일입니다.")		;Stay150
	SetQuestNumStep(73, 150)
	goto End_QuestNpc00032 
}
	if(ran==3){
	SendSound(0,64)
	D("이번 임무는 헤게모니아의 무녀를 도와주는 일입니다.")	;Stay0
	SetQuestNumStep(29,0)
	D("그녀의 정확한 위치는 헤게모니아 42, 530 우물 근처입니다.")		;Stay106
	SetQuestNumStep(73,106)
	goto End_QuestNpc00032 
}
	if(ran>3){
	SendSound(0,64)
	D("이번 임무는 국지전에서 공을 세우는 일입니다.")		;Stay170
	SetQuestNumStep( 73, 170 )
	goto End_QuestNpc00032 
}
}
CmpQuestNumStep(73,  110)
	if(yes == 1){
	D("기밀 문서는 대초원에서 목격 됐다고 합니다. 아마 듀얼 에틴을 잡으면 구할 수 있을 겁니다.")
	SetQuestNumStep( 73, 115 )
	goto End_QuestNpc00032 
}
 
CmpQuestNumStep( 73, 115 )
if( yes==1 ){
	D("그 지역에 있는 몬스터를 잡으면 바이서스 기밀 문서를 얻을 수 있을 것입니다.")
	SetQuestNumStep( 73, 120 )
	goto End_QuestNpc00032 
}

CmpQuestNumStep( 73, 120 )
if( yes==1 ){
	IsInvHavePC(10176)
	if(yes == 1){
	D("임무에 성공하셨군요..흐름의 조각 하나를 드리겠습니다.")
	SetItemInvPC(10176,  0,  0)
	Qcount = Qcount + 1
	CallMenu(27)
	LogDualQuest(73,Qcount,"듀얼 2차 퀘스트",0)	;;20030617 듀얼 퀘스트 로그 파일을 남기기 위해 개굴이가 추가
	SetQuestNumStep( 73, 125 )
	goto End_QuestNpc00032 
}
	else{
	SendSound(0,  1303)
	D("대초원의 듀얼 에틴을 죽여 바이서스 기밀 문서를 가져오시기 바랍니다.")		;Stay120
	SetQuestNumStep( 73, 120 )
	goto End_QuestNpc00032 
}
}

CmpQuestNumStep( 73, 125 )
if( yes==1 ){
	EventMsg("임무를 성공적으로 수행하셨습니다.")
	if(Qcount>23){
	D("아.. 타블렛을 다 완성하셨군요.. 듀얼 등급을 올릴 수 있는 첫 번째 시험에 통과하셨습니다.")		;Stay185
	SetQuestNumStep( 73, 185 )
	goto End_QuestNpc00032 
}
	else{
	EventMsg("다음 임무가 주어집니다.")		;Stay105
	SetQuestNumStep( 73, 105 )
	goto End_QuestNpc00032 
}
}
CmpQuestNumStep(73,   130)
	if(yes == 1){
	D("기밀 문서는 대초원에서 목격 됐다고 합니다. 아마 듀얼 에틴을 잡으면 구할 수 있을 겁니다.")
	SetQuestNumStep( 73, 135 )
	goto End_QuestNpc00032 
}
 
CmpQuestNumStep( 73, 135 )
if( yes==1 ){
	D("그 지역에 있는 몬스터를 잡으면 자이펀 기밀 문서를 얻을 수 있을 것입니다.")
	SetQuestNumStep( 73, 140 )
	goto End_QuestNpc00032 
}

CmpQuestNumStep( 73, 140 )
if( yes==1 ){
	IsInvHavePC(10177)
	if(yes == 1){
	D("임무에 성공하셨군요..흐름의 조각 하나를 드리겠습니다.")
	SetItemInvPC(10177,   0,   0)
	Qcount = Qcount + 1
	CallMenu(27)
	LogDualQuest(73,Qcount,"듀얼 2차 퀘스트",0)	;;20030617 듀얼 퀘스트 로그 파일을 남기기 위해 개굴이가 추가	
	SetQuestNumStep( 73, 145 )
	goto End_QuestNpc00032 
}
	else{
	SendSound(0,  1303)
	D("대초원의 듀얼 에틴을 죽여 자이펀 기밀 문서를 가져오시기 바랍니다.")		;Stay140
	SetQuestNumStep( 73, 140 )
	goto End_QuestNpc00032 
}
}

CmpQuestNumStep( 73, 145 )
if( yes==1 ){
	EventMsg("임무를 성공적으로 수행하셨습니다.")
	if(Qcount>23){
	D("아.. 타블렛을 다 완성하셨군요.. 듀얼 등급을 올릴 수 있는 첫 번째 시험에 통과하셨습니다.")		;Stay185
	SetQuestNumStep( 73, 185 )
	goto End_QuestNpc00032 
}
	else{
	EventMsg("다음 임무가 주어집니다.")		;Stay105
	SetQuestNumStep( 73, 105 )
	goto End_QuestNpc00032 
}
}
CmpQuestNumStep(73,    150)
	if(yes == 1){
	D("기밀 문서는 대초원에서 목격 됐다고 합니다. 아마 듀얼 에틴을 잡으면 구할 수 있을 겁니다.")
	SetQuestNumStep( 73, 155 )
	goto End_QuestNpc00032 
}
 
CmpQuestNumStep( 73, 155 )
if( yes==1 ){
	D("그 지역에 있는 몬스터를 잡으면 일스 기밀 문서를 얻을 수 있을 것입니다.")
	SetQuestNumStep( 73, 160 )
	goto End_QuestNpc00032 
}

CmpQuestNumStep( 73, 160 )
if( yes==1 ){
	IsInvHavePC(10178)
	if(yes == 1){
	D("임무에 성공하셨군요..흐름의 조각 하나를 드리겠습니다.")
	SetItemInvPC(10178,   0,   0)
	Qcount = Qcount + 1
	CallMenu(27)
	LogDualQuest(73,Qcount,"듀얼 2차 퀘스트",0)	;;20030617 듀얼 퀘스트 로그 파일을 남기기 위해 개굴이가 추가
	SetQuestNumStep( 73, 165 )
	goto End_QuestNpc00032 
}
	else{
	SendSound(0,  1303)
	D("대초원의 듀얼 에틴을 죽여 일스 기밀 문서를 가져오시기 바랍니다.")		;Stay160
	SetQuestNumStep( 73, 160 )
	goto End_QuestNpc00032 
}
}

CmpQuestNumStep( 73, 165 )
if( yes==1 ){
	EventMsg("임무를 성공적으로 수행하셨습니다.")
	if(Qcount>23){
	D("아.. 타블렛을 다 완성하셨군요.. 듀얼 등급을 올릴 수 있는 첫 번째 시험에 통과하셨습니다.")		;Stay185
	SetQuestNumStep( 73, 185 )
	goto End_QuestNpc00032 
}
	else{
	EventMsg("다음 임무가 주어집니다.")		;Stay105
	SetQuestNumStep( 73, 105 )
	goto End_QuestNpc00032 
}
}
CmpQuestNumStep(73,170)
	if(yes == 1){
	D("국지전에 참여해 명성 50 이상을 얻어 오셔야 합니다.")
	SetQuestNumStep( 73, 175 )
	goto End_QuestNpc00032 
}
 
CmpQuestNumStep( 73, 175 )
if( yes==1 ){
	EventMsg("......")
	if(KillDualCount>49){
	D("임무에 성공하셨군요..흐름의 조각 하나를 드리겠습니다.")
	KillDualCount = 0
	Qcount = Qcount + 1
	CallMenu(27)
	LogDualQuest(73,Qcount,"듀얼 2차 퀘스트",0)	;;20030617 듀얼 퀘스트 로그 파일을 남기기 위해 개굴이가 추가	
	SetQuestNumStep( 73, 180 )
	goto End_QuestNpc00032 
}
	else{
	SendSound(0,  1303)
	D("명성이 부족합니다. 국지전에 참여해 명성 50 이상을 얻어 오셔야 합니다.")		;Stay175
	SetQuestNumStep( 73, 175 )
	goto End_QuestNpc00032 
}
}

CmpQuestNumStep( 73, 180 )
if( yes==1 ){
	EventMsg("임무를 성공적으로 수행하셨습니다.")
	if(Qcount>23){
	D("아.. 타블렛을 다 완성하셨군요.. 듀얼 등급을 올릴 수 있는 첫 번째 시험에 통과하셨습니다.")		;Stay185
	SetQuestNumStep( 73, 185 )
	goto End_QuestNpc00032 
}
	else{
	EventMsg("다음 임무가 주어집니다.")		;Stay105
	SetQuestNumStep( 73, 105 )
	goto End_QuestNpc00032 
}
}
CmpQuestNumStep(73,  185)
	if(yes == 1){
	D("듀얼 등급을 올리기 위해서는 3가지의 시험을 통과하셔야 합니다.")
	SendSound(0,  64)
	SetQuestNumStep( 73, 190 )
	goto End_QuestNpc00032 
}
 
CmpQuestNumStep( 73, 190 )
if( yes==1 ){
	D("첫 번째 시험인 타블렛 한 장을 완성하는 시험은 통과하셨습니다.")
	SetQuestNumStep( 73, 195 )
	goto End_QuestNpc00032 
}

CmpQuestNumStep( 73, 195 )
if( yes==1 ){
	D("다음 시험은 언데드 던전에 있는 리치를 죽여 ‘리치의 눈알’을 가져 오셔야 합니다.")
	SetQuestNumStep( 73, 200 )
	goto End_QuestNpc00032 
}

CmpQuestNumStep( 73, 200 )
if( yes==1 ){
	IsInvHavePC(10073)
	if(yes == 1){
	SendSound(0,  1310)
	SetItemInvPC(10073,   0,   0)
	D("이렇게 단 시간내에 언데드 던전 정벌에 성공을 하시다니 정말 대단하십니다..")
	SetQuestNumStep( 73, 205 )
	goto End_QuestNpc00032 
}
	else{
	SendSound(0,  1303)
	D("언데드 던전에 있는 리치를 죽여 '리치의 눈알'을 가져오셔야 합니다.")		;Stay200
	SetQuestNumStep( 73, 200 )
	goto End_QuestNpc00032 
}
}

CmpQuestNumStep( 73, 205 )
if( yes==1 ){
	D("세 번째 시험은 레벨이 120 가 될 때까지 수련을 하셔야 하며, 레더점수가 70,000점 이거나 명성이 3,000 이 되셔야 합니다. ")
	SendSound(0,  64)
	SetQuestNumStep( 73, 210 )
	goto End_QuestNpc00032 
}

CmpQuestNumStep( 73, 210 )
if( yes==1 ){
	CallSmallMenu(200,  1190)
	SetQuestNumStep( 73, 215 )
	goto End_QuestNpc00032 
}

CmpQuestNumStep( 73, 215 )
if( yes==1 ){
	DualCheck(3)
	if(yes==1){
	SendSound(0,  1311)
	Qcount = 0
	GhostLv = GhostLv + 1
	D("듀얼 3등급이 되신 거를 축하드립니다.")		;Stay220
	SetQuestNumStep( 73, 220 )
	goto End_QuestNpc00032 
}
	else{
	D("세번째 시험을 통과하지 못하셨군요..좀 더 수련을 하셔야 합니다")		;Stay210
	SetQuestNumStep( 73, 210 )
	goto End_QuestNpc00032 
}
}
CmpQuestNumStep(73,  220)
	if(yes == 1){
	D("저의 임무는 여기까지가 끝입니다.")
	SetQuestNumStep( 73, 225 )
	goto End_QuestNpc00032 
}
 
CmpQuestNumStep( 73, 225 )
if( yes==1 ){
	D("듀얼 3등급부터는 헤게모니아 [92,447] 에 있는 사람을 찾아가시면 됩니다.")
	SetQuestNumStep( 73, 230 )
	goto End_QuestNpc00032 
}

CmpQuestNumStep( 73, 230 )
if( yes==1 ){
	SendSound(0,  51)
	D("아 잊은게 있었군요.. 이 아이템은 듀얼 3등급까지 오른 사람에게 주는 것입니다.")
	sSetRareItemInvPc(8041,1,2,2,53)
	SetQuestNumStep( 73, 235 )
	LogDualQuest(73,Qcount,"듀얼 2차 퀘스트",1)	;;20030617 듀얼 퀘스트 로그 파일을 남기기 위해 개굴이가 추가
	goto End_QuestNpc00032 
}

CmpQuestNumStep( 73, 235 )
if( yes==1 ){
	D("그럼.. 신의 가호가 있기를...")
	SetQuestNumStep( 73, 235 )
	goto End_QuestNpc00032 
}

;EQuest73_Npc00032
:End_QuestNpc00032
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
	MoveDungeon("Abyss_1",274,564)
end
@Event00002
;; 미니던전 1층
;; 출입조건 Level 61~90
	sGetLevel()
	if( yes >= 61 )
	{
		if( yes <= 90 )
		{
			MapMove( "Mini2", 185,54 )
			if( yes == 1 )
			{
				EventMsg("<미니던전>으로 이동합니다.")
			}
			else
			{
				EventMsg("맵 이동에 실패했습니다.")
			}
		}
		else	; 레벨 61 이상 91 이상
		{
			EventMsg("이 곳은 레벨 61 ~ 90 인 영웅들만 출입할 수 있는 곳입니다.  당신은 너무 레벨이 높군요.")
		}
	}
	else	; 레벨 61 미만
	{
		EventMsg("이 곳은 레벨 61 ~ 90 인 영웅들만 출입할 수 있는 곳입니다. 당신은 아직 레벨이 낮군요.")
	}
end
@Event00003
;; 얼음던전 1층
;; 출입조건 Level 31~60
	sGetLevel()
	if( yes >= 31 )
	{
		if( yes <= 60 )
		{
			MapMove( "Ice-w02", 209,82 )
			if( yes == 1 )
			{
				EventMsg("<얼음던전>으로 이동합니다.")
			}
			else
			{
				EventMsg("맵 이동에 실패했습니다.")
			}
		}
		else	; 레벨 31 이상 61 이상
		{
			EventMsg("이 곳은 레벨 31 ~ 60 인 영웅들만 출입할 수 있는 곳입니다. 당신은 레벨이 높군요.")
		}
	}
	else	; 레벨 31 미만
	{
		EventMsg("이 곳은 레벨 31 ~ 60 인 영웅들만 출입할 수 있는 곳입니다. 당신은 아직 레벨이 낮군요.")
	}
end
@Event00004
;; 어둠의던전
;; 출입조건 Level 81 ~
	sGetLevel()
	if( yes >= 81 )
	{
		MapMove( "darkdun1", 120,246 )
		if( yes == 1 )
		{
			EventMsg("<어둠의던전>으로 이동합니다.")
		}
		else
		{
			EventMsg("맵 이동에 실패했습니다.")
		}
	}
	else	; 레벨 81 미만
	{
		EventMsg("이 곳은 레벨 81 이상인 영웅들만 출입할 수 있는 곳입니다. 당신은 아직 레벨이 낮군요.")
	}
end
@Event00005
;; 대초원
	MapMove( "big_g", 187,705 )
	if( yes == 1 )
	{
		EventMsg("<대초원>으로 이동합니다.")
	}
	else
	{
		EventMsg("맵 이동에 실패했습니다.")
	}
end
@Event00006
;; 레테의 산맥
	MapMove( "Lethe_hill", 531,530 )
	if( yes == 1 )
	{
		EventMsg("<레테의 산맥>으로 이동합니다.")
	}
	else
	{
		EventMsg("맵 이동에 실패했습니다.")
	}
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



