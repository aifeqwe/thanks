onClipEvent(enterFrame){
   if(400 < _parent._y)
   {
      _root.strela.strela["shot" + st_number] = true;
      _parent.removeMovieClip();
   }
   if(_currentframe == 1)
   {
      _parent._x = x + vox * t;
      _parent._y = y - voy * t + g / 2 * (t * t);
   }
   if(hitTest(_root["land" + Math.round(_parent._x)]))
   {
      play();
   }
   i = 1;
   while(_root.pocet_hracu >= i)
   {
      if(hitTest(_root["t" + i]))
      {
         play();
      }
      i++;
   }
   t += 0.12;
}
