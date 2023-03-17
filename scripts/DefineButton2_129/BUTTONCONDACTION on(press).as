on(press){
   if(_root.na_rade.type == "tank")
   {
      if(100 >= _root["tank_" + _root.na_rade.tank_number].energy)
      {
         startDrag("",0,0,100 - _root["tank_" + _root.na_rade.tank_number].energy,0,100);
      }
      else
      {
         startDrag("",0,0,0,0,100);
      }
      _parent.sdrag = true;
   }
}
