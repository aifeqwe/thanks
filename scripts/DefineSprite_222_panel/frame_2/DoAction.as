if(sh_active)
{
   fuel_ar.gotoAndStop(2);
}
else
{
   fuel_ar.gotoAndStop(1);
}
num = _root.na_rade.tank_number;
cl.setRGB(_root["tank_" + num].col);
power = _root.power;
rotation = _root.rotace;
energy = Math.round(_root["tank_" + num].energy);
fuel = Math.round(_root["tank_" + num].fuel);
kills = _root["tank_" + num].kills;
name.name = _root["tank_" + num].name;
score = _root["tank_" + num].score;
vitr = Math.abs(_root.vitr);
vitr_uk._xscale = _root.vitr;
tank.hlaven._rotation = _root.na_rade.rotace;
