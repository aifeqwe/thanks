onClipEvent(load){
   function refresh()
   {
      if(_root.na_rade.type == "tank")
      {
         sh1.refresh();
         sh2.refresh();
         sh3.refresh();
         sh4.refresh();
         sh_d.refresh();
      }
      else
      {
         gotoAndStop(3);
      }
   }
}
