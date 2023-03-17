onClipEvent(enterFrame){
   if(_root.type == "ai" && _alpha < 100)
   {
      _alpha = _alpha + speed;
   }
   else if(_root.type == "tank" && 0 < _alpha)
   {
      _alpha = _alpha - speed;
   }
}
