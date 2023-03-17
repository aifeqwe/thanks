i = 0;
while(550 >= i)
{
   _root["land" + i].removeMovieClip();
   i++;
}
i = 0;
while(i < 100)
{
   _root["strom" + i].removeMovieClip();
   i++;
}
i = 1;
while(_root.pocet_hracu >= i)
{
   _root["shield" + i].removeMovieClip();
   _root["parachute" + i].removeMovieClip();
   _root["tank" + i].removeMovieClip();
   _root["tank" + i + "_hlaven"].removeMovieClip();
   _root["tank_" + i].fuel = _root["tank_" + i].specials[2];
   i++;
}
_root.strela.removeMovieClip();
_root.attachMovie("clona","clona",1000001);
_root.clona._x = 275;
_root.clona._y = 200;
_root.clona.purchasing = true;
_root.vitr = 0;
_root.pozadi.slunce.gotoAndStop(1);
_root.clona.ch = true;
_root.clona.speed = 10;
_root.clona.speed = 10;
_root.clona.k = 2340;
_root.clona.k = 2340;
