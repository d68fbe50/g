@sys00   ; 籀擠 憮幗 Setting?朝 ?熱.

  MaxNPC( 50 )
  
  MapName( "venom2" )
  
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





@Event00000     
end
@Event00001     
end
@Event00002   ;;2類 轎掘
  MapMove("venom1",526,470)
  if( yes == 1 ) {
  EventMsg(" 往毒洞窟一楼移动. ")
}
  else {
  EventMsg(" 无法移动到其他地区. ")
}

end
@Event00003   ;;3類 殮掘
  IsInvHavePC(9089)
  if(yes==1){
  CheckItemMulti(10239,1)
  if(yes>=1){
  DeleteItemMulti(10239,1)
  if(yes==1){
  MapMove("venom3",10,529)
  if( yes == 1 ) {
  EventMsg(" 往毒洞窟三楼移动. ")
}
  else {
  EventMsg("无法移动到其他地区. ")
}
}
}
  else{
  EventMsg("到3楼需要'魔力金性'.")
}
}
  else{
  EventMsg("往3楼移动需要'星之冠'.")
}

end
@Event00004   ;;3廓寞 殮掘 ?瓚
  IsInvHavePC(9089)
  if(yes==1){
  CheckItemMulti(10237,1)
  if(yes>=1){
  DeleteItemMulti(10237,1)
  if(yes==1){
  QuestTeleport(1,451,84)
  if(yes==1){
  ScriptTimer(1800,"venom1",325,272)
  EventMsg("进入束缚之室，计时开始.")
}
  else{
  EventMsg("时间到了，移动到1楼开始处")
}
}
}
  else{
  EventMsg("往束縛之室移动需要 '百眼怪的牙齒'.")
}
}
  else{
  EventMsg("移动時 需要'星之冠'.")
}

end
@Event00005   ;;4廓寞 殮掘 ?瓚
  IsInvHavePC(9089)
  if(yes==1){
  CheckItemMulti(10238,1)
  if(yes>=1){
  DeleteItemMulti(10238,1)
  if(yes==1){
  QuestTeleport(1,85,444)
  if(yes==1){
  ScriptTimer(1800,"venom1",325,272)
  EventMsg("进入试练之室，计时开始.")
}
  else{
  EventMsg("时间到了，移动到1楼开始处.")
}
}
}
  else{
  EventMsg("要进入此房間 需要'星之砂'.")
}
}
  else{
  EventMsg("移动時 需要'星之冠'.")
}

end
@Event00006   ;;3廓寞 轎掘 ?瓚
  QuestTeleport(1,274,266)
  if(yes == 1) {
  EventMsg("往二楼等待所移动. ")
  ScriptTimer(0,"0",0,0)
}
  else {
  EventMsg("时间到了，移动到1楼开始处. ")
}

end
@Event00007   ;;4廓寞 轎掘 ?瓚
  QuestTeleport(1,274,266)
  if(yes == 1) {
  EventMsg("往二楼等待所移动. ")
  ScriptTimer(0,"0",0,0)
}
  else {
  EventMsg("时间到了，移动到1楼开始处. ")
}

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