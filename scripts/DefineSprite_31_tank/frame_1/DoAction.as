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
function na_rade()
{
   par_active = false;
   calc_hill_up();
}
function fire()
{
   testing = true;
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
fuel_c = 1 / (_root["tank_" + tank_number].specials[10] + 1);
