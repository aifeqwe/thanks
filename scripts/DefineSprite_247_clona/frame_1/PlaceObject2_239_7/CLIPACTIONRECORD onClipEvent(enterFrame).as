onClipEvent(enterFrame){
   if(_root.clona.projizdi)
   {
      speed -= (137.5 + Math.abs(_X)) / k;
      _X = _X - speed;
      if(_X < 137.5)
      {
         _X = 137.5;
      }
   }
   else if(137.5 < _X)
   {
      speed -= (137.5 + Math.abs(_X)) / k;
      _X = _X - speed;
   }
   else
   {
      _X = 137;
   }
}
