test_ = true;
i = 0;
while(i < 7)
{
   if(this["shot" + i] != true)
   {
      test_ = false;
      break;
   }
   i++;
}
if(test_ || end)
{
   gotoAndStop(14);
}