onClipEvent(load){
   stop();
   y = -50;
   if(uhel == 0)
   {
      x = x - 120 + num * 20;
   }
   else
   {
      x = x + 120 - num * 20;
   }
   g = 9.81;
   st_number = num;
   vo = 10;
   vox = Math.cos(0.017453292519943295 * uhel) * vo;
   voy = Math.sin(0.017 * uhel) * vo;
   t = 0;
}
