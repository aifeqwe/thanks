onClipEvent(enterFrame){
   if(_root.clona.projizdi)
   {
      speed -= (137.5 + Math.abs(_X)) / k;
      if(-137.5 < _X)
      {
         _X = -137.5;
         _root.gotoAndStop(_parent.frame);
      }
      _X = _X + speed;
      if(speed < 0 && _X < x)
      {
         if(_parent.stops)
         {
            _parent.removeMovieClip();
         }
         else
         {
            _root.play();
            _parent.removeMovieClip();
         }
      }
   }
   else if(_X < -137.5)
   {
      speed -= (137.5 + Math.abs(_X)) / k;
      _X = _X + speed;
   }
   else
   {
      _X = -137.5;
      _root.pozadi.removeMovieClip();
      _root.panel.removeMovieClip();
      if(_parent.purchasing && first)
      {
         first = false;
         _parent.purchasing_fc();
      }
   }
}
