if(400 < _Y)
{
   _root["tank_" + tank_number].live = false;
   _root["tank_" + tank_number].energy = 0;
   _root["tank_" + tank_number].score -= 2000;
   _root.hracu--;
   if(_root["tank_" + tank_number].score < 0)
   {
      _root["tank_" + tank_number].score = 0;
   }
   gotoAndPlay(4);
}
if(0 >= _root["tank_" + tank_number].energy)
{
   _root["tank_" + tank_number].energy = 0;
   _root["tank_" + tank_number].live = false;
   gotoAndPlay(4);
}
_root[_name + "_hlaven"]._x = _X;
_root[_name + "_hlaven"]._y = _Y - 1;
if(sh_active)
{
   _root["shield" + tank_number]._x = _X;
   _root["shield" + tank_number]._y = _Y;
}
if(playing)
{
   if(!target_.live && first_frame)
   {
      rounds = 1;
      select_target();
   }
   if(rounds == 1)
   {
      if(first_frame)
      {
         i = 1;
         while(_root.pocet_hracu >= i)
         {
            if(_root["tank" + i].playing && i != tank_number && _root["tank_" + i].live)
            {
               _root["tank" + i].playing = false;
               _root.test();
            }
            i++;
         }
         first_shot = true;
         calc_first_shot();
      }
   }
   else if(first_frame)
   {
      calc_shot();
   }
   first_frame = false;
   _root.rotace = rotace;
   _root.power = power;
   if(prepare_shot())
   {
      fire();
   }
   na_zemi = false;
   left = true;
   right = true;
   i = 0;
   min = 500;
   gg = false;
   test_hill();
   while(i < _width)
   {
      cur = _root["land" + Math.round(_X - _width / 2 + i)];
      if(pasy.hitTest(cur))
      {
         na_zemi = true;
         if(par_out)
         {
            par_out = false;
            _root["parachute" + tank_number].removeMovieClip();
         }
         if(0.4 < fall)
         {
            if(fall < 0.8)
            {
               damage(Math.round(fall * 25),this,true);
            }
            else
            {
               damage(Math.round(fall * fall * 3000),this,true);
            }
         }
         fall = 0;
      }
      top = cur._y - cur._height / 2;
      if(top < min && na_zemi)
      {
         gg = true;
         min = top;
      }
      if(i + 1 >= _width && na_zemi && gg)
      {
         _Y = min - 2;
         gg = false;
      }
      if(!na_zemi)
      {
         if(fall >= 0.2 && par)
         {
            if(!par_active)
            {
               par_active = true;
               _root["tank_" + i].specials[0] -= 1;
            }
            if(!par_out)
            {
               _root.attachMovie("parachute","parachute" + tank_number,9000 + tank_number);
            }
            par_out = true;
         }
         _Y = _Y + fall;
         if(!par_out)
         {
            fall += 0.01;
         }
         else
         {
            _root["parachute" + tank_number]._x = _X;
            _root["parachute" + tank_number]._y = _Y - 7.5;
            fall = 0.2;
            _X = _X + _root.vitr / 3000;
         }
      }
      i++;
   }
   if(_root["tank_" + tank_number].energy < power)
   {
      power = _root["tank_" + tank_number].energy;
   }
   _root[_name + "_hlaven"]._rotation = rotace;
}
if(testing)
{
   i = 0;
   min = 500;
   gg = false;
   test_hill();
   while(i < _width)
   {
      cur = _root["land" + Math.round(_X - _width / 2 + i)];
      if(pasy.hitTest(cur))
      {
         if(0.4 < fall)
         {
            if(fall < 0.8)
            {
               damage(Math.round(fall * 25),this,true);
            }
            else
            {
               damage(Math.round(fall * fall * 80),this,true);
            }
         }
         if(par_out)
         {
            par_out = false;
            _root["parachute" + tank_number].removeMovieClip();
         }
         na_zemi = true;
         fall = 0;
      }
      top = cur._y - cur._height / 2;
      if(top < min && na_zemi)
      {
         gg = true;
         min = top;
      }
      if(i + 1 >= _width && na_zemi && gg)
      {
         _Y = min - 2;
         gg = false;
      }
      if(0.001 < fall)
      {
         test = false;
      }
      if(!na_zemi)
      {
         if(fall >= 0.2 && par)
         {
            if(!par_active)
            {
               par_active = true;
               _root["tank_" + tank_number].specials[0] -= 1;
            }
            if(!par_out)
            {
               _root.attachMovie("parachute","parachute" + tank_number,9000 + tank_number);
            }
            par_out = true;
         }
         _Y = _Y + fall;
         if(!par_out)
         {
            fall += 0.01;
         }
         else
         {
            _root["parachute" + tank_number]._x = _X;
            _root["parachute" + tank_number]._y = _Y - 7.5;
            fall = 0.2;
            _X = _X + _root.vitr / 3000;
         }
      }
      i++;
   }
   if(0.001 < fall)
   {
      test = false;
   }
   test_hill();
   x3 = x2;
   x2 = x1;
   x1 = Math.round(_X);
   y3 = y2;
   y2 = y1;
   y1 = Math.round(_Y * 10) / 10;
   if(y1 == y3 && x1 == x3)
   {
      test = true;
   }
   if(test)
   {
      testing = false;
      _root[_name + "test"] = false;
   }
   _root[_name + "_hlaven"]._x = _X;
   _root[_name + "_hlaven"]._y = _Y - 1;
   test = true;
}
