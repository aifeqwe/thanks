onClipEvent(load){
   f = false;
   _root[_root.na_rade._name + "_hlaven"].gotoAndStop(1);
   stop();
   Mouse.hide();
   _root.attachMovie("astrikecur","cursor",1100000);
   startDrag(_root.cursor,1);
   uhel = 0;
}
