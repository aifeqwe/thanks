function next_player()
{
   if(cur < _root.pocet_hracu)
   {
      cur++;
      if(_root["tank_" + cur].type == "tank")
      {
         view_weapons();
      }
      else
      {
         _root["tank_" + cur].buy();
         next_player();
      }
   }
   else
   {
      score._visible = false;
      player._visible = false;
      buymenu._y = -500;
      remove_weapons();
      _root.gotoAndStop(3);
      stops = false;
      projizdi = true;
   }
   st = false;
   i = cur + 1;
   while(_root.pocet_hracu >= i)
   {
      if(_root["tank_" + i].type == "tank")
      {
         st = true;
         break;
      }
      i++;
   }
   if(cur == _root.pocet_hracu || st == false)
   {
      buymenu.but_capt = "Start!";
   }
}
function purchasing_fc()
{
   view_weapons();
   score._visible = true;
   clr = new Color(player);
   player._visible = true;
   clr.setRGB(_root["tank_" + cur].col);
   buymenu._x = 140;
   buymenu._y = 80;
   if(cur == 0)
   {
      next_player();
   }
}
function view_weapons()
{
   i = 0;
   while(i < _root.weapons.length)
   {
      this["weapon" + i].removeMovieClip();
      i++;
   }
   sc = _root["tank_" + cur].score;
   score.score = sc;
   player.player = _root["tank_" + cur].name;
   clr.setRGB(_root["tank_" + cur].col);
   i = 0;
   while(i < _root.weapons.length)
   {
      this.attachMovie("weapon","weapon" + i,1000060 + i);
      this["weapon" + i].icon_link = _root.weapons[i][0];
      this["weapon" + i].caption = _root.weapons[i][1];
      this["weapon" + i].price = _root.weapons[i][2];
      this["weapon" + i].count = _root.weapons[i][3];
      this["weapon" + i].num = i;
      this["weapon" + i]._x = -140;
      this["weapon" + i]._y = -140 + this["weapon" + i]._height * i;
      i++;
   }
   i = 0;
   while(i < _root.specials.length)
   {
      this.attachMovie("special","special" + i,1000080 + i);
      this["special" + i].icon_link = _root.specials[i][0];
      this["special" + i].caption = _root.specials[i][1];
      this["special" + i].price = _root.specials[i][2];
      this["special" + i].count = _root.specials[i][3];
      this["special" + i].num = i;
      this["special" + i]._x = 140;
      this["special" + i]._y = -140 + this["special" + i]._height * i;
      i++;
   }
}
function purchase_weapon(num)
{
   _root["tank_" + cur].guns[num] += _root.weapons[num][3];
   _root["tank_" + cur].score -= _root.weapons[num][2];
   view_weapons();
}
function purchase_special(num)
{
   _root["tank_" + cur].specials[num] += _root.specials[num][3];
   _root["tank_" + cur].score -= _root.specials[num][2];
   view_weapons();
}
function remove_weapons()
{
   i = 0;
   while(i < 20)
   {
      this["weapon" + i].removeMovieClip();
      this["special" + i].removeMovieClip();
      i++;
   }
}
if(ch != true)
{
   speed = 16;
   k = 920;
}
cur = 0;
