@sys00   ; 籀擠 憮幗 Setting?朝 ?熱.

  MaxNPC( 50 )
  
  MapName( "venom3" )
  
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
;SQuest30_Npc00030
CmpQuestNumStep(30,0)
if( yes==1 ){
  UpDualClassItem(0)
  if(yes==0){
  D("我是负责升级文章的人,可您还没有1转纹章可升级.")
  EventMsg("没有纹章可升级，必须拥有1转纹章.")     ;Stay0
  SetQuestNumStep(30,0)
  goto End_QuestNpc00030 
}
  if(yes==1){
  D("升级纹章属性需要付出一定的代价.")
  EventMsg("需要1个银龙来完成2转纹章升级'.")
  D("你能给我一个银龙吗?")     ;Stay95
  SetQuestNumStep(30,95)
  goto End_QuestNpc00030 
}
  else{
  D(".")     ;Stay1005
  SetQuestNumStep(30,1005)
  goto End_QuestNpc00030 
}
}
CmpQuestNumStep(30,95)
  if(yes==1){
  D("请给我1个银龙我再给你升级...")     ;Stay195
  SetQuestNumStep(30,195)
  goto End_QuestNpc00030 
}

CmpQuestNumStep(30,195)
  if(yes==1){
  CheckItemMulti(10200,1)
  if(yes==1){
  DeleteItemMulti(10200,1)
  if(yes==1){
  SendSound(0,1310)     ;Stay295
  SetQuestNumStep(30,295)
  goto End_QuestNpc00030 
}
}
  else{
  EventMsg("需要1个银龙来升级纹章.")
  D("必须要带1个银龙才能完成2转纹章升级.")     ;Stay195
  SetQuestNumStep(30,195)
  goto End_QuestNpc00030 
}
}

CmpQuestNumStep(30,295)
  if(yes==1){
  IsClassPC(0)
  if(yes==1){
  UpDualClassItem(1)
  EventMsg("纹章属性成功升级到了2转.")
  D("恭喜你，2转纹章升级成功了.")     ;Stay1005
  SetQuestNumStep(30,1005)
  goto End_QuestNpc00030 
}
  else{
  D("谢谢你的银龙^_^")     ;Stay395
  SetQuestNumStep(30,395)
  goto End_QuestNpc00030 
}
}

CmpQuestNumStep(30,395)
  if(yes==1){
  IsClassPC(1)
  if(yes==1){
  UpDualClassItem(1)
  D("9999恭喜你，您的2转纹章已经升级成功.")     ;Stay1005
  SetQuestNumStep(30,1005)
  goto End_QuestNpc00030 
}
  else{
  D("101010103转纹章的升级需要1个金龙，并且完成3转任务")     ;Stay495
  SetQuestNumStep(30,495)
  goto End_QuestNpc00030 
}
}

CmpQuestNumStep(30,495)
  if(yes==1){
  IsClassPC(2)
  if(yes==1){
  UpDualClassItem(1)
  EventMsg("11 11 11 11需要1个金龙龙'.")
  D("12 12 12 12需要1个金龙来升级纹章.")     ;Stay1005
  SetQuestNumStep(30,1005)
  goto End_QuestNpc00030 
}
  else{
  D("...")     ;Stay595
  SetQuestNumStep(30,595)
  goto End_QuestNpc00030 
}
}

CmpQuestNumStep(30,595)
  if(yes==1){
  IsClassPC(3)
  if(yes==1){
  UpDualClassItem(1)
  ShowLearnDualMagic()
  D("13 13 13需要1个金龙来升级纹章.")     ;Stay1005
  SetQuestNumStep(30,1005)
  goto End_QuestNpc00030 
}
  else{
  D("....")     ;Stay695
  SetQuestNumStep(30,695)
  goto End_QuestNpc00030 
}
}

CmpQuestNumStep(30,695)
  if(yes==1){
  IsClassPC(4)
  if(yes==1){
  UpDualClassItem(1)
  ShowLearnDualMagic()
  D("14 14 14需要1个金龙来升级纹章.")     ;Stay1005
  SetQuestNumStep(30,1005)
  goto End_QuestNpc00030 
}
  else{
  D(".....")     ;Stay0
  SetQuestNumStep(30,0)
  goto End_QuestNpc00030 
}
}
CmpQuestNumStep(30,1005)
  if(yes==1){
  UpDualClassItem(0)
  if(yes==2){
  D("......")     ;Stay1095
  SetQuestNumStep(30,1095)
  goto End_QuestNpc00030 
}
  else{
  D(".......")     ;Stay1695
  SetQuestNumStep(30,1695)
  goto End_QuestNpc00030 
}
}

CmpQuestNumStep(30,1095)
  if(yes==1){
  CheckItemMulti(10199,1)
  if(yes==1){
  DeleteItemMulti(10199,1)
  if(yes==1){
  SendSound(0,1310)     ;Stay1195
  SetQuestNumStep(30,1195)
  goto End_QuestNpc00030 
}
}
  else{
  EventMsg("需要1个金龙来完成升级.")
  D("需要1个金龙来升级纹章.")     ;Stay1095
  SetQuestNumStep(30,1095)
  goto End_QuestNpc00030 
}
}

CmpQuestNumStep(30,1195)
  if(yes==1){
  IsClassPC(0)
  if(yes==1){
  UpDualClassItem(1)
  D("16 16 16恭喜你，纹章升级成功.")     ;Stay1695
  SetQuestNumStep(30,1695)
  goto End_QuestNpc00030 
}
  else{
  D(".......")     ;Stay1295
  SetQuestNumStep(30,1295)
  goto End_QuestNpc00030 
}
}

CmpQuestNumStep(30,1295)
  if(yes==1){
  IsClassPC(1)
  if(yes==1){
  UpDualClassItem(1)
  EventMsg("纹章属性成功升级到3转.")
  D("恭喜你，纹章升级成功.")     ;Stay1695
  SetQuestNumStep(30,1695)
  goto End_QuestNpc00030 
}
  else{
  D("...........")     ;Stay1395
  SetQuestNumStep(30,1395)
  goto End_QuestNpc00030 
}
}

CmpQuestNumStep(30,1395)
  if(yes==1){
  IsClassPC(2)
  if(yes==1){
  UpDualClassItem(1)
  D("17 17 17 17需要3个金龙来升级纹章.")     ;Stay1695
  SetQuestNumStep(30,1695)
  goto End_QuestNpc00030 
}
  else{
  D("............")     ;Stay1495
  SetQuestNumStep(30,1495)
  goto End_QuestNpc00030 
}
}

CmpQuestNumStep(30,1495)
  if(yes==1){
  IsClassPC(3)
  if(yes==1){
  UpDualClassItem(1)
  ShowLearnDualMagic()
  D("18 18 18 18需要3个金龙来升级纹章.")     ;Stay1695
  SetQuestNumStep(30,1695)
  goto End_QuestNpc00030 
}
  else{
  D(".............")     ;Stay1595
  SetQuestNumStep(30,1595)
  goto End_QuestNpc00030 
}
}

CmpQuestNumStep(30,1595)
  if(yes==1){
  IsClassPC(4)
  if(yes==1){
  UpDualClassItem(1)
  ShowLearnDualMagic()
  D("19 19 19需要3个金龙来升级纹章.")     ;Stay1695
  SetQuestNumStep(30,1695)
  goto End_QuestNpc00030 
}
  else{
  D(".............")     ;Stay0
  SetQuestNumStep(30,0)
  goto End_QuestNpc00030 
}
}
CmpQuestNumStep(30,1695)
  if(yes==1){
  UpDualClassItem(0)
  if(yes==3){
  D(".......")     ;Stay1705
  SetQuestNumStep(30,1705)
  goto End_QuestNpc00030 
}
  else{
  D("............")
  SetQuestNumStep(30,1700)
  goto End_QuestNpc00030 
}
}

CmpQuestNumStep(30,1705)
  if(yes==1){
  CheckItemMulti(10199,3)
  if(yes==1){
  DeleteItemMulti(10199,3)
  if(yes==1){
  SendSound(0,1310)     ;Stay1795
  SetQuestNumStep(30,1795)
  goto End_QuestNpc00030 
}
}
  else{
  EventMsg("需要3个金龙来升级4转纹章.")
  D("需要3个金龙来升级纹章.")     ;Stay1705
  SetQuestNumStep(30,1705)
  goto End_QuestNpc00030 
}
}

CmpQuestNumStep(30,1795)
  if(yes==1){
  IsClassPC(0)
  if(yes==1){
  UpDualClassItem(1)     ;Stay2995
  SetQuestNumStep(30,2995)
  goto End_QuestNpc00030 
}
  else{
  D("谢谢你的金龙^_^")     ;Stay1895
  SetQuestNumStep(30,1895)
  goto End_QuestNpc00030 
}
}

CmpQuestNumStep(30,1895)
  if(yes==1){
  IsClassPC(1)
  if(yes==1){
  UpDualClassItem(1)     ;Stay2995
  SetQuestNumStep(30,2995)
  goto End_QuestNpc00030 
}
  else{
  D(".........")     ;Stay1995
  SetQuestNumStep(30,1995)
  goto End_QuestNpc00030 
}
}

CmpQuestNumStep(30,1995)
  if(yes==1){
  IsClassPC(2)
  if(yes==1){
  UpDualClassItem(1)     ;Stay2995
  SetQuestNumStep(30,2995)
  goto End_QuestNpc00030 
}
  else{
  D("...........")     ;Stay2095
  SetQuestNumStep(30,2095)
  goto End_QuestNpc00030 
}
}

CmpQuestNumStep(30,2095)
  if(yes==1){
  IsClassPC(3)
  if(yes==1){
  UpDualClassItem(1)     ;Stay2995
  SetQuestNumStep(30,2995)
  goto End_QuestNpc00030 
}
  else{
  D(".............")     ;Stay2195
  SetQuestNumStep(30,2195)
  goto End_QuestNpc00030 
}
}

CmpQuestNumStep(30,2195)
  if(yes==1){
  IsClassPC(4)
  if(yes==1){
  UpDualClassItem(1)     ;Stay2995
  SetQuestNumStep(30,2995)
  goto End_QuestNpc00030 
}
  else{
  D(".......")     ;Stay0
  SetQuestNumStep(30,0)
  goto End_QuestNpc00030 
}
}
CmpQuestNumStep(30,2995)
  if(yes==1){
  D("你的进阶纹章已经不能再升级了.")     ;End
  SetQuestNumStep(30,9999)
  goto End_QuestNpc00030 
}

;EQuest30_Npc00030
:End_QuestNpc00030
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
  IsInvHavePC(9089)
  if(yes==1){
  CheckItemMulti(10239,1)
  if(yes>=1){
  DeleteItemMulti(10239,1)
  if(yes==1){
  QuestTeleport(1,30,309)
  if( yes == 1 ) {
  ScriptTimer(1800,"venom2",274,266)
  EventMsg("进入考验之室，计时开始. ")
}
  else {
  EventMsg("时间到了，移动到2楼开始处. ")
}
}
}
  else{
  EventMsg("移动需要'魔力金属'.")
}
}
  else{
  EventMsg("移动時 需要'星之冠'.")
}

end
@Event00002     
  IsInvHavePC(9089)
  if(yes==1){
  CheckItemMulti(10241,1)
  if(yes>=1){
  DeleteItemMulti(10241,1)
  if(yes==1){
  QuestTeleport(1,405,121)
  if( yes == 1 ) {
  EventMsg("往 <誓约之室> 移动. ")
}
  else {
  EventMsg("时间到了，移动到2楼开始处. ")
}
}
}
  else{
  EventMsg("移动需要 '眼魔的觸鬚' .")
}
}
  else{
  EventMsg("移动時 需要'星之冠'.")
}

end
@Event00003
  IsInvHavePC(9089)
  if(yes==1){
  CheckItemMulti(10240,1)
  if(yes>=1){
  DeleteItemMulti(10240,1)
  QuestTeleport(1,282,448)
  if(yes==1){
  ScriptTimer(1800,"venom2",274,266)
  if( yes == 1 ) {
  EventMsg("进入真实之室，计时开始. ")
}
  else {
  EventMsg("时间到了，移动到2楼开始处. ")
}
}
}
  else{
  EventMsg("移动需要 '树妖的枝枒' .")
}
}
  else{
  EventMsg("移动時 需要'星之冠'.")
}

end
@Event00004     
  QuestTeleport(1,198,350)
  if(yes == 1) {
  EventMsg("往三楼等待所移动. ")
  ScriptTimer(0,"0",0,0)
}
  else {
  EventMsg("时间到了，移动到2楼开始处. ")
}

end
@Event00005   
  QuestTeleport(1,198,350)
  if(yes == 1) {
  EventMsg("往三楼等待所移动. ")
  ScriptTimer(0,"0",0,0)
}
  else {
  EventMsg("时间到了，移动到2楼开始处. ")
}

end
@Event00006     
  MapMove("northern_w",262,87)
  if(yes==1){
  EventMsg("往 <瓦南平原北部> 移动. ")
}
  else{
  EventMsg("无法移动到其他地区.")
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
