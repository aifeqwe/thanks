onClipEvent(load){
   if(_quality == "HIGH")
   {
      gotoAndStop(2);
   }
   else if(_quality == "MEDIUM")
   {
      _parent.rad2.gotoAndStop(2);
   }
   else if(_quality == "LOW")
   {
      _parent.rad3.gotoAndStop(2);
   }
}
