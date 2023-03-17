onClipEvent(load){
   function refresh()
   {
      count = _root["tank_" + _root.na_rade.tank_number].specials[7];
      if(0 < count && _root.na_rade.type == "tank")
      {
         gotoAndStop(1);
      }
      else
      {
         gotoAndStop(2);
      }
   }
}
