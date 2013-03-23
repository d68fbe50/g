@sys00 ; 贸澜 辑滚 Setting窍绰 窃荐.

    MaxNPC( 50 )
    MapName( "MA-IN" )

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
;荤恩老 版快 促澜 措荤 罚待 
   sGetNat(); 磊捞戚捞搁.
    if(yes==4)
    {
          D( " 你好.欢迎光临E龙族.这里是贺坦特村." )
          goto ENDnation_
    }

    random( 0, 13 )
    if( ran == 0 ) 
    {
        D( "为了必要时把幸运..." )
    }
    if( ran == 1 ) 
    {
         D( "这是贺坦特村..." )
    }
    if( ran == 2 ) 
    {
        D( "村外有一个洞窟,但并不是每一个人都能进去的... " )
    }
       if( ran == 3 ) 
    {
        D( "听说杰彭已经在攻打雷诺斯了,你还在这里作什么!!!" )
    }
    if( ran == 4 ) 
    {
         D( "你知道杰彭已经攻到哪里吗?" )
    }
    if( ran == 5 ) 
    {
        D( "传说艾德布洛伊神殿能使死人复活..." )
    }
    if( ran == 6 ) 
    {
         D( "随风飘散的大波斯菊............" )
    }
    if( ran == 7 ) 
    {
        D( "让我们为这刀刃下最伟大的名字而感到光荣." )
    }
    if( ran == 8 ) 
    {
         D( "杰彭若打进来,我们的卫兵不会袖手旁观的!" )
    }
    if( ran == 9 ) 
    {
        D( "到村庄外面有很多强悍的怪物出没." )
    }
    if( ran == 10 ) 
    {
         D( "杰彭攻进来了!")
    }
    if( ran == 11 ) 
    {
        D( "听说杰彭已经攻进修多恩山谷了")
    }     
    if( ran == 12 )
    {
         D( "让我们为这刀刃下最伟大的名字而感到光荣吧." )   
    }
    
end
@Npc00001
;; 俊胆宏肺捞 脚傈
   random( 0, 3 )
    if( ran == 0 )
    {
        D( "这里是大波斯菊和大风暴的艾德布洛伊神殿. " )
    }
    if( ran == 1 )
    {
         D( "以大波斯菊和大风暴的艾德布洛伊之名." )
    }
    if( ran == 2 )
    {
        D( "这里是可以让死者复活的地方." )
    }
    CallSmallMenu( 0, 73 )
end
@Npc00002
;; 抛其府 脚傈
    random( 0, 3 )
    if( ran == 0 )
    {
        D( "以必要时所需之小幸运祝福你..." )
    }
    if( ran == 1 )
    {
       D( "从心所行之路即是正路.." )
    }
    if( ran == 2 )
    {
       D( "德菲力会保佑你的！在岔路上不要犹豫，直接望心里想走的地方走吧.." )
    }
    CallSmallMenu( 0, 74 )
end
@Npc00003
;; 饭萍脚傈
    random( 0, 3 )
    if( ran == 0 )
    {
        D( "让我们为这刀刃下最伟大的名字感到光荣..." )
    }
    if( ran == 1 )
    {
       D( "这里是剑和破坏之神雷提的神殿..." )
    }
    if( ran == 2 )
    {
       D( "剑术训练也是一种接受神旨意的表现." )
    }
    CallSmallMenu( 0, 75 )
end
@Npc00004
;; 切贱盔
   sGetNat(); 磊捞戚捞搁.
    if( yes==4)
    {
          D( " 你好.欢迎光临E龙族.这里是贺坦特村." )
          goto ENDnation_
    }
    random( 0, 3 )
    if( ran == 0 )
    {
        D( "我知道一些在别的地方学不到的东西." )
    }
    if( ran == 1 )
    {
       D( "想让我教你高水平的知识吗?" )
    }
    if( ran == 2 )
    {
       D( "这里是研究学问和技能的学院..." )
    }
    CallSmallMenu( 0, 72 )
end
@Npc00005
;;狼丰盔
   sGetNat(); 磊捞戚捞搁.
    if( yes==4)
    {
          D( " 你好.欢迎光临E龙族.这里是贺坦特村." )
          goto ENDnation_
    }
    random( 0, 3 )
    if( ran == 0 )
    {
        D( "这里是医院.." )
    }
    if( ran == 1 )
    {
       D( "可以接种各种疾病的疫苗.." )
    }
    if( ran == 2 )
    {
        D("如果身上有病的话我们可以给你治疗哦.")
    }
    CallSmallMenu( 0, 63 )
end
@Npc00006   
;; 付阑雀包
   sGetNat(); 磊捞戚捞搁.
    if( yes==4)
    {
          D( " 你好.欢迎光临E龙族.这里是贺坦特村." )
          goto ENDnation_
    }
   random( 0, 3 )
   if( ran == 0 )
   {
       D("贺坦特村位于拜索斯的最西边...")
   }
   if( ran == 1 )
   {
       D("我来告诉你在贺坦特能做的事情.")
   }
   if( ran == 2 )
   {
       D("你去过灰色山脉吗?也可以去修多恩河畔..")
   }
   CallSmallMenu( 0, 29 )
end
@Npc00007
;; 辑官捞国 捞亥飘 NPC
   CheckEventLocalWarStatus()
   if( yes==0 )
   {
       goto END0701_ ; 捞亥飘 绝澜
   }
   if( yes==1 )
   {
       goto END0702_ ; 捞亥飘 殿废
   }
   if( yes==2 )
   {
       goto END0703_ ; 捞亥飘 捞悼
   }
   if( yes==3 )
   {
       goto END0704_ ; 捞亥飘 柳青吝
   }
   if( yes==4 )
   {
       goto END0705_ ; 捞亥飘 绒侥
   }
   
:END0701_
   D(" 还没有确定大会时间,确定以后会用公告形式通知的. ")
   goto END0799_
   
:END0702_
   D(" 还没有确定大会时间,确定以后会用公告形式通知的. ")
   CallMenu(293)
   goto END0799_

:END0703_
   D(" 还没有确定大会时间,确定以后会用公告形式通知的. ")
   CallMenu(294)
   goto END0799_
   
:END0704_
   D(" 还没有确定大会时间,确定以后会用公告形式通知的.")
   goto END0799_

:END0705_
   D(" 还没有确定大会时间,确定以后会用公告形式通知的. ")
   goto END0799_

:END0799_

end
@Npc00008
;官捞辑胶 瘤档焊扁 (付阑林函)
   sGetNat()
   if(yes==3)
   {
       CmpQuestNumStep(49,123)
       if(yes==2)
       {
           D("为了帮助你狩猎怪物,我帮你准备了地图..")
           SetQuestNumStep(49,121)
           goto ENDmonmap_
       }
       CmpQuestNumStep(49,121)
       if(yes==0)
       {
           D("为了帮助你狩猎怪物,我帮你准备了地图..")
           SetQuestNumStep(49,121)
           goto ENDmonmap_
       }
       CmpQuestNumStep(49,121)
       if(yes==1)
       {
           D("这里是贺坦特村里出怪物的地方..")
           sCallCustomSmallMenu(280,7,436,423,900)    ;秋畔飘付阑 阁胶磐 瘤档
           EventMsg("这里是贺坦特村的主要狩猎点,然后你可以看到灰色山脉的主要狩猎点.")
           SetQuestNumStep(49,122)
           goto ENDmonmap_
       }
       CmpQuestNumStep(49,122)
       if(yes==1)
       {
           D("这里是灰色山脉的主要狩猎地点.")
           sCallCustomSmallMenu(280,6,436,423,900)    ;雀祸魂钙 阁胶磐 瘤档
           EventMsg("这里是灰色山脉的主要狩猎点,然后你可以看到修多恩河的主要狩猎点.")
           SetQuestNumStep(49,123)
           goto ENDmonmap_
       }
       CmpQuestNumStep(49,123)
       if(yes==1)
       {
           D("修多恩河的半兽人村是我们常去的狩猎地点.")
           sCallCustomSmallMenu(280,11,436,423,900)    ;绒促牢碍 阁胶磐 瘤档
           EventMsg("这里是修多恩河的主要狩猎点,然后你想看可以再看一遍..")
           SetQuestNumStep(49,124)
           goto ENDmonmap_
       }
   }
   else
   {
       random( 0, 3 )
       if(ran==0)
       {
           D("警卫，这里有个杰彭人..")
           goto ENDmonmap_
       }
       if(ran==1)
       {
           D("警卫，这里有个杰彭人..")
           goto ENDmonmap_
       }
       if(ran==2)
       {
           D("警卫，这里有个杰彭人..")
           goto ENDmonmap_
       }
   }
:ENDmonmap_

end
@Npc00009
;; 篮青
   sGetNat(); 磊捞戚捞搁.
    if( yes==4)
    {
          D( " 欢迎来到E龙族，这里是银行...." )
          goto ENDnation_
    }
   random( 0, 3 )
   if( ran == 0 )
   {
       D("在银行可以存款,提款,贷款,保管和兑换货币..")
   }
   if( ran == 1 )
   {
       D("警卫，这里有个杰彭人")
   }
   if( ran == 2 )
   {
       D( "欢迎光临这是贺坦特的银行。 存款,提款,贷款,保管和兑换货币.." )
   }
   CallSmallMenu( 0, 13 )
end

@Npc00010
;; 辨靛盔府胶飘 凯扁
   sGetNat(); 官捞辑胶搁.
    if( yes==4)
    {
          D( " 你好.欢迎光临E龙族.这里是贺坦特村...." )
          goto ENDnation_
    }
   random( 0, 3 )
   if( ran == 0 )
   {
       D("依你如果已经加入工会,我回给你看工会成员列表.")
   }
   if( ran == 1 )
   {
       D("我来告诉你的工会成员.")
   }
   if( ran == 2 )
   {
       D("我来告诉你所属工会的工会成员.")
   }
   CallMenu(24) 
end

@Npc00011
   D("风中飘散的波斯菊...让暴风的沉睡的花瓣的光荣...")
end

@Npc00012
;; 拳企俺酋(篮青)
   sGetNat(); 磊捞戚捞搁.
    if( yes==4)
   {
       D( " 你好.欢迎光临E龙族.这里是贺坦特村." )
       goto ENDnation_
    }
   D( " 这是推进货币改革的地方。 宣言货币单位从cell变成了crit的.. " );
   CallSmallMenu( 0, 78 )
end

@Npc00013
;; 咯包
   sGetNat(); 磊捞戚捞搁.
    if( yes==4)
    {
          D( " 你好.欢迎光临E龙族.这里是贺坦特村.." )
          goto ENDnation_
    }
   random( 0, 3 )
   if( ran == 0 )
   {
       D("魔法师为了记忆魔法必须要睡眠.")
   }
   if( ran == 1 )
   {
       D("当不能记忆魔法的时候来这里睡觉就能记忆魔法了.")
   }
   if( ran == 2 )
   {
       D("通过休息和睡眠可以恢复Life和Health.")
   }
       CallSmallMenu( 0, 67 )
end
@Npc00014
;; 户笼
   sGetNat(); 磊捞戚捞搁.
    if( yes==4)
    {
          D( " 你好.欢迎光临E龙族.这里是贺坦特村." )
          goto ENDnation_
    }
   random( 0, 3 )
   if( ran == 0 )
   {
       D("要做长途旅行的人必须事先做好准备.")
   }     
   if( ran == 1)
   {
       D("听说杰彭人会念很恐怖的咒语,真是太恐怖了....")
   }     
   if( ran == 2 )
   {
       D( " 各种料理已经准备好了.." )
   }
   CallSmallMenu( 0, 20 )
end

@Npc00015   
;; 距檬痢
   sGetNat(); 磊捞戚捞搁.
    if( yes==4)
    {
          D( " 你好.欢迎光临E龙族.这里是贺坦特村." )
          goto ENDnation_
    }
    random( 0, 3 )
    if( ran == 0 )
    {
        D( "最近杰彭的间谍到处都有,要当心.." )
    }
    if( ran == 1 )
    {
         D( "我要不要也烧药卖钱呢?" )
    }
    if( ran == 2 )
    {
         D( "这里卖各式各样的草药和药草粉. " )
    }
    CallSmallMenu( 0, 21 ) 
end
@Npc00016
;; 规绢备痢
   sGetNat(); 磊捞戚捞搁.
    if( yes==4)
    {
          D( " 你好.欢迎光临E龙族.这里是贺坦特村." )
          goto ENDnation_
    }
    
    D( "这里是专门卖防具的地方,但是铁做的东西也可以买卖. " )
    CallSmallMenu( 0, 18 )    ; 措厘埃 牢磐其捞胶 
end
@Npc00017   
;; 措厘埃
   sGetNat(); 磊捞戚捞搁.
    if( yes==4)
    {
          D( " 你好.欢迎光临E龙族.这里是贺坦特村." )
          goto ENDnation_
    }
    random( 0, 3 )
   if( ran == 0 )
   {
       D( "由于长期战争的关系,高级装备在这里已经没有卖了." )
   }
   if( ran == 1 )
   {
       D( "采矿需要十字稿和采矿技能,在我这里都能学到.")
   }
   if( ran == 2 )
   {
       D( "只要给钱,用铁做的东西什么都卖,还可以教你打铁的技术哟... ")
   }
   CallSmallMenu( 0, 18 )
end
@Npc00018
;; 公扁痢
   sGetNat(); 磊捞戚捞搁.
    if( yes==4)
    {
          D( " 你好.欢迎光临E龙族.这里是贺坦特村." )
          goto ENDnation_
    }
    random( 0, 3 )
   if( ran == 0 )
   {
       D( "这里是专门卖武器的地方,但是用铁做的物品也可以买卖." )
   }
   if( ran == 1 )
   {
       D( "由于长期战争,现在卖不了多少高级物品.")
   }
   if( ran == 2 )
   {
       D( "欢迎光临. 我是运营武器店的武器专家... ")
   }
   CallSmallMenu( 0, 18 )
end
@Npc00019
;; 狼幅痢
   sGetNat(); 磊捞戚捞搁.
    if( yes==4)
    {
          D( " 这里是服饰店...." )
          goto ENDnation_
    }
    
    random( 0, 3 )
    if( ran == 0 )
    {
        D("不穿衣服的人到处走动是不是很象野人?")
    }     
    if( ran == 1)
    {
         D( "我这里的衣服都是千挑万选." )
    }     
    if( ran == 2 )
    {
        D( "现在已经不接受cell了。 请到银行兑换成crit.. " );
    }
    CallSmallMenu( 0, 24 )
end
@Npc00020   
;; 剧檬痢
   sGetNat(); 磊捞戚捞搁.
    if( yes==4)
    {
          D( " 你好.欢迎光临E龙族.这里是贺坦特村." )
          goto ENDnation_
    }
    random( 0, 2 )
    if( ran == 0 )
    {
        D( " 由于跟杰彭战争的原因,蜡烛有些短缺... " );
    }
    if( ran == 1 )
    {
         D( " 到了村庄外部就有洞窟,在那只能用蜡烛照明.") 
    }
    CallSmallMenu( 0, 23 )
end
@Npc00021
;; 仟赁埃
   sGetNat(); 磊捞戚捞搁.
    if( yes==4)
    {
          D( " 你好.欢迎光临E龙族.这里是贺坦特村." )
          goto ENDnation_
    }
    random( 0, 2 )
    if( ran == 0 )
    {
       D( "若拥有屠宰技能,可以从死亡的动物身上得到肉和毛皮." );
    }
    if( ran == 1 )
    {
         D( "最近提供牛肉给参加杰彭战争的军队...")
    }
    CallSmallMenu( 0, 22 ) 
end
@Npc00022
;; 格傍家
   sGetNat(); 磊捞戚捞搁.
    if( yes==4)
    {
          D( " 你好.欢迎光临E龙族.这里是贺坦特村." )
          goto ENDnation_
    }
   random( 0, 3 )
   if( ran == 0 )
   {
       D( "樵夫们用木材制作了家具和工具." )
   }
   if( ran == 1 )
   {
       D( "其他工会不卖的东西这里都有,随便来挑挑.")
   }
   if( ran == 2 )
   {
       D( "好的木材是制作路木杖所需要的材料哦." )
   }
   CallSmallMenu( 0, 26 )
end
@Npc00023   
;; 痢己贱荤狼 笼
   sGetNat(); 磊捞戚捞搁.
    if( yes==4)
    {
          D( " 你好.欢迎光临E龙族.这里是贺坦特村." )
          goto ENDnation_
    }
    
   random( 0, 3 )
   if( ran == 0 )
   {
       D("在这里可以学到魔法...")
   }
   if( ran == 1)
   {
       D( "你相信MANA的力量吗?" )
   }
   if( ran == 2 )
   {
       D( "世上有一种看不见的力量存在这,叫做大自然之力." )
   }
   CallSmallMenu( 0, 71 )
end
@Npc00024
;; 丑厘
   sGetNat(); 磊捞戚捞搁.
    if( yes==4)
    {
          D( " 你好.欢迎光临E龙族.这里是贺坦特村." )
          goto ENDnation_
    }
   random( 0, 3 )
   if( ran == 0 )
   {
       D( "从土地里生长的一切作物都拥有施慕尼安的光荣 " )
   }
   if( ran == 1)
   {
       D( "想不想养家畜看看?或者开垦田种也可以" )
   }
   if( ran == 2)
   {
       D( "我是贺坦特村中有名的农夫..." )
   }
   CallSmallMenu( 0, 19 )
end
@Npc00025
;; 超矫痢
   sGetNat(); 磊捞戚捞搁.
    if( yes==4)
    {
          D( " 你好.欢迎光临E龙族.这里是贺坦特村." )
          goto ENDnation_
    }
   random( 0, 2 )
   if( ran == 0 )
   {
       D( "你试过晚上钓鱼么?用刚才吊的不知名的鱼做的鱼汤味道真是... " );
   }
   if( ran == 1)
   {
       D( "在那海浪搏斗的船员形象就是真实的人生啊... " );
   }   
   CallSmallMenu( 0, 28 )
end
@Npc00026
;; 惫啊 绊鞭 酒捞袍 惑痢
   sGetNat(); 磊捞戚捞搁.
    if( yes==4)
    {
          D( " 你好.欢迎光临E龙族.这里是贺坦特村." )
          goto ENDnation_
    }
   D("这个商店是用国家基金运营的,你可以通过钱和名声来购买高级道具.")
   CallMenu( 66 )
end
@Npc00027   
;; 劝力累家
   sGetNat(); 磊捞戚捞搁.
    if( yes==4)
    {
          D( " 你好.欢迎光临E龙族.这里是贺坦特村." )
          goto ENDnation_
    }
   random(0,3)
    if( ran == 0 )
    {
        D( "弓与箭对弓箭手来说是非常非常重要的.. " );
    }
    if( ran == 1 )
    {
        D( "好像快要和杰彭打仗喽....高级武器都要交给军队,无法再卖喽.... ")
    }
    if( ran == 2 )
    {
        D( "制作弓与箭需要有樵夫的技能...")
    }
    CallSmallMenu( 0, 27 )
end
@Npc00028   
;; 仟赁埃
   sGetNat(); 磊捞戚捞搁.
    if( yes==4)
    {
          D( " 你好.欢迎光临E龙族.这里是贺坦特村." )
          goto ENDnation_
    }
    D("屠夫有提供肉和皮吧?")
    CallSmallMenu( 0, 22 ) 
end
@Npc00029
;; 丑厘
   sGetNat(); 磊捞戚捞搁.
    if( yes==4)
    {
          D(" 你好.欢迎光临E龙族.这里是贺坦特村.")
          goto ENDnation_
    }
   random( 0, 3 )
   if( ran == 0 )
   {
       D("从土地里生长的一切作物都拥有施慕尼安的光荣.")
   }
   if( ran == 1)
   {
       D("我是贺坦特村中有名的农夫" )
   }
   if( ran == 2)
   {
       D("想不想养家畜看看,或者开垦或种农作物" )
   }
   CallSmallMenu( 0, 19 )
end
@Npc00030
;; 傈眉 傍瘤
   sGetNat(); 磊捞戚捞搁.
    if( yes==4)
    {
          D( "你好.欢迎光临E龙族.这里是贺坦特村." )
          goto ENDnation_
    }
    D( "嗨~贺坦特的各位村民!" )
    CallSmallMenu( 0, 79 )
end
@Npc00031   
;; 林痢
   sGetNat(); 磊捞戚捞搁.
    if( yes==4)
    {
          D( " 你好.欢迎光临E龙族.这里是贺坦特村." )
          goto ENDnation_
    }

    CallSmallMenu( 0, 57 )
end
@Npc00032   
; 格傍家 (痢己贱荤 笼 辟贸)
   sGetNat(); 磊捞戚捞搁.
    if( yes==4)
    {
          D( " 你好.欢迎光临E龙族.这里是贺坦特村." )
          goto ENDnation_
    }
   random( 0, 3 )
   if( ran == 0 )
   {
       D( "好的木材是制作木杖所需要的材料." )
   }
   if( ran == 1 )
   {
       D( "樵夫可以用木材制作家具和工具.")
   }
   if( ran == 2 )
   {
       D( "因为在贺坦特村附近有很多树木,可以很容易的弄到木材." )
   }
   CallSmallMenu( 0, 26 )
end

@Npc00033
;; 楷陛贱荤
sGetNat(); 磊捞戚捞搁.
   if( yes==4)
   {
       D( " 你好.欢迎光临E龙族.这里是贺坦特村." )
       goto ENDnation_
   }
   random(0,3)
   if(ran == 0)
   {
       D(" 用药草做药水,铁和铜一起可以做强金属..哈哈哈哈..")
   }
   if(ran == 1)
   {
   D("做药水的材料是药草,只要有药草就可以做药水.")
   }
   if(ran == 2)
   {
       D(" 做药水的材料是药草,只要有药草就可以做药水.")
   }    
   if(ran == 3)
   {
       D(" 做药水的材料是药草,只要有药草就可以做药水.")
   }    
   CallSmallMenu( 0, 25 )
end
@Npc00034   
;; 抛其府 脚傈 辟贸俊 乐绰 侥樊 芒绊....款康磊狼 厚剐涅胶飘檬扁拳


end
@Npc00035
;; 辨靛包府家
   sGetNat(); 磊捞戚捞搁.
    if( yes==4)
    {
          D( " 警卫！这里有个杰彭人...." )
          goto ENDnation_
    }
    D( "欢迎光临,你是属于哪个工会的?" )
   CallSmallMenu( 0, 76 )
end
@Npc00036
;; hint
   sGetNat(); 磊捞戚捞搁.
    if( yes==4)
    {
          D( " 警卫！这里有个杰彭人...." )
          goto ENDnation_
    }
   D("以风中飘散的大波斯菊之名祝福你... ")
end

@Npc00037
;; 檬焊 救郴 NPC
CmpQuestNumStep(800,0)
   if(yes==1)
   {
   D("欢迎来到E龙族")
   SetQuestNumStep(800,10)
   goto ENDchobo_
   }

CmpQuestNumStep(800,10)
   if(yes==1){
   D("E龙族有很多富有特色的设置.")
   SetQuestNumStep(800,15)
   goto ENDchobo_
}

CmpQuestNumStep(800,15)
   if(yes==1){
   D("在您进入游戏之前，建议您到dr.yedoo.net仔细查看游戏的设置")
   SetQuestNumStep(800,20)
   goto ENDchobo_
}

CmpQuestNumStep(800,20)
   if(yes==1){
   D("祝您游戏愉快，E龙族感谢您的支持")
   SetQuestNumStep(800,0)
   goto ENDchobo_
}
:ENDchobo_
end

@Npc00038   
;; 户笼
    CheckNation(4); 磊捞戚捞搁.
    if( yes==1)
    {
          D( " 你好.欢迎光临E龙族.这里是贺坦特村." )
          goto ENDnation_
    }
   random( 0, 3 )
   if( ran == 0 )
   {
       D("各种料理已经准备好了..")
   }
   if( ran == 1)
   {
       D("现在开始不再收cell币,你可以去银行换成crit..")
   }
   if( ran == 2 )
   {
        D( "要做长途旅行的人必须事先做好准备.." );
   }
   CallSmallMenu( 0, 20 ) 
end
@Npc00039
;; 辨靛 骏器府酒 备涝
   sGetNat(); 磊捞戚捞搁.
    if( yes==4)
    {
          D( " 你好.欢迎光临E龙族.这里是贺坦特村." )
          goto ENDnation_
    }
   D("你想买工会房吗?")
   CallMenu(68)
end
@Npc00040   
;; 距檬痢
   sGetNat(); 磊捞戚捞搁.
    if( yes==4)
    {
          D( " 你好.欢迎光临E龙族.这里是贺坦特村." )
          goto ENDnation_
    }
   random( 0, 3 )
   if( ran == 0 )
   {
       D( "在雨量充沛,阳光普照的贺坦特村,森林生长总是非常茂盛. " );
   }
   if( ran == 1 )
   {
       D( "在这里生长的药草有神秘的功效. " );
   }
   if( ran == 2 )
   {
       D( "虽然药草本身就具有神秘功效,但是制作药剂的材料. " );
   }
   CallSmallMenu( 0, 21 ) 
end
@Npc00041
   sGetNat(); 磊捞戚捞搁.
    if( yes==4)
    {
          D( "你好.欢迎光临E龙族.这里是贺坦特村." )
          goto ENDnation_
    }
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
;SQuest76_npc00043
CmpQuestNumStep(76,0)
if(yes==1)
{
	SendSound(0,0097)
	D( "你好，这里是E龙族金龙交易所.我可以把你包里的银龙换成金龙" )
	D( "目前的兑换比例是 5银龙:1金龙" )
   	SetQuestNumStep(76,5)
    	goto End_QuestNpc00043
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
    		goto End_QuestNpc00043
  	}
  	else
  	{
    		D( "您身上的银龙不够，需要5个才能交换." )
    		SetQuestNumStep(76,0)
    		goto End_QuestNpc00043
  	}     
}

;EQuest76_Npc00043
:End_QuestNpc00043
end
@Npc00044
end
@Npc00045
;; 器呕 牢磐其捞胶 龋免
   sGetNat(); 磊捞戚捞搁.
    if( yes==4)
    {
          D( " 你好.欢迎光临E龙族.这里是贺坦特村." )
          goto ENDnation_
    }
   random( 0, 2 ) 
   if( ran == 0 ) 
   {
       D( "随时都可以把你送到想去的地方. 虽然会收取适当费用,但是会比以前更加方便." ) 
   }
   if( ran == 1 ) 
   {
       D( "随时都可以把你送到想去的地方. 虽然会收取适当费用,但是会比以前更加方便." ) 
   }

    IsLevel(11)
    if( yes == 1)
    {
       CallMenu( 39 )
    }
    else
    {
         EventMsg("你到达11级后才能使用传送.")
         SendSound(0,2061)
   }
end
@Npc00046   
;; 棱拳痢
   sGetNat(); 磊捞戚捞搁.
    if( yes==4)
    {
          D( " 你好.欢迎光临E龙族.这里是贺坦特村." )
          goto ENDnation_
    }
    D( "这里卖的东西是其他地方没有卖的" );
    CallSmallMenu( 0, 60 )    ; 棱拳痢 牢磐其捞胶

end
@Npc00047
;; 劝力累家
   sGetNat(); 磊捞戚捞搁.
    if( yes==4)
    {
          D( " 你好.欢迎光临E龙族.这里是贺坦特村." )
          goto ENDnation_
    }
   random( 0, 3 )
   if( ran == 0 )
   {
       D("战争中弓箭和飞镖的威力都很大~" )
   }
   if( ran == 1 )
   {
       D( "弓箭手当然要配一把好的弓..." )
   }
   if( ran == 2 )
   {
       D( "为了打中远距离的敌人,需要使用飞镖和弓箭.." )
   }
   CallSmallMenu( 0, 27 ) 


end
@Npc00048
;; Change the Color (渴, 厘侥 拿矾 背眉)
   sGetNat(); 磊捞戚捞搁.
    if( yes==4)
    {
          D( " 你好.欢迎光临E龙族.这里是贺坦特村." )
          goto ENDnation_
    }
   random( 0, 3 )
   if( ran == 0 )
   {
       D("你好..这里可以换衣服和皮肤的颜色. ")
   }
   if( ran == 1 )
   {
       D( "换吧~! 换吧~! 衣服和皮肤的颜色不满意?让我来帮你换吧..")
   }
   if( ran == 2 )
   {
       D( "换衣服和皮肤的颜色需要很多钱也." )
   }
   CallMenu(28)
end
@Npc00049
;; 惫啊饶盔雀 (惫啊扁何陛)
   sGetNat(); 磊捞戚捞搁.
    if( yes==4)
    {
          D( " 你好.欢迎光临E龙族.这里是贺坦特村." )
          goto ENDnation_
    }
	random( 0, 3 )
   if( ran == 0 )
   {
       D("捐款可以提高你的名声")
   }
   if( ran == 1 )
   {
       D( "拜索斯以你为荣...")
   }
   if( ran == 2 )
   {
       D( "这些钱会用在拜索斯国的建设上." )
   }
   CallSmallMenu( 0, 77 )
:ENDnation_
end





@Event00000
;; 绒促牢碍
    MapMove( "Source", 270,8 )
       if( yes == 1 ) 
   {
       EventMsg( "往修多恩河移动." ) 
   }
   else
   {
       EventMsg( "地图移动失败." ) 
   }
end

@Event00001
;; 秋畔飘己
    MapMove( "K_Sung2", 344,224 )
       if( yes == 1 ) 
   {
       EventMsg( "望贺坦特城移动." ) 
   }
   else
   {
       EventMsg( "地图移动失败." ) 
   }
end

@Event00002
;; 绒促牢 绊俺
    MapMove( "Hu_Vm", 9,10 )
       if( yes == 1 ) 
   {
       EventMsg( "往修多恩山谷移动." ) 
   }
   else
   {
       EventMsg( "地图移动失败." ) 
   }
end

@Event00003       
;; 雀祸魂钙
    MapMove( "Gray", 346,349 )
       if( yes == 1 ) 
   {
       EventMsg( "往灰色山脉移动." ) 
   }
   else
   {
       EventMsg( "地图移动失败." ) 
   }
end

@Event00004
;; 檬焊磊 救郴家
;; 饭骇 7 捞窍鳖瘤 免涝啊瓷
    IsLevel(7)
    if( yes == 1)
    {
        EventMsg("你已经不是新手了，无法进入新手村")
         QuestSound(15007)
    }
    else
    {
                   MapMove( "Scholium2", 51, 164 )
       if( yes == 1 )
       {
           EventMsg("移动到新手村.")
           QuestSound(15007)
       }
       else
       {
           EventMsg("地图移动失败.")
       }
    }
end

@Event00005

end

@Event00006
; 辨靛笼栏肺
   GotoGuildHouse()
   if( yes == 1 )
   {
       EventMsg( "移动到工会屋." )
       goto ENDgh_
   }
   else
   {
       EventMsg( "移动失败." )
       goto ENDgh_
   }
:ENDgh_
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