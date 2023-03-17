onClipEvent(load){
   function refresh()
   {
      count = _root["tank_" + _root.na_rade.tank_number].specials[0];
      if(count == 0 && _root.na_rade.par_used == false || _root.na_rade.type == "ai")
      {
         gotoAndStop(3);
      }
      else if(_root.na_rade.par)
      {
         gotoAndStop(2);
      }
      else
      {
         gotoAndStop(1);
      }
   }
}
