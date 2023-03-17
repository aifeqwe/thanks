onClipEvent(enterFrame){
   if(_root.na_rade.type == "tank")
   {
      if(left)
      {
         _root.na_rade.move_left();
      }
      else if(right)
      {
         _root.na_rade.move_right();
      }
      if(_root["tank_" + _root.na_rade.tank_number].fuel == 0)
      {
         left = false;
         right = false;
      }
   }
}
