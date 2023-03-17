onClipEvent(load){
   function refresh()
   {
      if(_root["tank_" + _root.na_rade.tank_number].energy < _root["tank_" + _root.na_rade.tank_number].max_energy && 0 < _root["tank_" + _root.na_rade.tank_number].specials[1] && _root.na_rade.type == "tank")
      {
         gotoAndStop(1);
      }
      else
      {
         gotoAndStop(2);
      }
      count = _root["tank_" + _root.na_rade.tank_number].specials[1];
   }
}
