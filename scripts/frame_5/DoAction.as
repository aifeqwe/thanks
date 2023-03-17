function nextplayer()
{
   na_rade = next;
   if(na_rade.tank_number < pocet_hracu && 1 < hracu)
   {
      next = eval("tank" + Number(na_rade.tank_number + 1));
   }
   else if(1 < hracu)
   {
      next = tank1;
   }
   na_rade.playing = true;
   if(_root["tank_" + na_rade.tank_number].live == false && 1 < hracu)
   {
      nextplayer();
   }
   else if(1 < hracu)
   {
      na_rade.blik();
   }
   vitr += - random(vitrchange) + vitrchange / 2;
   panel.player_changed();
   na_rade.na_rade();
}
function test()
{
   i = 1;
   while(pocet_hracu >= i)
   {
      _root["tank" + i].playing = false;
      _root["tank" + i].testing = true;
      _root["tank" + i].na_zemi = false;
      i++;
   }
   testing = true;
}
i = 1;
while(i < pocet_hracu + 1)
{
   if(_root["tank_" + i].type == "tank")
   {
      _root.attachMovie(_root["tank_" + i].type,"tank" + i,10000 + i);
   }
   else
   {
      _root.attachMovie(_root["tank_" + i].type add "_" add _root["tank_" + i].dif,"tank" + i,10000 + i);
   }
   tank = _root["tank" + i];
   tank.type = _root["tank_" + i].type;
   col = new Color(tank.col);
   col.setRGB(_root["tank_" + i].col);
   tank.tank_number = i;
   tank._x = random(500) + 20;
   while(400 < _root["land" + tank._x]._y - _root["land" + tank._x]._height / 2)
   {
      tank._x = random(500) + 20;
   }
   f = 1;
   while(f < i)
   {
      if(tank._x < _root["tank" + f]._x + 350 / _root.pocet_hracu && _root["tank" + f]._x - 350 / _root.pocet_hracu < tank._x)
      {
         tank._x = random(500) + 20;
         while(400 < _root["land" + tank._x]._y - _root["land" + tank._x]._height / 2)
         {
            tank._x = random(500) + 20;
         }
         f = 0;
      }
      f++;
   }
   tank.playing = false;
   i++;
}
_root.attachMovie("panel","panel",1000000);
panel._x = 442.6;
panel._y = 28.4;
fired = false;
power = 50;
next = tank1;
i = 1;
while(pocet_hracu >= i)
{
   if(_root["tank_" + i].total_score < _root["tank_" + next.tank_number].total_score)
   {
      next = _root["tank" + i];
   }
   i++;
}
hracu = pocet_hracu;
panel._visible = true;
end = false;
fuel_c = 1 / (_root["tank_" + tank_number].specials[10] + 1);
