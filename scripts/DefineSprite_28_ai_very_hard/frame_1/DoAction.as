function test_hill()
{
   calc_hill_up();
   if(_root["land" + Math.ceil(_X - _width / 2)]._y - _root["land" + Math.ceil(_X - _width / 2)]._height / 2 < _Y - hill_up || _root["land" + Math.floor(_X - _width / 2)]._y - _root["land" + Math.floor(_X - _width / 2)]._height / 2 < _Y - hill_up)
   {
      _X = _X + 0.7;
      test = false;
      left = false;
      right = false;
   }
   else if(_root["land" + Math.floor(_X + _width / 2)]._y - _root["land" + Math.floor(_X + _width / 2)]._height / 2 < _Y - hill_up || _root["land" + Math.ceil(_X + _width / 2)]._y - _root["land" + Math.ceil(_X + _width / 2)]._height / 2 < _Y - hill_up)
   {
      left = false;
      right = false;
      _X = _X - 0.7;
      test = false;
   }
   else
   {
      left = true;
      right = true;
   }
}
function blik()
{
   _root.attachMovie("blk","blik",10030);
   _root.blik._x = _X;
   _root.blik._y = _Y - 10;
}
function calc_hill_up()
{
   hill_up = 0.5 + _root["tank_" + tank_number].specials[11] - fall * 10;
}
function move_left()
{
   _X = _X - 0.5;
   _root["tank_" + tank_number].fuel -= fuel_c;
   moving = true;
   i = 1;
   while(i < _root.pocet_hracu + 1)
   {
      if(hitTest(_root["tank" + i]) && i != tank_number)
      {
         _X = _X + 0.6;
      }
      i++;
   }
}
function move_right()
{
   _X = _X + 0.5;
   _root["tank_" + tank_number].fuel -= fuel_c;
   moving = true;
   i = 1;
   while(i < _root.pocet_hracu + 1)
   {
      if(hitTest(_root["tank" + i]) && i != tank_number)
      {
         _X = _X - 0.6;
      }
      i++;
   }
}
function activate_shield(shield)
{
   _root.attachMovie(_root.specials[2 + shield][4],"shield" + tank_number,5040 + tank_number);
   _root["shield" + tank_number].num = tank_number;
   _root["tank_" + tank_number].specials[2 + shield]--;
   sh_active = true;
   _root["t" + tank_number] = _root["shield" + tank_number];
}
function disable_shield()
{
   _root["shield" + tank_number].disable();
   sh_active = false;
   _root["t" + tank_number] = _root["tank" + tank_number];
}
function p_m(par)
{
   if(0 < par)
   {
      return 1;
   }
   return -1;
}
function calc_first_shot()
{
   p_rotace = 90 + p_m(target._x - _X) * 45;
   p_x = _X;
   p_power = Math.abs(_X - target._x) / (2 + Math.abs(_X - target._x) / 80) - p_m(target._x - _X) * _root.vitr / 13 + (_Y - target._y) / 20;
   if(p_power >= _root["tank_" + tank_number].energy)
   {
      p_power = _root["tank_" + tank_number].energy;
   }
}
function calc_shot()
{
   last_shot_vzd = Math.sqrt(Math.abs((_X - last_shot_x) * (_X - last_shot_x)) + Math.abs((_Y - last_shot_y) * (_Y - last_shot_y)));
   target_vzd = Math.sqrt(Math.abs((_X - target._x) * (_X - target._x)) + Math.abs((_Y - target._y) * (_Y - target._y)));
   x_vzd = Math.abs(last_shot_x - target._x);
   y_vzd = Math.abs(last_shot_y - target._y);
   if(power >= _root["tank_" + tank_number].energy || power == 100)
   {
      full_power = true;
   }
   else
   {
      full_power = false;
   }
   wind_change_koef = 7;
   wind_koef_vzd_koef = 380;
   vzd_koef = 10.9;
   vzd_koef_k = 7 + Math.abs(_X - last_shot_x) / 80;
   y_vzd_koef = 30;
   y_koef = 22;
   rot_r = 100 - (200 - Math.abs(_X - target._x)) / 30;
   rot_l = 80 + (200 - Math.abs(_X - target._x)) / 30;
   if(_X < target._x)
   {
      wind_koef_vzd_koef -= (180 - rotace) * 3;
      y_koef += (135 - rotace) * 1.7;
      if(last_shot_x < _X)
      {
         _root.z_f_used = "1.1";
         p_rotace += (_X - last_shot_x) / 10 + (target._x - _X) / 20 - _root.vitr / 50;
      }
      else if((60 < last_shot_vzd || target_vzd < 70 || power < 10) && (power < 70 || 200 < last_shot_vzd))
      {
         _root.z_f_used = "1.2.1.failed";
         if(last_shot_x >= target._x)
         {
            if(20 < x_vzd)
            {
               _root.z_f_used = "1.2.1.1.1";
               p_power -= x_vzd / (vzd_koef + 2.5 - Math.abs(135 - rotace) / vzd_koef_k) + (_root.vitr - last_wind) / (wind_change_koef - Math.abs(last_shot_x - _X) / wind_koef_vzd_koef) - (last_shot_y - target._y) / y_koef;
            }
            else
            {
               _root.z_f_used = "1.2.1.1.2";
               p_power -= x_vzd / (vzd_koef - 1 - Math.abs(135 - rotace) / vzd_koef_k) + (_root.vitr - last_wind) / (wind_change_koef - Math.abs(last_shot_x - _X) / wind_koef_vzd_koef);
            }
         }
         else if(last_shot_y < target._y)
         {
            if(target._y < _Y)
            {
               if(80 < _Y - target._y && y_vzd < 80 && 20 < y_vzd && last_shot_vzd < 100 && 220 < target_vzd && 30 < power && rot_r - _root.vitr / 7 < rotace)
               {
                  _root.z_f_used = "1.2.1.2.1.1.1";
                  p_rotace -= (rotace - (rot_r - _root.vitr / 7)) / 4 + _root.vitr / 20 - target_vzd / 100;
               }
               else if(rotace < rot_r - _root.vitr / 7)
               {
                  _root.z_f_used = "1.2.1.2.1.1.2.";
                  p_power += x_vzd / (vzd_koef - Math.abs(135 - rotace) / vzd_koef_k) - (_root.vitr - last_wind) / (wind_change_koef - Math.abs(last_shot_x - _X) / wind_koef_vzd_koef) + (last_shot_y - target._y) / y_koef;
               }
               else if(y_vzd < 30 && x_vzd < 200)
               {
                  _root.z_f_used = "1.2.1.2.1.1.3";
                  p_power += x_vzd / (vzd_koef - Math.abs(135 - rotace) / vzd_koef_k) - (_root.vitr - last_wind) / (wind_change_koef - Math.abs(last_shot_x - _X) / wind_koef_vzd_koef) + (last_shot_y - target._y) / y_koef;
               }
               else if(y_vzd >= 30)
               {
                  if(300 < target._x - _X && power < 50 && rotace < 110)
                  {
                     _root.z_f_used = "1.2.1.2.1.1.4.1";
                     p_power += x_vzd / (vzd_koef / 3) - (_root.vitr - last_wind) / (wind_change_koef - Math.abs(last_shot_x - _X) / wind_koef_vzd_koef);
                  }
                  else if(rot_r - _root.vitr / 7 < rotace)
                  {
                     if(135 >= p_rotace)
                     {
                        _root.z_f_used = "1.2.1.2.1.1.4.2.1";
                        p_power += x_vzd / (vzd_koef * 2) - (_root.vitr - last_wind) / (wind_change_koef - Math.abs(last_shot_x - _X) / wind_koef_vzd_koef) + y_vzd / y_vzd_koef + (135 - rotace) / 8 - _root.vitr / 15 + (rotace - (rot_r - _root.vitr / 7)) / 8;
                     }
                     else
                     {
                        _root.z_f_used = "1.2.1.2.1.1.4.2.2";
                        p_power += x_vzd / (vzd_koef * 2) - (_root.vitr - last_wind) / (wind_change_koef - Math.abs(last_shot_x - _X) / wind_koef_vzd_koef) + y_vzd / y_vzd_koef - _root.vitr / 15;
                     }
                     p_rotace -= (rotace - (rot_r - _root.vitr / 7)) / 4.5 + y_vzd / y_vzd_koef;
                  }
               }
            }
            else if(target._y - _Y < 70 && y_vzd < 100 && 20 < y_vzd && last_shot_vzd < 100 && 250 < target_vzd && 30 < power && rot_r - _root.vitr / 7 < rotace)
            {
               _root.z_f_used = "1.2.1.2.1.2.1";
               p_rotace -= (rotace - (rot_r - _root.vitr / 7)) / 4.5 + _root.vitr / 20 - target_vzd / 100;
            }
            else if(rotace < rot_r - _root.vitr / 7)
            {
               _root.z_f_used = "1.2.1.2.1.2.2";
               p_power += x_vzd / (vzd_koef - Math.abs(135 - rotace) / vzd_koef_k) - (_root.vitr - last_wind) / (wind_change_koef - Math.abs(last_shot_x - _X) / wind_koef_vzd_koef) + (last_shot_y - target._y) / y_koef;
            }
            else if(y_vzd < 30 && x_vzd < 200)
            {
               _root.z_f_used = "1.2.1.2.1.2.3";
               p_power += x_vzd / (vzd_koef - Math.abs(135 - rotace) / vzd_koef_k) - (_root.vitr - last_wind) / (wind_change_koef - Math.abs(last_shot_x - _X) / wind_koef_vzd_koef) + (last_shot_y - target._y) / y_koef;
            }
            else if(y_vzd >= 30)
            {
               if(200 < target._y - _Y && _Y < last_shot_y)
               {
                  _root.z_f_used = "1.2.1.2.1.2.4.1";
                  if(120 < p_rotace)
                  {
                     _root.z_f_used = "1.2.1.2.1.2.4.1.1";
                     p_power += x_vzd / (vzd_koef / 1.5) - (_root.vitr - last_wind) / (wind_change_koef - Math.abs(last_shot_x - _X) / wind_koef_vzd_koef);
                  }
                  else
                  {
                     _root.z_f_used = "1.2.1.2.1.2.4.1.2";
                     p_power += x_vzd / (vzd_koef / 2) - (_root.vitr - last_wind) / (wind_change_koef - Math.abs(last_shot_x - _X) / wind_koef_vzd_koef);
                  }
               }
               else if(300 < target._x - _X && power < 50 && rotace < 110)
               {
                  _root.z_f_used = "1.2.1.2.1.2.4.2.";
                  p_power += x_vzd / (vzd_koef / 3) - (_root.vitr - last_wind) / (wind_change_koef - Math.abs(last_shot_x - _X) / wind_koef_vzd_koef);
               }
               else if(rot_r - _root.vitr / 7 < rotace)
               {
                  if(135 >= p_rotace)
                  {
                     _root.z_f_used = "1.2.1.2.1.2.4.3.1.";
                     p_power += x_vzd / (vzd_koef * 2) - (_root.vitr - last_wind) / (wind_change_koef - Math.abs(last_shot_x - _X) / wind_koef_vzd_koef) - y_vzd / y_vzd_koef + (135 - rotace) / 8 - _root.vitr / 15 + (rotace - (rot_r - _root.vitr / 7)) / 8;
                  }
                  else
                  {
                     _root.z_f_used = "1.2.1.2.1.2.4.3.2.";
                     p_power += x_vzd / (vzd_koef * 2) - (_root.vitr - last_wind) / (wind_change_koef - Math.abs(last_shot_x - _X) / wind_koef_vzd_koef) - y_vzd / y_vzd_koef - _root.vitr / 15;
                  }
                  p_rotace -= (rotace - (rot_r - _root.vitr / 7)) / 4.5 + y_vzd / y_vzd_koef;
               }
            }
         }
         else if(last_shot_vzd < 150 && target._x - _X < 170 || last_shot_vzd >= 100 || last_shot_vzd < 100 && power < 30)
         {
            if(target._y < _Y)
            {
               p_power += x_vzd / (vzd_koef - Math.abs(135 - rotace) / vzd_koef_k) - (_root.vitr - last_wind) / (wind_change_koef - Math.abs(last_shot_x - _X) / wind_koef_vzd_koef) + (last_shot_y - target._y) / y_koef;
               _root.z_f_used = "1.2.1.2.2.1.1";
            }
            else if(100 < target._y - _Y)
            {
               _root.z_f_used = "1.2.1.2.2.1.2.1";
               p_power += x_vzd / (vzd_koef - Math.abs(135 - rotace) / vzd_koef_k) - (_root.vitr - last_wind) / (wind_change_koef - Math.abs(last_shot_x - _X) / wind_koef_vzd_koef);
            }
            else
            {
               _root.z_f_used = "1.2.1.2.2.1.2.2";
               p_power += x_vzd / (vzd_koef - Math.abs(135 - rotace) / vzd_koef_k) - (_root.vitr - last_wind) / (wind_change_koef - Math.abs(last_shot_x - _X) / wind_koef_vzd_koef) + (last_shot_y - target._y) / y_koef;
            }
         }
         else if(rotace < rot_r - 5 - root.vitr / 7)
         {
            _root.z_f_used = "1.2.1.2.2.2";
            p_rotace += (135 - rotace) / 10 + target._x - _X / 100;
         }
         else
         {
            _root.z_f_used = "1.2.1.2.2.3";
            p_rotace -= (rotace - (rot_r - _root.vitr / 7)) / 2;
            p_power += x_vzd / (vzd_koef - Math.abs(135 - rotace) / vzd_koef_k) / 1.5 + (rotace - (rot_r - _root.vitr / 7)) / 5;
         }
      }
      else if(100 < _Y - target._y && target._x - _X < 100)
      {
         _root.z_f_used = "1.2.2.1";
         p_rotace -= (rotace - (rot_r - _root.vitr / 7)) / 2;
      }
      else
      {
         _root.z_f_used = "1.2.2.2";
         p_rotace -= (rotace - (rot_r - _root.vitr / 7)) / 2 - (target._x - _X) / 100;
      }
   }
   else
   {
      wind_koef_vzd_koef -= rotace * 3;
      y_koef += (rotace - 45) * 1.7;
      if(_X < last_shot_x)
      {
         _root.z_f_used = "2.1";
         p_rotace -= (last_shot_x - _X) / 10 + (_X - target._x) / 20 + _root.vitr / 50;
      }
      else if((60 < last_shot_vzd || target_vzd < 70 || power < 10) && (power < 70 || 200 < last_shot_vzd))
      {
         _root.z_f_used = "2.2.1.failed";
         if(target._x >= last_shot_x)
         {
            if(20 < x_vzd)
            {
               _root.z_f_used = "2.2.1.1.1";
               p_power -= x_vzd / (vzd_koef + 2.5 - Math.abs(45 - rotace) / vzd_koef_k) - (_root.vitr - last_wind) / (wind_change_koef - Math.abs(last_shot_x - _X) / wind_koef_vzd_koef) - (last_shot_y - target._y) / y_koef;
            }
            else
            {
               _root.z_f_used = "2.2.1.1.2";
               p_power -= x_vzd / (vzd_koef - 1 - Math.abs(45 - rotace) / vzd_koef_k) - (_root.vitr - last_wind) / (wind_change_koef - Math.abs(last_shot_x - _X) / wind_koef_vzd_koef);
            }
         }
         else if(last_shot_y < target._y)
         {
            if(target._y < _Y)
            {
               if(80 < _Y - target._y && y_vzd < 80 && 20 < y_vzd && last_shot_vzd < 100 && 220 < target_vzd && 30 < power && rot_l + _root.vitr / 7 < rotace)
               {
                  _root.z_f_used = "2.2.1.2.1.1.1";
                  p_rotace += (rot_l + _root.vitr / 7 - rotace) / 4 - _root.vitr / 20 - target_vzd / 100;
               }
               else if(rot_l + _root.vitr / 7 < rotace)
               {
                  _root.z_f_used = "2.2.1.2.1.1.2";
                  p_power += x_vzd / (vzd_koef - Math.abs(rotace - 45) / vzd_koef_k) + (_root.vitr - last_wind) / (wind_change_koef - Math.abs(_X - last_shot_x) / wind_koef_vzd_koef) + (last_shot_y - target._y) / y_koef;
               }
               else if(y_vzd < 30 && x_vzd < 200)
               {
                  _root.z_f_used = "2.2.1.2.1.1.3";
                  p_power += x_vzd / (vzd_koef - Math.abs(rotace - 45) / vzd_koef_k) + (_root.vitr - last_wind) / (wind_change_koef - Math.abs(_X - last_shot_x) / wind_koef_vzd_koef) + (last_shot_y - target._y) / y_koef;
               }
               else if(y_vzd >= 30)
               {
                  if(300 < _X - target._x && power < 50 && 70 < rotace)
                  {
                     _root.z_f_used = "2.2.1.2.1.1.4.1";
                     p_power += x_vzd / (vzd_koef / 3) + (_root.vitr - last_wind) / (wind_change_koef - Math.abs(_X - last_shot_x) / wind_koef_vzd_koef);
                  }
                  else if(rotace < rot_l + _root.vitr / 7)
                  {
                     if(p_rotace >= 45)
                     {
                        _root.z_f_used = "2.2.1.2.1.1.4.2.1";
                        p_power += x_vzd / (vzd_koef * 2) + (_root.vitr - last_wind) / (wind_change_koef - Math.abs(last_shot_x - _X) / wind_koef_vzd_koef) + y_vzd / y_vzd_koef + (rotace - 45) / 8 + _root.vitr / 15 + (rot_l + _root.vitr / 7 - rotace) / 8;
                     }
                     else
                     {
                        _root.z_f_used = "2.2.1.2.1.1.4.2.2";
                        p_power += x_vzd / (vzd_koef * 2) + (_root.vitr - last_wind) / (wind_change_koef - Math.abs(last_shot_x - _X) / wind_koef_vzd_koef) + y_vzd / y_vzd_koef + _root.vitr / 15;
                     }
                     p_rotace += (rot_l + _root.vitr / 7 - rotace) / 4.5 + y_vzd / y_vzd_koef;
                  }
               }
            }
            else if(target._y - _Y < 70 && y_vzd < 100 && 20 < y_vzd && last_shot_vzd < 100 && 250 < target_vzd && 30 < power && rotace < rot_l - _root.vitr / 7)
            {
               _root.z_f_used = "2.2.1.2.1.2.1";
               p_rotace += (rot_l + _root.vitr / 7 - rotace) / 4.5 - _root.vitr / 20 - target_vzd / 100;
            }
            else if(rot_l + _root.vitr / 7 < rotace)
            {
               _root.z_f_used = "2.2.1.2.1.2.2";
               p_power += x_vzd / (vzd_koef - Math.abs(rotace - 45) / vzd_koef_k) + (_root.vitr - last_wind) / (wind_change_koef - Math.abs(_X - last_shot_x) / wind_koef_vzd_koef) + (last_shot_y - target._y) / y_koef;
            }
            else if(y_vzd < 30 && x_vzd < 200)
            {
               _root.z_f_used = "2.2.1.2.1.2.3";
               p_power += x_vzd / (vzd_koef - Math.abs(45 - rotace) / vzd_koef_k) + (_root.vitr - last_wind) / (wind_change_koef - Math.abs(last_shot_x - _X) / wind_koef_vzd_koef) + (last_shot_y - target._y) / y_koef;
            }
            else if(y_vzd >= 30)
            {
               if(200 < target._y - _Y && _Y < last_shot_y)
               {
                  if(p_rotace < 60)
                  {
                     _root.z_f_used = "2.2.1.2.1.2.4.1.1";
                     p_power += x_vzd / (vzd_koef / 1.5) + (_root.vitr - last_wind) / (wind_change_koef - Math.abs(last_shot_x - _X) / wind_koef_vzd_koef);
                  }
                  else
                  {
                     _root.z_f_used = "2.2.1.2.1.2.4.1.2";
                     p_power += x_vzd / (vzd_koef / 2) + (_root.vitr - last_wind) / (wind_change_koef - Math.abs(last_shot_x - _X) / wind_koef_vzd_koef);
                  }
               }
               else if(300 < _X - target._x && power < 50 && 70 < rotace)
               {
                  _root.z_f_used = "2.2.1.2.1.2.4.2";
                  p_power += x_vzd / (vzd_koef / 3) + (_root.vitr - last_wind) / (wind_change_koef - Math.abs(last_shot_x - _X) / wind_koef_vzd_koef);
               }
               else if(rotace < rot_l + _root.vitr / 7)
               {
                  if(p_rotace >= 45)
                  {
                     _root.z_f_used = "2.2.1.2.1.2.4.3.1";
                     p_power += x_vzd / (vzd_koef * 2) + (_root.vitr - last_wind) / (wind_change_koef - Math.abs(last_shot_x - _X) / wind_koef_vzd_koef) + y_vzd / y_vzd_koef + (rotace - 45) / 8 + _root.vitr / 15 + (rot_l + _root.vitr / 7 - rotace) / 8;
                  }
                  else
                  {
                     _root.z_f_used = "2.2.1.2.1.2.4.3.2";
                     p_power += x_vzd / (vzd_koef * 2) + (_root.vitr - last_wind) / (wind_change_koef - Math.abs(last_shot_x - _X) / wind_koef_vzd_koef) + y_vzd / y_vzd_koef + _root.vitr / 15;
                  }
                  p_rotace += (rot_l + _root.vitr / 7 - rotace) / 4.5 + y_vzd / y_vzd_koef;
               }
            }
         }
         else if(last_shot_vzd < 150 && _X - target._x < 170 || last_shot_vzd >= 100 || last_shot_vzd < 100 && power < 30)
         {
            if(target._y < _Y)
            {
               p_power += x_vzd / (vzd_koef - Math.abs(rotace - 45) / vzd_koef_k) + (_root.vitr - last_wind) / (wind_change_koef - Math.abs(last_shot_x - _X) / wind_koef_vzd_koef) + (last_shot_y - target._y) / y_koef;
               _root.z_f_used = "2.2.1.2.2.1.1";
            }
            else if(100 < target._y - _Y)
            {
               _root.z_f_used = "2.2.1.2.2.1.2.1";
               p_power += x_vzd / (vzd_koef - Math.abs(rotace - 45) / vzd_koef_k) + (_root.vitr - last_wind) / (wind_change_koef - Math.abs(last_shot_x - _X) / wind_koef_vzd_koef);
            }
            else
            {
               _root.z_f_used = "2.2.1.2.2.1.2.2";
               p_power += x_vzd / (vzd_koef - Math.abs(rotace - 45) / vzd_koef_k) + (_root.vitr - last_wind) / (wind_change_koef - Math.abs(last_shot_x - _X) / wind_koef_vzd_koef) + (last_shot_y - target._y) / y_koef;
            }
         }
         else if(rot_l + 5 + root.vitr / 7 < rotace)
         {
            _root.z_f_used = "2.2.1.2.2.2";
            p_rotace -= (rotace - 45) / 10 + _X - target._x / 100;
         }
         else
         {
            _root.z_f_used = "2.2.1.2.2.3";
            p_rotace += (rot_l + _root.vitr / 7 - rotace) / 3;
            p_power += x_vzd / (vzd_koef - Math.abs(rotace - 45) / vzd_koef_k) / 1.5 + (rot_l + _root.vitr / 7 - rotace) / 5;
         }
      }
      else if(100 < _Y - target._y && _X - target._x < 100)
      {
         _root.z_f_used = "2.2.2.1";
         p_rotace += (rot_l + _root.vitr / 7 - rotace) / 2;
      }
      else
      {
         _root.z_f_used = "2.2.2.2";
         p_rotace += (rot_l + _root.vitr / 7 - rotace) / 2 - (target._x - _X) / 100;
      }
   }
   if(100 < p_power)
   {
      p_power = 100;
   }
   if(p_power >= _root["tank_" + tank_number].energy)
   {
      p_power = _root["tank_" + tank_number].energy;
      if(_X < target._x)
      {
         if(p_rotace < 135)
         {
            if(70 < p_power)
            {
               p_power -= (135 - p_rotace) / 2.5;
            }
            p_rotace += (135 - p_rotace) / 3;
         }
      }
      else if(45 < p_rotace)
      {
         if(70 < p_power)
         {
            p_power -= (p_rotace - 45) / 2.5;
         }
         p_rotace -= (p_rotace - 45) / 3;
      }
   }
   if(p_power < 0)
   {
      p_power = 0;
   }
   if(p_rotace < 0)
   {
      p_rotace = 0;
   }
   else if(180 < p_rotace)
   {
      p_rotace = 180;
   }
}
function prepare_shot()
{
   prep = true;
   if(Math.max(rotace,p_rotace) - Math.min(rotace,p_rotace) < 10)
   {
      sp = 1;
   }
   else
   {
      sp = Math.floor((Math.max(rotace,p_rotace) - Math.min(rotace,p_rotace)) / 10);
   }
   if(Math.ceil(rotace) != Math.ceil(p_rotace))
   {
      if(Math.ceil(p_rotace) < Math.ceil(rotace) && rotace - sp >= 0)
      {
         prep = false;
         rotace -= sp;
         _root.tur.play();
      }
      else if(180 >= rotace + sp)
      {
         prep = false;
         rotace += sp;
         _root.tur.play();
      }
   }
   if(Math.ceil(power) != Math.ceil(p_power))
   {
      if(Math.ceil(p_power) < Math.ceil(power) && power - sp >= 0)
      {
         prep = false;
         power -= sp;
      }
      else if(180 >= power + sp)
      {
         prep = false;
         power += sp;
      }
   }
   if(Math.round(p_x) != Math.round(_X) && 0 < _root["tank_" + tank_number].fuel && p_move)
   {
      prep = false;
      if(Math.round(p_x) < Math.round(_X))
      {
         move_right();
      }
      else
      {
         move_left();
      }
   }
   if(prep)
   {
      return true;
   }
}
function select_target()
{
   vzd = 1000;
   i = 1;
   while(_root.pocet_hracu >= i)
   {
      vz = Math.abs(_X - _root["tank" + i]._x);
      if(vz < vzd && i != tank_number && _root["tank_" + i].live)
      {
         vzd = vz;
         target = _root["tank" + i];
         target_ = _root["tank_" + i];
      }
      i++;
   }
}
function na_rade()
{
   rounds++;
   par_active = false;
   calc_hill_up();
}
function damage(damag, attacker, par)
{
   armor = 1;
   arm = 1;
   i = 0;
   while(i < _root["tank_" + tank_number].specials[9])
   {
      armor /= 1.12 / arm;
      arm /= 1.0002;
      i++;
   }
   if(!sh_active || par)
   {
      _root["tank_" + tank_number].energy -= damag * armor;
   }
   else
   {
      _root["shield" + tank_number].damage(damag,attacker);
   }
   if(0 >= _root["tank_" + tank_number].energy)
   {
      if(this != attacker)
      {
         _root["tank_" + attacker.tank_number].kills += 1;
         _root["tank_" + attacker.tank_number].score += 5000;
         _root["tank_" + attacker.tank_number].total_score += 5000;
      }
      else
      {
         _root["tank_" + tank_number].kills -= 1;
         _root["tank_" + tank_number].score -= 2000;
         _root["tank_" + tank_number].total_score -= 2000;
      }
   }
   if(this != attacker)
   {
      _root["tank_" + attacker.tank_number].score += damag * 100;
      _root["tank_" + attacker.tank_number].total_score += damag * 100;
   }
   else
   {
      if(par)
      {
         damag /= 3;
      }
      _root["tank_" + tank_number].score -= Math.round(damag * 50);
      _root["tank_" + tank_number].total_score -= Math.round(damag * 50);
      if(_root["tank_" + tank_number].score < 0)
      {
         _root["tank_" + tank_number].score = 0;
      }
   }
}
function fire()
{
   if(_root.debugging)
   {
      save_inf();
   }
   last_wind = _root.vitr;
   first_frame = true;
   _root.attachMovie(_root.weapons[_root["tank_" + tank_number].cur_gun][4],"strela",1000);
   if(_root["tank_" + tank_number].cur_gun != 0)
   {
      _root["tank_" + tank_number].guns[_root["tank_" + tank_number].cur_gun]--;
      if(_root["tank_" + tank_number].guns[_root["tank_" + tank_number].cur_gun] == 0)
      {
         _root["tank_" + tank_number].cur_gun = 0;
      }
   }
   _root.strela._rotation = rotace - 90;
   _root.strela._x = _X;
   _root.strela._y = _Y - 1;
   _root.strela.strela.vo = power;
   _root.strela.strela.owner = _root[_name];
   _root[_name + "_hlaven"].play();
   playing = false;
}
function save_inf()
{
   _root.z_target = target;
   _root.z_target_name = target_.name;
   _root.z_target_energy = target_.energy;
   _root.z_target_live = target_.live;
   _root.z_name = _root["tank_" + tank_number].name;
   _root.z_energy = _root["tank_" + tank_number].energy;
   if(target._x < _X)
   {
      _root.z_pos = "right";
   }
   else
   {
      _root.z_pos = "left";
   }
   _root.z_x = _X;
   _root.z_y = _Y;
   _root.z_tar_x = target._x;
   _root.z_tar_y = target._y;
   _root.z_last_vitr = last_wind;
   _root.z_vitr = _root.vitr;
   _root.z_wind_koef_vzd_koef = wind_koef_vzd_koef;
   _root.z_angle = rotace;
   _root.z_power = power;
   _root.z_y_koef = y_koef;
   _root.z_vzd_koef_k = vzd_koef_k;
   _root.z_last_shot_x = last_shot_x;
   _root.z_last_shot_y = last_shot_y;
   _root.z_last_shot_vzd = last_shot_vzd;
   _root.z_last_shot_y_vzd = y_vzd;
   _root.z_last_shot_x_vzd = x_vzd;
   _root.z_dif = dif;
   getURL("FSCommand:SAVE","debug/" add _root.game add "_" add rounds add "_" add _root.z_pos add "_" add _root["tank_" + tank_number].name add ".txt");
}
dif = _root["tank_" + tank_number].dif;
_Y = _root["land" + Math.round(_X)]._y - _root["land" + Math.round(_X)]._height / 2 - 4;
i = 0;
while(i < _width)
{
   cur = _root["land" + Math.floor(_X - _width / 2 + i)];
   if(hitTest(cur))
   {
      cur._y += _Y + _height / 2 - (cur._y - cur._height / 2);
   }
   i++;
}
if(0 < _root["tank_" + tank_number].specials[0])
{
   par = true;
}
_root.attachMovie("hlaven",_name + "_hlaven",10010 + tank_number);
rotace = random(67) * 2 + 46;
_root[_name + "_hlaven"]._x = _X;
_root[_name + "_hlaven"]._y = _Y - 1;
_root[_name + "_hlaven"]._rotation = rotace;
power = 50;
playing = false;
testing = false;
par_active = false;
par_out = false;
par_used = false;
sh_active = false;
_root["t" + tank_number] = _root["tank" + tank_number];
first_shot = true;
first_frame = true;
calc_frame = true;
fuel_c = 1 / (_root["tank_" + tank_number].specials[10] + 1);
rounds = 0;
p_move = false;
select_target();
