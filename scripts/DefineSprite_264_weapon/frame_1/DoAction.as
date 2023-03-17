if(_root["tank_" + _root.clona.cur].score >= price)
{
   w_caption = caption;
   w2_caption = "";
}
else
{
   w2_caption = caption;
   w_caption = "";
}
w_price = price;
w_count = count;
t_count = _root["tank_" + _root.clona.cur].guns[num];
this.attachMovie(icon_link,"icon",1000060 + num);
icon._y = 0.4;
icon._x = -74;
