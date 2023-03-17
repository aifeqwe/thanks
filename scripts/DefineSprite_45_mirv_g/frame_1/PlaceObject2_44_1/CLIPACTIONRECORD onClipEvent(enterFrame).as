onClipEvent(enterFrame){
   if(_parent._x < 0 || 550 < _parent._x || 400 < _Y)
   {
      gotoAndPlay(12);
   }
   if(_currentframe == 1)
   {
      _parent._x = x + vox * t;
      _parent._y = y - voy * t + g / 2 * (t * t);
      vox += _root.vitr / 600;
   }
   if(hitTest(_root["land" + Math.round(_parent._x)]))
   {
      play();
   }
   i = 1;
   while(_root.pocet_hracu >= i)
   {
      if(hitTest(_root["tank" + i]) && i != owner.tank_number)
      {
         play();
      }
      if(hitTest(owner) && hit == false)
      {
         play();
      }
      i++;
   }
   if(!hitTest(owner))
   {
      hit = false;
   }
   if(Math.round(t * 10) / 10 == 3)
   {
      if(_currentframe == 1)
      {
         bum2();
      }
      else
      {
         end = true;
      }
   }
   t += 0.1;
}
