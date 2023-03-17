on(release){
   if(_root["tank_" + _root.na_rade.tank_number].max_energy >= _root["tank_" + _root.na_rade.tank_number].energy + 10)
   {
      _root["tank_" + _root.na_rade.tank_number].energy += 10;
   }
   else
   {
      _root["tank_" + _root.na_rade.tank_number].energy = _root["tank_" + _root.na_rade.tank_number].max_energy;
   }
   _root["tank_" + _root.na_rade.tank_number].specials[1]--;
   refresh();
}
