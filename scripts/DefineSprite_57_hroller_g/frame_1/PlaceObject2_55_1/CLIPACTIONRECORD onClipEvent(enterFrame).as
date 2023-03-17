onClipEvent(enterFrame){
   if(_parent._x < 0 || 550 < _parent._x || 400 < _parent._y)
   {
      _root.shot_flying = false;
      _root.test();
      _parent.removeMovieClip();
   }
   i = 1;
   while(_root.pocet_hracu >= i)
   {
      if(hitTest(_root["t" + i]) && i != owner.tank_number)
      {
         play();
         first = false;
         second = false;
      }
      if((hitTest(owner) || hitTest(_root["shield" + owner.tank_number])) && hit == false)
      {
         play();
         first = false;
         second = false;
      }
      i++;
   }
   if(!hitTest(owner) && hitTest(_root["shield" + owner.tank_number]) == false)
   {
      hit = false;
   }
   if(first)
   {
      _parent._x = x + vox * t;
      _parent._y = y - voy * t + g / 2 * (t * t);
      vox += _root.vitr / 600;
      if(hitTest(_root["land" + Math.round(_parent._x)]))
      {
         first = false;
         second = true;
      }
      t += 0.1;
   }
   if(second)
   {
      lastx = Math.round(_parent._x);
      if(start)
      {
         cur = _root["land" + Math.round(_parent._x)];
         cury = cur._y - cur._height / 2;
         _parent._y = cury;
         curl = _root["land" + (Math.round(_parent._x) - 1)];
         curly = curl._y - curl._height / 2;
         curp = _root["land" + (Math.round(_parent._x) + 1)];
         curpy = curp._y - curp._height / 2;
         if(curly >= cury || curpy >= cury)
         {
            if(curly >= cury)
            {
               smer = "left";
            }
            else if(curpy >= cury)
            {
               smer = "right";
            }
         }
         else
         {
            second = false;
            play();
         }
         start = false;
      }
      if(smer == "left")
      {
         cur = _root["land" + Math.round(_parent._x)];
         cury = cur._y - cur._height / 2;
         _parent._y = cury;
         curl = _root["land" + (Math.round(_parent._x) - 1)];
         curly = curl._y - curl._height / 2;
         if(curly >= cury)
         {
            _parent._x -= 1;
         }
         else
         {
            second = false;
            play();
         }
      }
      else if(smer == "right")
      {
         cur = _root["land" + Math.round(_parent._x)];
         cury = cur._y - cur._height / 2;
         _parent._y = cury;
         curp = _root["land" + (Math.round(_parent._x) + 1)];
         curpy = curp._y - curp._height / 2;
         if(curpy >= cury)
         {
            _parent._x += 1;
         }
         else
         {
            second = false;
            play();
         }
      }
      if(Math.round(lastx) == Math.round(_parent._x))
      {
         if(owner._x < _parent._x)
         {
            smer = right;
         }
         else
         {
            smer = left;
         }
      }
   }
}
