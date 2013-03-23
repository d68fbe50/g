
@sys00	; 贸澜 辑滚 Setting窍绰 窃荐.

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
	D("您想参加哪个竞技..")
	QuestTeleport(1,87,14)
end
@Npc00003	; view ladder point
        random( 0 , 2 ) 
       	if( ran == 0 ) 
        {
	        D( "你想知道您在竞技的积分么 " )
        }
       	if( ran == 1 ) 
        {
        	D( "所有参加过竞技的英雄都在我这里有排名." )  
        }	
        CallSmallMenu( 0, 81 )
end
@Npc00004
end
@Npc00005    ; bank
    random( 0, 3 ) 
    if( ran == 0 ) 
    {
        	D( "你需要什么服务?" )
    }     
    if( ran == 1)
    {
        	D( "你想保管什么物品.." ) 
    }     
    if( ran == 2 ) 
    {
        	D( "我会为您提供最好的服务." ) 
    }
    CallSmallMenu( 0, 13 )

end

@Npc00006
   CmpQuestNumStep(49,1)
   if( yes == 0) ; 累促
   {
       		D("您想试下手气么？只要您有赌石，就可以来找我..")
       		SetQuestNumStep(49,1)
       		goto END3_
   }
   if( yes == 1) ; 鞍促
   {
       		D("有时候，您可以获得一些稀有物品...")
       		SetQuestNumStep(49,2)
       		goto END3_
   }
   if( yes == 2) ; 农促
   {
       		D("使用的赌石越多，赌到东西的可能性就越大..")
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

@Npc00010    ; alchemist
    random( 0, 3 ) 
    if( ran == 0 ) 
    {
        	D( "我这里有各种上好的药物出售.." )
    }     
    if( ran == 1)
    {
        	D( "红色药水，蓝色药水，黄色药水的功能都不一样." ) 
    }     
    if( ran == 2 ) 
    {
        	D( "我可以传授你制作药水的诀窍.. " ) 
    }
    CallSmallMenu( 0, 25 )
end

@Npc00011
end
@Npc00012    ; bakery
    random( 0, 3 ) 
    if( ran == 0 ) 
    {
        	D( "新鲜出炉的料理啦..." ) 
    }     
    if( ran == 1) 
    {
        	D( "您肚子饿么？找我就对了..." )
    }     
    if( ran == 2 ) 
    {
        	D( "没有体力什么都做不了~ " )
    }
    CallSmallMenu( 0, 20 )
end

@Npc00013	
end
@Npc00014    ; weapon shop
    random( 0, 3 ) 
    if( ran == 0 ) 
    {
        	D( "铁器制造的武器是最优良的..." ) 
    }     
    if( ran == 1) 
    {
        	D( "只有铁才能做出最好的盔甲.." ) 
    }     
    if( ran == 2 ) 
    {
        	D( "来我这里看看准没错... " ) 
    }
    CallSmallMenu( 0, 18 )
end
@Npc00015    ; carpenter's shop
    random( 0, 3 ) 
    if( ran == 0 ) 
    {
        	D( "木匠可以做出精美的家具." ) 
    }     
    if( ran == 1) 
    {
        	D( "房子基本上都是木头做的.." ) 
    }     
    if( ran == 2 ) 
    {
        	D( "要学会木匠，首先你要学会鉴别木头.." ) 
    }
    CallSmallMenu( 0, 26 )
end
@Npc00016    ; bow shop
    random( 0, 3 ) 
    if( ran == 0 ) 
    {
        	D( "弓箭手没有一把好弓是不行的..." ) 
    }     
    if( ran == 1) 
    {
        	D( "锋利的弓箭可以刺穿厚重的铠甲..." ) 
    }     
    if( ran == 2 ) 
    {
        	D( "来选一把好弓吧.. " ) 
    }
    CallSmallMenu( 0, 27 )
end

@Npc00017
end
@Npc00018
end
@Npc00019    ; astrologer
    random( 0, 3 ) 
    if( ran == 0 ) 
    {
        	D( "魔法其实并不神秘.." ) 
    }     
    if( ran == 1) 
    {
        	D( "你感受到自然的力量了么.. " ) 
    }     
    if( ran == 2 ) 
    {
        	D( "各种魔法我都可以教给你.. " ) 
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
@Npc00024    ; bow shop 2
    random( 0, 3 ) 
    if( ran == 0 ) 
    {
        	D( "弓箭手需要一把好弓..." ) 
    }     
    if( ran == 1) 
    {
        	D( "弓箭手要随身携带很多箭... " ) 
    }     
    if( ran == 2 ) 
    {
        	D( "弓箭手一个需要很高敏捷的职业.." ) 
    }
    CallSmallMenu( 0, 27 )
end

@Npc00025	; Edelbroy's
        random( 0, 3 ) 
        if( ran == 0 ) 
        {
	        D( "以风中飘散的大波斯菊之名祝福你.." ) 
        }       
        if( ran == 1) 
        {
	        D( "以平息暴风的花瓣之荣耀祝福你.." ) 
        }       
        if( ran == 2 ) 
        {
	        D( "使暴风雨沉静下来的是纤弱的大波斯菊，愿艾德布洛伊的祝福伴随着你.." ) 
        }
        CallSmallMenu( 0, 73 )

end
@Npc00026
end
@Npc00027	
end
@Npc00028    ; bakery 2
    random( 0, 3 ) 
    if( ran == 0 ) 
    {
        D( "没有体力什么都做不了..." ) 
    }     
    if( ran == 1) 
    {
        D( "肚子饿么？找我就对了..." ) 
    }     
    if( ran == 2 ) 
    {
        D( "出去冒险不带食物怎么行? " ) 
    }
    CallSmallMenu( 0, 20 )
end
@Npc00029    ; carpenter's shop
    random( 0, 3 ) 
    if( ran == 0 ) 
    {
        	D( "想做各种精美的家具么..." ) 
    }     
    if( ran == 1) 
    {
        	D( "只有学会了鉴别木头，才能做木匠.." ) 
    }     
    if( ran == 2 ) 
    {
        	D( "所有的房子都是木头做的.." ) 
    }
    CallSmallMenu( 0, 26 )
end

@Npc00030    ; weapon shop 2
    random( 0, 3 ) 
    if( ran == 0 ) 
    {
        	D( "来选一件称手的武器吧.." ) 
    }     
    if( ran == 1) 
    {
        	D( "厚重的铠甲可以为战士提供良好的保护..." ) 
    }     
    if( ran == 2 ) 
    {
        	D( "战士最需要铁器.." ) 
    }
    CallSmallMenu( 0, 18 )
end

@Npc00031
;SQuest71_Npc00031
CmpQuestNumStep( 71, 0 )
if( yes==1 ){
	MessageBox("贰歹痢荐啊 5000捞 逞绰 荤恩甸俊霸 <猫乔柯狼 飘肺乔>甫 靛赋聪促. 猫乔柯狼 飘肺乔绰 篮芭茄 康旷俊 包茄 捞具扁狼 凯艰而聪促.")
	SetQuestNumStep( 71, 5 )
	goto End_QuestNpc00031 
}

CmpQuestNumStep( 71, 5 )
if( yes==1 ){
	CompLadderScore(5000)
	if(yes>=1){
	D("磊匙 饭歹 痢荐啊 5000痢 逞菌焙! 捞巴栏肺 猫乔柯狼 飘肺乔甫 罐阑 磊拜捞 乐匙. 猫乔柯狼 飘肺乔绰 磊匙狼 硅扯俊 郴啊 持绢淋技.")
	SetItemInvPC(0,  9048,  500)
	if(yes==1){
	EventMsg("寸脚狼 硅扯俊 <猫乔柯狼 飘肺乔>啊 眠啊登菌嚼聪促.")
	MessageBox("傀胶飘弊饭捞靛'327,14' 捞 镑俊 篮芭茄 康旷捞 磊匙甫 档客临 荐 乐阑芭具..")
	SetQuestNumStep( 71, 10 )
	goto End_QuestNpc00031 
}
	else{
	EventMsg("硅扯捞 啊垫 谩焙. 飘肺乔甫 持阑 傍埃捞 何练秦..控父窍搁 沥府 粱 窍瘤弊贰?")		;End
	SetQuestNumStep( 71, 5 )
	goto End_QuestNpc00031 
}
}
	else{
	D("Colossus狼 康堡篮 5000痢 捞惑牢 磊俊霸 林绢绰巴捞匙. 痢荐甫 歹 棵府绊 坷霸.")		;End
	SetQuestNumStep( 71, 5 )
	goto End_QuestNpc00031 
}
}
CmpQuestNumStep( 71, 25 )
if( yes==1 ){
	MessageBox("炔去狼 飘肺乔绰 贰歹痢荐啊 7000捞 逞绰 荤恩甸俊霸父 林绢瘤绰 巴捞而聪促. 炔去狼 飘肺乔绰 炔去 奇带飘俊 '炔去狼 见搬'阑 何咯且 荐 乐霸 秦 凛聪促.")
	SetQuestNumStep( 71, 30 )
	goto End_QuestNpc00031 
}

CmpQuestNumStep( 71, 30 )
if( yes==1 ){
	CompLadderScore(7000)
	if(yes>=1){
	D("捞 飘肺乔甫 罐阑 磊拜捞 乐绰 荤恩篮 捞 措氟俊辑 割救登绰 巴牢单..辈厘茄 康堡涝聪促. 捞 飘肺乔甫 罐栏绞矫坷. 寸脚篮 面盒洒 捞 康堡阑 穿副 磊拜捞 乐绰 康旷涝聪促.")
	SetItemInvPC(0,  9049,  500)
	if(yes==1){
	EventMsg("寸脚狼 硅扯俊 <炔去狼 飘肺乔>啊 眠啊登菌嚼聪促.")
	MessageBox("寸脚狼 硅扯俊 炔去狼 飘肺乔甫 持菌栏聪 肋 埃流窍绞矫坷.. 捞力 庆霸葛聪酒 '54,444'俊 乐绰 篮芭茄 康旷阑 父唱焊绞矫坷..")
	SetQuestNumStep( 71, 35 )
	goto End_QuestNpc00031 
}
	else{
	EventMsg("硅扯捞 啊垫 瞒继焙夸. 飘肺乔甫 持阑 傍埃捞 何练钦聪促. 沥府甫 秦林矫辨..")
	SetQuestNumStep( 71, 35 )
	goto End_QuestNpc00031 
}
}
	else{
	D("饭歹 痢荐啊 酒流 7000痢捞 登矫瘤 给沁焙夸. 康堡阑 困秦辑扼档 轿快寂辑 痢荐甫 裙垫窍矫辨 官而聪促.")		;Stay30
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
   LogDualQuest(72,Qcount,"2转记录",0)    ;;20030617
   Qcount = 0
   GhostLv = 0
   SendSound(0, 1311)
   D("恭喜你已经晋升为DUAL等级。")
   SetQuestNumStep(72,5)
   goto End_QuestNpc00032 
}
   else{
   SendSound(0, 1303)
   D("你还没有达到Dual等级晋升资格,练习后再来...")        ;Stay0
   SetQuestNumStep(72,0)
   goto End_QuestNpc00032 
}
}

CmpQuestNumStep(72,5)
if( yes==1 ){
   D("首先我担任Dual等级晋升的工作.")
   SetQuestNumStep(72,10)
   goto End_QuestNpc00032 
}

CmpQuestNumStep(72,10)
if( yes==1 ){
   D("让我帮你开始踏上英雄之路的第一步...")
   SetQuestNumStep(72,15)
   goto End_QuestNpc00032 
}

CmpQuestNumStep(72,15)
if( yes==1 ){
   D("Dual等级共有5级,你目前是最初的1级.")
   SendSound(0, 64)
   SetQuestNumStep(72,20)
   goto End_QuestNpc00032 
}

CmpQuestNumStep(72,20)
if( yes==1 ){
   D("DUAL每提升一级,人物的能力上限也会随之提高.")
   SetQuestNumStep(72,25)
   goto End_QuestNpc00032 
}

CmpQuestNumStep(72,25)
if( yes==1 ){
   D("为了提高Dual等级必须通过三项考试..")
   SetQuestNumStep(72,30)
   goto End_QuestNpc00032 
}

CmpQuestNumStep(72,30)
if( yes==1 ){
   D("首先在最开始,我做了一块任务石板。")
   SetQuestNumStep(72,35)
   goto End_QuestNpc00032 
}

CmpQuestNumStep(72,35)
if( yes==1 ){
   D("在这块石板中有24个流动的符号，必须先把符号填满.")
   SetQuestNumStep(72,40)
   goto End_QuestNpc00032 
}

CmpQuestNumStep(72,40)
if( yes==1 ){
   D("据说每完成我交给你的一个任务，就能得到一个相应的符号.")
   SetQuestNumStep(72,45)
   goto End_QuestNpc00032 
}

CmpQuestNumStep(72,45)
if( yes==1 ){
   MessageBox("如果填满石板中24个流动的符号,那么你就顺利完第一个考核.")
   SendSound(0,   64)
   SetQuestNumStep(72,50)
   goto End_QuestNpc00032 
}

CmpQuestNumStep(72,50)
if( yes==1 ){
   D("第二个任务是必须出去深渊迷宫,杀死怪物建立功绩.")
   SetQuestNumStep(72,55)
   goto End_QuestNpc00032 
}

CmpQuestNumStep(72,55)
if( yes==1 ){
   D("只要拿到'炎魔的牙齿'就说明你已经完成使命.")
   SetQuestNumStep(72,60)
   goto End_QuestNpc00032 
}

CmpQuestNumStep(72,60)
if( yes==1 ){
   MessageBox("杀死深渊迷宫的怪物可以得到'炎魔的牙齿'.")
   SendSound(0,   64)
   SetQuestNumStep(72,65)
   goto End_QuestNpc00032 
}

CmpQuestNumStep(72,65)
if( yes==1 ){
   D("第三个考核是,必须等级达到110级. ")
   SetQuestNumStep(72,70)
   goto End_QuestNpc00032 
}

CmpQuestNumStep(72,70)
if( yes==1 ){
   MessageBox("第三个考核是,必须等级达到110级.")
   SendSound(0,   64)
   SetQuestNumStep(72,75)
   goto End_QuestNpc00032 
}

CmpQuestNumStep(72,75)
if( yes==1 ){
   D("深渊迷宫是有很多强悍怪物出没的地方.")
   SetQuestNumStep(72,80)
   goto End_QuestNpc00032 
}

CmpQuestNumStep(72,80)
if( yes==1 ){
   D("为了能够杀死他们,你必须锻炼你的能力.")
   SetQuestNumStep(72,85)
   goto End_QuestNpc00032 
}
CmpQuestNumStep(72,85)
if( yes==1 ){
   D("相信你自己的实力吧,你能做到的.")
   SetQuestNumStep(72,90)
   goto End_QuestNpc00032 
}

CmpQuestNumStep(72,90)
if( yes==1 ){
   D("首先先接受我的任务石板,石板是很重要的东西,不可以弄丢了.")
   SetQuestNumStep(72,95)
   goto End_QuestNpc00032 
}

CmpQuestNumStep(72,95)
if( yes==1 ){
   SetItemInvPC(0, 10179, 500)
   EventMsg("'收到了符文石板'.")
   SetQuestNumStep(72,100)
   goto End_QuestNpc00032 
}

CmpQuestNumStep(72,100)
if( yes==1 ){
   D("为简化大家的转职步骤，任务设置为边境得分，并取消了限制")
   SetQuestNumStep(72,105)
   goto End_QuestNpc00032 
}
CmpQuestNumStep(72,105)
if( yes==1 ){
   random(0,5)
   if(ran==0){
   SendSound(0,64)
   D("此次的任务要在边境战中建立功绩.")        ;Stay170
   SetQuestNumStep(72,170)
   goto End_QuestNpc00032 
}
   if(ran==1){
   SendSound(0,64)
   D("此次的任务要在边境战中建立功绩.")        ;Stay170
   SetQuestNumStep(72,170)
   goto End_QuestNpc00032 
}
   if(ran==2){
   SendSound(0,64)
   D("此次的任务要在边境战中建立功绩.")        ;Stay170
   SetQuestNumStep(72,170)
   goto End_QuestNpc00032 
}
   if(ran==3){
   SendSound(0,64)
   D("此次的任务要在边境战中建立功绩.")        ;Stay170
   SetQuestNumStep(72,170)
   goto End_QuestNpc00032
}
   if(ran==4){
   SendSound(0,64)
   D("此次的任务要在边境战中建立功绩.")        ;Stay170
   SetQuestNumStep(72,170)
   goto End_QuestNpc00032 
}
   if(ran>4){
   SendSound(0,64)
   D("此次的任务要在边境战中建立功绩.")        ;Stay170
   SetQuestNumStep(72,170)
   goto End_QuestNpc00032 
}
}
CmpQuestNumStep(72, 110)
   if(yes == 1){
   D("机密文件在商店已经可以买到.")
   SetQuestNumStep(72,115)
   goto End_QuestNpc00032 
}

CmpQuestNumStep(72,115)
if( yes==1 ){
   D("您只要带钱去买就可以了.")
   SetQuestNumStep(72,120)
   goto End_QuestNpc00032 
}

CmpQuestNumStep(72,120)
if( yes==1 ){
   IsInvHavePC(10176)
   if(yes == 1){
   D("任务完成,增加一个符文.")
   SetItemInvPC(10176, 0, 0)
   Qcount = Qcount + 1
   CallMenu(27)
   LogDualQuest(72,Qcount,"2转记录",0)    ;;20030617
   SetQuestNumStep(72,125)
   goto End_QuestNpc00032 
}
   else{
   SendSound(0, 1303)
   D("您带了拜索斯机密文件么.")        ;Stay120
   SetQuestNumStep(72,120)
   goto End_QuestNpc00032 
}
}

CmpQuestNumStep(72,125)
if( yes==1 ){
   EventMsg("成功地完成了任务.")
   if(Qcount<23){
   D("恩.. 完成了全部石板任务．． 能提高Dual等级的最初考验通过.")        ;Stay185
   SetQuestNumStep(72,185)
   goto End_QuestNpc00032 
}
   else{
   EventMsg("下面的任务给予.")        ;Stay105
   SetQuestNumStep(72,105)
   goto End_QuestNpc00032 
}
}
CmpQuestNumStep(72, 130)
   if(yes == 1){
   D("机密文件在商店可以买到.")
   SetQuestNumStep(72,135)
   goto End_QuestNpc00032 
}

CmpQuestNumStep(72,135)
if( yes==1 ){
   D("您只要带钱去买就可以了.")
   SetQuestNumStep(72,140)
   goto End_QuestNpc00032 
}

CmpQuestNumStep(72,140)
if( yes==1 ){
   IsInvHavePC(10177)
   if(yes == 1){
   D("任务完成,增加一个符文.")
   SetItemInvPC(10177, 0, 0)
   Qcount = Qcount + 1
   CallMenu(27)
   LogDualQuest(72,Qcount,"2转记录",0)    ;;20030617
   SetQuestNumStep(72,145)
   goto End_QuestNpc00032 
}
   else{
   SendSound(0, 1303)
   D("您带了杰彭机密文件么.")        ;Stay140
   SetQuestNumStep(72,140)
   goto End_QuestNpc00032 
}
}

CmpQuestNumStep(72,145)
if( yes==1 ){
   EventMsg("成功地完成了任务.")
   if(Qcount<23){
   D("恩.. 完成了全部石板任务．． 能提高Dual等级的最初考验通过.")        ;Stay185
   SetQuestNumStep(72,185)
   goto End_QuestNpc00032 
}
   else{
   EventMsg("下面的任务给予.")        ;Stay105
   SetQuestNumStep(72,105)
   goto End_QuestNpc00032 
}
}
CmpQuestNumStep(72, 150)
   if(yes == 1){
   D("机密文件在商店出售.")
   SetQuestNumStep(72,155)
   goto End_QuestNpc00032 
}

CmpQuestNumStep(72,155)
if( yes==1 ){
   D("你只要带钱去购买就行了.")
   SetQuestNumStep(72,160)
   goto End_QuestNpc00032 
}

CmpQuestNumStep(72,160)
if( yes==1 ){
   IsInvHavePC(10178)
   if(yes == 1){
   D("任务完成,增加一个符文.")
   SetItemInvPC(10178, 0, 0)
   Qcount = Qcount + 1
   CallMenu(27)
   LogDualQuest(72,Qcount,"2转记录",0)    ;;20030617
   SetQuestNumStep(72,165)
   goto End_QuestNpc00032 
}
   else{
   SendSound(0, 1303)
   D("您带了伊斯的机密文件么.")        ;Stay160
   SetQuestNumStep(72,160)
   goto End_QuestNpc00032 
}
}

CmpQuestNumStep(72,165)
if( yes==1 ){
   EventMsg("成功的完成了任务.")
   if(Qcount<23){
   D("恩.. 完成了全部石板任务．． 能提高Dual等级的最初考验通过.")        ;Stay185
   SetQuestNumStep(72,185)
   goto End_QuestNpc00032 
}
   else{
   EventMsg("下面的任务给予.")        ;Stay105
   SetQuestNumStep(72,105)
   goto End_QuestNpc00032 
}
}
CmpQuestNumStep(72, 170)
   if(yes == 1){
   D("参加边境战,为了简化大家转职，此任务可以直接完成.")
   SetQuestNumStep(72,175)
   goto End_QuestNpc00032 
}

CmpQuestNumStep(72,175)
if( yes==1 ){
   EventMsg("......")
   if(KillDualCount<999){
   D("边境任务直接完成,增加一个符文.")
   KillDualCount = 0
   Qcount = Qcount + 1
   CallMenu(27)
   LogDualQuest(72,Qcount,"2转记录",0)    ;;20030617
   SetQuestNumStep(72,180)
   goto End_QuestNpc00032 
}
   else{
   SendSound(0, 1303)
   D("边境名声不足. 参加边境战,必须得到dualfame 25以上.")        ;Stay175
   SetQuestNumStep(72,175)
   goto End_QuestNpc00032 
}
}

CmpQuestNumStep(72,180)
if( yes==1 ){
   EventMsg("成功的完成了任务.")
   if(Qcount<23){
   D("恩.. 完成了全部石板任务．． 能提高Dual等级的最初考验通过.")        ;Stay185
   SetQuestNumStep(72,185)
   goto End_QuestNpc00032 
}
   else{
   EventMsg("下面的任务给予.")        ;Stay105
   SetQuestNumStep(72,105)
   goto End_QuestNpc00032 
}
}
CmpQuestNumStep(72, 185)
   if(yes == 1){
   D("为了提高Dual等级必须通过三项考试.")
   SendSound(0, 64)
   SetQuestNumStep(72,190)
   goto End_QuestNpc00032 
}

CmpQuestNumStep(72,190)
if( yes==1 ){
   D("完成最初的考试, '符文石板'的考试通过了.")
   SetQuestNumStep(72,195)
   goto End_QuestNpc00032 
}

CmpQuestNumStep(72,195)
if( yes==1 ){
   D("下面的考试必须杀死深渊迷宫的BOSS后取得'炎魔的牙齿'.")
   SetQuestNumStep(72,200)
   goto End_QuestNpc00032 
}

CmpQuestNumStep(72,200)
if( yes==1 ){
   IsInvHavePC(10064)
   if(yes == 1){
   SendSound(0, 1310)
   SetItemInvPC(10064, 0, 0)
   D("恩..不错,你已经办到了,你很厉害…")
   SetQuestNumStep(72,205)
   goto End_QuestNpc00032 
}
   else{
   SendSound(0, 1303)
   D("必须杀死深渊迷宫的BOSS后取得'炎魔的牙齿'.")        ;Stay200
   SetQuestNumStep(72,200)
   goto End_QuestNpc00032 
}
}

CmpQuestNumStep(72,205)
if( yes==1 ){
   D("第三项考试,等级必须达到110级别. ")
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
   D("祝贺你成功升级为Dual2等级.")        ;Stay220
   SetQuestNumStep(72,220)
   goto End_QuestNpc00032 
}
   else{
   D("不能通过第3项考试．．必须再稍做练习")        ;Stay210
   SetQuestNumStep(72,210)
   goto End_QuestNpc00032 
}
}
CmpQuestNumStep(72, 220)
   if(yes == 1){
   D("我的任务到这里都结束了.")
   SetQuestNumStep(72,225)
   goto End_QuestNpc00032 
}

CmpQuestNumStep(72,225)
if( yes==1 ){
   D("如果想继续进修Dual3等级,去拜访西部林地[356,15]的人就行了.")
   SetQuestNumStep(72,230)
   goto End_QuestNpc00032 
}

CmpQuestNumStep(72,230)
if( yes==1 ){
   SendSound(0, 51)
   D("差点忘记了．． 这个东西送给达到Dual2等级的人.")
   sSetRareItemInvPc(9042,1,2,2,2)
   SetQuestNumStep(72,235)
LogDualQuest(72,Qcount,"2转记录",1)    ;;20030617
   goto End_QuestNpc00032 
}

CmpQuestNumStep(72,235)
if( yes==1 ){
   D("那么.. 愿神保佑你...")
   SetQuestNumStep(72,235)
   goto End_QuestNpc00032 
}

;EQuest72_Npc00032
:End_QuestNpc00032
end






@Npc00033	
	random(0,3)
	if( ran == 0 ) {
	D(" 攫力鳖瘤 巢甸俊霸 脚技瘤哥 混酒啊妨绰啊? 捞芭 茄 厘栏肺 第笼绢滚府绰芭具! ")
}
	if( ran == 1 ) {
	D(" 磊~ 措付过荤 贾肺贸啊 傈秦林绰 付过狼 箭磊肺 寸脚狼 牢积阑 开傈矫难焊瘤 臼摆唱? ")
}
	if( ran == 2 ) {
	D(" 窍风 辆老 荤成窍绰 巴焊促 捞 率狼 国捞啊 歹 亮促绰 巴阑 舅绊 乐唱? ")
}
 	CallSmallMenu(0,256)
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
		D("Fame捞 1000 捞惑牢 盒甸篮 汗备啊 登瘤 臼嚼聪促.")
	}
	else
	{
		FameUp(1000)
		D("Fame捞 汗备蹬辑 1000捞 棵扼啊霸 邓聪促.")
	}
end

@Npc00041

end
@Npc00042    ;;权其捞瘤 曼啊 何盒 昏力
:END4201_    ;;罚待茄 瘤开栏肺 捞悼
   random( 0, 2 ) 
    if( ran == 0 ) 
	{
       		goto END4202_
	}     
    if( ran == 1)
    	{
         	goto END4203_
    	}
    
:END4202_    ;;OX 柠令 1锅 瘤开栏肺 捞悼

   MapMove( "EVENT2", 25, 17 )
   if( yes == 1 )
   	{
       		EventMsg(" 移动到智者试验场.")
   	}
   	else
   	{
       		EventMsg(" 智者试验尚未开启. ")
       		goto END4299_
   	}

:END4203_    ;;OX 柠令 2锅 瘤开栏肺 捞悼

   MapMove( "EVENT2", 29, 28 )
   if( yes == 1 )
   	{
       		EventMsg(" 移动到智者试验场.")
   	}
   	else
   	{
       		EventMsg(" 智者试验尚未开启. ")
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
;SQuest76_npc00049
CmpQuestNumStep(76,0)
if(yes==1)
{
	SendSound(0,0097)
	D( "你好，我负责兑换2转任务所需要的“炎魔的牙齿”" )
	MessageBox("您现在正在兑换的物品是2转所需要的“炎魔的牙齿”.")
	D( "需要2个金龙才能兑换，你确认兑换吗？" )
   	SetQuestNumStep(76,5)
    	goto End_QuestNpc00049
}
CmpQuestNumStep(76,5)
if(yes==1)
	{
  	CheckItemMulti(10199, 2)
  	if(yes==1)
  	{
    		DeleteItemMulti(10199, 2)
    		SetItemInvPC(0 ,10064, 1)
		SendSound(0,2167)
		EventMsg("兑换炎魔的牙齿成功.")
    		D( "恭喜你! 炎魔的牙齿兑换成功  请查看你的背包" )
    		SetQuestNumStep(76,0)
    		goto End_QuestNpc00049
  	}
  	else
  	{
    		D( "您身上的金龙龙不够，需要2个才能交换." )
    		SetQuestNumStep(76,0)
    		goto End_QuestNpc00049
  	}     
}

;EQuest76_Npc00049
:End_QuestNpc00049
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
       		EventMsg("您有国籍么?")
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
@Event00014    ; to Fight map
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

   if( yes == 1)    ; Success to MapMove
   {
       		EventMsg("移动到中央竞技场.")
   }
   else    ; Failed to MapMove
   {
       		EventMsg("地图移动失败.")
   }
end
@Event00015    ; to Dunmaze map
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

   if( yes == 1)    ; Success to MapMove
   {
       		EventMsg("<移动到堡垒竞技场.")
   }
   else    ; Failed to MapMove
   {
       		EventMsg("地图移动失败.")
   }
end
@Event00016    ; to Stone map
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

   if( yes == 1)    ; Success to MapMove
   {
       		EventMsg("移动到夺石竞技场.")
   }
   else    ; Failed to MapMove
   {
       		EventMsg("地图移动失败.")
   }
   
end
@Event00017    
;; 喉风酒饭唱
   MapMove( "GM_event", 148,202 )
   if( yes == 1 )
   {
       		EventMsg("移动到GM竞技场.")
   }
   else
   {
       		EventMsg("地图移动失败.")
   }
end
@Event00018    ; to Castle2 map
   IsLevel(61)        ;拱带傈 50饭骇 力茄
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
       if( yes == 1)    ; Success to MapMove
       {
           	EventMsg("移动到初阶竞技场.")
           	goto Event00018
       }
       else    ; Failed to MapMove
       {
           	EventMsg("地图移动失败.")
           	goto Event00018
       }    
   }
   else
   {
       		EventMsg("60以下玩家才能进入初阶竞技场.")
   }
:Event00018
end
@Event00019
end

@Event00020
end
@Event00021
end
@Event00022
end
@Event00023
end
@Event00024
end
@Event00025
end
@Event00026
end
@Event00027
end
@Event00028
end
@Event00029
end

@Event00030
end
@Event00031
end
@Event00032
end
@Event00033
end
@Event00034
end
@Event00035
end
@Event00036
end
@Event00037
end
@Event00038
end
@Event00039
end

@Event00040
end
@Event00041
;; 阁胶磐 酒饭唱
   MapMove("mon_arena",405,407)
   if( yes == 1 )
   {
       		EventMsg("移动到怪物竞技场.")
   }
   else
   {
       		EventMsg("地图移动失败.")
   }
end
@Event00042
end
@Event00043
end
@Event00044
end
@Event00045
end





