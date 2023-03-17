test_ = true;
i = 0;
while(i < 5)
{
   if(this["shot" + i] != true)
   {
      test_ = false;
      break;
   }
   i++;
}
if(test_)
{
   gotoAndStop(4);
}
