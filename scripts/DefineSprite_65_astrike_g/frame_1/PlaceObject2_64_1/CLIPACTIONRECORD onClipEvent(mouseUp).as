onClipEvent(mouseUp){
   if(!f)
   {
      f = true;
      stopDrag();
      _root.cursor._x = -20;
      Mouse.show();
      x = _root._xmouse;
      i = 0;
      while(i < 5)
      {
         _root.attachMovie("amissile","strela" + i,1001 + i);
         _root["strela" + i].strela.num = i;
         _root["strela" + i].strela.x = x;
         _root["strela" + i].strela.uhel = uhel;
         _root["strela" + i].strela.owner = owner;
         i++;
      }
      gotoAndPlay(2);
   }
}
