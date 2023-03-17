onClipEvent(enterFrame){
   if(sdrag)
   {
      _root.na_rade.power = 100 - Math.round(pow._y);
      if(pow._y < 0)
      {
         pow._y = 0;
      }
   }
   else
   {
      pow._y = 100 - _root.na_rade.power;
   }
   shadow._y = - _root["tank_" + _root.na_rade.tank_number].energy;
}
