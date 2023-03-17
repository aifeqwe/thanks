onClipEvent(mouseMove){
   if(_X + _width / 2 < _xmouse || _xmouse < _X - _width / 2 || _Y + _height / 2 < _ymouse || _ymouse < _Y - _height / 2)
   {
      _parent.gotoAndStop(1);
   }
}
