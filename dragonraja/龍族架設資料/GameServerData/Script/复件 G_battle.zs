
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
	D("了价钦聪促. 泅犁 妮肺辑胶 甘阑 急琶且 荐 乐绰 镑阑 霖厚吝涝聪促..")
	QuestTeleport(1,87,14)
end
@Npc00003	; view ladder point
;SQuest30_Npc00003
CmpQuestNumStep(30,0)
if( yes==1 ){
	UpDualClassItem(0)
	if(yes==0){
	D("我可以为您升级纹章，但您没有纹章可以升级.")
	EventMsg("您并没有获得一转纹章，请去瓦南平原获得一转纹章.")		;Stay0
	SetQuestNumStep(30,0)
	goto End_QuestNpc00003 
}
	if(yes==1){
	D("我可以为您升级，您有一个一转纹章需要升级.")
	EventMsg("需要20个魔力金属.")
	D("但是我需要20个魔力金属才能给您的纹章升级，您带了没有？")		;Stay95
	SetQuestNumStep(30,95)
	goto End_QuestNpc00003 
}
	else{
	D("您的纹章已经是二转纹章了，应该升级三转纹章")		;Stay1005
	SetQuestNumStep(30,1005)
	goto End_QuestNpc00003 
}
}
CmpQuestNumStep(30,95)
	if(yes==1){
	D("我需要的20个魔力金属您带来了没有？.")		;Stay195
	SetQuestNumStep(30,195)
	goto End_QuestNpc00003 
}
 
CmpQuestNumStep(30,195)
	if(yes==1){
	CheckItemMulti(10239,20)
	if(yes==1){
	DeleteItemMulti(10239,20)
	if(yes==1){
	SendSound(0,1310)		;Stay295
	SetQuestNumStep(30,295)
	goto End_QuestNpc00003 
}
}
	else{
	D("没有20个魔力金属，我无法为您的纹章升级.")		;Stay195
	SetQuestNumStep(30,195)
	goto End_QuestNpc00003 
}
}
 
CmpQuestNumStep(30,295)
	if(yes==1){
	IsClassPC(0)
	if(yes==1){
	UpDualClassItem(1)
	D("好的，您的20个魔力金属我收下了，现在就为您升级.")		;Stay1005
	SetQuestNumStep(30,1005)
	goto End_QuestNpc00003 
}
	else{
	D("请等下.")		;Stay395
	SetQuestNumStep(30,395)
	goto End_QuestNpc00003 
}
}
 
CmpQuestNumStep(30,395)
	if(yes==1){
	IsClassPC(1)
	if(yes==1){
	UpDualClassItem(1)
	D("好的，您的20个魔力金属我收下了，现在就为您升级.")		;Stay1005
	SetQuestNumStep(30,1005)
	goto End_QuestNpc00003 
}
	else{
	D("请等下.")		;Stay495
	SetQuestNumStep(30,495)
	goto End_QuestNpc00003 
}
}
 
CmpQuestNumStep(30,495)
	if(yes==1){
	IsClassPC(2)
	if(yes==1){
	UpDualClassItem(1)
	D("好的，您的20个魔力金属我收下了，现在就为您升级.")		;Stay1005
	SetQuestNumStep(30,1005)
	goto End_QuestNpc00003 
}
	else{
	D("请等下.")		;Stay595
	SetQuestNumStep(30,595)
	goto End_QuestNpc00003 
}
}
 
CmpQuestNumStep(30,595)
	if(yes==1){
	IsClassPC(3)
	if(yes==1){
	UpDualClassItem(1)
	ShowLearnDualMagic()
	D("好的，您的20个魔力金属我收下了，现在就为您升级.")		;Stay1005
	SetQuestNumStep(30,1005)
	goto End_QuestNpc00003 
}
	else{
	D("请等下.")		;Stay695
	SetQuestNumStep(30,695)
	goto End_QuestNpc00003 
}
}
 
CmpQuestNumStep(30,695)
	if(yes==1){
	IsClassPC(4)
	if(yes==1){
	UpDualClassItem(1)
	ShowLearnDualMagic()
	D("好的，您的20个魔力金属我收下了，现在就为您升级.")		;Stay1005
	SetQuestNumStep(30,1005)
	goto End_QuestNpc00003 
}
	else{
	D("请等下.")		;Stay0
	SetQuestNumStep(30,0)
	goto End_QuestNpc00003 
}
}
CmpQuestNumStep(30,1005)
	if(yes==1){
	UpDualClassItem(0)
	if(yes==2){
	D("您的二转纹章还可以继续升级，但是我需要20个树妖的枝桠.")		;Stay1095
	SetQuestNumStep(30,1095)
	goto End_QuestNpc00003 
}
	else{
	D("您已经是三转纹章了，应该升级四转纹章")		;Stay1695
	SetQuestNumStep(30,1695)
	goto End_QuestNpc00003 
}
}
 
CmpQuestNumStep(30,1095)
	if(yes==1){
	CheckItemMulti(10240,20)
	if(yes==1){
	DeleteItemMulti(10240,20)
	if(yes==1){
	SendSound(0,1310)		;Stay1195
	SetQuestNumStep(30,1195)
	goto End_QuestNpc00003 
}
}
	else{
	D("我可以为您升级，但是您要提供给我20个树妖的枝桠.")		;Stay1095
	SetQuestNumStep(30,1095)
	goto End_QuestNpc00003 
}
}
 
CmpQuestNumStep(30,1195)
	if(yes==1){
	IsClassPC(0)
	if(yes==1){
	UpDualClassItem(1)
	D("您真是个好人，20个树妖的枝桠我收下了.")		;Stay1695
	SetQuestNumStep(30,1695)
	goto End_QuestNpc00003 
}
	else{
	D("请等下.")		;Stay1295
	SetQuestNumStep(30,1295)
	goto End_QuestNpc00003 
}
}
 
CmpQuestNumStep(30,1295)
	if(yes==1){
	IsClassPC(1)
	if(yes==1){
	UpDualClassItem(1)
	D("您真是个好人，20个树妖的枝桠我收下了.")		;Stay1695
	SetQuestNumStep(30,1695)
	goto End_QuestNpc00003 
}
	else{
	D("请等下.")		;Stay1395
	SetQuestNumStep(30,1395)
	goto End_QuestNpc00003 
}
}
 
CmpQuestNumStep(30,1395)
	if(yes==1){
	IsClassPC(2)
	if(yes==1){
	UpDualClassItem(1)
	D("您真是个好人，20个树妖的枝桠我收下了.")		;Stay1695
	SetQuestNumStep(30,1695)
	goto End_QuestNpc00003 
}
	else{
	D("请等下.")		;Stay1495
	SetQuestNumStep(30,1495)
	goto End_QuestNpc00003 
}
}
 
CmpQuestNumStep(30,1495)
	if(yes==1){
	IsClassPC(3)
	if(yes==1){
	UpDualClassItem(1)
	ShowLearnDualMagic()
	D("您真是个好人，20个树妖的枝桠我收下了.")		;Stay1695
	SetQuestNumStep(30,1695)
	goto End_QuestNpc00003 
}
	else{
	D("请等下.")		;Stay1595
	SetQuestNumStep(30,1595)
	goto End_QuestNpc00003 
}
}
 
CmpQuestNumStep(30,1595)
	if(yes==1){
	IsClassPC(4)
	if(yes==1){
	UpDualClassItem(1)
	ShowLearnDualMagic()
	D("您真是个好人，20个树妖的枝桠我收下了.")		;Stay1695
	SetQuestNumStep(30,1695)
	goto End_QuestNpc00003 
}
	else{
	D("请等下.")		;Stay0
	SetQuestNumStep(30,0)
	goto End_QuestNpc00003 
}
}
CmpQuestNumStep(30,1695)
	if(yes==1){
	UpDualClassItem(0)
	if(yes==3){
	D("好了，我还可以为您的纹章升级一次，但是我差20个眼魔的触须.")		;Stay1705
	SetQuestNumStep(30,1705)
	goto End_QuestNpc00003 
}
	else{
	D("我的能力无法为您的纹章升级了.....")
	SetQuestNumStep(30,1700)
	goto End_QuestNpc00003 
}
}
 
CmpQuestNumStep(30,1705)
	if(yes==1){
	CheckItemMulti(10241,20)
	if(yes==1){
	DeleteItemMulti(10241,20)
	if(yes==1){
	SendSound(0,1310)		;Stay1795
	SetQuestNumStep(30,1795)
	goto End_QuestNpc00003 
}
}
	else{
	D("请您带上20个眼魔的触须再来找我.")		;Stay1705
	SetQuestNumStep(30,1705)
	goto End_QuestNpc00003 
}
}
 
CmpQuestNumStep(30,1795)
	if(yes==1){
	IsClassPC(0)
	if(yes==1){
	UpDualClassItem(1)
        D("就差这20个眼魔的触须了，现在齐全了.")	;Stay2995
	SetQuestNumStep(30,2995)
	goto End_QuestNpc00003 
}
	else{
	D("请等下.")		;Stay1895
	SetQuestNumStep(30,1895)
	goto End_QuestNpc00003 
}
}
 
CmpQuestNumStep(30,1895)
	if(yes==1){
	IsClassPC(1)
	if(yes==1){
	UpDualClassItem(1)
	D("就差这20个眼魔的触须了，现在齐全了.")		;Stay2995
	SetQuestNumStep(30,2995)
	goto End_QuestNpc00003 
}
	else{
	D("请等下.")		;Stay1995
	SetQuestNumStep(30,1995)
	goto End_QuestNpc00003 
}
}
 
CmpQuestNumStep(30,1995)
	if(yes==1){
	IsClassPC(2)
	if(yes==1){
	UpDualClassItem(1)
	D("就差这20个眼魔的触须了，现在齐全了.")		;Stay2995
	SetQuestNumStep(30,2995)
	goto End_QuestNpc00003 
}
	else{
	D("请等下.")		;Stay2095
	SetQuestNumStep(30,2095)
	goto End_QuestNpc00003 
}
}
 
CmpQuestNumStep(30,2095)
	if(yes==1){
	IsClassPC(3)
	if(yes==1){
	UpDualClassItem(1)
	D("就差这20个眼魔的触须了，现在齐全了.")		;Stay2995
	SetQuestNumStep(30,2995)
	goto End_QuestNpc00003 
}
	else{
	D("请等下.")		;Stay2195
	SetQuestNumStep(30,2195)
	goto End_QuestNpc00003 
}
}
 
CmpQuestNumStep(30,2195)
	if(yes==1){
	IsClassPC(4)
	if(yes==1){
	UpDualClassItem(1)
	D("就差这20个眼魔的触须了，现在齐全了.")		;Stay2995
	SetQuestNumStep(30,2995)
	goto End_QuestNpc00003 
}
	else{
	D("请等下.")		;Stay0
	SetQuestNumStep(30,0)
	goto End_QuestNpc00003 
}
}
CmpQuestNumStep(30,2995)
	if(yes==1){
	D("好了，您的纹章已经全部升级完毕，我所需要的东西也都齐全了，再见.")		;End
	SetQuestNumStep(30,9999)
	goto End_QuestNpc00003 
}
 
;EQuest30_Npc00003
:End_QuestNpc00003        
end
@Npc00004
end
@Npc00005	; bank
        random( 0, 3 ) 
        if( ran == 0 ) 
        {
	        D( "捣篮 腹篮啊?" )
        }       
        if( ran == 1)
        {
	        D( "捞 镑篮 妮肺辑胶 篮青涝聪促.." ) 
        }       
        if( ran == 2 ) 
        {
	        D( "捞镑篮 抗陛, 焊包 诀公甫 窍绊 乐嚼聪促." ) 
        }
        CallSmallMenu( 0, 13 )

end
@Npc00006
	CmpQuestNumStep(49,1)
	if( yes == 0) ; 累促
	{
		D("白喉阑 窍妨绊 吭焙.. 快急 白喉阑 窍扁 困秦辑绰 '白喉 胶沛'阑 啊瘤绊 乐绢具 窍瘤.. 白喉 胶沛篮 辨靛傈阑 烹秦 备且 荐啊 乐阑 吧技..")
		SetQuestNumStep(49,1)
		goto END3_
	}
	if( yes == 1) ; 鞍促
	{
		D("白喉篮 白喉芒 救俊 '白喉 胶沛'阑 棵妨 初绊 Gamble 滚瓢阑 穿福搁 登匙.. 酒林 浆匡 芭具.. 窍瘤父 赣府甫 结具 亮篮 酒捞袍阑 备且 荐 乐阑芭具...")
		SetQuestNumStep(49,2)
		goto END3_
	}
	if( yes == 2) ; 农促
	{
		D("坷疵狼 酒捞袍篮 绊鞭 白喉 胶沛 5俺啊 鞘夸窍匙.. 白喉捞鄂 100% 己傍且 荐啊 绝促绰 巴阑 舅酒滴霸..")
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
	        D( "捞 器记 茄锅 冈绢毫.. 柯个浚 塞捞 阂馋阂馋, 滴 传浚 蝴捞 檬氛檬氛.." )
        }       
        if( ran == 1)
        {
	        D( "货 器记篮 货 捍俊 淬绊, 货 澜侥篮 格备港栏肺 逞败具 力咐捞瘤." ) 
        }       
        if( ran == 2 ) 
        {
	        D( "咯扁辑 颇绰 弧埃 器记阑 冈栏搁 惑贸啊 富阐洒 荤扼柳促匙.. " ) 
        }
        CallSmallMenu( 0, 25 )
end
@Npc00011
end
@Npc00012	; bakery
        random( 0, 3 ) 
        if( ran == 0 ) 
        {
	        D( "版扁俊 曼啊秦辑绰 亲惑 炼缴秦具 登匙.. 绢叼辑 阂货啊 朝酒棵瘤 葛福芭电..." ) 
        }       
        if( ran == 1) 
        {
	        D( "磊匙档 酒饭唱俊 曼啊窍妨绊? 捞凡 锭老荐废 诡加捞 电电秦具瘤..." )
        }       
        if( ran == 2 ) 
        {
	        D( "郴啊 啊福模 力磊啊 老胶 夸府措雀俊辑 1殿阑 沁促匙. 框窍窍~ " )
        }
        CallSmallMenu( 0, 20 )
end
@Npc00013	
end
@Npc00014	; weapon shop
        random( 0, 3 ) 
        if( ran == 0 ) 
        {
	        D( "公扁甫 父靛绰 巴篮 曼栏肺 困氰茄 老捞具..." ) 
        }       
        if( ran == 1) 
        {
	        D( "顿绢抄 措厘厘捞绰 楷厘 趴阑 救窍瘤. 傈荤档 付蛮啊瘤扼匙.." ) 
        }       
        if( ran == 2 ) 
        {
	        D( "措厘厘捞狼 磷澜栏肺 父甸绢柳 公扁俊绰 弊 去捞 辑妨乐烈... " ) 
        }
        CallSmallMenu( 0, 18 )
end
@Npc00015	; carpenter's shop
        random( 0, 3 ) 
        if( ran == 0 ) 
        {
	        D( "唱公绰 曼栏肺 蜡侩茄 犁丰具.. 剑篮 玫楷犁丰狼 焊绊扼绊 且 荐 乐瘤." ) 
        }       
        if( ran == 1) 
        {
	        D( "咯扁辑 父电 拱扒甸篮 葛滴 流立 颊栏肺 父电 巴甸捞瘤.." ) 
        }       
        if( ran == 2 ) 
        {
	        D( "瘤莆捞俊档 付过八贸烦 付过阑 阂绢持阑 荐 乐瘤.." ) 
        }
        CallSmallMenu( 0, 26 )
end
@Npc00016	; bow shop
        random( 0, 3 ) 
        if( ran == 0 ) 
        {
	        D( "劝篮 犁丰俊 蝶扼 咯矾辆幅啊 乐促匙..." ) 
        }       
        if( ran == 1) 
        {
	        D( "拳混篮 拳混盟苞 标判捞 概快 吝夸茄 犁丰啊 登瘤..." ) 
        }       
        if( ran == 2 ) 
        {
	        D( "穿焙啊 磊匙狼 缴厘阑 败穿绢 金促绊 积阿秦焊霸.. 阐嘛窍焙.. " ) 
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
	        D( "弥辟狼 喊甸狼 框流烙阑 混旗 焊聪, 货肺款 康旷捞 捞率栏肺 坷绊 乐绰 芭 鞍歹焙.." ) 
        }       
        if( ran == 1) 
        {
	        D( "磊匙档 康旷捞 登绊 酵绢 茫酒柯 扒啊? 儒儒.. " ) 
        }       
        if( ran == 2 ) 
        {
	        D( "康旷篮 鸥绊唱绰 巴捞 酒聪扼, 矫措啊 康旷阑 父甸绢郴绰 巴捞瘤.. " ) 
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
	        D( "历 率俊辑绰 郴 屈力啊 劝阑 迫绊 乐栏聪, 弊率档 腹捞 捞侩秦林霸..." ) 
        }       
        if( ran == 1) 
        {
	        D( "郡橇狼 赣府墨遏篮 劝临阑 父甸扁俊 力拜捞瘤... " ) 
        }       
        if( ran == 2 ) 
        {
	        D( "寸脚档 酒饭唱俊 曼啊窍绊 酵篮啊夸? 寸脚狼 扒捧甫 瑚聪促.." ) 
        }
        CallSmallMenu( 0, 27 )
end
@Npc00025	; Edelbroy's
        random( 0, 3 ) 
        if( ran == 0 ) 
        {
	        D( "官恩加俊 瑞朝府绰 内胶葛胶甫.." ) 
        }       
        if( ran == 1) 
        {
	        D( "俊胆宏肺捞绰 秋墨匙胶甫 蝶福绰 脚捞烈.." ) 
        }       
        if( ran == 2 ) 
        {
	        D( "寸脚俊霸 俊胆宏肺捞狼 篮醚捞 窃膊窍扁甫 官而聪促.." ) 
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
	        D( "酒饭唱俊 曼啊窍妨聪 蕊盒登唱夸? 捞凡锭老荐废 电电秦具烈..." ) 
        }       
        if( ran == 1) 
        {
	        D( "力啊 老胶 夸府措雀俊辑 2困甫 沁翠聪促. 促澜浚 怖 1困甫 秦具窍绰单..." ) 
        }       
        if( ran == 2 ) 
        {
	        D( "寸脚篮 <篮芭茄 康旷狼 捞具扁>鄂 畴贰甫 甸绢焊继唱夸? " ) 
        }
        CallSmallMenu( 0, 20 )
end
@Npc00029	; carpenter's shop
        random( 0, 3 ) 
        if( ran == 0 ) 
        {
	        D( "抄 寸脚捞 酒饭唱俊辑 混酒乐绰 傈汲捞 登菌栏搁 钦聪促..." ) 
        }       
        if( ran == 1) 
        {
	        D( "蜡乔弛苞 秋墨匙胶绰 矫埃阑 父甸绢郴绊, 矫埃篮 唱狼 林抚混阑 父甸菌瘤.." ) 
        }       
        if( ran == 2 ) 
        {
	        D( "寸脚档 酒饭唱俊辑 傈汲捞 瞪 荐 乐嚼聪促.." ) 
        }
        CallSmallMenu( 0, 26 )
end

@Npc00030	; weapon shop 2
        random( 0, 3 ) 
        if( ran == 0 ) 
        {
	        D( "八捞鄂 公矫公矫茄 抗府窃栏肺 乔甫 何福绰 拱扒捞扼匙.." ) 
        }       
        if( ran == 1) 
        {
	        D( "漠捞鄂 谗烙绝捞 哎绊 篡酒具 踌浇瘤 臼绰 过捞烈..." ) 
        }       
        if( ran == 2 ) 
        {
	        D( "惑措规狼 沥脚鳖瘤档 海绰 巴捞 柳沥茄 绊荐狼 角仿捞烈.." ) 
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
;SQuest74_npc00032
CmpQuestNumStep(74,0)
if( yes==1 ){
        DualCheck(1)
        if(yes == 1){
        D("马上进行二转,请等待…")
        SetQuestNumStep(74,5)
        goto End_Questnpc00032 
}
        else
        {
        D("想转职???等级不够,再去练练吧")
        SetQuestNumStep(74,15)
        goto End_Questnpc00032 
}
}
CmpQuestNumStep( 74, 5 )
if( yes==1 ){
        CallSmallMenu(200,  1190)
        SetQuestNumStep( 74, 10 )
        goto End_Questnpc00032 
}

CmpQuestNumStep(74,10)
if( yes==1 ){
        SendSound(0, 1311)
        Qcount = 0
        GhostLv = GhostLv + 1
        D("好了,您已经二转了！")                ;Stay220
        SetQuestNumStep(74,15)
        goto End_Questnpc00032 
}

CmpQuestNumStep(74,15)
if( yes==1 ){
        DualCheck(2)
        if(yes == 1){
        D("这么快就够三转了?不要使用非法程序哦!…")
        SetQuestNumStep(74,20)
        goto End_Questnpc00032 
}
        else
        {
        D("等级还不够,加油!!!…")
        SetQuestNumStep(74,30)
        goto End_Questnpc00032 
}
}
CmpQuestNumStep( 74, 20 )
if( yes==1 ){
        CallSmallMenu(200,  1190)
        SetQuestNumStep( 74, 25 )
        goto End_Questnpc00032 
}
CmpQuestNumStep(74,25)
if( yes==1 ){
        SendSound(0, 1311)
        Qcount = 0
        GhostLv = GhostLv + 1
        D("三转成功!恭喜!!!")                ;Stay220
        SetQuestNumStep(74,30)
        goto End_Questnpc00032 
}

CmpQuestNumStep(74,30)
if( yes==1 ){
        DualCheck(3)
        if(yes == 1){
        D("四转了,在这里练的挺快吧?")
        SetQuestNumStep(74,35)
        goto End_Questnpc00032 
}
        else
        {
        D("努力再努力,四转并不难!!!!!!")
        SetQuestNumStep(74,45)
        goto End_Questnpc00032 
}
}
CmpQuestNumStep( 74, 35 )
if( yes==1 ){
        CallSmallMenu(200,  1190)
        SetQuestNumStep( 74, 40 )
        goto End_Questnpc00032 
}
CmpQuestNumStep(74,40)
if( yes==1 ){
        SendSound(0, 1311)
        Qcount = 0
        GhostLv = GhostLv + 1
        D("四转成功!您可以向最高称号进军了!")                ;Stay220
        SetQuestNumStep(74,45)
        goto End_Questnpc00032 
}

CmpQuestNumStep(74,45)
if( yes==1 ){
        DualCheck(4)
        if(yes == 1){
        D("马上就可以成为DragonSlayer…")
        SetQuestNumStep(74,50)
        goto End_Questnpc00032 
}
        else
        {
        D("您还不够条件成为DragonSlayer.......")
        SetQuestNumStep(74,0)
        goto End_Questnpc00032 
}
}


CmpQuestNumStep( 74, 50 )
if( yes==1 ){
        CallSmallMenu(200,  1190)
        SetQuestNumStep( 74, 55 )
        goto End_Questnpc00032 
}
CmpQuestNumStep(74,55)
if( yes==1 ){
        DualCheck(5)
        if(yes == 1){
        SendSound(0, 1311)
        Qcount = 0
        GhostLv = GhostLv + 1
        D("不知道该恭喜你还是替你郁闷！")                ;Stay220
        SetQuestNumStep(74,240)
        goto End_Questnpc00032 
}
        else
        {
        SetQuestNumStep(74,0)
        goto End_Questnpc00032 
}
}
CmpQuestNumStep(74,240)
if( yes==1 ){
        DualCheck(5)
        if(yes == 1){
        D("您已经没有追求了……")
        goto End_Questnpc00032 
}
        else
        {
        SetQuestNumStep(74,0)
        goto End_Questnpc00032 
}
}
;EQuest74_npc00032
:End_Questnpc00032
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
@Npc00042	;;权其捞瘤 曼啊 何盒 昏力
:END4201_ 	;;罚待茄 瘤开栏肺 捞悼
	random( 0, 2 ) 
        if( ran == 0 ) 
        {
		goto END4202_
	}       
        if( ran == 1)
        {
        	goto END4203_
        }
      
:END4202_ 	;;OX 柠令 1锅 瘤开栏肺 捞悼

	MapMove( "EVENT2", 25, 17 )
	if( yes == 1 )
	{
		EventMsg(" OX 柠令 捞亥飘 瘤开栏肺 捞悼钦聪促.")
	}
	else
	{
		EventMsg(" OX 柠令 捞亥飘甫 霖厚吝涝聪促. ")
		goto END4299_
	}

:END4203_	;;OX 柠令 2锅 瘤开栏肺 捞悼

	MapMove( "EVENT2", 29, 28 )
	if( yes == 1 )
	{
		EventMsg(" OX 柠令 捞亥飘 瘤开栏肺 捞悼钦聪促.")
	}
	else
	{
		EventMsg(" OX 柠令 捞亥飘甫 霖厚吝涝聪促. ")
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
		EventMsg("寸脚 捞镑俊 绢痘霸 甸绢吭烈?")
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
		EventMsg("<<内绢 酒饭唱>>肺 捞悼钦聪促.")
		EventMsg("鞘夸茄 锭甫 困茄 累篮青款阑~.")
	}
	else	; Failed to MapMove
	{
		EventMsg("甘 捞悼俊 角菩沁嚼聪促.")
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
		EventMsg("<<某浇 酒饭唱>>肺 捞悼钦聪促.")
		EventMsg("漠朝 困俊 角阑 荐 乐绰 啊厘 芭措茄 捞抚狼 康堡俊 狼瘤窍咯~")
	}
	else	; Failed to MapMove
	{
		EventMsg("甘 捞悼俊 角菩沁嚼聪促.")
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
		EventMsg("<<胶沛 酒饭唱>>肺 捞悼钦聪促.")
		EventMsg("鞘夸茄 锭甫 困茄 累篮青款阑~.")
	}
	else	; Failed to MapMove
	{
		EventMsg("甘 捞悼俊 角菩沁嚼聪促.")
	}
	
end
@Event00017	
;; 喉风酒饭唱
	MapMove( "GM_event", 148,202 )
	if( yes == 1 )
	{
		EventMsg("<喉风酒饭唱>肺 捞悼钦聪促.")
	}
	else
	{
		EventMsg("甘 捞悼俊 角菩沁嚼聪促.")
	}
end
@Event00018	; to Castle2 map
	IsLevel(61)		;拱带傈 50饭骇 力茄
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
			EventMsg("<<某浇 酒饭唱2>>肺 捞悼钦聪促.")
			EventMsg("捞镑篮 饭骇10何磐 饭骇60鳖瘤父 捞侩且 荐 乐绰 酒饭唱涝聪促.")
			goto Event00018
		}
		else	; Failed to MapMove
		{
			EventMsg("甘 捞悼俊 角菩沁嚼聪促.")
			goto Event00018
		}	
	}
	else
	{
		EventMsg("饭骇 60鳖瘤父 免涝且 荐啊 乐嚼聪促.")
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
		EventMsg("<阁胶磐 酒饭唱>肺 捞悼钦聪促.")
	}
	else
	{
		EventMsg("甘 捞悼俊 角菩沁嚼聪促.")
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






