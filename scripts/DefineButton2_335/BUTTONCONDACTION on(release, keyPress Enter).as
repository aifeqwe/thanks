on(release, keyPress "<Enter>"){
   if(!released)
   {
      _root.attachMovie("clona","clona",1000001);
      _root.clona._x = 275;
      _root.clona._y = 200;
      _root.clona.projizdi = true;
      _root.clona.frame = 2;
      _root.clona.stops = true;
      released = true;
   }
}
