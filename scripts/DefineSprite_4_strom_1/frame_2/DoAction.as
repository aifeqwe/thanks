if(Math.floor(_Y) < Math.floor(_root["land" + _X]._y - _root["land" + _X]._height / 2))
{
   _Y = _Y + fall;
   fall += 1;
}
else
{
   fall = 0;
}
