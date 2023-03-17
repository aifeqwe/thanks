onClipEvent(enterFrame){
   if(i < 540)
   {
      f = i + 40;
   }
   if(_root.krajina == 1)
   {
      while(i < f)
      {
         duplicateMovieClip(_root.land,"land" + i,16384 + (i + 8000));
         _root["land" + i]._x = i;
         _root["land" + i]._y += Math.sin(3.141592653589793 / n3 * i) * Math.cos(3.141592653589793 / n4 * i) * (ran - i) / 2;
         col = new Color(_root["land" + i]);
         col.setRGB(16777215);
         i++;
      }
   }
   if(_root.krajina == 2)
   {
      while(i < f)
      {
         duplicateMovieClip(_root.land,"land" + i,16384 + (i + 8000));
         _root["land" + i]._x = i;
         _root["land" + i]._y += Math.sin(0.017453292519943295 * i) * Math.cos(3.141592653589793 / n4 * i) * (ran - i) / 4 / 2;
         col = new Color(_root["land" + i]);
         barv = _root["land" + i]._height / 12;
         mycoltrans = new Object();
         mycoltrans.ra = 100;
         mycoltrans.rb = 120;
         mycoltrans.ga = 100;
         mycoltrans.gb = 130 + barv;
         mycoltrans.ba = 100;
         mycoltrans.bb = 0;
         mycoltrans.aa = 100;
         mycoltrans.ab = 0;
         col.setTransform(mycoltrans);
         i++;
      }
   }
   if(_root.krajina == 3)
   {
      while(i < f)
      {
         duplicateMovieClip(_root.land,"land" + i,16384 + (i + 8000));
         _root["land" + i]._x = i;
         _root["land" + i]._y += Math.sin(0.017453292519943295 * i * rand2) * rand / 2;
         col = new Color(_root["land" + i]);
         barv = _root["land" + i]._height / 12;
         mycoltrans = new Object();
         mycoltrans.ra = 100;
         mycoltrans.rb = 234;
         mycoltrans.ga = 100;
         mycoltrans.gb = 221;
         mycoltrans.ba = 100;
         mycoltrans.bb = 181;
         mycoltrans.aa = 100;
         mycoltrans.ab = 0;
         col.setTransform(mycoltrans);
         i++;
      }
   }
   if(i >= 550)
   {
      if(_root.krajina == 1)
      {
         i = 0;
         while(i < pocet)
         {
            _root.attachMovie("strom_1","strom" add i,20000 + i);
            i++;
         }
      }
      if(_root.krajina == 2)
      {
         f = 0;
         i = 0;
         while(i < 100)
         {
            _root.attachMovie("strom_2","strom" add i,20000 + i);
            _root["strom" + i]._x = f;
            f += random(30) + 8;
            if(550 < f)
            {
               break;
            }
            i++;
         }
      }
      _root.uv.removeMovieClip();
      _root.gotoAndPlay("hra");
   }
   if(500 >= i)
   {
      _root.uv.percent._width = Math.round(i / 550 * 100) * 2;
      _root.uv.percent._x = -95.3 + Math.round(i / 550 * 100);
   }
   else
   {
      _root.uv.percent._width = 200;
      _root.uv.percent._x = 4.7;
   }
}
