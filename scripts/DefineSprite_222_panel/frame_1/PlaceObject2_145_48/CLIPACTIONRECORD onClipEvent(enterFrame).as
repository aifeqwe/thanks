onClipEvent(enterFrame){
   if(sdrag)
   {
      _root.na_rade.rotace = 90 + Math.round(drag._x);
      _root.tur.play();
   }
   else
   {
      drag._x = -90 + _root.na_rade.rotace;
      _root.tur.gotoAndStop(2);
   }
}
