function change_icon()
{
   this.attachMovie(_root.weapons[_root["tank_" + _root.na_rade.tank_number].cur_gun][0],"gun_ico",1000101);
   gun_ico._x = -55;
   gun_ico._y = 0;
   name = _root.weapons[_root["tank_" + _root.na_rade.tank_number].cur_gun][1];
   count = _root["tank_" + _root.na_rade.tank_number].guns[_root["tank_" + _root.na_rade.tank_number].cur_gun];
}
