function bum()
{
   par1 = 30;
   par2 = 15;
   par3 = 15;
   i = 0;
   while(i < _width)
   {
      cur = _root["land" + Math.round(_parent._x - _width / 2 + i)];
      xx = _parent._x;
      yy = _parent._y;
      x = cur._x;
      y = cur._y;
      h = cur._y - cur._height / 2;
      if(hitTest(x,h,true))
      {
         vzr = Math.cos(0.017 * (Math.sqrt((xx - x) * (xx - x) + (yy - h) * (yy - h)) * (180 / _width)));
         cur._height -= par1 * vzr;
         cur._y += par2 * vzr;
      }
      else if(hitTest(_root["land" + Math.round(xx - _width / 2 + i)]))
      {
         cur._height -= par3 * Math.cos(0.017 * (Math.abs(xx - x) * (180 / _width)));
         cur._y += par3 * Math.cos(0.017 * (Math.abs(xx - x) * (180 / _width))) / 2;
      }
      i++;
   }
   par4 = 17;
   par5 = 24;
   owner.last_shot_x = _parent._x;
   owner.last_shot_y = _parent._y;
   owner.last_shot_out = false;
   i = 1;
   while(_root.pocet_hracu >= i)
   {
      current = _root["tank" + i];
      if(hitTest(current) || hitTest(_root["shield" + i]))
      {
         x = _parent._x - current._x;
         y = _parent._y - current._y;
         vzd = Math.sqrt(x * x + y * y);
         if(!current.sh_active)
         {
            damg = Math.round(_width / ((vzd + 1) / par4));
            if(_root["tank_" + i].energy < damg)
            {
               damg = _root["tank_" + i].energy;
            }
         }
         else
         {
            damg = Math.round(_width / ((vzd / 2 + 1) / par5));
         }
         current.damage(damg,owner);
      }
      i++;
   }
}
stop();
