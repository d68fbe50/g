
@sys00	; 처음 서버 Setting하는 함수.

	MaxNPC( 50 )
	
	MapName( "mon_arena" )
	
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
@Npc00001	;;포션 파는 노인
	random( 0, 3 )
	if( ran == 0 ) {
	D("이 포션 한번 먹어봐... 온몸엔 힘이 불끈불끈, 두 눈엔 빛이 초롱초롱...")
}
	if( ran == 1) {
	D("당신을 위한 특제 포션 좀 먹어보겠나?")
}
	if( ran == 2 ) {
	D("저 안에 있는 짐승들과 싸우려면 포션을 많이 준비해야지.")
}
 	CallSmallMenu(0,25)

end
@Npc00002	;;정체 불명의 이벤트 아가씨
	random(0,3)
	if(ran==0) {
	D("지난 이벤트는 끝났습니다.")
}
	if(ran==1)  {
	D("다른 초대형 이벤트를 기획중이니 기다려주시길 바랍니다.")
}
	if(ran==2)  {
	D("이벤트를 준비하느라 정신이 없습니다.")
}
 
end
@Npc00003	
end
@Npc00004	
end
@Npc00005	;;60레벨 이하 아레나
	IsPlayArenaGame(5)
	if(yes==1){
	D("한 경기 시간은 20분입니다. 잠시만 기다려주십시오.")
	EventMsg("현재 경기가 진행중이므로 참가하실 수 없습니다.")
}
	else{
	IsLevel(61)
	if(yes==1) {
	D("이 곳은 60레벨까지 들어올 수 있는 아레나입니다.")
}
	else {
	D("몬스터 아레나에 잘 오셨습니다.")
	CallSmallMenu(5,80)
}
}
 
end
@Npc00006	;;61레벨 이상 아레나
	IsPlayArenaGame(6)
	if(yes==1){
	D("죽으려고 들어오는 사람들이 이렇게 많다니... 조금만 기다려.")
	EventMsg("현재 경기가 진행중이므로 참가하실 수 없습니다.")
}
	else{
	IsLevel(61)
	if(yes==1) {
	D("몬스터 아레나에 잘 오셨습니다.")
	CallSmallMenu(6,80)
}
	else {
	D("이 곳은 61레벨부터 들어올 수 있는 아레나입니다.")
}
}
 
end
@Npc00007	;;무제한 아레나
	random(0,3)
	if(ran==0) {
	D("이 곳은 강력한 몬스터가 나오는 무제한 아레나입니다.")
}
	if(ran==1)  {
	D("이 아레나는 현재 닫혀있습니다.")
}
	if(ran==2)  {
	D("우리 보스가 강한 몬스터를 잡아올 때까지 기다려줘.")
}
 
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
@Npc00017	;;무제한 아레나 백업 이벤트 시에는 7번으로 올라갑니다
	IsPlayArenaGame(7)
	if(yes==1){
	D("경기가 진행 중이니 잠시만 기다려주시기 바랍니다.")
	EventMsg("현재 경기가 진행중이므로 참가하실 수 없습니다.")
}
	else{
	D(" 여기는 성별, 체급, 나이를 따지지 않는 무차별 아레나입니다. ")
	CallSmallMenu(7,80)
}
 
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





@Event00000	;;0번을 찍어도 실행이 안 된다
end
@Event00001	;;원래는 1번부터인데 실행이 안 된다
end
@Event00002	;;결국 2번을 찍었다
	MapMove("G_battle",150,50)
	if( yes == 1 ) {
	EventMsg("<콜로서스 아레나>로 이동합니다.")
}
	else {
	EventMsg("맵 이동에 실패했습니다.")
}
 
end
@Event00003	;;곤조를 부려 죄다 찍었다
	MapMove("G_battle",150,50)
	if( yes == 1 ) {
	EventMsg("<콜로서스 아레나>로 이동합니다.")
}
	else {
	EventMsg("맵 이동에 실패했습니다.")
}
 
end
@Event00004	;;4는 불길한 숫자
	MapMove("G_battle",150,50)
	if( yes == 1 ) {
	EventMsg("<콜로서스 아레나>로 이동합니다.")
}
	else {
	EventMsg("맵 이동에 실패했습니다.")
}
 
end
@Event00005	;;어느 스크립트가 작동할 지는 이제 모른다
	MapMove("G_battle",150,50)
	if( yes == 1 ) {
	EventMsg("<콜로서스 아레나>로 이동합니다.")
}
	else {
	EventMsg("맵 이동에 실패했습니다.")
}
 
end
@Event00006 ;;며느리도 모르는 몬스터 아레나 이벤트 박스
	MapMove("G_battle",150,50)
	if( yes == 1 ) {
	EventMsg("<콜로서스 아레나>로 이동합니다.")
}
	else {
	EventMsg("맵 이동에 실패했습니다.")
}
 
end
@Event00007		
	MapMove("G_battle",150,50)
	if( yes == 1 ) {
	EventMsg("<콜로서스 아레나>로 이동합니다.")
}
	else {
	EventMsg("  맵 이동에 실패했습니다.  ")
}
 
end
@Event00008		
	MapMove("G_battle",150,50)
	if( yes == 1 ) {
	EventMsg("<콜로서스 아레나>로 이동합니다.  ")
}
	else {
	EventMsg("맵 이동에 실패했습니다.")
}
 
end
@Event00009		
	MapMove("G_battle",150,50)
	if( yes == 1 ) {
	EventMsg("  <콜로서스 아레나>로 이동합니다.  ")
}
	else {
	EventMsg("  맵 이동에 실패했습니다.  ")
}
 
end

@Event00010		
	MapMove("G_battle",150,50)
	if( yes == 1 ) {
	EventMsg("  <콜로서스 아레나>로 이동합니다.  ")
}
	else {
	EventMsg("  맵 이동에 실패했습니다.  ")
}
 
end
@Event00011		
	MapMove("G_battle",150,50)
	if( yes == 1 ) {
	EventMsg("  <콜로서스 아레나>로 이동합니다.  ")
}
	else {
	EventMsg("  맵 이동에 실패했습니다.  ")
}
 
end
@Event00012		
	MapMove("G_battle",150,50)
	if( yes == 1 ) {
	EventMsg("  <콜로서스 아레나>로 이동합니다.  ")
}
	else {
	EventMsg("  맵 이동에 실패했습니다.  ")
}
 
end
@Event00013		
	MapMove("G_battle",150,50)
	if( yes == 1 ) {
	EventMsg("  <콜로서스 아레나>로 이동합니다.  ")
}
	else {
	EventMsg("  맵 이동에 실패했습니다.  ")
}
 
end
@Event00014		
	MapMove("G_battle",150,50)
	if( yes == 1 ) {
	EventMsg("  <콜로서스 아레나>로 이동합니다.  ")
}
	else {
	EventMsg("  맵 이동에 실패했습니다.  ")
}
 
end
@Event00015		
	MapMove("G_battle",150,50)
	if( yes == 1 ) {
	EventMsg("  <콜로서스 아레나>로 이동합니다.  ")
}
	else {
	EventMsg("  맵 이동에 실패했습니다.  ")
}
 
end
@Event00016		
	MapMove("G_battle",150,50)
	if( yes == 1 ) {
	EventMsg("  <콜로서스 아레나>로 이동합니다.  ")
}
	else {
	EventMsg("  맵 이동에 실패했습니다.  ")
}
 
end
@Event00017		
	MapMove("G_battle",150,50)
	if( yes == 1 ) {
	EventMsg("  <콜로서스 아레나>로 이동합니다.  ")
}
	else {
	EventMsg("  맵 이동에 실패했습니다.  ")
}
 
end
@Event00018		
	MapMove("G_battle",150,50)
	if( yes == 1 ) {
	EventMsg("  <콜로서스 아레나>로 이동합니다.  ")
}
	else {
	EventMsg("맵 이동에 실패했습니다.")
}
 
end
@Event00019		
	MapMove("G_battle",150,50)
	if( yes == 1 ) {
	EventMsg("<콜로서스 아레나>로 이동합니다.")
}
	else {
	EventMsg("맵 이동에 실패했습니다.")
}
 
end








