
@sys00	; 贸澜 辑滚 Setting窍绰 窃荐.

	MaxNPC( 50 )
	MapName( "barantan" )

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
        D("当你来到巴拉坦时这个城镇将为你运转")
        }
        if( ran == 2 )
        {
        D("财政原本是宽裕的.但战事开始的时候.必须投入大量的军事费用.所以必须纳税")
        }
        CallSmallMenu( 0, 29 );市政府大厅
end
@Npc00004
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
@Npc00005
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
	        D( "欢迎光临E龙族，这里是巴拉坦银行" );
        }
        if( ran == 1 )
        {
	        D( "我们提供最安全的存款及保险柜服务" );
        }
        CallSmallMenu( 0, 13 );存款员 
end
@Npc00006
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
@Npc00007
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
@Npc00008
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
@Npc00009
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
@Npc00010
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
@Npc00011
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
@Npc00012
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
@Npc00013
;; 铁匠
        random( 0, 2 ) 
        if( ran == 0 ) 
        {
	        D( "别妨碍我打造传说中的武器..我现在很烦. " ) 
        }
        if( ran == 1 ) 
        {
	        D( "如果你出的价格合适，也许我会考虑." ) 
        }
        CallSmallMenu( 0, 18 ) 
	
end
@Npc00014
;; 铁匠
        random( 0, 2 ) 
        if( ran == 0 ) 
        {
	        D( "别妨碍我打造传说中的武器..我现在很烦." ) 
        }
        if( ran == 1 ) 
        {
	        D( "如果你出的价格合适，也许我会考虑 " ) 
        }
        CallSmallMenu( 0, 18 ) 
end
@Npc00015
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
@Npc00016
;; 弓箭
        random( 0, 2 ) 
        if( ran == 0 ) 
        {
	        D( "你是不是偶尔会射不准? " ) 
        }
        if( ran == 1 ) 
        {
	        D( "想提升你的箭术? " ) 
        }
        CallSmallMenu( 0, 27 ) 
end
@Npc00017
;; 屠夫店
        random( 0, 2 ) 
        if( ran == 0 ) 
        {
        	D( "你可以在我这里学习屠夫." ) 
        }
        if( ran == 1 ) 
        {
        	D( "我这里的肉，品质都是一流的.." ) 
        }
        CallSmallMenu( 0, 22 ) 
end
@Npc00018
;; 服装
        random( 0, 3 ) 
        if( ran == 0 ) 
        {
	        D( "你这件衣服哪买的? " ) 
        }       
        if( ran == 1) 
        {
	        D( "你不觉得你穿成这样很丢脸么? " ) 
        }       
        if( ran == 2 ) 
        {
        D( "还是到我这里买吧." ) 
        }
        CallSmallMenu( 0, 24 ) 
end
@Npc00019
;; 痢己贱荤
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
@Npc00020
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
@Npc00021
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
@Npc00022
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
@Npc00023
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
@Npc00024
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
@Npc00025
;;公告商人Codel
 	sGetNat();所有对话
        if( yes==3)
        {
                D( "从最近的开始" )
                goto ENDnation_
        }
	D( "你在这说的话全伊斯的人民都能听到" )
	CallSmallMenu( 0, 79 )
end
@Npc00026

end
@Npc00027
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
@Npc00028
;; 坷方脚傈
        random( 0 , 2 ) 
        if( ran == 0 ) 
        {
        D( "欢迎来到E龙族." ) 
        }
        if( ran == 1 ) 
        {
        D( "这里是伊斯." ) 
        }
        CallSmallMenu( 0, 82 ) ; Orem 
end
@Npc00029
;; 厚磊 魄概
	CheckNation(6)
	if(yes==1)
	{
		random( 0 , 3 )
        	if( ran == 0 )
	        {
        		D( "这里是伊斯.." );
	        }
        	if( ran == 1 )
	        {
		        D( "这里是伊斯.." );
	        }
        	if( ran == 2 )
	        {
        		D( "这里是伊斯.." );
	        }
        	CallSmallMenu( 0, 85 )
        }
        else
	{
		random( 0 , 3 )
	        if( ran == 0 )
        	{
		        D( "捞 镑篮 老胶牢俊霸 鸥惫狼 免涝刘阑 魄概窍绰 镑涝聪促. " );
	        }
	        if( ran == 1 )
	        {
		        D( "老胶 荤恩捞 酒聪焙夸. 寸脚狼 荐档俊 啊辑 免涝刘阑 惯鞭罐栏矫扁 官而聪促." );
	        }
	        if( ran == 2 )
	        {
			D( "了价钦聪促. 捞 镑篮 老胶牢甸父 捞侩捞 啊瓷钦聪促. " );
	        }
	}
end
@Npc00030
;老胶 瘤档焊扁
 	sGetNat()
	if(yes==6)
	{
		CmpQuestNumStep(49,122)
		if(yes==2)
		{
			D("Npc00030..")
			SetQuestNumStep(49,121)
			goto ENDmonmap_
		}
		CmpQuestNumStep(49,121)
		if(yes==0)
		{
			D("Npc00030..")
			SetQuestNumStep(49,121)
			goto ENDmonmap_
		}
		CmpQuestNumStep(49,121)
		if(yes==1)
		{
			D("Npc00030..")
			sCallCustomSmallMenu(280,4,436,379,900)	;官鄂藕 阁胶磐 瘤档
			EventMsg("捞巴篮 官鄂藕狼 林夸 荤成磐涝聪促. 促澜篮 技甸饭胶狼 林夸 荤成磐甫 杭 荐 乐嚼聪促.")
			SetQuestNumStep(49,122)
			goto ENDmonmap_
		}
		CmpQuestNumStep(49,122)
		if(yes==1)
		{
			D("技甸饭胶狼 林夸 荤成磐 瘤开涝聪促.")
			sCallCustomSmallMenu(280,10,436,494,900)	;技甸饭胶 阁胶磐 瘤档
			EventMsg("捞巴篮 技甸饭胶狼 林夸 荤成磐涝聪促. 贸澜何磐 促矫 焊绊 酵促搁, 促矫 努腐秦林技夸..")
			SetQuestNumStep(49,123)
			goto ENDmonmap_
		}
	}
	else
	{
		random(0,2)
		if(ran==0)
		{
			D("寸脚篮 促弗 唱扼俊辑 坷脚 盒捞焙夸..")
			goto ENDmonmap_
		}
		if(ran==1)
		{
			D("鸥惫牢俊霸绰 富且 荐 绝绰 扁剐捞 乐嚼聪促.")
			goto ENDmonmap_
		}
	}
:ENDmonmap_

end
@Npc00031
end
@Npc00032

end
@Npc00033
end
@Npc00034
 	sGetNat();所有对话
        if( yes==3)
        {
                D( "从最近的开始" )
                goto ENDnation_
        }
	D("公会成员名单属於公会所有当你加入的时候才能看")
	CallMenu(24)
end
@Npc00035
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
@Npc00036                   ;龙族送声望NPC36

end
@Npc00037
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
		D( "更多的便利快速移动,是为了去战争中的地方,保持资源请支付小的使用费。" ) 
	}
	if( ran == 1 ) 
	{
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
;SQuest76_npc00047
CmpQuestNumStep(76,0)
if(yes==1)
{
	SendSound(0,0097)
	D( "你好，这里是E龙族金龙交易所.我可以把你包里的银龙换成金龙" )
	D( "目前的兑换比例是 5银龙:1金龙" )
   	SetQuestNumStep(76,5)
    	goto End_QuestNpc00047
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
    		goto End_QuestNpc00047
  	}
  	else
  	{
    		D( "您身上的银龙不够，需要5个才能交换." )
    		SetQuestNumStep(76,0)
    		goto End_QuestNpc00047
  	}     
}

;EQuest76_Npc00047
:End_QuestNpc00047
end
@Npc00048
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
		D( "伊斯将以你为荣!" )
	}
	CallSmallMenu( 0, 77 ) ;   

:ENDnation_
end


@Event00000

end
@Event00001
;; 技甸饭胶 涝备
	MapMove( "Sedless", 160,410 ) 
	if( yes == 1 ) 
	{
		EventMsg( "移动到塞多拉斯." ) 
	}
	else
	{
		EventMsg( "不能移动到其他地图." ) 
	}
end
@Event00002
;; 矫没 救 --> 廉胶萍胶 扁荤窜
	QuestTeleport(1,20,94) 
	EventMsg( "廉胶萍胶 扁荤窜栏肺 器呕 捞悼钦聪促." ) 
end
@Event00003
;; 坷方脚傈俊辑 --> 付阑堡厘
	QuestTeleport(1,329,95) 
	EventMsg( "付阑堡厘栏肺 器呕 捞悼钦聪促." ) 
end
@Event00004
;; 辨靛笼栏肺
	GotoGuildHouse()
	if( yes == 1 )
	{
		EventMsg( "寸脚狼 辨靛 骏器府酒肺 捞悼 吝涝聪促." )
		goto ENDgh_
	}
	else
	{
		EventMsg( "寸脚篮 辨靛 骏器府酒甫 啊瘤绊 乐瘤 臼嚼聪促." )
		goto ENDgh_
	}
:ENDgh_
end
@Event00005

end
@Event00006	

end
@Event00007
;; 檬焊磊 救郴家
;; 饭骇 7 捞窍鳖瘤 免涝啊瓷
       IsLevel(7) 
       if( yes == 1) 
       {
	  	    EventMsg( "捞镑篮 檬焊磊狼 啊捞靛甫 困茄 甘涝聪促. 寸脚篮 檬焊啊 酒聪焙夸" ) 
					SendSound(0,0161) 
       }
       else
       {
					MapMove( "Scholium2", 51, 164 ) 
					if( yes == 1 ) 
					{
						EventMsg( "檬焊磊 救郴家肺 器呕 捞悼钦聪促." ) 
						SendSound(0,0161) 
					}
					else
					{
						EventMsg( "甘 捞悼俊 角菩沁嚼聪促." ) 
						SendSound(0,0161) 
					}
      }
end
@Event00008
;; 3殿鞭 辨靛笼
	IsMyGuildHouse(8)
	if(yes == 1)	; 抛胶飘辑滚 滚傈
	{
		EventMsg(" 券康钦聪促. 捞 镑篮 辨靛 骏器府酒 涝聪促...")
		goto ENDkey1_
	}
	else
	{
		EventMsg("捞 镑篮 辨靛狼 骏器府酒涝聪促. 辨靛盔父捞 甸绢哎 荐 乐嚼聪促.")
		SendSound(0,0161) 
		goto ENDkey1_
	}
:ENDkey1_
end
@Event00009	
end

@Event00010
;; 技甸饭胶 涝备
	MapMove( "Naurchen", 8,270 ) 
	if( yes == 1 ) 
	{
		EventMsg( "移动到那吴勒臣." ) 
	}
	else
	{
		EventMsg( "不能移动到该地图." ) 
	}
end
@Event00011
end
@Event00012
;; 辨靛包府家 厚剐烹肺 谅
	QuestTeleport(1,330,54)
end
@Event00013
;; 辨靛包府家 厚剐烹肺 快
	QuestTeleport(1,330,54) 
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
