function player_changed()
{
   ico.change_icon();
   sort_score();
   refresh_icons();
}
function refresh_icons()
{
   repair.refresh();
   parachutes.refresh();
   teleport.refresh();
   shields.refresh();
}
function sort_score()
{
   i = 1;
   while(i < _root.pocet_hracu + 1)
   {
      this["score" + i].score = _root["tank_" + i].total_score;
      i++;
   }
   i = 1;
   while(i < _root.pocet_hracu + 1)
   {
      set("t" + i,_root.pocet_hracu);
      i++;
   }
   c = 1;
   while(c < _root.pocet_hracu + 1)
   {
      i = 1;
      while(i < _root.pocet_hracu + 1)
      {
         if(_root["tank_" + c].total_score >= _root["tank_" + i].total_score && c != i)
         {
            this["t" + c] -= 1;
         }
         i++;
      }
      c++;
   }
   p1 = new Object();
   p1.total_score = -1000000000000000000;
   i = 1;
   while(i < _root.pocet_hracu + 1)
   {
      if(p1.total_score < _root["tank_" + i].total_score)
      {
         p1 = _root["tank_" + i];
         this["score" + i]._y = 28.3;
      }
      i++;
   }
   p2 = new Object();
   p2.total_score = -10000000000000000000;
   i = 1;
   while(i < _root.pocet_hracu + 1)
   {
      if(p2.total_score < _root["tank_" + i].total_score && p1 != _root["tank_" + i])
      {
         p2 = _root["tank_" + i];
         this["score" + i]._y = 42.45;
      }
      i++;
   }
   p3 = new Object();
   p3.total_score = -10000000000000000000;
   i = 1;
   while(i < _root.pocet_hracu + 1)
   {
      if(p3.total_score < _root["tank_" + i].total_score && p1 != _root["tank_" + i] && p2 != _root["tank_" + i])
      {
         p3 = _root["tank_" + i];
         this["score" + i]._y = 56.6;
      }
      i++;
   }
   p4 = new Object();
   p4.total_score = -10000000000000000000;
   i = 1;
   while(i < _root.pocet_hracu + 1)
   {
      if(p4.total_score < _root["tank_" + i].total_score && p1 != _root["tank_" + i] && p2 != _root["tank_" + i] && p3 != _root["tank_" + i])
      {
         p4 = _root["tank_" + i];
         this["score" + i]._y = 70.75;
      }
      i++;
   }
   p5 = new Object();
   p5.total_score = -10000000000000000000;
   i = 1;
   while(i < _root.pocet_hracu + 1)
   {
      if(p5.total_score < _root["tank_" + i].total_score && p1 != _root["tank_" + i] && p2 != _root["tank_" + i] && p3 != _root["tank_" + i] && p4 != _root["tank_" + i])
      {
         p5 = _root["tank_" + i];
         this["score" + i]._y = 84.9;
      }
      i++;
   }
}
cl = new Color(name);
i = 1;
while(i < _root.pocet_hracu + 1)
{
   this.attachMovie("score_tab","score" + i,1090000 + i);
   this["score" + i]._x = 36;
   this["score" + i]._y = 14.15 * i + 14.15;
   this["score" + i].name = _root["tank_" + i].name;
   this["score" + i].score = _root["tank_" + i].total_score;
   this["col" + i] = new Color(this["score" + i]);
   this["col" + i].setRGB(_root["tank_" + i].col);
   i++;
}
player_changed();
