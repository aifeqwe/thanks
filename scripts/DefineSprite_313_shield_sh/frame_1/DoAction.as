function damage(dam, attacker)
{
   en -= dam;
   _alpha = Math.round(en / en_max * 100);
   if(0 >= en)
   {
      _root["tank" + num].sh_active = false;
      _root["t" + num] = _root["tank" + num];
      _root["tank" + num].damage(Math.abs(en) * 2,attacker);
      this.removeMovieClip();
   }
}
function disable()
{
   this.removeMovieClip();
}
en = 200;
en_max = 200;
