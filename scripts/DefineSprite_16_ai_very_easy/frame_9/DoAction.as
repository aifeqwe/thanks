i = 0;
while(i < _width)
{
   cur = _root["land" + Math.round(_X - _width / 2 + i)];
   x = cur._x;
   y = cur._y;
   h = cur._y - cur._height / 2;
   if(hitTest(x,h,true))
   {
      vzr = Math.cos(0.017 * (Math.sqrt((_X - x) * (_X - x) + (_Y - h) * (_Y - h)) * (180 / _width)));
      cur._height -= 30 * vzr;
      cur._y += 15 * vzr;
   }
   else if(hitTest(_root["land" + Math.round(xx - _width / 2 + i)]))
   {
      cur._height -= 50 / Math.abs(_X - x);
      cur._y += 50 / Math.abs(_X - x) / 2;
   }
   i++;
}
i = 1;
while(_root.pocet_hracu >= i)
{
   current = _root["tank" + i];
   if((hitTest(current) || hitTest(_root["shield" + i])) && i != tank_number)
   {
      x = _X - current._x;
      y = _Y - current._y;
      vzd = Math.sqrt(x * x + y * y);
      if(!current.sh_active)
      {
         damg = Math.round(_width / ((vzd + 1) / 14));
         if(_root["tank_" + i].energy < damg)
         {
            damg = _root["tank_" + i].energy;
         }
      }
      else
      {
         damg = Math.round(_width / ((vzd / 2 + 1) / 18));
      }
      current.damage(damg,this);
   }
   i++;
}
