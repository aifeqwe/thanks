panel._visible = false;
i = 1;
while(pocet_hracu >= i)
{
   _root["tank_" + i].live = true;
   _root["tank_" + i].max_energy = 100 + _root["tank_" + i].specials[8] * 10;
   _root["tank_" + i].energy = _root["tank_" + i].max_energy;
   _root["tank_" + i].fuel = _root["tank_" + i].specials[2];
   i++;
}
game++;
