
@sys00	; 贸澜 辑滚 Setting窍绰 窃荐.

	MaxNPC( 50 )
	
	MapName( "Lethe_hill" )
	
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
		    D( "捞 镑篮 <饭抛狼 魂钙> 瘤开涝聪促." )
        }
        if( ran == 1 )
        {
        	D( "捞 镑篮 劝苞 拳混阑 荤绊 颇绰 镑涝聪促." )
        }
        if( ran == 2 )
        {
	        D( "寸脚篮 泵荐涝聪鳖? 泵荐扼搁 怖 促矫 甸矾林绞矫坷." )
        }
        CallSmallMenu( 0, 27 )
end
@Npc00002
;; 棱拳痢
	random( 0, 3 )
        if( ran == 0 )
        {
		    D( "捞 镑篮 <饭抛狼 魂钙> 瘤开涝聪促." )
        }
        if( ran == 1 )
        {
        	D( "捞 镑篮 积劝俊 鞘夸茄 拱扒阑 荤绊 颇绰 镑涝聪促." )
        }
        if( ran == 2 )
        {
	        D( "器记惑磊甫 酒技夸?." )
        }
        CallSmallMenu( 0, 60 )
end
@Npc00003
;; 措厘埃
	random( 0, 3 )
        if( ran == 0 )
        {
		    D( "捞 镑篮 <饭抛狼 魂钙> 瘤开涝聪促." )
        }
        if( ran == 1 )
        {
        	D( "捞 镑篮 公扁客 规绢备甫 力累窍绰 镑涝聪促." )
        }
        if( ran == 2 )
        {
	        D( "亮篮 公扁绰 亮篮 犁丰甫 鞘夸肺 窍瘤夸." )
        }
        CallSmallMenu( 0, 18 )	
end
@Npc00004
;; 格傍家
	random( 0, 3 )
        if( ran == 0 )
        {
		    D( "捞 镑篮 <饭抛狼 魂钙> 瘤开涝聪促." )
        }
        if( ran == 1 )
        {
        	D( "捞 镑篮 唱公肺 等 胶怕橇 殿阑 荤绊 颇绰 镑涝聪促." )
        }
        if( ran == 2 )
        {
	        D( "捞 镑篮 困氰茄 镑涝聪促. 俊胆宏肺捞狼 篮醚捞 乐扁甫." )
        }
        CallSmallMenu( 0, 26 )	
end
@Npc00005
;; 户笼
	random( 0, 3 )
        if( ran == 0 )
        {
		    D( "捞 镑篮 <饭抛狼 魂钙> 瘤开涝聪促." )
        }
        if( ran == 1 )
        {
        	D( "捞 镑篮 户苞 鞍篮 澜侥阑 荤绊 颇绰 镑涝聪促." )
        }
        if( ran == 2 )
        {
	        D( "咯青辨俊 硅啊 绊橇瘤 臼档废 澜侥阑 亲惑 霖厚甫 窍寂具 钦聪促." )
        }
        CallSmallMenu( 0, 20 )	
end
@Npc00006
;; 狼幅痢
	random( 0, 3 )
        if( ran == 0 )
        {
		    D( "捞 镑篮 <饭抛狼 魂钙> 瘤开涝聪促." )
        }
        if( ran == 1 )
        {
        	D( "带傈俊 甸绢啊歹扼档 渴篮 涝绢具瘤夸?" )
        }
        if( ran == 2 )
        {
	        D( "亮篮 渴篮 亮篮 规绢仿阑 爱眠绊 乐嚼聪促." )
        }
        CallSmallMenu( 0, 24 )	
end
@Npc00007
;; 楷陛贱家 (器记)
	random( 0, 3 )
        if( ran == 0 )
        {
	    	D( "捞 镑篮 <饭抛狼 魂钙> 瘤开涝聪促." )
        }
        if( ran == 1 )
        {
        	D( "捞 镑篮 器记阑 荤绊 颇绰 镑涝聪促." )
        }
        if( ran == 2 )
        {
	        D( "楷陛贱阑 酒绞聪鳖? 措氟 镑镑俊绰 楷陛贱荤甸捞 利瘤 臼嚼聪促." )
        }
        CallSmallMenu( 0, 25 )	
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
;SQuest75_Npc00032
CmpQuestNumStep( 75, 0 )
if( yes==1 ){
   DualCheck(4)
   if(yes == 1){
   LogDualQuest(75,Qcount,"5转记录",0)    ;;20030617 掂倔 涅胶飘 肺弊 颇老阑 巢扁扁 困秦 俺奔捞啊 眠啊
   Qcount = 0
   GhostLv = 1
   SendSound(0, 1323)
   D("恭喜你已经晋升为Dual4等级..")
   SetQuestNumStep( 75, 5 )
   goto End_QuestNpc00032 
}
   else{
   SendSound(0, 1303)
   D("你还没有达到DragonSlayer等级晋升资格,练习后再来..")        ;Stay0
   SetQuestNumStep( 75, 0 )
   goto End_QuestNpc00032 
}
}

CmpQuestNumStep( 75, 5 )
if( yes==1 ){
   D("首先我担任DragonSlayer等级晋升的工作.")
   SetQuestNumStep( 75, 10 )
   goto End_QuestNpc00032 
}

CmpQuestNumStep( 75, 10 )
if( yes==1 ){
   D("让我帮你开始踏上DragonSlayer等级晋升的第一步...")
   SetQuestNumStep( 75, 15 )
   goto End_QuestNpc00032 
}

CmpQuestNumStep( 75, 15 )
if( yes==1 ){
   D("Dual等级共有5级,你目前是4级.")
   SendSound(0,   64)
   SetQuestNumStep( 75, 20 )
   goto End_QuestNpc00032 
}

CmpQuestNumStep( 75, 20 )
if( yes==1 ){
   D("DUAL每提升一级,人物的能力上限也会随之提高.")
   SetQuestNumStep( 75, 25 )
   goto End_QuestNpc00032 
}

CmpQuestNumStep( 75, 25 )
if( yes==1 ){
   D("为了提高Dual等级必须通过三项考试..")
   SetQuestNumStep( 75, 30 )
   goto End_QuestNpc00032 
}

CmpQuestNumStep( 75, 30 )
if( yes==1 ){
   D("首先在最开始,我做了一块任务石板.")
   SetQuestNumStep( 75, 35 )
   goto End_QuestNpc00032 
}

CmpQuestNumStep( 75, 35 )
if( yes==1 ){
   D("在这块石板中有24个流动的符号，必须先把符号填满.")
   SetQuestNumStep( 75, 40 )
   goto End_QuestNpc00032 
}

CmpQuestNumStep( 75, 40 )
if( yes==1 ){
   D("据说每完成我交给你的一个任务，就能得到一个相应的符号.")
   SetQuestNumStep( 75, 45 )
   goto End_QuestNpc00032 
}

CmpQuestNumStep( 75, 45 )
if( yes==1 ){
   MessageBox("如果填满石板中24个流动的符号,那么你就顺利完第一个考核.")
   SendSound(0,   64)
   SetQuestNumStep( 75, 50 )
   goto End_QuestNpc00032 
}

CmpQuestNumStep( 75, 50 )
if( yes==1 ){
   D("第二个任务是必须拥有一定的财富.")
   SetQuestNumStep( 75, 55 )
   goto End_QuestNpc00032 
}

CmpQuestNumStep( 75, 55 )
if( yes==1 ){
   D("只要拥有面值1亿的债卷就说明你成功了.")
   SetQuestNumStep( 75, 60 )
   goto End_QuestNpc00032 
}

CmpQuestNumStep( 75, 60 )
if( yes==1 ){
   MessageBox("需要一张 1亿的债卷 才能完成最后的任务.")
   SendSound(0,   64)
   SetQuestNumStep( 75, 65 )
   goto End_QuestNpc00032 
}

CmpQuestNumStep( 75, 65 )
if( yes==1 ){
   D("第三个考核是,必须等级达到150级 ")
   SetQuestNumStep( 75, 70 )
   goto End_QuestNpc00032 
}

CmpQuestNumStep( 75, 70 )
if( yes==1 ){
   MessageBox("第三个考核是,必须等级达到150级.")
   SendSound(0,   64)
   SetQuestNumStep( 75, 75 )
   goto End_QuestNpc00032 
}

CmpQuestNumStep( 75, 75 )
if( yes==1 ){
   D("在E龙族的世界里钱是很重要的.")
   SetQuestNumStep( 75, 80 )
   goto End_QuestNpc00032 
}

CmpQuestNumStep( 75, 80 )
if( yes==1 ){
   D("为了得到更多的钱，你必须努力.")
   SetQuestNumStep( 75, 85 )
   goto End_QuestNpc00032 
}
CmpQuestNumStep( 75, 85 )
if( yes==1 ){
   D("相信你自己的实力吧,你能做到的.")
   SetQuestNumStep( 75, 90 )
   goto End_QuestNpc00032 
}

CmpQuestNumStep( 75, 90 )
if( yes==1 ){
   D("首先先接受我的任务石板,石板是很重要的东西,不可以弄丢了.")
   SetQuestNumStep( 75, 95 )
   goto End_QuestNpc00032 
}

CmpQuestNumStep( 75, 95 )
if( yes==1 ){
   SetItemInvPC(0, 10179, 500)
   EventMsg("收到了符文石板.")
   SetQuestNumStep( 75, 100 )
   goto End_QuestNpc00032 
}

CmpQuestNumStep( 75, 100 )
if( yes==1 ){
   D("为简化大家的转职步骤，5转任务仍然是边境得分，并取消分数限制.")
   SetQuestNumStep( 75, 105 )
   goto End_QuestNpc00032 
}
CmpQuestNumStep(75,105)
if( yes==1 ){
   random(0,6)
   if(ran==0){
   SendSound(0,64)
   D("此次的任务要在边境战中建立功绩.")        ;Stay170
   SetQuestNumStep( 75, 170 )
   goto End_QuestNpc00032 
}
   if(ran==1){
   SendSound(0,64)
   D("此次的任务要在边境战中建立功绩.")        ;Stay170
   SetQuestNumStep( 75, 170 )
   goto End_QuestNpc00032 
}
   if(ran==2){
   SendSound(0,64)
   D("此次的任务要在边境战中建立功绩.")        ;Stay170
   SetQuestNumStep( 75, 170 )
   goto End_QuestNpc00032
}
   if(ran==3){
   SendSound(0,64)
   D("此次的任务要在边境战中建立功绩.")        ;Stay170
   SetQuestNumStep( 75, 170 )
   goto End_QuestNpc00032 
}
   if(ran>3){
   SendSound(0,64)
   D("此次的任务要在边境战中建立功绩.")        ;Stay170
   SetQuestNumStep( 75, 170 )
   goto End_QuestNpc00032 
}
}
CmpQuestNumStep(75, 110)
   if(yes == 1){
   D("机密文件在商店已经可以买到..")
   SetQuestNumStep( 75, 115 )
   goto End_QuestNpc00032 
}

CmpQuestNumStep( 75, 115 )
if( yes==1 ){
   D("您只要带钱去买就可以了.")
   SetQuestNumStep( 75, 120 )
   goto End_QuestNpc00032 
}

CmpQuestNumStep( 75, 120 )
if( yes==1 ){
   IsInvHavePC(10176)
   if(yes == 1){
   D("任务完成,增加一个符文.")
   SetItemInvPC(10176, 0, 0)
   Qcount = Qcount + 1
   CallMenu(27)
   LogDualQuest(75,Qcount,"5转记录",0)    ;;20030617 掂倔 涅胶飘 肺弊 颇老阑 巢扁扁 困秦 俺奔捞啊 眠啊
   SetQuestNumStep( 75, 125 )
   goto End_QuestNpc00032 
}
   else{
   SendSound(0, 1303)
   D("您带了拜索斯机密文件么.")        ;Stay120
   SetQuestNumStep( 75, 120 )
   goto End_QuestNpc00032 
}
}

CmpQuestNumStep( 75, 125 )
if( yes==1 ){
   EventMsg("成功地完成了任务.")
   if(Qcount<23){
   D("恩.. 完成了全部石板任务．． 能提高Dual等级的最初考验通过.")        ;Stay185
   SetQuestNumStep( 75, 185 )
   goto End_QuestNpc00032 
}
   else{
   EventMsg("下面的任务给予.")        ;Stay105
   SetQuestNumStep( 75, 105 )
   goto End_QuestNpc00032 
}
}
CmpQuestNumStep(75,   130)
   if(yes == 1){
   D("机密文件在商店可以买到.")
   SetQuestNumStep( 75, 135 )
   goto End_QuestNpc00032 
}

CmpQuestNumStep( 75, 135 )
if( yes==1 ){
   D("您只要带钱去买就可以了.")
   SetQuestNumStep( 75, 140 )
   goto End_QuestNpc00032 
}

CmpQuestNumStep( 75, 140 )
if( yes==1 ){
   IsInvHavePC(10177)
   if(yes == 1){
   D("任务完成,增加一个符文.")
   SetItemInvPC(10177,   0,   0)
   Qcount = Qcount + 1
   CallMenu(27)
   LogDualQuest(75,Qcount,"5转记录",0)    ;;20030617 掂倔 涅胶飘 肺弊 颇老阑 巢扁扁 困秦 俺奔捞啊 眠啊    
   SetQuestNumStep( 75, 145 )
   goto End_QuestNpc00032 
}
   else{
   SendSound(0, 1303)
   D("您带了杰彭机密文件么.")        ;Stay140
   SetQuestNumStep( 75, 140 )
   goto End_QuestNpc00032 
}
}

CmpQuestNumStep( 75, 145 )
if( yes==1 ){
   EventMsg("成功地完成了任务.")
   if(Qcount<23){
   D("恩.. 完成了全部石板任务．． 能提高Dual等级的最初考验通过.")        ;Stay185
   SetQuestNumStep( 75, 185 )
   goto End_QuestNpc00032 
}
   else{
   EventMsg("下面的任务给予.")        ;Stay105
   SetQuestNumStep( 75, 105 )
   goto End_QuestNpc00032 
}
}
CmpQuestNumStep(75,   150)
   if(yes == 1){
   D("机密文件在商店出售.")
   SetQuestNumStep( 75, 155 )
   goto End_QuestNpc00032 
}

CmpQuestNumStep( 75, 155 )
if( yes==1 ){
   D("你只要带钱去购买就行了.")
   SetQuestNumStep( 75, 160 )
   goto End_QuestNpc00032 
}

CmpQuestNumStep( 75, 160 )
if( yes==1 ){
   IsInvHavePC(10178)
   if(yes == 1){
   D("任务完成,增加一个符文.")
   SetItemInvPC(10178,   0,   0)
   Qcount = Qcount + 1
   CallMenu(27)
   LogDualQuest(75,Qcount,"5转记录",0)    ;;20030617 掂倔 涅胶飘 肺弊 颇老阑 巢扁扁 困秦 俺奔捞啊 眠啊
   SetQuestNumStep( 75, 165 )
   goto End_QuestNpc00032 
}
   else{
   SendSound(0, 1303)
   D("您带了伊斯的机密文件么.")        ;Stay160
   SetQuestNumStep( 75, 160 )
   goto End_QuestNpc00032 
}
}

CmpQuestNumStep( 75, 165 )
if( yes==1 ){
   EventMsg("成功的完成了任务.")
   if(Qcount<23){
   D("恩.. 完成了全部石板任务．． 能提高Dual等级的最初考验通过.")        ;Stay185
   SetQuestNumStep( 75, 185 )
   goto End_QuestNpc00032 
}
   else{
   EventMsg("下面的任务给予.")        ;Stay105
   SetQuestNumStep( 75, 105 )
   goto End_QuestNpc00032 
}
}
CmpQuestNumStep(75,170)
   if(yes == 1){
   D("参加边境战,为了简化大家转职，此任务可以直接完成.")
   SetQuestNumStep( 75, 175 )
   goto End_QuestNpc00032 
}

CmpQuestNumStep( 75, 175 )
if( yes==1 ){
   EventMsg("......")
   if(KillDualCount<49){
   D("边境任务直接完成,增加一个符文.")
   KillDualCount = 0
   Qcount = Qcount + 1
   CallMenu(27)
   LogDualQuest(75,Qcount,"5转记录",0)    ;;20030617 掂倔 涅胶飘 肺弊 颇老阑 巢扁扁 困秦 俺奔捞啊 眠啊    
   SetQuestNumStep( 75, 180 )
   goto End_QuestNpc00032 
}
   else{
   SendSound(0, 1303)
   D("边境名声不足. 参加边境战,必须得到dualfame 25以上.")        ;Stay175
   SetQuestNumStep( 75, 175 )
   goto End_QuestNpc00032 
}
}

CmpQuestNumStep( 75, 180 )
if( yes==1 ){
   EventMsg("成功的完成了任务.")
   if(Qcount<23){
   D("恩.. 完成了全部石板任务．． 能提高Dual等级的最初考验通过.")        ;Stay185
   SetQuestNumStep( 75, 185 )
   goto End_QuestNpc00032 
}
   else{
   EventMsg("下面的任务给予.")        ;Stay105
   SetQuestNumStep( 75, 105 )
   goto End_QuestNpc00032 
}
}
CmpQuestNumStep(75, 185)
   if(yes == 1){
   D("为了提高Dual等级必须通过三项考试.")
   SendSound(0, 64)
   SetQuestNumStep( 75, 190 )
   goto End_QuestNpc00032 
}

CmpQuestNumStep( 75, 190 )
if( yes==1 ){
   D("完成最初的考试, '符文石板'的考试通过了.")
   SetQuestNumStep( 75, 195 )
   goto End_QuestNpc00032 
}

CmpQuestNumStep( 75, 195 )
if( yes==1 ){
   D("下面的考试必须拥有一张 1亿的债卷.")
   SetQuestNumStep( 75, 200 )
   goto End_QuestNpc00032 
}

CmpQuestNumStep( 75, 200 )
if( yes==1 ){
   IsInvHavePC(10221)
   if(yes == 1){
   SendSound(0, 1320)
   SetItemInvPC(10221,   0,   0)
   D("恩..不错,你已经办到了,你很厉害…")
   SetQuestNumStep( 75, 205 )
   goto End_QuestNpc00032 
}
   else{
   SendSound(0, 1303)
   D("你身上来了一张 1亿的债卷吗？.")        ;Stay200
   SetQuestNumStep( 75, 200 )
   goto End_QuestNpc00032 
}
}

CmpQuestNumStep( 75, 205 )
if( yes==1 ){
   D("第三项考试,等级必须达到150级别. ")
   SendSound(0, 64)
   SetQuestNumStep( 75, 210 )
   goto End_QuestNpc00032 
}

CmpQuestNumStep( 75, 210 )
if( yes==1 ){
   CallSmallMenu(200, 1190)
   SetQuestNumStep( 75, 215 )
   goto End_QuestNpc00032 
}

CmpQuestNumStep( 75, 215 )
if( yes==1 ){
   DualCheck(5)
   if(yes==1){
   SendSound(0, 1321)
   Qcount = 0
   GhostLv = GhostLv + 1
   D("祝贺你成功升级为DragonSlayer等级.")        ;Stay220
   SetQuestNumStep( 75, 220 )
   goto End_QuestNpc00032 
}
   else{
   D("不能通过第3项考试．．必须再稍做练习")        ;Stay210
   SetQuestNumStep( 75, 210 )
   goto End_QuestNpc00032 
}
}
CmpQuestNumStep(75, 220)
   if(yes == 1){
   D("我的任务到这里都结束了.")
   SetQuestNumStep( 75, 225 )
   goto End_QuestNpc00032 
}

CmpQuestNumStep( 75, 225 )
if( yes==1 ){
   D("到此你已经完成了最后的转职任务.")
   SetQuestNumStep( 75, 230 )
   goto End_QuestNpc00032 
}

CmpQuestNumStep( 75, 230 )
if( yes==1 ){
   SendSound(0, 51)
   D("差点忘记了．． 这个东西送给达到DragonSlayer等级的人.")
   sSetRareItemInvPc(9044,2,2,2,53)
   sSetRareItemInvPc(9044,2,2,2,53)
   SetQuestNumStep( 75, 235 )
   LogDualQuest(75,Qcount,"5转记录",1)    ;;20030617 掂倔 涅胶飘 肺弊 颇老阑 巢扁扁 困秦 俺奔捞啊 眠啊
   goto End_QuestNpc00032 
}

CmpQuestNumStep( 75, 235 )
if( yes==1 ){
   D("那么.. 愿神保佑你...")
   SetQuestNumStep( 75, 235 )
   goto End_QuestNpc00032 
}

;EQuest75_Npc00032
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
;; 傀胶飘 弊饭捞靛
	MapMove( "W_glade", 10,187 )
	if( yes == 1 )
	{
		EventMsg("<傀胶飘 弊饭捞靛>肺 捞悼钦聪促.")
	}
	else
	{
		EventMsg("甘 捞悼俊 角菩沁嚼聪促.")
	}		
end
@Event00002
;; 饭抛狼 碍
	MapMove( "Lethe_river", 530,9 )
	if( yes == 1 )
	{
		EventMsg("<饭抛狼 碍>栏肺 捞悼钦聪促.")
	}
	else
	{
		EventMsg("甘 捞悼俊 角菩沁嚼聪促.")
	}			

end
@Event00003
;; 饭抛
	MapMove( "Lethe", 8,531 )
	if( yes == 1 )
	{
		EventMsg("<饭抛>肺 捞悼钦聪促.")
	}
	else
	{
		EventMsg("甘 捞悼俊 角菩沁嚼聪促.")
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








