
@sys00	; 贸澜 辑滚 Setting窍绰 窃荐.

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
;; 劝力累家
   random( 0, 3 )
    if( ran == 0 )
    {
       		D( "欢迎来到 E龙族. 这里是 < 西部林地 >" )
    }
    if( ran == 1 )
    {
         	D( "我是制弓匠，你有什么需要." )
    }
    if( ran == 2 )
    {
        	D( "这里有各种各样的弓箭，欢迎挑选." )
    }
    CallSmallMenu( 0, 27 )
end

@Npc00002
;; 格傍家
   random( 0, 3 )
    if( ran == 0 )
    {
       		D( "欢迎来到 E龙族. 这里是 < 西部林地 >." )
    }
    if( ran == 1 )
    {
         	D( "有什么可以为您服务的." )
    }
    if( ran == 2 )
    {
        	D( "您需要什么样的木器." )
    }
    CallSmallMenu( 0, 26 )
end
@Npc00003
;; 公扁痢
   random( 0, 3 )
    if( ran == 0 )
    {
       		D( "欢迎来到 E龙族. 这里是 < 西部林地 >." )
    }
    if( ran == 1 )
    {
         	D( "有什么可以为您效劳的." )
    }
    if( ran == 2 )
    {
        	D( "您想要什么样的武器?" )
    }
    CallSmallMenu( 0, 18 )
end
@Npc00004
;; 楷陛贱家 (器记)
   random( 0, 3 )
    if( ran == 0 )
    {
       		D( "欢迎来到 E龙族. 这里是 < 西部林地 >." )
    }
    if( ran == 1 )
    {
         	D( "我是炼金术士，有什么可以为您服务的." )
    }
    if( ran == 2 )
    {
        	D( "您需要药物么，找我就对了." )
    }
    CallSmallMenu( 0, 25 )
end
@Npc00005
;; 户笼
   random( 0, 3 )
    if( ran == 0 )
    {
       		D( "欢迎来到 E龙族. 这里是 < 西部林地 >." )
    }
    if( ran == 1 )
    {
         	D( "我是厨师，您有什么需要." )
    }
    if( ran == 2 )
    {
        	D( "进行长途旅行，食物是必不可少的." )
    }
    CallSmallMenu( 0, 20 )
end
@Npc00006
;; 狼幅痢
   random( 0, 3 )
    if( ran == 0 )
    {
       		D( "欢迎来到 E龙族. 这里是 < 西部林地 >." )
    }
    if( ran == 1 )
    {
         	D( "只有野蛮人才不穿衣服夸?" )
    }
    if( ran == 2 )
    {
        	D( "冒险者的衣服总是最新的." )
    }
    CallSmallMenu( 0, 24 )
end
@Npc00007
;; 器呕NPC
random( 0, 3 )
   if( ran == 0 )
   {
       		D( "传送可以送你到你想去的地方." )
   }
   if( ran == 1 )
   {
       		D( "虽然传送很方便，但是有的地方还是需要步行到达." )
   }
   if( ran == 2 )
   {
       		D( "只要您付钱，我们可以把您传送到你想去的地方." )
   }
    IsLevel(11)
    if( yes == 1)
    {
       		CallMenu( 39 )
    }
    else
    {
         	EventMsg("只有LV11以上的玩家才能使用传送..")
         	SendSound(0,2061)
   }
end

@Npc00008
end
@Npc00009
end

@Npc00010
;SQuest83_Npc00010
;EQuest83_Npc00010
end
@Npc00011
;SQuest84_Npc00011
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
end


@Npc00032
;SQuest73_Npc00032
CmpQuestNumStep( 73, 0 )
if( yes==1 ){
   DualCheck(2)
   if(yes == 1){
   LogDualQuest(73,Qcount,"3转记录",0)    ;;20030617 掂倔 涅胶飘 肺弊 颇老阑 巢扁扁 困秦 俺奔捞啊 眠啊
   Qcount = 0
   GhostLv = 1
   SendSound(0, 1311)
   D("恭喜你已经晋升为DUAL2等级..")
   SetQuestNumStep( 73, 5 )
   goto End_QuestNpc00032 
}
   else{
   SendSound(0, 1303)
   D("你还没有达到Dual2等级晋升资格,练习后再来..")        ;Stay0
   SetQuestNumStep( 73, 0 )
   goto End_QuestNpc00032 
}
}

CmpQuestNumStep( 73, 5 )
if( yes==1 ){
   D("首先我担任Dual3等级晋升的工作.")
   SetQuestNumStep( 73, 10 )
   goto End_QuestNpc00032 
}

CmpQuestNumStep( 73, 10 )
if( yes==1 ){
   D("让我帮你开始踏上DUAL3等级晋升的第一步...")
   SetQuestNumStep( 73, 15 )
   goto End_QuestNpc00032 
}

CmpQuestNumStep( 73, 15 )
if( yes==1 ){
   D("Dual等级共有5级,你目前是2级.")
   SendSound(0,   64)
   SetQuestNumStep( 73, 20 )
   goto End_QuestNpc00032 
}

CmpQuestNumStep( 73, 20 )
if( yes==1 ){
   D("DUAL每提升一级,人物的能力上限也会随之提高.")
   SetQuestNumStep( 73, 25 )
   goto End_QuestNpc00032 
}

CmpQuestNumStep( 73, 25 )
if( yes==1 ){
   D("为了提高Dual等级必须通过三项考试..")
   SetQuestNumStep( 73, 30 )
   goto End_QuestNpc00032 
}

CmpQuestNumStep( 73, 30 )
if( yes==1 ){
   D("首先在最开始,我做了一块任务石板.")
   SetQuestNumStep( 73, 35 )
   goto End_QuestNpc00032 
}

CmpQuestNumStep( 73, 35 )
if( yes==1 ){
   D("在这块石板中有24个流动的符号，必须先把符号填满.")
   SetQuestNumStep( 73, 40 )
   goto End_QuestNpc00032 
}

CmpQuestNumStep( 73, 40 )
if( yes==1 ){
   D("据说每完成我交给你的一个任务，就能得到一个相应的符号.")
   SetQuestNumStep( 73, 45 )
   goto End_QuestNpc00032 
}

CmpQuestNumStep( 73, 45 )
if( yes==1 ){
   MessageBox("如果填满石板中24个流动的符号,那么你就顺利完第一个考核.")
   SendSound(0,   64)
   SetQuestNumStep( 73, 50 )
   goto End_QuestNpc00032 
}

CmpQuestNumStep( 73, 50 )
if( yes==1 ){
   D("第二个任务是必须去不死迷宫,杀死怪物建立功绩.")
   SetQuestNumStep( 73, 55 )
   goto End_QuestNpc00032 
}

CmpQuestNumStep( 73, 55 )
if( yes==1 ){
   D("只要拿到'大巫妖的眼球'就说明你已经完成使命.")
   SetQuestNumStep( 73, 60 )
   goto End_QuestNpc00032 
}

CmpQuestNumStep( 73, 60 )
if( yes==1 ){
   MessageBox("杀死深渊迷宫的怪物可以得到'大巫妖的眼球'.")
   SendSound(0,   64)
   SetQuestNumStep( 73, 65 )
   goto End_QuestNpc00032 
}

CmpQuestNumStep( 73, 65 )
if( yes==1 ){
   D("第三个考核是,必须等级达到120级. ")
   SetQuestNumStep( 73, 70 )
   goto End_QuestNpc00032 
}

CmpQuestNumStep( 73, 70 )
if( yes==1 ){
   MessageBox("第三个考核是,必须等级达到120级.")
   SendSound(0,   64)
   SetQuestNumStep( 73, 75 )
   goto End_QuestNpc00032 
}

CmpQuestNumStep( 73, 75 )
if( yes==1 ){
   D("不死迷宫是有很多强悍怪物出没的地方.")
   SetQuestNumStep( 73, 80 )
   goto End_QuestNpc00032 
}

CmpQuestNumStep( 73, 80 )
if( yes==1 ){
   D("为了能够杀死他们,你必须锻炼你的能力.")
   SetQuestNumStep( 73, 85 )
   goto End_QuestNpc00032 
}
CmpQuestNumStep( 73, 85 )
if( yes==1 ){
   D("相信你自己的实力吧,你能做到的.")
   SetQuestNumStep( 73, 90 )
   goto End_QuestNpc00032 
}

CmpQuestNumStep( 73, 90 )
if( yes==1 ){
   D("首先先接受我的任务石板,石板是很重要的东西,不可以弄丢了.")
   SetQuestNumStep( 73, 95 )
   goto End_QuestNpc00032 
}

CmpQuestNumStep( 73, 95 )
if( yes==1 ){
   SetItemInvPC(0, 10179, 500)
   EventMsg("收到了符文石板.")
   SetQuestNumStep( 73, 100 )
   goto End_QuestNpc00032 
}

CmpQuestNumStep( 73, 100 )
if( yes==1 ){
   D("为简化大家转职，设置任务为边境得分，并取消分数限制.")
   SetQuestNumStep( 73, 105 )
   goto End_QuestNpc00032 
}
CmpQuestNumStep(73,105)
if( yes==1 ){
   random(0,6)
   if(ran==0){
   SendSound(0,64)
   D("此次的任务要在边境战中建立功绩.")        ;Stay170
   SetQuestNumStep( 73, 170 )
   goto End_QuestNpc00032 
}
   if(ran==1){
   SendSound(0,64)
   D("此次的任务要在边境战中建立功绩.")        ;Stay170
   SetQuestNumStep( 73, 170 )
   goto End_QuestNpc00032 
}
   if(ran==2){
   SendSound(0,64)
   D("此次的任务要在边境战中建立功绩.")        ;Stay170
   SetQuestNumStep( 73, 170 )
   goto End_QuestNpc00032 
}
   if(ran==3){
   SendSound(0,64)
   D("此次的任务要在边境战中建立功绩.")        ;Stay170
   SetQuestNumStep( 73, 170 )
   goto End_QuestNpc00032 
}
   if(ran>3){
   SendSound(0,64)
   D("此次的任务要在边境战中建立功绩.")        ;Stay170
   SetQuestNumStep( 73, 170 )
   goto End_QuestNpc00032 
}
}
CmpQuestNumStep(73, 110)
   if(yes == 1){
   D("机密文件在商店已经可以买到..")
   SetQuestNumStep( 73, 115 )
   goto End_QuestNpc00032 
}

CmpQuestNumStep( 73, 115 )
if( yes==1 ){
   D("您只要带钱去买就可以了.")
   SetQuestNumStep( 73, 120 )
   goto End_QuestNpc00032 
}

CmpQuestNumStep( 73, 120 )
if( yes==1 ){
   IsInvHavePC(10176)
   if(yes == 1){
   D("任务完成,增加一个符文.")
   SetItemInvPC(10176, 0, 0)
   Qcount = Qcount + 1
   CallMenu(27)
   LogDualQuest(73,Qcount,"3转记录",0)    ;;20030617 掂倔 涅胶飘 肺弊 颇老阑 巢扁扁 困秦 俺奔捞啊 眠啊
   SetQuestNumStep( 73, 125 )
   goto End_QuestNpc00032 
}
   else{
   SendSound(0, 1303)
   D("您带了拜索斯机密文件么.")        ;Stay120
   SetQuestNumStep( 73, 120 )
   goto End_QuestNpc00032 
}
}

CmpQuestNumStep( 73, 125 )
if( yes==1 ){
   EventMsg("成功地完成了任务.")
   if(Qcount<23){
   D("恩.. 完成了全部石板任务．． 能提高Dual等级的最初考验通过.")        ;Stay185
   SetQuestNumStep( 73, 185 )
   goto End_QuestNpc00032 
}
   else{
   EventMsg("下面的任务给予.")        ;Stay105
   SetQuestNumStep( 73, 105 )
   goto End_QuestNpc00032 
}
}
CmpQuestNumStep(73,   130)
   if(yes == 1){
   D("机密文件在商店可以买到.")
   SetQuestNumStep( 73, 135 )
   goto End_QuestNpc00032 
}

CmpQuestNumStep( 73, 135 )
if( yes==1 ){
   D("您只要带钱去买就可以了.")
   SetQuestNumStep( 73, 140 )
   goto End_QuestNpc00032 
}

CmpQuestNumStep( 73, 140 )
if( yes==1 ){
   IsInvHavePC(10177)
   if(yes == 1){
   D("任务完成,增加一个符文.")
   SetItemInvPC(10177,   0,   0)
   Qcount = Qcount + 1
   CallMenu(27)
   LogDualQuest(73,Qcount,"2转记录",0)    ;;20030617 掂倔 涅胶飘 肺弊 颇老阑 巢扁扁 困秦 俺奔捞啊 眠啊    
   SetQuestNumStep( 73, 145 )
   goto End_QuestNpc00032 
}
   else{
   SendSound(0, 1303)
   D("您带了杰彭机密文件么.")        ;Stay140
   SetQuestNumStep( 73, 140 )
   goto End_QuestNpc00032 
}
}

CmpQuestNumStep( 73, 145 )
if( yes==1 ){
   EventMsg("成功地完成了任务.")
   if(Qcount<23){
   D("恩.. 完成了全部石板任务．． 能提高Dual等级的最初考验通过.")        ;Stay185
   SetQuestNumStep( 73, 185 )
   goto End_QuestNpc00032 
}
   else{
   EventMsg("下面的任务给予.")        ;Stay105
   SetQuestNumStep( 73, 105 )
   goto End_QuestNpc00032 
}
}
CmpQuestNumStep(73,   150)
   if(yes == 1){
   D("机密文件在商店出售.")
   SetQuestNumStep( 73, 155 )
   goto End_QuestNpc00032 
}

CmpQuestNumStep( 73, 155 )
if( yes==1 ){
   D("你只要带钱去购买就行了.")
   SetQuestNumStep( 73, 160 )
   goto End_QuestNpc00032 
}

CmpQuestNumStep( 73, 160 )
if( yes==1 ){
   IsInvHavePC(10178)
   if(yes == 1){
   D("任务完成,增加一个符文.")
   SetItemInvPC(10178,   0,   0)
   Qcount = Qcount + 1
   CallMenu(27)
   LogDualQuest(73,Qcount,"3转记录",0)    ;;20030617 掂倔 涅胶飘 肺弊 颇老阑 巢扁扁 困秦 俺奔捞啊 眠啊
   SetQuestNumStep( 73, 165 )
   goto End_QuestNpc00032 
}
   else{
   SendSound(0, 1303)
   D("您带了伊斯的机密文件么.")        ;Stay160
   SetQuestNumStep( 73, 160 )
   goto End_QuestNpc00032 
}
}

CmpQuestNumStep( 73, 165 )
if( yes==1 ){
   EventMsg("成功的完成了任务.")
   if(Qcount<23){
   D("恩.. 完成了全部石板任务．． 能提高Dual等级的最初考验通过.")        ;Stay185
   SetQuestNumStep( 73, 185 )
   goto End_QuestNpc00032 
}
   else{
   EventMsg("下面的任务给予.")        ;Stay105
   SetQuestNumStep( 73, 105 )
   goto End_QuestNpc00032 
}
}
CmpQuestNumStep(73,170)
   if(yes == 1){
   D("参加边境战,为了简化大家转职，此任务可以直接完成.")
   SetQuestNumStep( 73, 175 )
   goto End_QuestNpc00032 
}

CmpQuestNumStep( 73, 175 )
if( yes==1 ){
   EventMsg("......")
   if(KillDualCount<49){
   D("边境任务直接完成,增加一个符文.")
   KillDualCount = 0
   Qcount = Qcount + 1
   CallMenu(27)
   LogDualQuest(73,Qcount,"3转记录",0)    ;;20030617 掂倔 涅胶飘 肺弊 颇老阑 巢扁扁 困秦 俺奔捞啊 眠啊    
   SetQuestNumStep( 73, 180 )
   goto End_QuestNpc00032 
}
   else{
   SendSound(0, 1303)
   D("边境名声不足. 参加边境战,必须得到dualfame 25以上.")        ;Stay175
   SetQuestNumStep( 73, 175 )
   goto End_QuestNpc00032 
}
}

CmpQuestNumStep( 73, 180 )
if( yes==1 ){
   EventMsg("成功的完成了任务.")
   if(Qcount<23){
   D("恩.. 完成了全部石板任务．． 能提高Dual等级的最初考验通过.")        ;Stay185
   SetQuestNumStep( 73, 185 )
   goto End_QuestNpc00032 
}
   else{
   EventMsg("下面的任务给予.")        ;Stay105
   SetQuestNumStep( 73, 105 )
   goto End_QuestNpc00032 
}
}
CmpQuestNumStep(73, 185)
   if(yes == 1){
   D("为了提高Dual等级必须通过三项考试.")
   SendSound(0, 64)
   SetQuestNumStep( 73, 190 )
   goto End_QuestNpc00032 
}

CmpQuestNumStep( 73, 190 )
if( yes==1 ){
   D("完成最初的考试, '符文石板'的考试通过了.")
   SetQuestNumStep( 73, 195 )
   goto End_QuestNpc00032 
}

CmpQuestNumStep( 73, 195 )
if( yes==1 ){
   D("下面的考试必须杀死不死迷宫的BOSS后取得'大巫妖的眼球'.")
   SetQuestNumStep( 73, 200 )
   goto End_QuestNpc00032 
}

CmpQuestNumStep( 73, 200 )
if( yes==1 ){
   IsInvHavePC(10073)
   if(yes == 1){
   SendSound(0, 1310)
   SetItemInvPC(10073,   0,   0)
   D("恩..不错,你已经办到了,你很厉害…")
   SetQuestNumStep( 73, 205 )
   goto End_QuestNpc00032 
}
   else{
   SendSound(0, 1303)
   D("必须杀死不死迷宫的BOSS后取得'大巫妖的眼球'.")        ;Stay200
   SetQuestNumStep( 73, 200 )
   goto End_QuestNpc00032 
}
}

CmpQuestNumStep( 73, 205 )
if( yes==1 ){
   D("第三项考试,等级必须达到110级别. ")
   SendSound(0, 64)
   SetQuestNumStep( 73, 210 )
   goto End_QuestNpc00032 
}

CmpQuestNumStep( 73, 210 )
if( yes==1 ){
   CallSmallMenu(200, 1190)
   SetQuestNumStep( 73, 215 )
   goto End_QuestNpc00032 
}

CmpQuestNumStep( 73, 215 )
if( yes==1 ){
   DualCheck(3)
   if(yes==1){
   SendSound(0, 1311)
   Qcount = 0
   GhostLv = GhostLv + 1
   D("祝贺你成功升级为Dual3等级.")        ;Stay220
   SetQuestNumStep( 73, 220 )
   goto End_QuestNpc00032 
}
   else{
   D("不能通过第3项考试．．必须再稍做练习")        ;Stay210
   SetQuestNumStep( 73, 210 )
   goto End_QuestNpc00032 
}
}
CmpQuestNumStep(73, 220)
   if(yes == 1){
   D("我的任务到这里都结束了.")
   SetQuestNumStep( 73, 225 )
   goto End_QuestNpc00032 
}

CmpQuestNumStep( 73, 225 )
if( yes==1 ){
   D("如果想继续进修Dual4等级,去拜访海格摩尼亚[92,447] 的人就行了.")
   SetQuestNumStep( 73, 230 )
   goto End_QuestNpc00032 
}

CmpQuestNumStep( 73, 230 )
if( yes==1 ){
   SendSound(0, 51)
   D("差点忘记了．． 这个东西送给达到Dual3等级的人.")
   sSetRareItemInvPc(8041,2,2,2,53)
   SetQuestNumStep( 73, 235 )
   LogDualQuest(73,Qcount,"3转记录",1)    ;;20030617 掂倔 涅胶飘 肺弊 颇老阑 巢扁扁 困秦 俺奔捞啊 眠啊
   goto End_QuestNpc00032 
}

CmpQuestNumStep( 73, 235 )
if( yes==1 ){
   D("那么.. 愿神保佑你...")
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
;SQuest76_npc00048
CmpQuestNumStep(76,0)
if(yes==1)
{
	SendSound(0,0097)
	D( "你好，我负责兑换3转任务所需要的“大巫妖的眼球”" )
	MessageBox("您现在正在兑换的物品是3转所需要的“大巫妖的眼球”.")
	D( "需要3个金龙才能兑换，你确认兑换吗？" )
   	SetQuestNumStep(76,5)
    	goto End_QuestNpc00048
}
CmpQuestNumStep(76,5)
if(yes==1)
	{
  	CheckItemMulti(10199, 3)
  	if(yes==1)
  	{
    		DeleteItemMulti(10199, 3)
    		SetItemInvPC(0 ,10073, 1)
		SendSound(0,2167)
		EventMsg("成功兑换大巫妖的眼球.")
    		D( "恭喜你! 大巫妖的眼球兑换成功  请查看你的背包" )
    		SetQuestNumStep(76,0)
    		goto End_QuestNpc00048
  	}
  	else
  	{
    		D( "您身上的金龙龙不够，需要3个才能交换." )
    		SetQuestNumStep(76,0)
    		goto End_QuestNpc00048
  	}     
}

;EQuest76_Npc00048
:End_QuestNpc00048
end
@Npc00049

end



@Event00000
end
@Event00001
   MoveDungeon("Abyss_1",274,564)
end
@Event00002
;; 固聪带傈 1摸
;; 免涝炼扒 Level 61~90
   sGetLevel()
   if( yes >= 61 )
   {
       if( yes <= 90 )
       {
           MapMove( "Mini2", 185,54 )
           if( yes == 1 )
           {
               EventMsg("进入迷你洞窟.")
           }
           else
           {
               EventMsg("地图移动失败.")
           }
       }
       else    ; 饭骇 61 捞惑 91 捞惑
       {
           EventMsg("只有等级在61~90之间的玩家才能进入.")
       }
   }
   else    ; 饭骇 61 固父
   {
       EventMsg("只有等级在61~90之间的玩家才能进入.")
   }
end
@Event00003
;; 倔澜带傈 1摸
;; 免涝炼扒 Level 31~60
   sGetLevel()
   if( yes >= 31 )
   {
       if( yes <= 60 )
       {
           MapMove( "Ice-w02", 209,82 )
           if( yes == 1 )
           {
               EventMsg("进入冰洞窟.")
           }
           else
           {
               EventMsg("地图移动失败.")
           }
       }
       else    ; 饭骇 31 捞惑 61 捞惑
       {
           EventMsg("只有等级在31~60之间的玩家才能进入.")
       }
   }
   else    ; 饭骇 31 固父
   {
       EventMsg("只有等级在31~60之间的玩家才能进入.")
   }
end
@Event00004
;; 绢狄狼带傈
;; 免涝炼扒 Level 81 ~
   sGetLevel()
   if( yes >= 81 )
   {
       MapMove( "darkdun1", 120,246 )
       if( yes == 1 )
       {
           EventMsg("进入黑暗洞窟.")
       }
       else
       {
           EventMsg("地图移动失败.")
       }
   }
   else    ; 饭骇 81 固父
   {
       EventMsg("只有等级在81以上的玩家才能进入.")
   }
end
@Event00005
;; 措檬盔
   MapMove( "big_g", 187,705 )
   if( yes == 1 )
   {
       EventMsg("移动到大草原.")
   }
   else
   {
       EventMsg("地图移动失败.")
   }
end
@Event00006
;; 饭抛狼 魂钙
   MapMove( "Lethe_hill", 531,530 )
   if( yes == 1 )
   {
       EventMsg("移动到幽冥山丘.")
   }
   else
   {
       EventMsg("地图移动失败.")
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



