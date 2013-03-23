
@sys00	; 贸澜 辑滚 Setting窍绰 窃荐.

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
	D("唱绰 乔棵扼狼 齿掳 酒甸.")
	SetQuestNumStep( 88, 100 )
	goto End_QuestNpc00021 
}

CmpQuestNumStep( 88, 100 )
if( yes==1 ){
	D("笛掳 屈狼 积阿篮 亲惑 扁惯窍窜 富具..")
	SetQuestNumStep( 88, 105 )
	goto End_QuestNpc00021 
}

CmpQuestNumStep( 88, 105 )
if( yes==1 ){
	D("捞犯霸 埃窜茄 捞亥飘肺 快府 屈力啊 绢痘霸 瘤郴绰瘤甫 促 舅荐啊 乐栏聪..")
	SetQuestNumStep( 88, 110 )
	goto End_QuestNpc00021 
}

CmpQuestNumStep( 88, 110 )
if( yes==1 ){
	D("酒流鳖瘤 葛滴 公荤洒 瘤郴绊 乐绢 沥富 促青捞具..")
	SetQuestNumStep( 88, 115 )
	goto End_QuestNpc00021 
}

CmpQuestNumStep( 88, 115 )
if( yes==1 ){
	D("咯扁鳖瘤 柯 芭 焊聪 霉掳 屈父 给 父抄 芭 鞍焙..")
	SetQuestNumStep( 88, 120 )
	goto End_QuestNpc00021 
}

CmpQuestNumStep( 88, 120 )
if( yes==1 ){
	D("奴 屈篮 弊镑俊 茄 锅 啊歹聪 歹捞惑 倒酒棵 积阿阑 救窍聪..")
	SetQuestNumStep( 88, 125 )
	goto End_QuestNpc00021 
}

CmpQuestNumStep( 88, 125 )
if( yes==1 ){
	D("捞胶畔 官迟俊 啊搁 企倾瘤开捞 乐阑 芭具.. 弊镑俊 茄锅 啊焊霸..")
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
	D("恐 混酒具 窍绰 巴老鳖. 抄 弊霸 泵陛茄 芭具.")
	SetQuestNumStep(89,95)
	goto End_QuestNpc00022 
}

CmpQuestNumStep(89,95)
if( yes==1 ){
	D("绢蠢 朝 癌磊扁 郴 活捞 刚瘤贸烦 蠢哺龙 挥捞瘤.")
	SetQuestNumStep(89,100)
	goto End_QuestNpc00022 
}

CmpQuestNumStep(89,100)
if( yes==1 ){
	D("唱绰 官焊具. 沥富 官焊瘤.")
	SetQuestNumStep(89,105)
	goto End_QuestNpc00022 
}

CmpQuestNumStep(89,105)
if( yes==1 ){
	D("抄 唱狼 老何牢 唱狼 皑沥 炼瞒 郴 涝栏肺 钎泅窍瘤档 给窍绰 官焊具.")
	SetQuestNumStep(89,110)
	goto End_QuestNpc00022 
}

CmpQuestNumStep(89,110)
if( yes==1 ){
	D("弊贰辑 唱焊促 家吝茄 荤恩阑 酪绊 富疽绢,")
	SetQuestNumStep(89,115)
	goto End_QuestNpc00022 
}

CmpQuestNumStep(89,115)
if( yes==1 ){
	D("抄 捞力 混 啊摹甫 茫瘤 给窍摆绢.")
	SetQuestNumStep(89,120)
	goto End_QuestNpc00022 
}

CmpQuestNumStep(89,120)
if( yes==1 ){
	D("弊贰辑 捞犯霸 磷绊 酵阑 挥捞具.")
	SetQuestNumStep(89,125)
	goto End_QuestNpc00022 
}

CmpQuestNumStep(89,125)
if( yes==1 ){
	D("捞 唱公俊绰 郴啊 弊赤甫 积阿窍哥 捞抚阑 货扁菌瘤.")
	SetQuestNumStep(89,130)
	goto End_QuestNpc00022 
}

CmpQuestNumStep(89,130)
if( yes==1 ){
	D("捞 唱公狼 捞抚贸烦 瞪 荐 乐促搁......")
	SetQuestNumStep(89,135)
	goto End_QuestNpc00022 
}

CmpQuestNumStep(89,135)
if( yes==1 ){
	D("弊繁单 唱俊霸 公郊 杭 老牢啊?")
	SetQuestNumStep(89,140)
	goto End_QuestNpc00022 
}

CmpQuestNumStep(89,140)
if( yes==1 ){
	IsInvHavePC(10231)
	if(yes == 1){
	SetItemInvPC(10231,  0,  0)
	EventMsg("'噶阿狼距'阑 扒郴玲嚼聪促.")
	SetQuestNumStep(89,145)
	goto End_QuestNpc00022 
}
	else{
	D("侩扒捞 绝促搁 唱甫 去磊 乐霸 秦林摆唱..")
	EventMsg("...")		;Stay140
	SetQuestNumStep(89,140)
	goto End_QuestNpc00022 
}
}

CmpQuestNumStep(89,145)
if( yes==1 ){
	D("捞霸 公均捞瘤? 酒! 刀距牢啊 焊焙..")
	SetQuestNumStep(89,150)
	goto End_QuestNpc00022 
}

CmpQuestNumStep(89,150)
if( yes==1 ){
	EventMsg("'噶阿狼距'阑 冈绰促.")
	SetQuestNumStep(89,155)
	goto End_QuestNpc00022 
}

CmpQuestNumStep(89,155)
if( yes==1 ){
	D("唱俊霸 公郊 杭 老牢啊?")
	SetQuestNumStep(89,160)
	goto End_QuestNpc00022 
}

CmpQuestNumStep(89,160)
if( yes==1 ){
	D("唱俊霸 何殴且 老捞扼档 乐绰 巴牢啊?")
	SetQuestNumStep(89,165)
	goto End_QuestNpc00022 
}

CmpQuestNumStep(89,165)
if( yes==1 ){
	D("酒滚瘤膊辑 捌沥窍矫摆焙..")
	SetQuestNumStep(89,170)
	goto End_QuestNpc00022 
}

CmpQuestNumStep(89,170)
if( yes==1 ){
	D("弊繁单 郴啊 恐 捞 掣急 镑俊 柯 巴捞瘤..")
	SetQuestNumStep(89,175)
	goto End_QuestNpc00022 
}

CmpQuestNumStep(89,175)
if( yes==1 ){
	D("林困甫 焊酒窍聪 捞镑篮 傀胶飘 官迟牢单..")
	SetQuestNumStep(89,180)
	goto End_QuestNpc00022 
}

CmpQuestNumStep(89,180)
if( yes==1 ){
	D("捞镑篮 困氰茄 镑捞聪 炼缴窍辨 官扼匙...")
	SetQuestNumStep(89,185)
	goto End_QuestNpc00022 
}

CmpQuestNumStep(89,185)
if( yes==1 ){
	D("弊繁单 抄 规陛 傈鳖瘤 公郊 老阑 窍妨绊 沁带 巴 鞍篮单 康 扁撅捞 救 唱绰焙.")
	SetQuestNumStep(89,190)
	goto End_QuestNpc00022 
}

CmpQuestNumStep(89,190)
if( yes==1 ){
	D("贸澜 父抄 磊匙俊霸 捞繁 吧 拱绢杭 荐 绝绊 富具..")
	SetQuestNumStep(89,195)
	goto End_QuestNpc00022 
}

CmpQuestNumStep(89,195)
if( yes==1 ){
	D("抄 酒公贰档 弊 老阑 积阿秦尘 锭鳖瘤 捞镑俊 乐绢具 摆匙..")
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
	D("你好，来自远方的朋友.")
	SetQuestNumStep(23,5)
	goto End_QuestNpc00023 
}
	else{
	D("我这这里等你很久了.")		;Stay0
	SetQuestNumStep(23,0)
	goto End_QuestNpc00023 
}
}

CmpQuestNumStep(23,5)
if( yes==1 ){
	D("我是负责引导您进行纹章任务的人.")
	SetQuestNumStep(23,10)
	goto End_QuestNpc00023 
}

CmpQuestNumStep(23,10)
if( yes==1 ){
	D("每种职业的纹章属性都不一样，等级不同的纹章属性也不同")
	SetQuestNumStep(23,15)
	goto End_QuestNpc00023 
}

CmpQuestNumStep(23,15)
if( yes==1 ){
	D("纹章一共有5个等级.")
	SetQuestNumStep(23,20)
	goto End_QuestNpc00023 
}

CmpQuestNumStep(23,20)
if( yes==1 ){
	D("您可以到[4, 26] 去接受1转纹章任务.")
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
	D("恩..那是几个贪婪的家伙，可能会向你要钱")
	SetQuestNumStep(23,35)
	goto End_QuestNpc00023 
}

CmpQuestNumStep(23,35)
if( yes==1 ){
	D("如果他们开口的话你就只能把钱给他们.")
	SetQuestNumStep(23,40)
	goto End_QuestNpc00023 
}

CmpQuestNumStep(23,40)
if( yes==1 ){
	D("经过他们的审查以后您将可以升级您的纹章")
	SetQuestNumStep(23,45)
	goto End_QuestNpc00023 
}

CmpQuestNumStep(23,45)
if( yes==1 ){
	D("下面是废话了......")
	SetQuestNumStep(23,50)
	goto End_QuestNpc00023 
}

CmpQuestNumStep(23,50)
if( yes==1 ){
	D(".....")
	SetQuestNumStep(23,55)
	goto End_QuestNpc00023 
}

CmpQuestNumStep(23,55)
if( yes==1 ){
	D("........")
	SetQuestNumStep(23,60)
	goto End_QuestNpc00023 
}

CmpQuestNumStep(23,60)
if( yes==1 ){
	D("..")
	goto End_QuestNpc00023 
}

CmpQuestNumStep(23,65)
if( yes==1 ){
	D(".........")
	SetQuestNumStep(23,70)
	goto End_QuestNpc00023 
}

CmpQuestNumStep(23,70)
if( yes==1 ){
	D(".......")
	SetQuestNumStep(23,75)
	goto End_QuestNpc00023 
}

CmpQuestNumStep(23,75)
if( yes==1 ){
	D("........")
	SetQuestNumStep(23,80)
	goto End_QuestNpc00023 
}

CmpQuestNumStep(23,80)
if( yes==1 ){
	D("........")
	SetQuestNumStep(23,85)
	goto End_QuestNpc00023 
}

CmpQuestNumStep(23,85)
if( yes==1 ){
	D(".......")
	SetQuestNumStep(23,90)
	goto End_QuestNpc00023 
}

CmpQuestNumStep(23,90)
if( yes==1 ){
	D(".....")
	SetQuestNumStep(23,95)
	goto End_QuestNpc00023 
}

CmpQuestNumStep(23,95)
if( yes==1 ){
	D("........")
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
	D("你好.我是负责帮战士追加纹章的人")
	SetQuestNumStep(24,5)
	goto End_QuestNpc00024 
}
	else{
	D("如果你不是战士，那我帮不了你了.")		;Stay0
	SetQuestNumStep(24,0)
	goto End_QuestNpc00024 
}
}
	else{
	D("去问问我旁边的朋友吧.")		;Stay0
	SetQuestNumStep(24,0)
	goto End_QuestNpc00024 
}
}

CmpQuestNumStep(24,5)
if( yes==1 ){
	DualClassCheck(0,0)
	if(yes==1){
	D("我先看看你的能力")
	SetQuestNumStep(24,10)
	goto End_QuestNpc00024 
}
	else{
	D("是这样的啊...")		;Stay40
	SetQuestNumStep(24,40)
	goto End_QuestNpc00024 
}
}

CmpQuestNumStep(24,10)
if( yes==1 ){
	D("其实你可以在身上装备一个转职的证明,就是纹章.")
	SetQuestNumStep(24,15)
	goto End_QuestNpc00024 
}

CmpQuestNumStep(24,15)
if( yes==1 ){
	D("我好穷啊，能不能给我个银龙？.")
	EventMsg("需要给他1个银龙.")
	SetQuestNumStep(24,20)
	goto End_QuestNpc00024 
}

CmpQuestNumStep(24,20)
if( yes==1 ){
	CheckItemMulti(10200,1)
	if(yes==1){
	DeleteItemMulti(10200,1)
	D("好多了,我们接着说.")
	SetQuestNumStep(24,25)
	goto End_QuestNpc00024 
}
	else{
	EventMsg("需要给他1个银龙.")		;Stay20
	SetQuestNumStep(24,20)
	goto End_QuestNpc00024 
}
}

CmpQuestNumStep(24,25)
if( yes==1 ){
	D("不同的职业和转职的不同,获得纹章也不一样.")		;Stay200
	SetQuestNumStep(24,200)
	goto End_QuestNpc00024 
}

CmpQuestNumStep(24,40)
	if(yes==1){
	DualClassCheck(0,1)
	if(yes==1){
	D("我想想...")
	SetQuestNumStep(24,45)
	goto End_QuestNpc00024 
}
	else{
	D("请等下...")		;Stay80
	SetQuestNumStep(24,80)
	goto End_QuestNpc00024 
}
}
 
CmpQuestNumStep(24,45)
if( yes==1 ){
	D("你可以在身上装备一个转职的证明.")
	SetQuestNumStep(24,50)
	goto End_QuestNpc00024 
}

CmpQuestNumStep(24,50)
if( yes==1 ){
	D("就是纹章,这个东西可以给予你特殊的能力.")
	SetQuestNumStep(24,55)
	goto End_QuestNpc00024 
}

CmpQuestNumStep(24,55)
if( yes==1 ){
	D("我好穷啊，能不能给我一个银龙？.")
	EventMsg("需要给他1个银龙.")
	SetQuestNumStep(24,60)
	goto End_QuestNpc00024 
}

CmpQuestNumStep(24,60)
if( yes==1 ){
	CheckItemMulti(10200,1)
	if(yes==1){
	DeleteItemMulti(10200,1)
	D("呵呵，收下了，我们继续.")
	SetQuestNumStep(24,65)
	goto End_QuestNpc00024 
}
	else{
	EventMsg("需要给他1个银龙.")		;Stay60
	SetQuestNumStep(24,60)
	goto End_QuestNpc00024 
}
}

CmpQuestNumStep(24,65)
if( yes==1 ){
	D("不同的职业和转职的不同,获得纹章也不一样.")		;Stay200
	SetQuestNumStep(24,200)
	goto End_QuestNpc00024 
}

CmpQuestNumStep(24,80)
	if(yes==1){
	DualClassCheck(0,3)
	if(yes==1){
	D("我来想想....")
	SetQuestNumStep(24,85)
	goto End_QuestNpc00024 
}
	else{
	D("恩，你的能力有点特殊.")		;Stay115
	SetQuestNumStep(24,115)
	goto End_QuestNpc00024 
}
}
 
CmpQuestNumStep(24,85)
if( yes==1 ){
	D("其实你可以在身上装备一个转职的证明,就是纹章.")
	SetQuestNumStep(24,90)
	goto End_QuestNpc00024 
}

CmpQuestNumStep(24,90)
if( yes==1 ){
	D("我好穷啊，能不能给我一个银龙？")
	EventMsg("需要给他1个银龙.")
	SetQuestNumStep(24,95)
	goto End_QuestNpc00024 
}

CmpQuestNumStep(24,95)
if( yes==1 ){
	CheckItemMulti(10200,1)
	if(yes==1){
	DeleteItemMulti(10200,1)
	D("呵呵，谢谢你的龙，我们继续.")
	SetQuestNumStep(24,100)
	goto End_QuestNpc00024 
}
	else{
	EventMsg("需要给他1个银龙.")		;Stay95
	SetQuestNumStep(24,95)
	goto End_QuestNpc00024 
}
}

CmpQuestNumStep(24,100)
if( yes==1 ){
	D("不同的职业和转职的不同,获得纹章也不一样.")		;Stay200
	SetQuestNumStep(24,200)
	goto End_QuestNpc00024 
}

CmpQuestNumStep(24,115)
	if(yes==1){
	DualClassCheck(0,2)
	if(yes==1){
	D("我来想想...")
	SetQuestNumStep(24,120)
	goto End_QuestNpc00024 
}
	else{
	D("原来是这样...")		;Stay150
	SetQuestNumStep(24,150)
	goto End_QuestNpc00024 
}
}
 
CmpQuestNumStep(24,120)
if( yes==1 ){
	D("其实你可以在身上装备一个转职的证明,就是纹章..")
	SetQuestNumStep(24,125)
	goto End_QuestNpc00024 
}

CmpQuestNumStep(24,125)
if( yes==1 ){
	D("我好穷啊，能不能给我一个银龙?")
	EventMsg("需要给他1个银龙.")
	SetQuestNumStep(24,130)
	goto End_QuestNpc00024 
}

CmpQuestNumStep(24,130)
if( yes==1 ){
	CheckItemMulti(10200,1)
	if(yes==1){
	DeleteItemMulti(10200,1)
	D("呵呵，我们继续.")
	SetQuestNumStep(24,135)
	goto End_QuestNpc00024 
}
	else{
	EventMsg("需要给他1个银龙.")		;Stay130
	SetQuestNumStep(24,130)
	goto End_QuestNpc00024 
}
}

CmpQuestNumStep(24,135)
if( yes==1 ){
	D("不同的职业和转职的不同,获得纹章也不一样.")		;Stay200
	SetQuestNumStep(24,200)
	goto End_QuestNpc00024 
}

CmpQuestNumStep(24,150)
	if(yes==1){
	DualClassCheck(0,4)
	if(yes==1){
	D("我想想...")
	SetQuestNumStep(24,155)
	goto End_QuestNpc00024 
}
	else{
	D(".....")		;Stay0
	SetQuestNumStep(24,0)
	goto End_QuestNpc00024 
}
}
 
CmpQuestNumStep(24,155)
if( yes==1 ){
	D("你可以在身上装备一个转职的证明.")
	SetQuestNumStep(24,160)
	goto End_QuestNpc00024 
}

CmpQuestNumStep(24,160)
if( yes==1 ){
	D("就是纹章,它可以给予你特殊的能力.")
	SetQuestNumStep(24,165)
	goto End_QuestNpc00024 
}

CmpQuestNumStep(24,165)
if( yes==1 ){
	D("我好穷啊，能不能给我一个银龙?")
	EventMsg("需要给他一个银龙.")
	SetQuestNumStep(24,170)
	goto End_QuestNpc00024 
}

CmpQuestNumStep(24,170)
if( yes==1 ){
	CheckItemMulti(10200,1)
	if(yes==1){
	DeleteItemMulti(10200,1)
	D("呵呵，好的，我们继续.")
	SetQuestNumStep(24,175)
	goto End_QuestNpc00024 
}
	else{
	EventMsg("需要给他一个银龙.")		;Stay170
	SetQuestNumStep(24,170)
	goto End_QuestNpc00024 
}
}

CmpQuestNumStep(24,175)
if( yes==1 ){
	D("不同的职业和转职不同,获得的纹章也不同.")		;Stay200
	SetQuestNumStep(24,200)
	goto End_QuestNpc00024 
}

CmpQuestNumStep(24,200)
	if(yes==1){
	UpDualClassItem(1)
	D("为了感谢你给我的银龙,我把我的纹章送给你,你要好好利用纹章的特殊能力.")	;Stay300
	EventMsg("获得纹章!.")
	SetQuestNumStep(24,205)
	goto End_QuestNpc00024 
}
 
CmpQuestNumStep(24,205)
if( yes==1 ){
	D("据说毒洞3层有个人可以将纹章升级.....")		;Stay300
        EventMsg("去毒洞3找人升级纹章.")
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
	D("呈 掂倔 努贰胶具?")
	SetQuestNumStep(25,5)
	goto End_QuestNpc00025 
}
	else{
	D("呈客绰 惑包绝绰 捞具扁具.")		;Stay0
	SetQuestNumStep(25,0)
	goto End_QuestNpc00025 
}
}
	else{
	D("呈绰 掂倔 努贰胶狼 档迪捞 酒聪垒酒.")		;Stay0
	SetQuestNumStep(25,0)
	goto End_QuestNpc00025 
}
}

CmpQuestNumStep(25,5)
if( yes==1 ){
	DualClassCheck(1,1)
	if(yes == 1){
	D("呈绰...")
	SetQuestNumStep(25,10)
	goto End_QuestNpc00025 
}
	else{
	D("抄富捞具.")		;Stay55
	SetQuestNumStep(25,55)
	goto End_QuestNpc00025 
}
}

CmpQuestNumStep(25,10)
if( yes==1 ){
	D("磨孺鞍篮 绢狄 加阑 付澜措肺 倒酒促匆 荐 乐绰 唱捞飘 龋农焙.")
	SetQuestNumStep(25,15)
	goto End_QuestNpc00025 
}

CmpQuestNumStep(25,15)
if( yes==1 ){
	D("喉发 促捞酒阁靛 捞具扁 甸绢好绢夸? 酒付 捞抚父 甸绢 好阑 芭具.")
	SetQuestNumStep(25,20)
	goto End_QuestNpc00025 
}

CmpQuestNumStep(25,20)
if( yes==1 ){
	D("傈汲利牢 葛氰磊牢 匙府客客 磊农 窜 滴 疙父捞 弊 喉发 促捞酒阁靛甫 颊俊 持阑 荐 乐菌瘤.")
	SetQuestNumStep(25,25)
	goto End_QuestNpc00025 
}

CmpQuestNumStep(25,25)
if( yes==1 ){
	D("弊繁单 酒绰 付过荤啊 付唱 皋呕捞 乐栏搁 喉发 促捞酒阁靛甫 父甸 荐 乐促绰芭具.")
	SetQuestNumStep(25,30)
	goto End_QuestNpc00025 
}

CmpQuestNumStep(25,30)
if( yes==1 ){
	D("我好穷啊，能不能给我一个银龙?.")
	EventMsg("需要给他1个银龙.")
	SetQuestNumStep(25,35)
	goto End_QuestNpc00025 
}

CmpQuestNumStep(25,35)
if( yes==1 ){
	CheckItemMulti(10200,1)
	if(yes == 1){
	DeleteItemMulti(10200,1)
	D("措窜窍匙夸.")
	SetQuestNumStep(25,40)
	goto End_QuestNpc00025 
}
	else{
	EventMsg("需要给他1个银龙.")		;Stay35
	SetQuestNumStep(25,35)
	goto End_QuestNpc00025 
}
}

CmpQuestNumStep(25,40)
if( yes==1 ){
	D("捞吧 啊瘤绊 刀 带傈狼 促农 郡橇甫 茫酒啊毫夸.")		;Stay250
	SetQuestNumStep(25,250)
	goto End_QuestNpc00025 
}

CmpQuestNumStep(25,55)
	if(yes==1){
	DualClassCheck(1,0)
	if(yes == 1){
	D("呈绰...")
	SetQuestNumStep(25,60)
	goto End_QuestNpc00025 
}
	else{
	D("瘤陛")		;Stay105
	SetQuestNumStep(25,105)
	goto End_QuestNpc00025 
}
}
 
CmpQuestNumStep(25,60)
if( yes==1 ){
	D("绢狄苞 规菩肺 磊脚狼 个阑 焊龋窍绰 内技绢焙.")
	SetQuestNumStep(25,65)
	goto End_QuestNpc00025 
}

CmpQuestNumStep(25,65)
if( yes==1 ){
	D("狼汾啊 甸绢吭绢. 啊磷捞 鞘夸秦夸.")
	SetQuestNumStep(25,70)
	goto End_QuestNpc00025 
}

CmpQuestNumStep(25,70)
if( yes==1 ){
	D("酒聪 弊繁 轿备妨富绊.")
	SetQuestNumStep(25,75)
	goto End_QuestNpc00025 
}

CmpQuestNumStep(25,75)
if( yes==1 ){
	D("促农 海绢狼 谦脚谦脚茄 啊磷捞 鞘夸秦夸.")
	SetQuestNumStep(25,80)
	goto End_QuestNpc00025 
}

CmpQuestNumStep(25,80)
if( yes==1 ){
	D("我好穷啊，能不能给我个银龙？.")
	EventMsg("需要给他1个银龙.")
	SetQuestNumStep(25,85)
	goto End_QuestNpc00025 
}

CmpQuestNumStep(25,85)
if( yes==1 ){
	CheckItemMulti(10200,1)
	if(yes == 1){
	DeleteItemMulti(10200,1)
	D("措窜窍匙夸.")
	SetQuestNumStep(25,90)
	goto End_QuestNpc00025 
}
	else{
	EventMsg("需要给他1个银龙.")		;Stay85
	SetQuestNumStep(25,85)
	goto End_QuestNpc00025 
}
}

CmpQuestNumStep(25,90)
if( yes==1 ){
	D("捞吧 啊瘤绊 刀 带傈狼 促农 郡橇甫 茫酒啊毫夸.")		;Stay250
	SetQuestNumStep(25,250)
	goto End_QuestNpc00025 
}

CmpQuestNumStep(25,105)
	if(yes==1){
	DualClassCheck(1,2)
	if(yes == 1){
	D("呈绰...")
	SetQuestNumStep(25,110)
	goto End_QuestNpc00025 
}
	else{
	D("何殴阑 甸绢临")		;Stay155
	SetQuestNumStep(25,155)
	goto End_QuestNpc00025 
}
}
 
CmpQuestNumStep(25,110)
if( yes==1 ){
	D("厚档客 拳混阑 悼矫俊 朝副 荐 乐绰 厚龙繁萍焙.")
	SetQuestNumStep(25,115)
	goto End_QuestNpc00025 
}

CmpQuestNumStep(25,115)
if( yes==1 ){
	D("狼汾啊 甸绢吭绢. 啊磷捞 鞘夸秦夸.")
	SetQuestNumStep(25,120)
	goto End_QuestNpc00025 
}

CmpQuestNumStep(25,120)
if( yes==1 ){
	D("丑淬窍瘤付. 匙 啊磷阑 措脚 傈秦临 荐档 乐栏聪鳖.")
	SetQuestNumStep(25,125)
	goto End_QuestNpc00025 
}

CmpQuestNumStep(25,125)
if( yes==1 ){
	D("荤捞努酚胶狼 啊磷捞 鞘夸秦夸.")
	SetQuestNumStep(25,130)
	goto End_QuestNpc00025 
}

CmpQuestNumStep(25,130)
if( yes==1 ){
	D("我好穷啊，能不能给我个银龙？.")
	EventMsg("需要给他1个银龙.")
	SetQuestNumStep(25,135)
	goto End_QuestNpc00025 
}

CmpQuestNumStep(25,135)
if( yes==1 ){
	CheckItemMulti(10200,1)
	if(yes == 1){
	DeleteItemMulti(10200,1)
	D("措窜窍匙夸.")
	SetQuestNumStep(25,140)
	goto End_QuestNpc00025 
}
	else{
	EventMsg("需要给他1个银龙")		;Stay135
	SetQuestNumStep(25,135)
	goto End_QuestNpc00025 
}
}

CmpQuestNumStep(25,140)
if( yes==1 ){
	D("捞吧 啊瘤绊 刀 带傈狼 促农 郡橇甫 茫酒啊毫夸.")		;Stay250
	SetQuestNumStep(25,250)
	goto End_QuestNpc00025 
}

CmpQuestNumStep(25,155)
	if(yes==1){
	DualClassCheck(1,4)
	if(yes==1){
	D("呈绰...")
	SetQuestNumStep(25,160)
	goto End_QuestNpc00025 
}
	else{
	D("钾揪亮篮 荤恩捞 鞘夸秦.")		;Stay200
	SetQuestNumStep(25,200)
	goto End_QuestNpc00025 
}
}
 
CmpQuestNumStep(25,160)
if( yes==1 ){
	D("绢狄 加俊辑 脚狼 篮醚阑 罐酒 蝴唱绰 饭厚惩飘焙.")
	SetQuestNumStep(25,165)
	goto End_QuestNpc00025 
}

CmpQuestNumStep(25,165)
if( yes==1 ){
	D("促农 海绢甫 拱府媚辑 呈狼 狼瘤甫 焊咯拎.")
	SetQuestNumStep(25,170)
	goto End_QuestNpc00025 
}

CmpQuestNumStep(25,170)
if( yes==1 ){
	D("刘芭肺 蝶舵茄 啊磷阑 啊廉客夸.")
	SetQuestNumStep(25,175)
	goto End_QuestNpc00025 
}

CmpQuestNumStep(25,175)
if( yes==1 ){
	D("我好穷啊，能不能给我个银龙？.")
	EventMsg("需要给他1个银龙.")
	SetQuestNumStep(25,180)
	goto End_QuestNpc00025 
}

CmpQuestNumStep(25,180)
if( yes==1 ){
	CheckItemMulti(10200,1)
	if(yes == 1){
	DeleteItemMulti(10200,1)
	D("措窜窍匙夸.")
	SetQuestNumStep(25,185)
	goto End_QuestNpc00025 
}
	else{
	EventMsg("需要给他1个银龙.")		;Stay180
	SetQuestNumStep(25,180)
	goto End_QuestNpc00025 
}
}

CmpQuestNumStep(25,185)
if( yes==1 ){
	D("捞吧 啊瘤绊 刀 带傈狼 促农 郡橇甫 茫酒啊毫夸.")		;Stay250
	SetQuestNumStep(25,250)
	goto End_QuestNpc00025 
}

CmpQuestNumStep(25,200)
	if(yes==1){
	DualClassCheck(1,3)
	if(yes == 1){
	D("呈绰...")
	SetQuestNumStep(25,205)
	goto End_QuestNpc00025 
}
	else{
	D("唱绰 唱焊促 距茄 荤恩苞 捞具扁窍瘤 臼酒.")		;Stay0
	SetQuestNumStep(25,0)
	goto End_QuestNpc00025 
}
}
 
CmpQuestNumStep(25,205)
if( yes==1 ){
	D("弊 绢狄 加俊辑 付唱鳖瘤 捞侩窍绰 配饭档焙.")
	SetQuestNumStep(25,210)
	goto End_QuestNpc00025 
}

CmpQuestNumStep(25,210)
if( yes==1 ){
	D("捞 顶俊辑 丑荤甫 窿摆促绰 丑何啊 乐歹焙.")
	SetQuestNumStep(25,215)
	goto End_QuestNpc00025 
}

CmpQuestNumStep(25,215)
if( yes==1 ){
	D("炼陛 愁贰难临鳖 窍绰单 构啊 亮阑鳖?")
	SetQuestNumStep(25,220)
	goto End_QuestNpc00025 
}

CmpQuestNumStep(25,220)
if( yes==1 ){
	D("弊贰. 荤捞努酚胶狼 啊磷捞 亮摆焙.")
	SetQuestNumStep(25,225)
	goto End_QuestNpc00025 
}

CmpQuestNumStep(25,225)
if( yes==1 ){
	D("我好穷啊，能不能给我个银龙？.")
	EventMsg("需要给他1个银龙.")
	SetQuestNumStep(25,230)
	goto End_QuestNpc00025 
}

CmpQuestNumStep(25,230)
if( yes==1 ){
	CheckItemMulti(10200,1)
	if(yes == 1){
	DeleteItemMulti(10200,1)
	D("措窜窍匙夸.")
	SetQuestNumStep(25,235)
	goto End_QuestNpc00025 
}
	else{
	EventMsg("需要给他1个银龙.")		;Stay230
	SetQuestNumStep(25,230)
	goto End_QuestNpc00025 
}
}

CmpQuestNumStep(25,235)
if( yes==1 ){
	D("捞吧 啊瘤绊 刀 带傈狼 促农 郡橇甫 茫酒啊毫夸.")		;Stay250
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
	EventMsg("掂倔 缴杭 酒捞袍阑 罐疽嚼聪促.")
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
	D("掂倔 努贰胶矫焙夸.")
	SetQuestNumStep(26,5)
	goto End_QuestNpc00026 
}
	else{
	D("了价钦聪促父 寸脚苞绰 包拌绝绰 捞具扁涝聪促. ")		;Stay0
	SetQuestNumStep(26,0)
	goto End_QuestNpc00026 
}
}
	else{
	D("寸脚篮 掂倔 努贰胶狼 泵荐啊 酒聪焙夸.")		;Stay0
	SetQuestNumStep(26,0)
	goto End_QuestNpc00026 
}
}

CmpQuestNumStep(26,5)
if( yes==1 ){
	DualClassCheck(2,1)
	if(yes==1){
	D("寸脚篮...")
	SetQuestNumStep(26,10)
	goto End_QuestNpc00026 
}
	else{
	D("泪矫父")		;Stay95
	SetQuestNumStep(26,95)
	goto End_QuestNpc00026 
}
}

CmpQuestNumStep(26,10)
if( yes==1 ){
	D("拳混阑 朝府哥 弊 弊覆磊 加栏肺 厚档甫 鞍捞 带瘤绰 单胶其扼档焙夸.")
	SetQuestNumStep(26,15)
	goto End_QuestNpc00026 
}

CmpQuestNumStep(26,15)
if( yes==1 ){
	D("贾流洒 富秦 瓜扁 塞甸焙夸. 寸脚阑 矫氰秦焊摆嚼聪促.")
	SetQuestNumStep(26,20)
	goto End_QuestNpc00026 
}

CmpQuestNumStep(26,20)
if( yes==1 ){
	D("我好穷啊，能不能给我个银龙？")
	EventMsg("需要给他1个银龙.")
	SetQuestNumStep(26,25)
	goto End_QuestNpc00026 
}

CmpQuestNumStep(26,25)
if( yes==1 ){
	CheckItemMulti(10200,1)
	if(yes==1){
	DeleteItemMulti(10200,1)
	D("捞力绰 寸脚阑 瓜阑 荐 乐摆嚼聪促.")
	SetQuestNumStep(26,30)
	goto End_QuestNpc00026 
}
	else{
	D("镭瘤 付矫坷. 荤捞努酚胶狼 啊磷 20俺涝聪促.")
	EventMsg("需要给他1个银龙")		;Stay25
	SetQuestNumStep(26,25)
	goto End_QuestNpc00026 
}
}

CmpQuestNumStep(26,30)
if( yes==1 ){
	D("捞巴篮 寸脚狼 惑隆涝聪促. 捞吧 啊瘤绊 海仇 带傈狼 促农 郡橇甫 茫酒啊焊矫坷.")		;Stay495
	SetQuestNumStep(26,495)
	goto End_QuestNpc00026 
}

CmpQuestNumStep(26,95)
	if(yes==1){
	DualClassCheck(2,2)
	if(yes==1){
	D("寸脚篮...")
	SetQuestNumStep(26,100)
	goto End_QuestNpc00026 
}
	else{
	D("寸脚狼")		;Stay195
	SetQuestNumStep(26,195)
	goto End_QuestNpc00026 
}
}
 
CmpQuestNumStep(26,100)
if( yes==1 ){
	D("寸脚捞 焊绊 寸脚狼 迫肺 寸扁绰 劝父阑 瓜绰 龋农酒捞焙夸.")
	SetQuestNumStep(26,105)
	goto End_QuestNpc00026 
}

CmpQuestNumStep(26,105)
if( yes==1 ){
	D("寸脚捞 柳沥栏肺 劝阑 肋 促烽促搁 腹篮 利苞档 肋 轿匡 荐 乐摆瘤夸.")
	SetQuestNumStep(26,110)
	goto End_QuestNpc00026 
}

CmpQuestNumStep(26,110)
if( yes==1 ){
	D("我好穷啊，能不能给我个银龙？.")
	EventMsg("需要给他1个银龙.")
	SetQuestNumStep(26,115)
	goto End_QuestNpc00026 
}

CmpQuestNumStep(26,115)
if( yes==1 ){
	CheckItemMulti(10200,1)
	if(yes==1){
	DeleteItemMulti(10200,1)
	D("捞力绰 寸脚阑 瓜阑 荐 乐摆嚼聪促.")
	SetQuestNumStep(26,120)
	goto End_QuestNpc00026 
}
	else{
	D("镭瘤 付矫坷. 促农 海绢狼 啊磷 20厘涝聪促.")
	EventMsg("需要给他1个银龙.")		;Stay115
	SetQuestNumStep(26,115)
	goto End_QuestNpc00026 
}
}

CmpQuestNumStep(26,120)
if( yes==1 ){
	D("捞巴篮 寸脚狼 惑隆涝聪促. 捞吧 啊瘤绊 海仇 带傈狼 促农 郡橇甫 茫酒啊焊矫坷.")		;Stay495
	SetQuestNumStep(26,495)
	goto End_QuestNpc00026 
}

CmpQuestNumStep(26,195)
	if(yes==1){
	DualClassCheck(2,0)
	if(yes==1){
	D("寸脚篮...")
	SetQuestNumStep(26,200)
	goto End_QuestNpc00026 
}
	else{
	D("捞抚阑...")		;Stay295
	SetQuestNumStep(26,295)
	goto End_QuestNpc00026 
}
}
 
CmpQuestNumStep(26,200)
if( yes==1 ){
	D("劝苞 窃膊 八阑 急琶茄 尼孽矾焙夸.")
	SetQuestNumStep(26,205)
	goto End_QuestNpc00026 
}

CmpQuestNumStep(26,205)
if( yes==1 ){
	D("绢蠢 蓖练 盒俊霸 狼汾啊 甸绢吭嚼聪促. 八苞 劝阑 肋 促风绰 荤恩捞 鞘夸窍促绰焙夸.")
	SetQuestNumStep(26,210)
	goto End_QuestNpc00026 
}

CmpQuestNumStep(26,210)
if( yes==1 ){
	D("我好穷啊，能不能给我个银龙？.")
	EventMsg("需要给他1个银龙.")
	SetQuestNumStep(26,215)
	goto End_QuestNpc00026 
}

CmpQuestNumStep(26,215)
if( yes==1 ){
	CheckItemMulti(10200,1)
	if(yes==1){
	DeleteItemMulti(10200,1)
	D("捞力绰 寸脚阑 瓜阑 荐 乐摆嚼聪促.")
	SetQuestNumStep(26,220)
	goto End_QuestNpc00026 
}
	else{
	D("镭瘤 付矫坷. 荤捞努酚胶狼 啊磷 20厘涝聪促.")
	EventMsg("需要给他1个银龙.")		;Stay215
	SetQuestNumStep(26,215)
	goto End_QuestNpc00026 
}
}

CmpQuestNumStep(26,220)
if( yes==1 ){
	D("捞巴篮 寸脚狼 惑隆涝聪促. 捞吧 啊瘤绊 海仇 带傈狼 促农 郡橇甫 茫酒啊焊矫坷.")		;Stay495
	SetQuestNumStep(26,495)
	goto End_QuestNpc00026 
}

CmpQuestNumStep(26,295)
	if(yes==1){
	DualClassCheck(2,4)
	if(yes==1){
	D("寸脚篮...")
	SetQuestNumStep(26,300)
	goto End_QuestNpc00026 
}
	else{
	D("茫酒焊档废 窍烈.")		;Stay395
	SetQuestNumStep(26,395)
	goto End_QuestNpc00026 
}
}
 
CmpQuestNumStep(26,300)
if( yes==1 ){
	D("扁档狼 塞阑 拳混俊 角绢 朝府绰 况 技牢飘焙夸.")
	SetQuestNumStep(26,305)
	goto End_QuestNpc00026 
}

CmpQuestNumStep(26,305)
if( yes==1 ){
	D("合何 格悼甸捞 家都甫 缠绊 坷促啊 阁胶磐俊霸 嚼拜寸沁翠聪促.")
	SetQuestNumStep(26,310)
	goto End_QuestNpc00026 
}

CmpQuestNumStep(26,310)
if( yes==1 ){
	D("磊操 捞贰辑绰 乞裹茄 荤恩甸俊霸鳖瘤 乔秦啊 癌聪促.")
	SetQuestNumStep(26,315)
	goto End_QuestNpc00026 
}

CmpQuestNumStep(26,315)
if( yes==1 ){
	D("我好穷啊，能不能给我个银龙？.")
	EventMsg("需要给他1个银龙.")
	SetQuestNumStep(26,320)
	goto End_QuestNpc00026 
}

CmpQuestNumStep(26,320)
if( yes==1 ){
	CheckItemMulti(10200,1)
	if(yes==1){
	DeleteItemMulti(10200,1)
	D("捞力绰 寸脚阑 瓜阑 荐 乐摆嚼聪促.")
	SetQuestNumStep(26,325)
	goto End_QuestNpc00026 
}
	else{
	D("镭瘤 付矫坷. 促农 海绢狼 啊磷 20厘涝聪促.")
	EventMsg("需要给他1个银龙.")		;Stay320
	SetQuestNumStep(26,320)
	goto End_QuestNpc00026 
}
}

CmpQuestNumStep(26,325)
if( yes==1 ){
	D("捞巴篮 寸脚狼 惑隆涝聪促. 捞吧 啊瘤绊 海仇 带傈狼 促农 郡橇甫 茫酒啊焊矫坷.")		;Stay495
	SetQuestNumStep(26,495)
	goto End_QuestNpc00026 
}

CmpQuestNumStep(26,395)
	if(yes==1){
	DualClassCheck(2,3)
	if(yes==1){
	D("寸脚篮...")
	SetQuestNumStep(26,400)
	goto End_QuestNpc00026 
}
	else{
	D("寸脚篮 郴啊 扁促府绰 荤恩捞 酒聪焙夸.")		;Stay0
	SetQuestNumStep(26,0)
	goto End_QuestNpc00026 
}
}
 
CmpQuestNumStep(26,400)
if( yes==1 ){
	D("拳混 场俊 付唱甫 抉篮 飘府芭 皋捞瘤焙夸.")
	SetQuestNumStep(26,405)
	goto End_QuestNpc00026 
}

CmpQuestNumStep(26,405)
if( yes==1 ){
	D("拳混肺 促农 海绢甫 静矾哆府绰 巴篮 沥富 绢妨款 老捞瘤.")
	SetQuestNumStep(26,410)
	goto End_QuestNpc00026 
}

CmpQuestNumStep(26,410)
if( yes==1 ){
	D("积阿秦毫. 促农 海绢绰 惑惑档 且 荐 绝阑 沥档狼 滴波款 啊磷栏肺 焊龋罐绊 乐窜 富捞具.")
	SetQuestNumStep(26,415)
	goto End_QuestNpc00026 
}

CmpQuestNumStep(26,415)
if( yes==1 ){
	D("拳混肺 弊 啊磷阑 墩阑 荐 乐促绊?")
	SetQuestNumStep(26,420)
	goto End_QuestNpc00026 
}

CmpQuestNumStep(26,420)
if( yes==1 ){
	D("我好穷啊，能不能给我个银龙？.")
	EventMsg("需要给他1个银龙.")
	SetQuestNumStep(26,425)
	goto End_QuestNpc00026 
}

CmpQuestNumStep(26,425)
if( yes==1 ){
	CheckItemMulti(10200,1)
	if(yes==1){
	DeleteItemMulti(10200,1)
	D("捞力绰 寸脚阑 瓜阑 荐 乐摆嚼聪促.")
	SetQuestNumStep(26,430)
	goto End_QuestNpc00026 
}
	else{
	D("镭瘤 付矫坷. 促农 海绢狼 啊磷 20厘涝聪促.")
	EventMsg("需要给他1个银龙.")		;Stay425
	SetQuestNumStep(26,425)
	goto End_QuestNpc00026 
}
}

CmpQuestNumStep(26,430)
if( yes==1 ){
	D("捞巴篮 寸脚狼 惑隆涝聪促. 捞吧 啊瘤绊 海仇 带傈狼 促农 郡橇甫 茫酒啊焊矫坷.")		;Stay495
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
	EventMsg("掂倔 缴杭 酒捞袍阑 罐疽嚼聪促.")
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
	D("掂倔 努贰胶牢啊?")
	SetQuestNumStep(27,5)
	goto End_QuestNpc00027 
}
	else{
	D("寸脚 沥档客绰 捞具扁窍绊 酵瘤 臼焙.")		;Stay0
	SetQuestNumStep(27,0)
	goto End_QuestNpc00027 
}
}
	else{
	D("呈绰 掂倔 努贰胶狼 付过荤啊 酒聪垒酒.")		;Stay0
	SetQuestNumStep(27,0)
	goto End_QuestNpc00027 
}
}

CmpQuestNumStep(27,5)
if( yes==1 ){
	DualClassCheck(3,0)
	if(yes==1){
	D("磊匙绰...")
	SetQuestNumStep(27,10)
	goto End_QuestNpc00027 
}
	else{
	D("泪矫父...")		;Stay95
	SetQuestNumStep(27,95)
	goto End_QuestNpc00027 
}
}

CmpQuestNumStep(27,10)
if( yes==1 ){
	D("癌渴阑 涝篮 付唱牢 况废捞焙夸.")
	SetQuestNumStep(27,15)
	goto End_QuestNpc00027 
}

CmpQuestNumStep(27,15)
if( yes==1 ){
	D("付唱客 八 笛 促 肋 促逢 临 酒唱?")
	SetQuestNumStep(27,20)
	goto End_QuestNpc00027 
}

CmpQuestNumStep(27,20)
if( yes==1 ){
	D("郴 传 菊俊辑 刘疙秦毫.")
	SetQuestNumStep(27,25)
	goto End_QuestNpc00027 
}

CmpQuestNumStep(27,25)
if( yes==1 ){
	D("我好穷啊，能不能给我个银龙？.")
	EventMsg("需要给他1个银龙.")
	SetQuestNumStep(27,30)
	goto End_QuestNpc00027 
}

CmpQuestNumStep(27,30)
if( yes==1 ){
	CheckItemMulti(10200,1)
	if(yes==1){
	DeleteItemMulti(10200,1)
	D("措窜窍焙.")
	SetQuestNumStep(27,35)
	goto End_QuestNpc00027 
}
	else{
	D("我好穷啊，能不能给我个银龙？.")
	EventMsg("需要给他1个银龙.")		;Stay30
	SetQuestNumStep(27,30)
	goto End_QuestNpc00027 
}
}

CmpQuestNumStep(27,35)
if( yes==1 ){
	D("捞巴篮 寸脚狼 瘤驱狼 惑隆涝聪促. 捞吧 啊瘤绊 海仇 带傈狼 促农 郡橇甫 茫酒啊焊矫坷.")		;Stay395
	SetQuestNumStep(27,395)
	goto End_QuestNpc00027 
}

CmpQuestNumStep(27,95)
	if(yes==1){
	DualClassCheck(3,2)
	if(yes==1){
	D("磊匙绰...")
	SetQuestNumStep(27,100)
	goto End_QuestNpc00027 
}
	else{
	D("唱狼 付唱啊...")		;Stay195
	SetQuestNumStep(27,195)
	goto End_QuestNpc00027 
}
}
 
CmpQuestNumStep(27,100)
if( yes==1 ){
	D("拳混阑 鸥绊 傈崔登绰 付唱牢 酒农 付扁焙夸.")
	SetQuestNumStep(27,105)
	goto End_QuestNpc00027 
}

CmpQuestNumStep(27,105)
if( yes==1 ){
	D("付过荤父怒 苞家厚甫 腹捞 窍绰 荤恩档 绝瘤.")
	SetQuestNumStep(27,110)
	goto End_QuestNpc00027 
}

CmpQuestNumStep(27,110)
if( yes==1 ){
	D("荤捞努酚胶狼 啊磷捞 鞘夸秦.")
	SetQuestNumStep(27,115)
	goto End_QuestNpc00027 
}

CmpQuestNumStep(27,115)
if( yes==1 ){
	D("我好穷啊，能不能给我个银龙？.")
	EventMsg("需要给他1个银龙.")
	SetQuestNumStep(27,120)
	goto End_QuestNpc00027 
}

CmpQuestNumStep(27,120)
if( yes==1 ){
	CheckItemMulti(10200,1)
	if(yes==1){
	DeleteItemMulti(10200,1)
	D("措窜窍焙.")
	SetQuestNumStep(27,125)
	goto End_QuestNpc00027 
}
	else{
	D("镭瘤 付矫坷. 荤捞努酚胶狼 啊磷 20厘涝聪促.")
	EventMsg("需要给他1个银龙.")		;Stay120
	SetQuestNumStep(27,120)
	goto End_QuestNpc00027 
}
}

CmpQuestNumStep(27,125)
if( yes==1 ){
	D("捞巴篮 寸脚狼 瘤驱狼 惑隆涝聪促. 捞吧 啊瘤绊 海仇 带傈狼 促农 郡橇甫 茫酒啊焊矫坷.")		;Stay395
	SetQuestNumStep(27,395)
	goto End_QuestNpc00027 
}

CmpQuestNumStep(27,195)
	if(yes==1){
	DualClassCheck(3,1)
	if(yes==1){
	D("磊匙绰...")
	SetQuestNumStep(27,200)
	goto End_QuestNpc00027 
}
	else{
	D("瘤陛...")		;Stay295
	SetQuestNumStep(27,295)
	goto End_QuestNpc00027 
}
}
 
CmpQuestNumStep(27,200)
if( yes==1 ){
	D("绢狄 加阑 崔府绰 付唱牢 摹啊匙焙夸.")
	SetQuestNumStep(27,205)
	goto End_QuestNpc00027 
}

CmpQuestNumStep(27,205)
if( yes==1 ){
	D("弊繁单 汗厘捞 弊霸 购啊.")
	SetQuestNumStep(27,210)
	goto End_QuestNpc00027 
}

CmpQuestNumStep(27,210)
if( yes==1 ){
	D("寸脚 鞍篮 付过荤俊罢 促农 海绢狼 啊磷栏肺 等 噶配啊 绢匡妨.")
	SetQuestNumStep(27,215)
	goto End_QuestNpc00027 
}

CmpQuestNumStep(27,215)
if( yes==1 ){
	D("啊磷阑 粱 备秦客毫.")
	EventMsg("需要给他1个银龙.")
	SetQuestNumStep(27,220)
	goto End_QuestNpc00027 
}

CmpQuestNumStep(27,220)
if( yes==1 ){
	CheckItemMulti(10200,1)
	if(yes==1){
	DeleteItemMulti(10200,1)
	D("措窜窍焙.")
	SetQuestNumStep(27,225)
	goto End_QuestNpc00027 
}
	else{
	D("我好穷啊，你能给我一个银龙啊？.")
	EventMsg("需要给他1个银龙.")		;Stay220
	SetQuestNumStep(27,220)
	goto End_QuestNpc00027 
}
}

CmpQuestNumStep(27,225)
if( yes==1 ){
	D("捞巴篮 寸脚狼 瘤驱狼 惑隆涝聪促. 捞吧 啊瘤绊 海仇 带傈狼 促农 郡橇甫 茫酒啊焊矫坷.")		;Stay395
	SetQuestNumStep(27,395)
	goto End_QuestNpc00027 
}

CmpQuestNumStep(27,295)
	if(yes==1){
	DualClassCheck(3,3)
	if(yes==1){
	D("磊匙绰...")
	SetQuestNumStep(27,300)
	goto End_QuestNpc00027 
}
	else{
	D("傈囚 馆览窍瘤 臼绰焙.")		;Stay0
	SetQuestNumStep(27,0)
	goto End_QuestNpc00027 
}
}
 
CmpQuestNumStep(27,300)
if( yes==1 ){
	D("付唱俊 谦 狐廉滚赴 弊罚靛 困历靛焙夸.")
	SetQuestNumStep(27,305)
	goto End_QuestNpc00027 
}

CmpQuestNumStep(27,305)
if( yes==1 ){
	D("货肺款 付过阑 父靛绰 老俊 悼曼窍绊 酵瘤 臼嚼聪鳖?")
	SetQuestNumStep(27,310)
	goto End_QuestNpc00027 
}

CmpQuestNumStep(27,310)
if( yes==1 ){
	D("力 楷备甫 档客林绞矫坷.")
	SetQuestNumStep(27,315)
	goto End_QuestNpc00027 
}

CmpQuestNumStep(27,315)
if( yes==1 ){
	D("我好穷啊，能不能给我个银龙？.")
	EventMsg("需要给他1个银龙.")
	SetQuestNumStep(27,320)
	goto End_QuestNpc00027 
}

CmpQuestNumStep(27,320)
if( yes==1 ){
	CheckItemMulti(10200,1)
	if(yes==1){
	DeleteItemMulti(10200,1)
	D("措窜窍焙.")
	SetQuestNumStep(27,325)
	goto End_QuestNpc00027 
}
	else{
	D("我好穷啊，能不能给我个银龙？.")
	EventMsg("需要给他1个银龙.")		;Stay320
	SetQuestNumStep(27,320)
	goto End_QuestNpc00027 
}
}

CmpQuestNumStep(27,325)
if( yes==1 ){
	D("捞巴篮 寸脚狼 瘤驱狼 惑隆涝聪促. 捞吧 啊瘤绊 海仇 带傈狼 促农 郡橇甫 茫酒啊焊矫坷.")		;Stay395
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
	EventMsg("掂倔 缴杭 酒捞袍阑 罐疽嚼聪促.")
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
	D("寸脚篮 掂倔 努贰胶矫焙夸.")
	SetQuestNumStep(28,5)
	goto End_QuestNpc00028 
}
	else{
	D("了价窍瘤父 蝶肺 扁促府绰 荤恩捞 乐嚼聪促.")		;Stay0
	SetQuestNumStep(28,0)
	goto End_QuestNpc00028 
}
}
	else{
	D("寸脚篮 酒流 掂倔 努贰胶鳖瘤 荐访窍瘤 给窍继焙夸.")		;Stay0
	SetQuestNumStep(28,0)
	goto End_QuestNpc00028 
}
}

CmpQuestNumStep(28,5)
if( yes==1 ){
	DualClassCheck(4,0)
	if(yes==1){
	D("屈力绰...")
	SetQuestNumStep(28,10)
	goto End_QuestNpc00028 
}
	else{
	D("寸脚篮")		;Stay95
	SetQuestNumStep(28,95)
	goto End_QuestNpc00028 
}
}

CmpQuestNumStep(28,10)
if( yes==1 ){
	D("脚狼 篮醚捞扼绰 捞抚狼 癌渴阑 涝篮 袍敲矾焙夸.")
	SetQuestNumStep(28,15)
	goto End_QuestNpc00028 
}

CmpQuestNumStep(28,15)
if( yes==1 ){
	D("鳃傅 器记捞扼绰 拱扒篮 曼 脚扁窍瘤 臼嚼聪鳖?")
	SetQuestNumStep(28,20)
	goto End_QuestNpc00028 
}

CmpQuestNumStep(28,20)
if( yes==1 ){
	D("拱沸 弊 犁丰啊 飘费捞扼绰 巴阑 积阿秦焊搁 弊 愁扼款 瓤苞档 捞秦啊 啊瘤夸.")
	SetQuestNumStep(28,25)
	goto End_QuestNpc00028 
}

CmpQuestNumStep(28,25)
if( yes==1 ){
	D("弊繁单 葛氰磊 1疙捞 静绰 鳃傅 器记阑 父甸妨搁 飘费捞 倔付唱 鞘夸且鳖夸? 拌魂捞 肋 救 登绰 钎沥捞焙夸.")
	SetQuestNumStep(28,30)
	goto End_QuestNpc00028 
}

CmpQuestNumStep(28,30)
if( yes==1 ){
	D("弊犯嚼聪促. 荤恩甸俊霸 舅妨柳 巴苞 崔府 捞矾茄 器记狼 犁丰肺 飘费阑 静瘤 臼嚼聪促.")
	SetQuestNumStep(28,35)
	goto End_QuestNpc00028 
}

CmpQuestNumStep(28,35)
if( yes==1 ){
	D("我好穷啊，能不能给我个银龙？")
	EventMsg("需要给他1个银龙.")
	SetQuestNumStep(28,40)
	goto End_QuestNpc00028 
}

CmpQuestNumStep(28,40)
if( yes==1 ){
	CheckItemMulti(10200,1)
	if(yes==1){
	DeleteItemMulti(10200,1)
	D("措窜窍焙.")
	SetQuestNumStep(28,45)
	goto End_QuestNpc00028 
}
	else{
	D("我好穷啊，能不能给我个银龙？")
	EventMsg("需要给他1个银龙.")		;Stay40
	SetQuestNumStep(28,40)
	goto End_QuestNpc00028 
}
}

CmpQuestNumStep(28,45)
if( yes==1 ){
	D("绊鞭 鳃傅 器记狼 柳楼 犁丰绰 荤捞努酚胶涝聪促.")
	SetQuestNumStep(28,50)
	goto End_QuestNpc00028 
}

CmpQuestNumStep(28,50)
if( yes==1 ){
	D("弊贰辑 槛访等 葛氰磊甸捞 飘费措脚 磷绢扼 荤捞努酚胶父阑 荤成窍绰 捞蜡涝聪促.")
	SetQuestNumStep(28,55)
	goto End_QuestNpc00028 
}

CmpQuestNumStep(28,55)
if( yes==1 ){
	D("捞巴篮 寸脚狼 脚居狼 惑隆涝聪促. 捞吧 啊瘤绊 海仇 带傈狼 促农 郡橇甫 茫酒啊焊矫坷.")		;Stay395
	SetQuestNumStep(28,395)
	goto End_QuestNpc00028 
}

CmpQuestNumStep(28,95)
	if(yes==1){
	DualClassCheck(4,2)
	if(yes==1){
	D("屈力绰...")
	SetQuestNumStep(28,100)
	goto End_QuestNpc00028 
}
	else{
	D("脚阑 瓜瘤 臼绰焙夸.")		;Stay195
	SetQuestNumStep(28,195)
	goto End_QuestNpc00028 
}
}
 
CmpQuestNumStep(28,100)
if( yes==1 ){
	D("扁档甫 拳混俊 角绢 朝府绰 绢亥历焙夸.")
	SetQuestNumStep(28,105)
	goto End_QuestNpc00028 
}

CmpQuestNumStep(28,105)
if( yes==1 ){
	D("历绰 阁胶磐甫 力拘窍绰 规过阑 楷备窍绊 乐嚼聪促.")
	SetQuestNumStep(28,110)
	goto End_QuestNpc00028 
}

CmpQuestNumStep(28,110)
if( yes==1 ){
	D("我好穷啊，能不能给我个银龙？.")
	EventMsg("需要给他1个银龙.")
	SetQuestNumStep(28,115)
	goto End_QuestNpc00028 
}

CmpQuestNumStep(28,115)
if( yes==1 ){
	CheckItemMulti(10200,1)
	if(yes==1){
	DeleteItemMulti(10200,1)
	D("皑荤钦聪促.")
	SetQuestNumStep(28,120)
	goto End_QuestNpc00028 
}
	else{
	D("我好穷啊，能不能给我个银龙？.")
	EventMsg("需要给他1个银龙.")		;Stay115
	SetQuestNumStep(28,115)
	goto End_QuestNpc00028 
}
}

CmpQuestNumStep(28,120)
if( yes==1 ){
	D("捞巴篮 寸脚狼 脚居狼 惑隆涝聪促. 捞吧 啊瘤绊 海仇 带傈狼 促农 郡橇甫 茫酒啊焊矫坷.")		;Stay395
	SetQuestNumStep(28,395)
	goto End_QuestNpc00028 
}

CmpQuestNumStep(28,195)
	if(yes==1){
	DualClassCheck(4,1)
	if(yes==1){
	D("屈力绰...")
	SetQuestNumStep(28,200)
	goto End_QuestNpc00028 
}
	else{
	D("泪矫父...")		;Stay295
	SetQuestNumStep(28,295)
	goto End_QuestNpc00028 
}
}
 
CmpQuestNumStep(28,200)
if( yes==1 ){
	D("技惑阑 灌洒扁 困秦 绢狄 加栏肺 顿绢电 弃弗捞焙夸.")
	SetQuestNumStep(28,205)
	goto End_QuestNpc00028 
}

CmpQuestNumStep(28,205)
if( yes==1 ){
	D("塞电 急琶阑 窍继焙夸.")
	SetQuestNumStep(28,210)
	goto End_QuestNpc00028 
}

CmpQuestNumStep(28,210)
if( yes==1 ){
	D("我好穷啊，能不能给我个银龙？.")
	EventMsg("需要给他1个银龙.")
	SetQuestNumStep(28,215)
	goto End_QuestNpc00028 
}

CmpQuestNumStep(28,215)
if( yes==1 ){
	CheckItemMulti(10200,1)
	if(yes==1){
	DeleteItemMulti(10200,1)
	D("皑荤钦聪促.")
	SetQuestNumStep(28,220)
	goto End_QuestNpc00028 
}
	else{
	D("我好穷啊，能不能给我个银龙？.")
	EventMsg("需要给他1个银龙.")		;Stay215
	SetQuestNumStep(28,215)
	goto End_QuestNpc00028 
}
}

CmpQuestNumStep(28,220)
if( yes==1 ){
	D("捞巴篮 寸脚狼 脚居狼 惑隆涝聪促. 捞吧 啊瘤绊 海仇 带傈狼 促农 郡橇甫 茫酒啊焊矫坷.")		;Stay395
	SetQuestNumStep(28,395)
	goto End_QuestNpc00028 
}

CmpQuestNumStep(28,295)
	if(yes==1){
	DualClassCheck(4,4)
	if(yes==1){
	D("屈力绰...")
	SetQuestNumStep(28,300)
	goto End_QuestNpc00028 
}
	else{
	D("力啊 肋给 夯 巴鞍焙夸.")		;Stay0
	SetQuestNumStep(28,0)
	goto End_QuestNpc00028 
}
}
 
CmpQuestNumStep(28,300)
if( yes==1 ){
	D("个苞 付澜 葛滴甫 脚俊霸 官模 技牢飘焙夸.")
	SetQuestNumStep(28,305)
	goto End_QuestNpc00028 
}

CmpQuestNumStep(28,305)
if( yes==1 ){
	D("脚 酒贰狼 葛电 屈力 磊概丛甸俊霸 何殴且 巴捞 乐嚼聪促.")
	SetQuestNumStep(28,310)
	goto End_QuestNpc00028 
}

CmpQuestNumStep(28,310)
if( yes==1 ){
	D("我好穷啊，能不能给我个银龙？")
	EventMsg("需要给他1个银龙.")
	SetQuestNumStep(28,315)
	goto End_QuestNpc00028 
}

CmpQuestNumStep(28,315)
if( yes==1 ){
	CheckItemMulti(10200,1)
	if(yes==1){
	DeleteItemMulti(10200,1)
	D("皑荤钦聪促.")
	SetQuestNumStep(28,320)
	goto End_QuestNpc00028 
}
	else{
	D("我好穷啊，能不能给我个银龙？")
	EventMsg("需要给他1个银龙.")		;Stay315
	SetQuestNumStep(28,315)
	goto End_QuestNpc00028 
}
}

CmpQuestNumStep(28,320)
if( yes==1 ){
	D("捞巴篮 寸脚狼 脚居狼 惑隆涝聪促. 捞吧 啊瘤绊 海仇 带傈狼 促农 郡橇甫 茫酒啊焊矫坷.")		;Stay395
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
	EventMsg("掂倔 缴杭 酒捞袍阑 罐疽嚼聪促.")
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
	EventMsg("移动到 <  瓦南平原北部 >.")
}
	else {
	EventMsg("无法移动到其他地图.")
}
		
end
@Event00002	
 
 	SpellMapMove("扁撅阑 刘疙窍绰 粮犁","sermenys_d1", 9, 9)
	if( yes == 1 ){
	EventMsg("<技福皋聪胶 带傈>栏肺 捞悼钦聪促.")
}
	else{
	EventMsg("林巩阑 寇快寂具 捞悼且 荐 乐嚼聪促.")
}
 
end
@Event00003		
	MapMove("venom1",73,27)
	if( yes == 1 )  {
	EventMsg(" 移动到 < 毒洞窟一层 >. ")
}
	else  {
	EventMsg("无法移动到其他地图")
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








