onClipEvent(enterFrame){
   if(_root.testing)
   {
      test = false;
      i = 1;
      while(_root.pocet_hracu >= i)
      {
         if(_root["tank" + i].testing != false && _root["tank_" + i].live == true)
         {
            test = true;
            break;
         }
         i++;
      }
      if(!test)
      {
         if(1 < _root.hracu)
         {
            _root.nextplayer();
         }
         _root.testing = false;
      }
      if(_root.hracu < 2 && _root.end == false && _root.testing == false)
      {
         _root.end = true;
         play();
      }
   }
}
