on(release){
   if(!_root.released)
   {
      if(type == "tank")
      {
         type = "ai";
         check.gotoAndStop(2);
      }
      else
      {
         type = "tank";
         check.gotoAndStop(1);
      }
   }
}
