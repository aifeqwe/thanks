onClipEvent(load){
   function view_forward()
   {
      d = false;
      i = _root["tank_" + _root.na_rade.tank_number].cur_gun + 1;
      while(_root.weapons.length >= i)
      {
         if(0 < _root["tank_" + _root.na_rade.tank_number].guns[i])
         {
            _root["tank_" + _root.na_rade.tank_number].cur_gun = i;
            d = true;
            this.change_icon();
            break;
         }
         i++;
      }
      if(d == false)
      {
         i = 0;
         while(_root.weapons.length >= i)
         {
            if(0 < _root["tank_" + _root.na_rade.tank_number].guns[i])
            {
               _root["tank_" + _root.na_rade.tank_number].cur_gun = i;
               this.change_icon();
               break;
            }
            i++;
         }
      }
   }
   function view_backward()
   {
      d = false;
      i = _root["tank_" + _root.na_rade.tank_number].cur_gun - 1;
      while(i >= 0)
      {
         if(0 < _root["tank_" + _root.na_rade.tank_number].guns[i])
         {
            _root["tank_" + _root.na_rade.tank_number].cur_gun = i;
            d = true;
            this.change_icon();
            break;
         }
         i--;
      }
      if(d == false)
      {
         i = _root.weapons.length;
         while(i >= 0)
         {
            if(0 < _root["tank_" + _root.na_rade.tank_number].guns[i])
            {
               _root["tank_" + _root.na_rade.tank_number].cur_gun = i;
               this.change_icon();
               break;
            }
            i--;
         }
      }
   }
}
