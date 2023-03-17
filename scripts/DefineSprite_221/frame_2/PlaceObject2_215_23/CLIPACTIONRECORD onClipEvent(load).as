onClipEvent(load){
   function refresh()
   {
      if(0 < _root["tank_" + _root.na_rade.tank_number].specials[6] && _root.na_rade.sh_active == false)
      {
         gotoAndStop(1);
      }
      else
      {
         gotoAndStop(3);
      }
   }
}
