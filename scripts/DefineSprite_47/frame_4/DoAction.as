i = 0;
while(i < 5)
{
   _root.attachMovie("missile_funky","strela" + i,1001 + i);
   _root["strela" + i].depth = 10041 + i;
   _root["strela" + i]._rotation = random(90) - 45;
   _root["strela" + i]._x = _parent._x;
   _root["strela" + i]._y = _parent._y - 5;
   _root["strela" + i].strela.vo = random(30) + 15;
   _root["strela" + i].strela.owner = owner;
   _root["strela" + i].strela.st_number = i;
   _root["strela" + i].strela.x = _root["strela" + i]._x;
   _root["strela" + i].strela.y = _root["strela" + i]._y;
   _root["strela" + i].strela.t = 0;
   i++;
}
