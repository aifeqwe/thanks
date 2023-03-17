on(release){
   _root["tank_" + _root.na_rade.tank_number].specials[7]--;
   Mouse.hide();
   _root.attachMovie("teleport_a","tel",10100);
   startDrag("_root.tel",1);
   gotoAndStop(2);
}
