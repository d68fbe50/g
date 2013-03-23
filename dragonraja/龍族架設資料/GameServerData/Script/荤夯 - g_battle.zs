
@sys00	; 처음 서버 Setting하는 함수.

	MaxNPC( 50 )
	
	MapName( "G_battle" )
	
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
@Npc00001	; Guard

end
@Npc00002	; select battle-map
	D("죄송합니다. 현재 콜로서스 맵을 선택할 수 있는 곳을 준비중입니다..")
	QuestTeleport(1,87,14)
end
@Npc00003	; view ladder point
        random( 0 , 2 ) 
       	if( ran == 0 ) 
        {
	        D( "내가 래더 점수를 알려주지.. 잠시만 기다리게.. 계산중이니까 건드리지 말게... " )
        }
       	if( ran == 1 ) 
        {
        	D( "자신의 최신 래더 점수를 알고 싶다면, 다시 한번 클릭해야 하니까 알아두게." ) 
        }	
        CallSmallMenu( 0, 81 )
end
@Npc00004
end
@Npc00005	; bank
        random( 0, 3 ) 
        if( ran == 0 ) 
        {
	        D( "돈은 많은가?" )
        }       
        if( ran == 1)
        {
	        D( "이 곳은 콜로서스 은행입니다.." ) 
        }       
        if( ran == 2 ) 
        {
	        D( "이곳은 예금, 보관 업무를 하고 있습니다." ) 
        }
        CallSmallMenu( 0, 13 )

end
@Npc00006
	CmpQuestNumStep(49,1)
	if( yes == 0) ; 작다
	{
		D("겜블을 하려고 왔군.. 우선 겜블을 하기 위해서는 '겜블 스톤'을 가지고 있어야 하지.. 겜블 스톤은 길드전을 통해 구할 수가 있을 걸세..")
		SetQuestNumStep(49,1)
		goto END3_
	}
	if( yes == 1) ; 같다
	{
		D("겜블은 겜블창 안에 '겜블 스톤'을 올려 놓고 Gamble 버튼을 누르면 되네.. 아주 쉬울 거야.. 하지만 머리를 써야 좋은 아이템을 구할 수 있을거야...")
		SetQuestNumStep(49,2)
		goto END3_
	}
	if( yes == 2) ; 크다
	{
		D("오늘의 아이템은 고급 겜블 스톤 5개가 필요하네.. 겜블이란 100% 성공할 수가 없다는 것을 알아두게..")
		SetQuestNumStep(49,0)
		CallMenu(29)
		goto END3_
	}


:END3_
end
@Npc00007	
end
@Npc00008   
end
@Npc00009	
end

@Npc00010	; alchemist
        random( 0, 3 ) 
        if( ran == 0 ) 
        {
	        D( "이 포션 한번 먹어봐.. 온몸엔 힘이 불끈불끈, 두 눈엔 빛이 초롱초롱.." )
        }       
        if( ran == 1)
        {
	        D( "새 포션은 새 병에 담고, 새 음식은 목구멍으로 넘겨야 제맛이지." ) 
        }       
        if( ran == 2 ) 
        {
	        D( "여기서 파는 빨간 포션을 먹으면 상처가 말끔히 사라진다네.. " ) 
        }
        CallSmallMenu( 0, 25 )
end
@Npc00011
end
@Npc00012	; bakery
        random( 0, 3 ) 
        if( ran == 0 ) 
        {
	        D( "경기에 참가해서는 항상 조심해야 되네.. 어디서 불새가 날아올지 모르거든..." ) 
        }       
        if( ran == 1) 
        {
	        D( "자네도 아레나에 참가하려고? 이럴 때일수록 뱃속이 든든해야지..." )
        }       
        if( ran == 2 ) 
        {
	        D( "내가 가르친 제자가 일스 요리대회에서 1등을 했다네. 움하하~ " )
        }
        CallSmallMenu( 0, 20 )
end
@Npc00013	
end
@Npc00014	; weapon shop
        random( 0, 3 ) 
        if( ran == 0 ) 
        {
	        D( "무기를 만드는 것은 참으로 위험한 일이야..." ) 
        }       
        if( ran == 1) 
        {
	        D( "뛰어난 대장장이는 연장 탓을 안하지. 전사도 마찬가지라네.." ) 
        }       
        if( ran == 2 ) 
        {
	        D( "대장장이의 죽음으로 만들어진 무기에는 그 혼이 서려있죠... " ) 
        }
        CallSmallMenu( 0, 18 )
end
@Npc00015	; carpenter's shop
        random( 0, 3 ) 
        if( ran == 0 ) 
        {
	        D( "나무는 참으로 유용한 재료야.. 숲은 천연재료의 보고라고 할 수 있지." ) 
        }       
        if( ran == 1) 
        {
	        D( "여기서 만든 물건들은 모두 직접 손으로 만든 것들이지.." ) 
        }       
        if( ran == 2 ) 
        {
	        D( "지팡이에도 마법검처럼 마법을 불어넣을 수 있지.." ) 
        }
        CallSmallMenu( 0, 26 )
end
@Npc00016	; bow shop
        random( 0, 3 ) 
        if( ran == 0 ) 
        {
	        D( "활은 재료에 따라 여러종류가 있다네..." ) 
        }       
        if( ran == 1) 
        {
	        D( "화살은 화살촉과 깃털이 매우 중요한 재료가 되지..." ) 
        }       
        if( ran == 2 ) 
        {
	        D( "누군가 자네의 심장을 겨누어 쏜다고 생각해보게.. 끔찍하군.. " ) 
        }
        CallSmallMenu( 0, 27 )
end
@Npc00017
end
@Npc00018
end
@Npc00019	; astrologer
        random( 0, 3 ) 
        if( ran == 0 ) 
        {
	        D( "최근의 별들의 움직임을 살펴 보니, 새로운 영웅이 이쪽으로 오고 있는 거 같더군.." ) 
        }       
        if( ran == 1) 
        {
	        D( "자네도 영웅이 되고 싶어 찾아온 건가? 흐흐.. " ) 
        }       
        if( ran == 2 ) 
        {
	        D( "영웅은 타고나는 것이 아니라, 시대가 영웅을 만들어내는 것이지.. " ) 
        }
        CallSmallMenu( 0, 71 )
end

@Npc00020	
end
@Npc00021	
end
@Npc00022	
end
@Npc00023	
end
@Npc00024	; bow shop 2
        random( 0, 3 ) 
        if( ran == 0 ) 
        {
	        D( "저 쪽에서는 내 형제가 활을 팔고 있으니, 그쪽도 많이 이용해주게..." ) 
        }       
        if( ran == 1) 
        {
	        D( "엘프의 머리카락은 활줄을 만들기에 제격이지... " ) 
        }       
        if( ran == 2 ) 
        {
	        D( "당신도 아레나에 참가하고 싶은가요? 당신의 건투를 빕니다.." ) 
        }
        CallSmallMenu( 0, 27 )
end
@Npc00025	; Edelbroy's
        random( 0, 3 ) 
        if( ran == 0 ) 
        {
	        D( "바람속에 흩날리는 코스모스를.." ) 
        }       
        if( ran == 1) 
        {
	        D( "에델브로이는 헬카네스를 따르는 신이죠.." ) 
        }       
        if( ran == 2 ) 
        {
	        D( "당신에게 에델브로이의 은총이 함께하기를 바랍니다.." ) 
        }
        CallSmallMenu( 0, 73 )

end
@Npc00026
end
@Npc00027	
end
@Npc00028	; bakery 2
        random( 0, 3 ) 
        if( ran == 0 ) 
        {
	        D( "아레나에 참가하려니 흥분되나요? 이럴때일수록 든든해야죠..." ) 
        }       
        if( ran == 1) 
        {
	        D( "제가 일스 요리대회에서 2위를 했답니다. 다음엔 꼭 1위를 해야하는데..." ) 
        }       
        if( ran == 2 ) 
        {
	        D( "당신은 <은거한 영웅의 이야기>란 노래를 들어보셨나요? " ) 
        }
        CallSmallMenu( 0, 20 )
end
@Npc00029	; carpenter's shop
        random( 0, 3 ) 
        if( ran == 0 ) 
        {
	        D( "난 당신이 아레나에서 살아있는 전설이 되었으면 합니다..." ) 
        }       
        if( ran == 1) 
        {
	        D( "유피넬과 헬카네스는 시간을 만들어내고, 시간은 나의 주름살을 만들었지.." ) 
        }       
        if( ran == 2 ) 
        {
	        D( "당신도 아레나에서 전설이 될 수 있습니다.." ) 
        }
        CallSmallMenu( 0, 26 )
end

@Npc00030	; weapon shop 2
        random( 0, 3 ) 
        if( ran == 0 ) 
        {
	        D( "검이란 무시무시한 예리함으로 피를 부르는 물건이라네.." ) 
        }       
        if( ran == 1) 
        {
	        D( "칼이란 끊임없이 갈고 닦아야 녹슬지 않는 법이죠..." ) 
        }       
        if( ran == 2 ) 
        {
	        D( "상대방의 정신까지도 베는 것이 진정한 고수의 실력이죠.." ) 
        }
        CallSmallMenu( 0, 18 )
end
@Npc00031
;SQuest71_Npc00031
CmpQuestNumStep( 71, 0 )
if( yes==1 ){
	MessageBox("래더점수가 5000이 넘는 사람들에게 <챔피온의 트로피>를 드립니다. 챔피온의 트로피는 은거한 영웅에 관한 이야기의 열쇠랍니다.")
	SetQuestNumStep( 71, 5 )
	goto End_QuestNpc00031 
}

CmpQuestNumStep( 71, 5 )
if( yes==1 ){
	CompLadderScore(5000)
	if(yes>=1){
	D("자네 레더 점수가 5000점 넘었군! 이것으로 챔피온의 트로피를 받을 자격이 있네. 챔피온의 트로피는 자네의 배낭에 내가 넣어줌세.")
	SetItemInvPC(0,  9048,  500)
	if(yes==1){
	EventMsg("당신의 배낭에 <챔피온의 트로피>가 추가되었습니다.")
	MessageBox("웨스트그레이드'327,14' 이 곳에 은거한 영웅이 자네를 도와줄 수 있을거야..")
	SetQuestNumStep( 71, 10 )
	goto End_QuestNpc00031 
}
	else{
	EventMsg("배낭이 가득 찼군. 트로피를 넣을 공간이 부족해..왠만하면 정리 좀 하지그래?")		;End
	SetQuestNumStep( 71, 5 )
	goto End_QuestNpc00031 
}
}
	else{
	D("Colossus의 영광은 5000점 이상인 자에게 주어는것이네. 점수를 더 올리고 오게.")		;End
	SetQuestNumStep( 71, 5 )
	goto End_QuestNpc00031 
}
}
CmpQuestNumStep( 71, 25 )
if( yes==1 ){
	MessageBox("황혼의 트로피는 래더점수가 7000이 넘는 사람들에게만 주어지는 것이랍니다. 황혼의 트로피는 황혼 펜던트에 '황혼의 숨결'을 부여할 수 있게 해 줍니다.")
	SetQuestNumStep( 71, 30 )
	goto End_QuestNpc00031 
}

CmpQuestNumStep( 71, 30 )
if( yes==1 ){
	CompLadderScore(7000)
	if(yes>=1){
	D("이 트로피를 받을 자격이 있는 사람은 이 대륙에서 몇안되는 것인데..굉장한 영광입니다. 이 트로피를 받으십시오. 당신은 충분히 이 영광을 누릴 자격이 있는 영웅입니다.")
	SetItemInvPC(0,  9049,  500)
	if(yes==1){
	EventMsg("당신의 배낭에 <황혼의 트로피>가 추가되었습니다.")
	MessageBox("당신의 배낭에 황혼의 트로피를 넣었으니 잘 간직하십시오.. 이제 헤게모니아 '54,444'에 있는 은거한 영웅을 만나보십시오..")
	SetQuestNumStep( 71, 35 )
	goto End_QuestNpc00031 
}
	else{
	EventMsg("배낭이 가득 차셨군요. 트로피를 넣을 공간이 부족합니다. 정리를 해주시길..")
	SetQuestNumStep( 71, 35 )
	goto End_QuestNpc00031 
}
}
	else{
	D("레더 점수가 아직 7000점이 되시지 못했군요. 영광을 위해서라도 싸우셔서 점수를 획득하시길 바랍니다.")		;Stay30
	SetQuestNumStep( 71, 30 )
	goto End_QuestNpc00031 
}
}

;EQuest71_Npc00031
:End_QuestNpc00031
end
@Npc00032	
;SQuest72_Npc00032
CmpQuestNumStep(72,0)
if( yes==1 ){
	DualCheck(1)
	if(yes == 1){
	Qcount = 0
	GhostLv = 0
	SendSound(0, 1311)
	D("듀얼 클래스로 승급 되신 것을 축하드립니다.")
	SetQuestNumStep(72,5)
	goto End_QuestNpc00032 
}
	else{
	SendSound(0, 1303)
	D("듀얼 클래스만 자격이 주어진다네... 좀 더 수련을 한 후에 오게...")		;Stay0
	SetQuestNumStep(72,0)
	goto End_QuestNpc00032 
}
}

CmpQuestNumStep(72,5)
if( yes==1 ){
	D("우선 저는 듀얼 클래스를 관리하고 승급을 담당하고 있습니다.")
	SetQuestNumStep(72,10)
	goto End_QuestNpc00032 
}

CmpQuestNumStep(72,10)
if( yes==1 ){
	D("이제부터가 진정한 영웅의 첫걸음이라고 생각하시면 될 겁니다.")
	SetQuestNumStep(72,15)
	goto End_QuestNpc00032 
}

CmpQuestNumStep(72,15)
if( yes==1 ){
	D("듀얼 클래스에는 총 5 등급 나누어져 있으며 현재 맨 처음 단계인 1등급이십니다.")
	SendSound(0,  64)
	SetQuestNumStep(72,20)
	goto End_QuestNpc00032 
}

CmpQuestNumStep(72,20)
if( yes==1 ){
	D("듀얼 등급마다 올릴 수 있는 레벨이 제한돼 있으며 등급이 오를 때마다 많은 혜택을 받게 된 답니다.")
	SetQuestNumStep(72,25)
	goto End_QuestNpc00032 
}

CmpQuestNumStep(72,25)
if( yes==1 ){
	D("듀얼 등급을 올리기 위해서는 총 3가지의 시험에 통과하셔야 합니다..")
	SetQuestNumStep(72,30)
	goto End_QuestNpc00032 
}

CmpQuestNumStep(72,30)
if( yes==1 ){
	D("우선 첫 번째는 제가 한 장의 타블렛을 드릴 것입니다.")
	SetQuestNumStep(72,35)
	goto End_QuestNpc00032 
}

CmpQuestNumStep(72,35)
if( yes==1 ){
	D("이 타블렛 안에 24개의 ‘흐름의 조각’을 채워놓으셔야 합니다.")
	SetQuestNumStep(72,40)
	goto End_QuestNpc00032 
}

CmpQuestNumStep(72,40)
if( yes==1 ){
	D("제가 드리는 임무 하나를 해결할 때마다 ‘흐름의 조각’ 하나를 얻게 된답니다.")
	SetQuestNumStep(72,45)
	goto End_QuestNpc00032 
}

CmpQuestNumStep(72,45)
if( yes==1 ){
	MessageBox("24개의 ‘흐름의 조각’을 타블렛 안에 채워놓는다. 타블렛은 임무를 수행하게 되면 받게 된다.")
	SendSound(0,   64)
	SetQuestNumStep(72,50)
	goto End_QuestNpc00032 
}

CmpQuestNumStep(72,50)
if( yes==1 ){
	D("두 번째는 아비스 미궁의 몬스터 정벌에 나가 공을 세워야 합니다.")
	SetQuestNumStep(72,55)
	goto End_QuestNpc00032 
}

CmpQuestNumStep(72,55)
if( yes==1 ){
	D("공을 세웠다는 증표로 발록을 죽이게 되면 나오는 ‘발록의 이빨’을 가져오시면 됩니다.")
	SetQuestNumStep(72,60)
	goto End_QuestNpc00032 
}

CmpQuestNumStep(72,60)
if( yes==1 ){
	MessageBox("아비스 미궁의 발록을 죽여 ‘발록의 이빨’을 가져온다.")
	SendSound(0,   64)
	SetQuestNumStep(72,65)
	goto End_QuestNpc00032 
}

CmpQuestNumStep(72,65)
if( yes==1 ){
	D("세 번째 시험은 레벨이 110 이 될 때까지 수련을 하셔야 하며, 레더점수가 60,000점 이거나 명성이 2,500 이 되셔야 합니다. ")
	SetQuestNumStep(72,70)
	goto End_QuestNpc00032 
}

CmpQuestNumStep(72,70)
if( yes==1 ){
	MessageBox("첫 번째 레벨 110 이 될 때까지 수련을 한다. 두 번째 레더 점수가 60,000점 이거나 명성이 2,500 이 된다.")
	SendSound(0,   64)
	SetQuestNumStep(72,75)
	goto End_QuestNpc00032 
}

CmpQuestNumStep(72,75)
if( yes==1 ){
	D("아비스 미궁은 다양한 트랩과 이계 몬스터들이 있는 곳입니다.")
	SetQuestNumStep(72,80)
	goto End_QuestNpc00032 
}

CmpQuestNumStep(72,80)
if( yes==1 ){
	D("발록을 죽이기 위해서는 많은 수련을 통해 능력을 키우셔야 합니다.")
	SetQuestNumStep(72,85)
	goto End_QuestNpc00032 
}
CmpQuestNumStep(72,85)
if( yes==1 ){
	D("그럼 모든 준비가 다 되셨으면 이제부터 임무를 드리도록 하겠습니다.")
	SetQuestNumStep(72,90)
	goto End_QuestNpc00032 
}

CmpQuestNumStep(72,90)
if( yes==1 ){
	D("우선 타블렛을 받으시기 바랍니다. 타블렛은 귀중한 물건이기 때문에 소중히 하셔야 합니다.")
	SetQuestNumStep(72,95)
	goto End_QuestNpc00032 
}

CmpQuestNumStep(72,95)
if( yes==1 ){
	SetItemInvPC(0, 10179, 500)
	EventMsg("'타블렛'을 받았습니다.")
	SetQuestNumStep(72,100)
	goto End_QuestNpc00032 
}

CmpQuestNumStep(72,100)
if( yes==1 ){
	D("임무는 총 4종류가 있으며 수시로 주어지는 임무가 바뀌게 됩니다.")
	SetQuestNumStep(72,105)
	goto End_QuestNpc00032 
}
CmpQuestNumStep(72,105)
if( yes==1 ){
	random(0, 10)
	if(ran < 2){
	SendSound(0,  64)
	D("이번 임무는 바이서스 기밀 문서를 찾아오는 일입니다.")		;Stay110
	SetQuestNumStep(72,110)
	goto End_QuestNpc00032 
}
	if(ran < 4){
	SendSound(0,  64)
	D("이번 임무는 자이펀 기밀 문서를 찾아오는 일입니다.")		;Stay130
	SetQuestNumStep(72,130)
	goto End_QuestNpc00032 
}
	if(ran < 6){
	SendSound(0,  64)
	D("이번 임무는 일스 기밀 문서를 찾아오는 일입니다.")		;Stay150
	SetQuestNumStep(72,150)
	goto End_QuestNpc00032 
}
	if(ran > 5){
	SendSound(0,  64)
	D("이번 임무는 국지전에서 공을 세우는 일입니다.")		;Stay170
	SetQuestNumStep(72,170)
	goto End_QuestNpc00032 
}
}
CmpQuestNumStep(72, 110)
	if(yes == 1){
	D("기밀 문서는 대초원에서 목격 됐다고 합니다. 아마 듀얼 에틴을 잡으면 구할 수 있을 겁니다.")
	SetQuestNumStep(72,115)
	goto End_QuestNpc00032 
}
 
CmpQuestNumStep(72,115)
if( yes==1 ){
	D("그 지역에 있는 몬스터를 잡으면 바이서스 기밀 문서를 얻을 수 있을 것입니다.")
	SetQuestNumStep(72,120)
	goto End_QuestNpc00032 
}

CmpQuestNumStep(72,120)
if( yes==1 ){
	IsInvHavePC(10176)
	if(yes == 1){
	D("임무에 성공하셨군요..흐름의 조각 하나를 드리겠습니다.")
	SetItemInvPC(10176, 0, 0)
	Qcount = Qcount + 1
	CallMenu(27)
	SetQuestNumStep(72,125)
	goto End_QuestNpc00032 
}
	else{
	SendSound(0, 1303)
	D("대초원의 듀얼 에틴을 죽여 바이서스 기밀 문서를 가져오시기 바랍니다.")		;Stay120
	SetQuestNumStep(72,120)
	goto End_QuestNpc00032 
}
}

CmpQuestNumStep(72,125)
if( yes==1 ){
	EventMsg("임무를 성공적으로 수행하셨습니다.")
	if(Qcount>23){
	D("아.. 타블렛을 다 완성하셨군요.. 듀얼 등급을 올릴 수 있는 첫 번째 시험에 통과하셨습니다.")		;Stay185
	SetQuestNumStep(72,185)
	goto End_QuestNpc00032 
}
	else{
	EventMsg("다음 임무가 주어집니다.")		;Stay105
	SetQuestNumStep(72,105)
	goto End_QuestNpc00032 
}
}
CmpQuestNumStep(72, 130)
	if(yes == 1){
	D("기밀 문서는 대초원에서 목격 됐다고 합니다. 아마 듀얼 에틴을 잡으면 구할 수 있을 겁니다.")
	SetQuestNumStep(72,135)
	goto End_QuestNpc00032 
}
 
CmpQuestNumStep(72,135)
if( yes==1 ){
	D("그 지역에 있는 몬스터를 잡으면 자이펀 기밀 문서를 얻을 수 있을 것입니다.")
	SetQuestNumStep(72,140)
	goto End_QuestNpc00032 
}

CmpQuestNumStep(72,140)
if( yes==1 ){
	IsInvHavePC(10177)
	if(yes == 1){
	D("임무에 성공하셨군요..흐름의 조각 하나를 드리겠습니다.")
	SetItemInvPC(10177,  0,  0)
	Qcount = Qcount + 1
	CallMenu(27)
	SetQuestNumStep(72,145)
	goto End_QuestNpc00032 
}
	else{
	SendSound(0, 1303)
	D("대초원의 듀얼 에틴을 죽여 자이펀 기밀 문서를 가져오시기 바랍니다.")		;Stay140
	SetQuestNumStep(72,140)
	goto End_QuestNpc00032 
}
}

CmpQuestNumStep(72,145)
if( yes==1 ){
	EventMsg("임무를 성공적으로 수행하셨습니다.")
	if(Qcount>23){
	D("아.. 타블렛을 다 완성하셨군요.. 듀얼 등급을 올릴 수 있는 첫 번째 시험에 통과하셨습니다.")		;Stay185
	SetQuestNumStep(72,185)
	goto End_QuestNpc00032 
}
	else{
	EventMsg("다음 임무가 주어집니다.")		;Stay105
	SetQuestNumStep(72,105)
	goto End_QuestNpc00032 
}
}
CmpQuestNumStep(72, 150)
	if(yes == 1){
	D("기밀 문서는 대초원에서 목격 됐다고 합니다. 아마 듀얼 에틴을 잡으면 구할 수 있을 겁니다.")
	SetQuestNumStep(72,155)
	goto End_QuestNpc00032 
}
 
CmpQuestNumStep(72,155)
if( yes==1 ){
	D("그 지역에 있는 몬스터를 잡으면 일스 기밀 문서를 얻을 수 있을 것입니다.")
	SetQuestNumStep(72,160)
	goto End_QuestNpc00032 
}

CmpQuestNumStep(72,160)
if( yes==1 ){
	IsInvHavePC(10178)
	if(yes == 1){
	D("임무에 성공하셨군요..흐름의 조각 하나를 드리겠습니다.")
	SetItemInvPC(10178,  0,  0)
	Qcount = Qcount + 1
	CallMenu(27)
	SetQuestNumStep(72,165)
	goto End_QuestNpc00032 
}
	else{
	SendSound(0, 1303)
	D("대초원의 듀얼 에틴을 죽여 일스 기밀 문서를 가져오시기 바랍니다.")		;Stay160
	SetQuestNumStep(72,160)
	goto End_QuestNpc00032 
}
}

CmpQuestNumStep(72,165)
if( yes==1 ){
	EventMsg("임무를 성공적으로 수행하셨습니다.")
	if(Qcount>23){
	D("아.. 타블렛을 다 완성하셨군요.. 듀얼 등급을 올릴 수 있는 첫 번째 시험에 통과하셨습니다.")		;Stay185
	SetQuestNumStep(72,185)
	goto End_QuestNpc00032 
}
	else{
	EventMsg("다음 임무가 주어집니다.")		;Stay105
	SetQuestNumStep(72,105)
	goto End_QuestNpc00032 
}
}
CmpQuestNumStep(72, 170)
	if(yes == 1){
	D("국지전에 참여해 명성 50 이상을 얻어 오셔야 합니다.")
	SetQuestNumStep(72,175)
	goto End_QuestNpc00032 
}
 
CmpQuestNumStep(72,175)
if( yes==1 ){
	EventMsg("......")
	if(KillDualCount>49){
	D("임무에 성공하셨군요..흐름의 조각 하나를 드리겠습니다.")
	KillDualCount = 0
	Qcount = Qcount + 1
	CallMenu(27)
	SetQuestNumStep(72,180)
	goto End_QuestNpc00032 
}
	else{
	SendSound(0, 1303)
	D("명성이 부족합니다. 국지전에 참여해 명성 50 이상을 얻어 오셔야 합니다.")		;Stay175
	SetQuestNumStep(72,175)
	goto End_QuestNpc00032 
}
}

CmpQuestNumStep(72,180)
if( yes==1 ){
	EventMsg("임무를 성공적으로 수행하셨습니다.")
	if(Qcount>23){
	D("아.. 타블렛을 다 완성하셨군요.. 듀얼 등급을 올릴 수 있는 첫 번째 시험에 통과하셨습니다.")		;Stay185
	SetQuestNumStep(72,185)
	goto End_QuestNpc00032 
}
	else{
	EventMsg("다음 임무가 주어집니다.")		;Stay105
	SetQuestNumStep(72,105)
	goto End_QuestNpc00032 
}
}
CmpQuestNumStep(72, 185)
	if(yes == 1){
	D("듀얼 등급을 올리기 위해서는 3가지의 시험을 통과하셔야 합니다.")
	SendSound(0, 64)
	SetQuestNumStep(72,190)
	goto End_QuestNpc00032 
}
 
CmpQuestNumStep(72,190)
if( yes==1 ){
	D("첫 번째 시험인 타블렛 한 장을 완성하는 시험은 통과하셨습니다.")
	SetQuestNumStep(72,195)
	goto End_QuestNpc00032 
}

CmpQuestNumStep(72,195)
if( yes==1 ){
	D("다음 시험은 아비스 미궁에 있는 발록을 죽여 ‘발록의 이빨’을 얻어 오셔야 합니다.")
	SetQuestNumStep(72,200)
	goto End_QuestNpc00032 
}

CmpQuestNumStep(72,200)
if( yes==1 ){
	IsInvHavePC(10064)
	if(yes == 1){
	SendSound(0, 1310)
	SetItemInvPC(10064, 0, 0)
	D("이렇게 단 시간내에 아비스 미궁 정벌에 성공을 하시다니 정말 대단하십니다..")
	SetQuestNumStep(72,205)
	goto End_QuestNpc00032 
}
	else{
	SendSound(0, 1303)
	D("아비스 미궁에 있는 발록을 죽여 '발록의 이빨'을 얻어 오셔야 합니다.")		;Stay200
	SetQuestNumStep(72,200)
	goto End_QuestNpc00032 
}
}

CmpQuestNumStep(72,205)
if( yes==1 ){
	D("세 번째 시험은 레벨이 110 이 될 때까지 수련을 하셔야 하며, 레더점수가 60,000점 이거나 명성이 2,500 이 되셔야 합니다. ")
	SendSound(0, 64)
	SetQuestNumStep(72,210)
	goto End_QuestNpc00032 
}

CmpQuestNumStep(72,210)
if( yes==1 ){
	CallSmallMenu(200, 1190)
	SetQuestNumStep(72,215)
	goto End_QuestNpc00032 
}

CmpQuestNumStep(72,215)
if( yes==1 ){
	DualCheck(2)
	if(yes==1){
	SendSound(0, 1311)
	Qcount = 0
	GhostLv = GhostLv + 1
	D("듀얼 2등급이 되신 거를 축하드립니다.")		;Stay220
	SetQuestNumStep(72,220)
	goto End_QuestNpc00032 
}
	else{
	D("세번째 시험을 통과하지 못하셨군요..좀 더 수련을 하셔야 합니다")		;Stay210
	SetQuestNumStep(72,210)
	goto End_QuestNpc00032 
}
}
CmpQuestNumStep(72,  220)
	if(yes == 1){
	D("저의 임무는 여기까지가 끝입니다.")
	SetQuestNumStep(72,225)
	goto End_QuestNpc00032 
}
 
CmpQuestNumStep(72,225)
if( yes==1 ){
	D("듀얼 2등급부터는 웨스트 그레이드 [356,15] 에 있는 사람을 찾아가시면 됩니다.")
	SetQuestNumStep(72,230)
	goto End_QuestNpc00032 
}

CmpQuestNumStep(72,230)
if( yes==1 ){
	SendSound(0, 51)
	D("아 잊은게 있었군요.. 이 아이템은 듀얼 2등급까지 오른 사람에게 주는 것입니다.")
	sSetRareItemInvPc(9042,1,2,2,2)
	SetQuestNumStep(72,235)
	goto End_QuestNpc00032 
}

CmpQuestNumStep(72,235)
if( yes==1 ){
	D("그럼.. 신의 가호가 있기를...")
	SetQuestNumStep(72,235)
	goto End_QuestNpc00032 
}

;EQuest72_Npc00032
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
	FameCheck(999)
	if( yes == 1)
	{
		D("Fame 이 1000 이상인 분들은 복구가 되지 않습니다.")
	}
	else
	{
		FameUp(1000)
		D("Fame 이 복구돼서 1000 이 올라가게 됩니다.")
	}
end

@Npc00041

end
@Npc00042
	CheckEventJoin(4)
	if( yes == 1 )
	{
		goto END4201_
	}
	else
	{
		D(" 홈페이지에서 이벤트 참가를 하신 경우에만 OX 퀴즈에 참가할 수 있습니다.")
		goto END4299_
	}

:END4201_ 	; 랜덤한 지역으로 이동
	random( 0, 2 ) 
        if( ran == 0 ) 
        {
		goto END4202_
	}       
        if( ran == 1)
        {
        	goto END4203_
        }
      
:END4202_ 	; OX 퀴즈 1번 지역으로 이동

	MapMove( "EVENT2", 25, 17 )
	if( yes == 1 )
	{
		ClearEventJoin(4)
		EventMsg(" OX 퀴즈 이벤트 지역으로 이동합니다.")
	}
	else
	{
		EventMsg(" OX 퀴즈 이벤트를 준비중입니다. ")
		goto END4299_
	}

:END4203_	; OX 퀴즈 2번 지역으로 이동

	MapMove( "EVENT2", 29, 28 )
	if( yes == 1 )
	{
		ClearEventJoin(4)
		EventMsg(" OX 퀴즈 이벤트 지역으로 이동합니다.")
	}
	else
	{
		EventMsg(" OX 퀴즈 이벤트를 준비중입니다. ")
		goto END4299_
	}

:END4299_

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

; to ma-in
	sGetNat()
	if( yes == 3)
	{
		MapMove( "ma-in", 245, 115 )
		goto ENDEVENT1_		
	}
	
; to Renes_c
	sGetNat()
	if( yes == 4)
	{
		MapMove( "Renes_c", 210, 175 )
		goto ENDEVENT1_	
	}

; to barantan
	sGetNat()
	if( yes == 6)
	{
		MapMove( "barantan", 325, 98 )
		goto ENDEVENT1_
	}
; others
	else
	{
		EventMsg("당신 이곳에 어떻게 들어왔죠?")
		goto ENDEVENT1_
	}

:ENDEVENT1_
end
@Event00002		

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
@Event00014	; to Fight map
	random(0,3)
	if(ran==0)
	{
		MapMove( "Fight", 6,72 )
	}
	if(ran==1)
	{
		MapMove( "Fight", 5,100 )
	}
	if(ran==2)
	{
		MapMove( "Fight", 33,100 )
	}

	if( yes == 1)	; Success to MapMove
	{
		EventMsg("<<코어 아레나>>로 이동합니다.")
		EventMsg("필요한 때를 위한 작은행운을~.")
	}
	else	; Failed to MapMove
	{
		EventMsg("맵 이동에 실패했습니다.")
	}
end
@Event00015	; to Dunmaze map
	random(0,3)
	if(ran==0)
	{
		MapMove( "Dunmaze", 3,85 )
	}
	if(ran==1)
	{
		MapMove( "Dunmaze", 2,87 )
	}
	if(ran==2)
	{
		MapMove( "Dunmaze", 4,86 )
	}

	if( yes == 1)	; Success to MapMove
	{
		EventMsg("<<캐슬 아레나>>로 이동합니다.")
		EventMsg("칼날 위에 실을 수 있는 가장 거대한 이름의 영광에 의지하여~")
	}
	else	; Failed to MapMove
	{
		EventMsg("맵 이동에 실패했습니다.")
	}
end
@Event00016	; to Stone map
	random(0,3)
	if(ran==0)
	{
		MapMove( "Stone", 152,22 )
	}
	if(ran==1)
	{
		MapMove( "Stone", 150,20 )
	}
	if(ran==2)
	{
		MapMove( "Stone", 148,18 )
	}

	if( yes == 1)	; Success to MapMove
	{
		EventMsg("<<스톤 아레나>>로 이동합니다.")
		EventMsg("필요한 때를 위한 작은행운을~.")
	}
	else	; Failed to MapMove
	{
		EventMsg("맵 이동에 실패했습니다.")
	}
	
end
@Event00017	
;; 블루아레나
	MapMove( "GM_event", 148,202 )
	if( yes == 1 )
	{
		EventMsg("<블루아레나>로 이동합니다.")
	}
	else
	{
		EventMsg("맵 이동에 실패했습니다.")
	}
end
@Event00018	; to Castle2 map
	IsLevel(61)		;물던전 50레벨 제한
	if( yes == 0)
	{
		random(0,3)
		if(ran==0)
		{
			MapMove( "castle2", 3,85 )
		}
		if(ran==1)
		{
			MapMove( "castle2", 2,87 )
		}
		if(ran==2)
		{
			MapMove( "castle2", 4,86 )
		}
		if( yes == 1)	; Success to MapMove
		{
			EventMsg("<<캐슬 아레나2>>로 이동합니다.")
			EventMsg("이곳은 레벨10부터 레벨60까지만 이용할 수 있는 아레나입니다.")
			goto Event00018
		}
		else	; Failed to MapMove
		{
			EventMsg("맵 이동에 실패했습니다.")
			goto Event00018
		}	
	}
	else
	{
		EventMsg("레벨 60까지만 출입할 수가 있습니다.")
	}
:Event00018
end
@Event00019
end








