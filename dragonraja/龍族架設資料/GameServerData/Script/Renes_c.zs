@sys00 ; 伺服器最初始设置
        MaxNPC( 50 )
        MapName( "Renes_c" )

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
;;新手村口Amicia
 	sGetNat();警备员单位的领域
        if( yes==3)
        {
                D( "从最近的开始" )
                goto ENDnation_
        }
        random( 0, 2 )
        if( ran == 0 )
        {
		D("如果军队找你的时候.请向我们报告")
        }
        if( ran == 1 )
        {
		SendSound(0,0092)
		D("雷诺斯很广阔治安困难")
        }
end

@Npc00001
;;市政府大厅kate
 	sGetNat();所有对话
        if( yes==3)
        {
                D( "从最近的开始" )
                goto ENDnation_
        }
        random( 0, 3 )
        if( ran == 0 )
        {
        D("这里是有高度文明及文化艺术的城市")
        }
        if( ran == 1 )
        {
        D("当你来到雷诺斯市时这个城镇将为你运转")
        }
        if( ran == 2 )
        {
        D("财政原本是宽裕的.但战事开始的时候.必须投入大量的军事费用.所以必须纳税")
        }
        CallSmallMenu( 0, 29 );市政府大厅
end

@Npc00002
 	sGetNat();所有对话
        if( yes==3)
        {
                D( "从最近的开始" )
                goto ENDnation_
        }
;占星术士Grement
        random( 0, 3 );
        if( ran == 0 )
        {
        D( "宇宙浩瀚...无尽星相...变化莫测.." );
        }
        if( ran == 1 )
        {
        D("我传授巫术与法术")
        }
        if( ran == 2 )
        {
        D("以艾德布洛依之名创造无限神力")
        }
        CallSmallMenu( 0, 71 ) ;巫术师协会, 这是一本魔术的书发芽并且它发芽
end

@Npc00003  
;雷提神殿
        D( "信我者得永生" );
        CallSmallMenu( 0, 75 );雷提神殿
end

@Npc00004
;传送员Eulalia
 	sGetNat();所有对话
        if( yes==3)
        {
                D( "从最近的开始" )
                goto ENDnation_
        }
	random( 0, 2 ) 
	if( ran == 0 ) 
	{
		SendSound(0,0092)
		D( "更多的便利快速移动,是为了去战争中的地方,保持资源请支付小的使用费。" ) 
	}
	if( ran == 1 ) 
	{
		SendSound(0,0092)
		D( "请求往你希望的地方移动,并且有小的使用费,但是这能使你轻松到达目的地" ) 
	}
        IsLevel(11)
        if( yes == 1)
        {
		CallMenu( 39 )
        }
        else
        {
        	EventMsg("等级LV11以上可以使用")
        	SendSound(0,2061)
	}
end
@Npc00005
;;练金铺Gaylen
 	sGetNat();所有对话
        if( yes==3 )
        {
                D( "从最近的开始" )
                goto ENDnation_
        }
        random( 0, 3 )
        if( ran == 0 )
        {
        D("你可以在这买到你所需要的任何药物.")
        }
        if( ran == 1 )
        {
        D("欢迎光临.")
        }
        if( ran == 2 )
        {
        D("怪物太强需要药物帮助你...")
        }
        CallSmallMenu( 0, 25 ) ;练金铺Gaylen
end

@Npc00006
;;武器店
 	sGetNat();所有对话
        if( yes==3)
        {
                D( "从最近的开始" )
                goto ENDnation_
        }
        random( 0, 2 )
        if( ran == 0 )
        {
	SendSound(0,0092)
        D( "因为战事不断.所以必须制作大量的武器" );
        }
        if( ran == 1 )
        {
	SendSound(0,0092)
        D( "没有办法提供高级别武器是因为战争缺乏物资" );
        }
        CallSmallMenu( 0, 18 );锻冶屋
end

@Npc00007    ;公会单位名单
 	sGetNat();所有对话
        if( yes==3)
        {
                D( "从最近的开始" )
                goto ENDnation_
        }
	D("公会成员名单属於公会所有当你加入的时候才能看")
	CallMenu(24)
end

@Npc00008
;地图指导表示
 	sGetNat()
	if(yes==4)
	{
		CmpQuestNumStep(49,123)
		if(yes==2)
		{
			D("我想在巨兽狩猎方面给你帮助.所以准备了地图")
			SetQuestNumStep(49,121)
			goto ENDmonmap_
		}
		CmpQuestNumStep(49,121)
		if(yes==0)
		{
			D("我想在巨兽狩猎方面给你帮助.所以准备了地图")
			SetQuestNumStep(49,121)
			goto ENDmonmap_
		}
		CmpQuestNumStep(49,121)
		if(yes==1)
		{
			D("这是巨兽在雷诺斯出现的地点")
			sCallCustomSmallMenu(280,8,436,437,900)	;雷诺斯巨兽出现地点指导
			EventMsg("这个是雷诺斯重要的狩猎地方.再来看卡拉尔村的狩猎地点")
			SetQuestNumStep(49,122)
			goto ENDmonmap_
		}
		CmpQuestNumStep(49,122)
		if(yes==1)
		{
			D("这是卡拉尔村主要狩猎区域")
			sCallCustomSmallMenu(280,5,436,428,900)	;彩色的巨兽狩猎地图指导
			EventMsg("这是卡拉尔村的狩猎区域.其次可以看到雷诺斯外部区域")
			SetQuestNumStep(49,123)
			goto ENDmonmap_
		}
		CmpQuestNumStep(49,123)
		if(yes==1)
		{
			D("雷诺斯外部的半兽人村是人们最喜欢的狩猎地方")
			sCallCustomSmallMenu(280,9,436,423,900)	;雷诺斯巨兽狩猎指导
			EventMsg("这是雷诺斯外部主要的狩猎场所如果想再次查看请再次点击")
			SetQuestNumStep(49,124)
			goto ENDmonmap_
		}
	}
	else
	{
		random(0,2)
		if(ran==0)
		{
			D("你是外国人?")
			goto ENDmonmap_
		}
		if(ran==1)
		{
			D("对他国人民.我有不能  漏机密的责任")
			goto ENDmonmap_
		}
	}
:ENDmonmap_

end

@Npc00009
;;锻冶屋
 	sGetNat();所有对话
        if( yes==3)
        {
                D( "从最近的开始" )
                goto ENDnation_
        }
        random(0,3)
        if( ran == 0 )
        {
        D( "如果你的头脑能灵活运用物品并给予大量的金币.我将传授你技术" );
        }
        if( ran == 1 )
        {
        D( "到铁矿山那是危险的.必须站着挖矿采集矿石")
        }
        if( ran == 2 )
        {
        D( "因为战争.暗杀行为.罪行不被消灭到处都是这种状况-保重!")  
        }
        CallSmallMenu( 0, 18 );锻冶屋
end

@Npc00010
;;农场
 	sGetNat();所有对话
        if( yes==3)
        {
                D( "从最近的开始" )
                goto ENDnation_
        }
        random( 0, 3 )
        if( ran == 0 )
        {
		SendSound(0,0092)
	        D( "细心培养出来的产物.这是会有荣誉感的" );
        }
        if( ran == 1)
        {
	        D( "如果不想饲养家畜.可以在旱田种植作物" );
        }     
        if( ran == 2)
        {
	        D( "已经超过可以接受的范围.请到银行把CELL换成CRIT" );
        }     
        CallSmallMenu( 0, 19 );农场
end

@Npc00011
;;钓具店
 	sGetNat();所有对话
        if( yes==3)
        {
                D( "从最近的开始" )
                goto ENDnation_
        }
        random( 0, 2 )
        if( ran == 0 )
        {
	        D( "如果要捕鲸.必须到深海去" );
        }
        if( ran == 1 )
        {
	        D( "经过漫长的岁月.你知道钓鱼有什麽意义了吗?" );
        }
        CallSmallMenu( 0, 28 );造船所
end

@Npc00012
;;汤姆木材行Tony
 	sGetNat();所有对话
        if( yes==3)
        {
                D( "从最近的开始" )
                goto ENDnation_
        }
        random( 0, 2 )
        if( ran == 0 )
        {
        D( "这里有完整的各式木材." );
        }
        if( ran == 1 )
        {
        D( "我也传授木工技术")
        }
        CallSmallMenu( 0, 26 );木材行
end

@Npc00013
;;芳香草药店Goldesburgh
 	sGetNat();所有对话
        if( yes==3)
        {
                D( "从最近的开始" )
                goto ENDnation_
        }
        D( "我的店的药都是自己生产的.绝无副作用.请安心服用." );
	CallSmallMenu( 0, 21 );草药店
end

@Npc00014
;德菲利神殿
        D( "信我者得永生..." );
        CallSmallMenu( 0, 74 );德菲利神殿
end

@Npc00015
;;鲜肉店
 	sGetNat();所有对话.
        if( yes==3)
        {
                D( "从最近的开始" )
                goto ENDnation_
        }
        random( 0, 3 )
        if( ran == 0 )
        {
	        D( "来喔~新鲜的猪肉.牛肉.羊肉......" );
        }
        if( ran == 1 )
        {
	        D( "想跟我学屠宰技术吗?")
        }
        if( ran == 2 )
        {
	        D( "杀牛就跟杀人一样过瘾 ")
        }
        CallSmallMenu( 0, 22 ) ;鲜肉店
end

@Npc00016
;;农场Golush
 	sGetNat();所有对话
        if( yes==3)
        {
                D( "从最近的开始" )
                goto ENDnation_
        }
        random( 0, 3 )
        if( ran == 0 )
        {
	        D( "欢迎光临" );
        }
        if( ran == 1 )
        {
	        D( "这里有各式各样的农场工具")
        }
        if( ran == 2 )
        {
	        D( "想学习农夫技术吗?")
        }
        CallSmallMenu( 0, 19 );农场
end

@Npc00017
;;商店Higra
 	sGetNat();所有对话
        if( yes==3)
        {
                D( "从最近的开始" )
                goto ENDnation_
        }
        D( "这里卖的东西是外面绝对找不到的喔!" )
        CallSmallMenu( 0, 60 ) ;商店
end

@Npc00018
;公会所
 	sGetNat();所有对话
        if( yes==3)
        {
                D( "从最近的开始" )
                goto ENDnation_
        }
	D("打算购买吗?")
	CallMenu(68)
end

@Npc00019
;;蜡烛Timoteo
 	sGetNat();所有对话
        if( yes==3)
        {
                D( "从最近的开始" )
                goto ENDnation_
        }
        random( 0, 3 )
        if( ran == 0 )
        {
	        D( "照亮世界的光 " );
        }
        if( ran == 1 )
        {
	        D( "关於蜡烛的传说你知道吗?")  
        }
        if( ran == 2 )
        {
	        D( "成为蜡烛达人绝对是世界上最富有的人")  
        }
        CallSmallMenu( 0, 23 ) ;蜡烛
end

@Npc00020
;;旅馆
 	sGetNat();所有对话
        if( yes==3)
        {
                D( "从最近的开始" )
                goto ENDnation_
        }
        random( 0, 2 )
        if( ran == 0 )
        {
	        D( "已经超过可以接受的范围.请到银行把CELL换成CRIT" );
        }
        if( ran == 1 )
        {
	        D( "假如你是魔法师.为了记忆一定要睡觉" );
        }
        CallSmallMenu( 0, 67 );旅馆
end

@Npc00021
;;货币交换Coinneach
 	sGetNat();所有对话
        if( yes==3)
        {
                D( "从最近的开始" )
                goto ENDnation_
        }
        D( "这里提供安全的货币交换机制 " );
        CallSmallMenu( 0, 78 ) 
end

@Npc00022
;;农场Erdian
 	sGetNat();所有对话
        if( yes==3)
        {
                D( "从最近的开始" )
                goto ENDnation_
        }
        random( 0, 3 )
        if( ran == 0 )
        {
        D( "欢迎光临" );
        }
        if( ran == 1)
        {
        D( "这里有最完整农场工具供你选购" );
        }     
        if( ran == 2)
        {
        D( "农夫技术让你可以自给自足" );
        }     
        CallSmallMenu( 0, 19 );农场
end

@Npc00023
;;市政府Elisote
 	sGetNat();所有对话
        if( yes==3)
        {
                D( "从最近的开始" )
                goto ENDnation_
        }
	D("这是国家授权经营的商店.透过捐款.可以提高你在本国的声望.还能得到高级商品")
	CallMenu( 66 )
end

@Npc00024
	D("在风中飞散的花瓣....暴风後闪耀着光芒")
end

@Npc00025
;;服装店
 	sGetNat();所有对话
        if( yes==3)
        {
		SendSound(0,0092)
                D( "从最近的开始" )
                goto ENDnation_
        }
        D( "我们贩卖各式流行服装" );
        CallSmallMenu( 0, 24 );服装店
end

@Npc00026
;;武器店
 	sGetNat();所有对话
        if( yes==3)
        {
                D( "从最近的开始" )
                goto ENDnation_
        }
        random( 0, 2 )
        if( ran == 0 )
        {
	        D( "当我打造出世界第一的武器那是好久以前的事情了" );
        }
        if( ran == 1 )
        {
	        D( "现在打算在其他地方购买几种高级物品" );
        }
        CallSmallMenu( 0, 18 );锻冶屋
end

@Npc00027
;;存款员Blackstone
 	sGetNat();所有对话
        if( yes==3)
        {
                D( "从最近的开始" )
                goto ENDnation_
        }
        random( 0, 2 )
        if( ran == 0 )
        {
		SendSound(0,0092)
	        D( "欢迎光临E龙族，这里是雷诺斯银行" );
        }
        if( ran == 1 )
        {
		SendSound(0,0092)
	        D( "我们提供最安全的存款及保险柜服务" );
        }
        CallSmallMenu( 0, 13 );存款员
end

@Npc00028
;;美味餐厅
 	sGetNat();所有对话
        if( yes==3)
        {
                D( "从最近的开始" )
                goto ENDnation_
        }
        random( 0, 4 )
        if( ran == 0 )
        {
        D("你吃饱了吗?")
        }       
        if( ran == 1)
        {
        D("没有体力怎麽应付挑战?")
        }       
        if( ran == 2 )
        {
        D( "这里有各式各样好吃的东西" );
        }
        if( ran == 3 )
        {
        D( "学习我的技术可以自己制作美食喔!" );
        }
        CallSmallMenu( 0, 20 );美味餐厅
end

@Npc00029
;武器店
 	sGetNat();所有对话
        if( yes==3)
        {
                D( "从最近的开始" )
                goto ENDnation_
        }
        D( "因为是初学者所以无法打造出好剑" );
        CallSmallMenu( 0, 18 );锻冶屋
end

@Npc00030
;;酒吧Qweldryk
 	sGetNat();所有对话
        if( yes==3)
        {
                D( "从最近的开始" )
                goto ENDnation_
        }
        random( 0, 2 )
        if( ran == 0 )
        {
	        D( "这里是喝酒说心事的地方" );
        }
        if( ran == 1 )
        {
	        D( "什麽样的事情.都比不上没有酒来的痛苦" );
        }
        CallSmallMenu( 0, 57 ) ;酒店
end

@Npc00031
;;商店Thatch
 	sGetNat();所有对话
        if( yes==3)
        {
                D( "从最近的开始" )
                goto ENDnation_
        }
        D( "这里是超级杂货卖场.别的地方没卖的.这里通通有" );
        CallSmallMenu( 0, 60 );商店
end

@Npc00032
;;学院
 	sGetNat();所有对话
        if( yes==3)
        {
                D( "从最近的开始" )
                goto ENDnation_
        }
        D( "希望追求高知识.获得其他技术及动物学的地方" );
        CallSmallMenu( 0, 72 ); 切贱盔
end

@Npc00033
;;旅店Valannus
 	sGetNat();所有对话
        if( yes==3)
        {
                D( "从最近的开始" )
                goto ENDnation_
        }
        random( 0, 2 )
        if( ran == 0 )
        {
	        D( "本店提供过夜&休息服务" );
        }
        if( ran == 1 )
        {
	        D( "本店没有停车场" );
        }
        CallSmallMenu( 0, 67 );旅店
end

@Npc00034    
;;罗宾汉弓箭
 	sGetNat();所有对话
        if( yes==3)
        {
                D( "从最近的开始" )
                goto ENDnation_
        }
        random( 0, 2 )
        if( ran == 0 )
        {
	        D( "你是弓箭手吗?" );
        }
        if( ran == 1 )
        {
	        D( "学习我的技术让你也能做出神弓" );
        }
        CallSmallMenu( 0, 27 )
end

@Npc00035
;艾德布洛伊神殿
        D("信我者得永生")
        CallSmallMenu( 0, 73 ) ;艾德布洛伊神殿
end

@Npc00036
;;所有处罚事件的NPC
	CheckEventLocalWarStatus()
	if( yes==0 )
	{
		goto END3601_ ;事件0
	}
	if( yes==1 )
	{
		goto END3602_ ;事件注册
	}
	if( yes==2 )
	{
		goto END3603_ ;事件移动
	}
	if( yes==3 )
	{
		goto END3604_ ;事件进行中
	}
	if( yes==4 )
	{
		goto END3605_ ;事件休息
	}
	
:END3601_
	D("会议还没决定.如果决定将会公告")
	goto END3699_
	
:END3602_
	D("开始接受会议参加者登记")
	CallMenu(293)
	goto END3699_

:END3603_
	D("参加会议者.请往会议所移动")
	CallMenu(294)
	goto END3699_
	
:END3604_
	D("会议进行中.会议结果将在结束後执行")
	goto END3699_

:END3605_
	D("会议达成共识.下一次会议开始受理")
	goto END3699_


:END3699_

end

@Npc00037
 	sGetNat();所有对话
        if( yes==3)
        {
                D( "从最近的开始" )
                goto ENDnation_
        }
        random( 0, 2 )
        if( ran == 0 )
        {
	        D("雷诺斯市场贩卖着很多好商品")
        }
        if( ran == 1 )
        {
	        D("你想要的是什么？.")
        }
end

@Npc00038
;;医院Stayk
 	sGetNat();所有对话
        if( yes==3)
        {
                D( "从最近的开始" )
                goto ENDnation_
        }
        random( 0, 2 )
        if( ran == 0 )
        {
	        D("这里是E龙族医院")
        }
        if( ran == 1 )
        {
	        D("原来只有强壮的身体是不能取得战争胜利的.")
        }
        CallSmallMenu( 0, 63 )
end

@Npc00039
 	sGetNat();所有对话
        if( yes==3)
        {
                D( "从最近的开始" )
                goto ENDnation_
        }
        D("天气这麽好先喝一杯吧!这里的酒精标准可是世界第一的高")
end

@Npc00040
;;公会管理所
 	sGetNat();所有对话
        if( yes==3)
        {
                D( "从最近的开始" )
                goto ENDnation_
        }
        D("你是来自哪个公会的?")
	CallSmallMenu( 0, 76 ) ;公会管理所
end

@Npc00041
;SQuest76_npc00041
CmpQuestNumStep(76,0)
if(yes==1)
{
	SendSound(0,0097)
	D( "你好，这里是E龙族金龙交易所.我可以把你包里的银龙换成金龙" )
	D( "目前的兑换比例是 5银龙:1金龙" )
   	SetQuestNumStep(76,5)
    	goto End_QuestNpc00041
}
CmpQuestNumStep(76,5)
if(yes==1)
	{
  	CheckItemMulti(10200, 5)
  	if(yes==1)
  	{
    		DeleteItemMulti(10200, 5)
    		SetItemInvPC(0 ,10199, 1)
		SendSound(0,2167)
		EventMsg("兑换金龙成功.")
    		D( "恭喜你! 金龙兑换成功  请查看你的背包" )
    		SetQuestNumStep(76,0)
    		goto End_QuestNpc00041
  	}
  	else
  	{
    		D( "您身上的银龙不够，需要5个才能交换." )
    		SetQuestNumStep(76,0)
    		goto End_QuestNpc00041
  	}     
}

;EQuest76_Npc00041
:End_QuestNpc00041
end

@Npc00042
;SQuest74_npc00042
CmpQuestNumStep(74,0)
if(yes==1)
	{
		D( "您好.这里是E龙族.你是新来的？" )
		D( "既然是新来的，那我送你个礼物吧.它可不便宜哦^_^" )
    		SetQuestNumStep(74,5)
    		goto End_QuestNpc00042
	}
CmpQuestNumStep(74,5)
if(yes==1)
	{
  		SetItemInvPC(0 ,9047, 1)
  		SetItemInvPC(0 ,10198, 1)
  		SetItemInvPC(0 ,3101, 1)
		EventMsg("收到了E龙族送给新手的礼物.")
  		D( "好了.看看你的背包里多了什么^&^" )
  		SetQuestNumStep(74,10)
  		goto End_QuestNpc00042
	}
CmpQuestNumStep(74,10)
if(yes==1){
		D( "我已经给过你礼物了,还想要啊？" )
  		SetQuestNumStep( 74,10)
  		goto End_QuestNpc00042
	}
;EQuest74_Npc00042
:End_QuestNpc00042
end


@Npc00043
end
@Npc00044
;;公告商人Codel
 	sGetNat();所有对话
        if( yes==3)
        {
                D( "从最近的开始" )
                goto ENDnation_
        }
	D( "你在这说的话全雷诺斯人民都能听到" )
	CallSmallMenu( 0, 79 )	
end
@Npc00045	;初学者向导 NPC
 	sGetNat()
	if(yes==4)
	{
		CmpQuestNumStep(49,101)
		if(yes==0)
		{
			SendSound(0,0097)
			D("这里是E龙族.你来到雷诺斯.却不知道怎麽开始吗?")
			SetQuestNumStep(49,102)
			goto ENDchobo_
		}
		CmpQuestNumStep(49,116)
		if(yes==2)
		{
			SendSound(0,0097)
			D("这里是E龙族.你来到雷诺斯.却不知道怎麽开始吗?")
			SetQuestNumStep(49,102)
			goto ENDchobo_
		}
		CmpQuestNumStep(49,101)
		if(yes==1)
		{
			SendSound(0,0097)
			D("这里是E龙族.你来到雷诺斯.却不知道怎麽开始吗?")
			SetQuestNumStep(49,102)
			goto ENDchobo_
		}
		CmpQuestNumStep(49,102)
		if(yes==1)
		{
			D("在城镇内四处遍布危险要素要注意!")
			SetQuestNumStep(49,103)
			goto ENDchobo_
		}
		CmpQuestNumStep(49,103)
		if(yes==1)
		{
			sGetClass()
			if(yes==0)	;战士
			{
				D("你的职业是战士")
			}
			if(yes==1)	;窃贼
			{
				D("你的职业是窃贼")
			}
			if(yes==2)	;弓手
			{
				D("你的职业是弓手")
			}
			if(yes==3)	;巫术师
			{
				D("你的职业是巫师")
			}
			if(yes==4)	;祭师
			{
				D("你的职业是祭师")
			}
			SetQuestNumStep(49,104)
			goto ENDchobo_
		}
		CmpQuestNumStep(49,104)
		if(yes==1)
		{
			D("一定要注意看地图的方向加以利用.并请注意好好听我讲话")
			SetQuestNumStep(49,105)
			goto ENDchobo_
		}		
		CmpQuestNumStep(49,105)
		if(yes==1)
		{
			sGetClass()
			if(yes==0)	;战士
			{
				sCallCustomSmallMenu(280,3,436,437,770)		;战士用
				SendSound(0,1432)
				SetQuestNumStep(49,106)
				goto ENDchobo_
			}
			if(yes==1)	;窃贼
			{
				sCallCustomSmallMenu(280,1,436,437,770)		;窃贼用
				SendSound(0,1432)
				SetQuestNumStep(49,106)
				goto ENDchobo_
			}
			if(yes==2)	;弓手
			{
				sCallCustomSmallMenu(280,0,436,437,770)		;弓手用
				SendSound(0,1432)
				SetQuestNumStep(49,106)
				goto ENDchobo_
			}
			if(yes==3)	;巫术师
			{
				sCallCustomSmallMenu(280,2,436,437,770)		;巫术师用
				SendSound(0,1432)
				SetQuestNumStep(49,106)
				goto ENDchobo_
			}
			if(yes==4)	;祭师
			{
				sCallCustomSmallMenu(280,2,436,437,770)		;祭师用
				SendSound(0,1432)
				SetQuestNumStep(49,106)
				goto ENDchobo_
			}
		}
		CmpQuestNumStep(49,106)
		if(yes==1)
		{
			D("你现在站的广场.是人民聚集讨论事情.各大院集中的地方")
			SetQuestNumStep(49,107)
			goto ENDchobo_
		}
		CmpQuestNumStep(49,107)
		if(yes==1)
		{
			D("这大广场是为了串接人民力量的.一起合作对抗巨兽")
			SetQuestNumStep(49,108)
			goto ENDchobo_
		}		
		CmpQuestNumStep(49,108)
		if(yes==1)
		{
			D("如果不足LV10或低可以前往牧场以及卡拉尔村进行狩猎")
			SetQuestNumStep(49,109)
			goto ENDchobo_
		}
		CmpQuestNumStep(49,109)
		if(yes==1)
		{
			D("如果输入 /HELP 命令语 可以查询与你等级相近的巨兽")
			SetQuestNumStep(49,110)
			goto ENDchobo_
		}
		CmpQuestNumStep(49,110)
		if(yes==1)
		{
			D("因为全部的人都攻击牛跟巨兽羊.所以必须找寻其他巨兽.在此之前必须在占星术士的家.做好十分准备")
			SetQuestNumStep(49,111)
			goto ENDchobo_
		}
		CmpQuestNumStep(49,111)
		if(yes==1)
		{
			D("如果想要学习魔法.请到占星术士之家.各种相关的法术都会要求各项能力值.必须符合才能学习")
			SetQuestNumStep(49,112)
			goto ENDchobo_
		}
		CmpQuestNumStep(49,112)
		if(yes==1)
		{
			D("在还没学习魔法之前.可以输入命令语 /HELP 查询要学习的魔法相关的能力值")
			SetQuestNumStep(49,113)
			goto ENDchobo_
		}
		CmpQuestNumStep(49,113)
		if(yes==1)
		{
			D("死亡後可以前往神殿.并输入 [以宇宙和大风暴的艾德布洛伊之名] 可以得到生反")
			SetQuestNumStep(49,114)
			goto ENDchobo_
		}
		CmpQuestNumStep(49,114)
		if(yes==1)
		{
			D("在狩猎後提升等级并获得金钱.到商店选购能力值足够的装备.继续狩猎")
			SetQuestNumStep(49,115)
			goto ENDchobo_
		}
		CmpQuestNumStep(49,115)
		if(yes==1)
		{
			D("如果遇到困难或不了解的地方.可以按下快速键F2或输入 /HELP 命令语打开帮助视窗查询")
			SetQuestNumStep(49,116)
			goto ENDchobo_
		}
		CmpQuestNumStep(49,116)
		if(yes==1)
		{
			D("最後..用快乐的意志在世界上旅行 GOOD LUCKY")
			SetQuestNumStep(49,101)
			goto ENDchobo_
		}
	}
	else
	{
		random(0,2)
		if(ran==0)
		{
			D("它来自遥远的地面那端的国家")
			goto ENDchobo_
		}
		if(ran==1)
		{
			D("令人对故乡产生怀念的感觉吗?")
			goto ENDchobo_
		}
	}
:ENDchobo_
end

@Npc00046
;; hint
 	sGetNat();所有对话
        if( yes==3)
        {
                D( "从最近的开始" )
                goto ENDnation_
        }
	D("在暴风中飞散的花瓣...在宇宙闪耀着光芒")
end
@Npc00047
end

@Npc00048
;;换肤坊 替换衣服装饰色彩
 	sGetNat();所有对话
        if( yes==3)
        {
                D( "从最近的开始" )
                goto ENDnation_
        }
	random( 0, 3 )
	if( ran == 0 )
	{
		D("你好.我们是可以替你更换衣服颜色及肤色的店")
	}
	if( ran == 1 )
	{
		D( "是否对自己衣服颜色及肤色不满意.我们替你换 换 换")
	}
	if( ran == 2 )
	{
		D( "为了更换颜色需要很多很多的钱" )
	}
	CallMenu(28)
end
@Npc00049
;;捐款员Francoise
 	sGetNat();所有对话
        if( yes==3)
        {
                D( "从最近的开始" )
                goto ENDnation_
        }
	random( 0, 3 )
	if( ran == 0 )
	{
		D("国家战事不断.国库需要大家出力")
	}
	if( ran == 1 )
	{
		D( "为国家出力会提高你在本国声望")
	}
	if( ran == 2 )
	{
		D( "杰彭将以你为荣!" )
	}
	CallSmallMenu( 0, 77 ) ;   

:ENDnation_
end





@Event00000
end

@Event00001
;;卡拉尔村
        MapMove( "COLOR", 209,13 )
	if( yes == 1 ) 
	{
		EventMsg( "移动到卡拉尔村" ) 
	}
	else
	{
		EventMsg( "无法移动到卡拉尔村" ) 
	}
end

@Event00002
;;雷诺斯外部
        MapMove( "RENES_OUT", 372,369 )
	if( yes == 1 ) 
	{
		EventMsg( "移动到雷诺斯外部" ) 
	}
	else
	{
		EventMsg( "无法移动到雷诺斯外部" ) 
	}
end

@Event00003
;;希里坎男爵宅邸 1F
        MapMove( "Sn_1F", 54,123 )
	if( yes == 1 ) 
	{
		EventMsg( "移动到男爵宅邸" ) 
	}
	else
	{
		EventMsg( "无法移动到男爵宅邸" ) 
	}
end

@Event00004
;;迷你洞窟
;;进出限制 Level 61~90
	sGetLevel()
	if( yes >= 61 )
	{
		if( yes <= 90 )
		{
			MapMove( "Mini2", 185,54 )
			if( yes == 1 )
			{
				EventMsg("移动到迷你洞窟")
			}
			else
			{
				EventMsg("无法移动迷你洞窟2阶")
			}
		}
		else	;在91 之上 在61 之上
		{
			EventMsg("我们这里只开放给61~90的玩家.英雄你等级太高了......")
		}
	}
	else	;等级未满61
	{
		EventMsg("等级不足.不能进去送死.....")
	}
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
;;新手介绍所
;;等级7以下进入许可
        IsLevel(7)
        if( yes == 1)
        {
        	EventMsg("这是给新手专用的向导.并且你不是新手喔!")
        	SendSound(0,2061)
        }
        else
        {           
					MapMove( "Scholium2", 51, 164 )
		if( yes == 1 )
		{
			EventMsg("往新手村移动")
			SendSound(0,2061)
		}
		else
		{
			EventMsg("无法移动到新手村")
		}
	}
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
;;公会房屋
	GotoGuildHouse()
	if( yes == 1 )
	{
		EventMsg( "往公会住所移动中" )
		goto ENDgh_
	}
	else
	{
		EventMsg( "你没有经过公会许可.无法进入" )
		goto ENDgh_
	}
:ENDgh_
end
@Event00015
;;往决斗场移动
	QuestTeleport(1, 295,132)
	EventMsg("往决斗场移动")
end
@Event00016
;;往场外移动
	QuestTeleport(1, 323,131)
	EventMsg("往场外移动")
end
@Event00017
end
@Event00018
end
@Event00019
end
;;RENES_C BY Kushu 2006 03 03
