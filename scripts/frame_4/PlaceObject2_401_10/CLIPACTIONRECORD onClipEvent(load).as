onClipEvent(load){
   i = 0;
   if(_root.rand_krajina)
   {
      _root.krajina = random(3) + 1;
   }
   if(_root.krajina == 1)
   {
      _root.vitrchange = 16;
      rn = 0;
      while(rn == 0)
      {
         rn = random(3) - 1;
      }
      _root.vitr = (random(50) + 30) * rn;
      _root.attachMovie("krajina1","pozadi",1);
      _root.pozadi._x = 274;
      _root.pozadi._y = 203.4;
      _root.land._x = 500;
      n2 = random(200) + 100;
      n3 = random(300) + 50;
      n4 = random(300) + 50;
      ran = random(500);
      pocet = random(5) + 2;
   }
   else if(_root.krajina == 2)
   {
      _root.vitrchange = 12;
      rn = 0;
      while(rn == 0)
      {
         rn = random(3) - 1;
      }
      _root.vitr = (random(25) + 25) * rn;
      _root.attachMovie("krajina2","pozadi",1);
      _root.pozadi._x = 248.8;
      _root.pozadi._y = 334.6;
      _root.land._y = 536;
      n2 = random(100) + 50;
      n3 = random(200) + 50;
      n4 = random(200) + 50;
      ran = random(500);
      pocet = random(6) + 2;
      f = random(50) + 10;
   }
   else if(_root.krajina == 3)
   {
      _root.vitrchange = 6;
      rn = 0;
      while(rn == 0)
      {
         rn = random(3) - 1;
      }
      _root.vitr = random(20) * rn;
      _root.attachMovie("krajina3","pozadi",1);
      _root.pozadi._x = 274;
      _root.pozadi._y = 200.6;
      _root.land._y = 615;
      i = 0;
      rand = random(400) / 10 + 1;
      rand2 = (random(15) + 1) / 10;
   }
}
