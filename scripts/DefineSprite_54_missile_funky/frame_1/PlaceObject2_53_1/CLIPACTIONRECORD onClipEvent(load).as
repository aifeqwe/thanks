onClipEvent(load){
   stop();
   uhel = - _parent._rotation + 90;
   g = 9.81;
   hit = true;
   vox = Math.cos(0.017453292519943295 * uhel) * vo;
   voy = Math.sin(0.017 * uhel) * vo;
}
