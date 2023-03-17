onClipEvent(load){
   stop();
   depth = 10040;
   uhel = - _parent._rotation + 90;
   g = 9.81;
   t = 0;
   x = _parent._x;
   hit = true;
   y = _parent._y;
   vox = Math.cos(0.017453292519943295 * uhel) * vo;
   voy = Math.sin(0.017 * uhel) * vo;
   _root.shot_flying = true;
}
