onClipEvent(enterFrame){
   if(_parent._x < 0 || 550 < _parent._x || 400 < _Y)
   {
      _root.shot_flying = false;
      owner.last_shot_x = _parent._x;
      owner.last_shot_y = _parent._y;
      owner.last_shot_out = true;
      _root.test();
      _parent.removeMovieClip();
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
      if(hitTest(_root["t" + i]) && i != owner.tank_number)
      {
         play();
      }
      if((hitTest(owner) || hitTest(_root["shield" + owner.tank_number])) && hit == false)
      {
         play();
      }
      i++;
   }
   if(!hitTest(owner) && hit)
   {
      _parent.swapDepths(depth);
   }
   if(!hitTest(owner) && hitTest(_root["shield" + owner.tank_number]) == false && hit == true)
   {
      hit = false;
   }
   t += 0.1;
}
