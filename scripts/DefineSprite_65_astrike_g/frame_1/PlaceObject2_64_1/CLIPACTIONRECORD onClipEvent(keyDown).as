onClipEvent(keyDown){
   if(Key.getCode() == 37)
   {
      uhel = 0;
      _root.cursor._xscale = 100;
   }
   else if(Key.getCode() == 39)
   {
      uhel = 180;
      _root.cursor._xscale = -100;
   }
}
