on(release, keyPress "<Enter>"){
   if(pocet_hracu >= cur)
   {
      if(_root.name != "")
      {
         _root["tank_" + cur].name = _root.name;
      }
      else
      {
         _root["tank_" + cur].name = "Player " + cur;
      }
      _root["tank_" + cur].col = _root.col;
      _root["tank_" + cur].type = type;
      if(type == "ai")
      {
         _root["tank_" + cur].dif = dif;
      }
      _root.name = "";
      cur++;
      if(pocet_hracu >= cur)
      {
         cislo = "Player " + cur;
      }
      else
      {
         gotoAndPlay(3);
      }
      if(cur == pocet_hracu)
      {
         _root.uk = "START ! ";
      }
   }
}
