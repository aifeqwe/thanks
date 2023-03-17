weapons = new Array();
weapons[0] = ["bmissile","Small missile",0,0,"bmissile_g"];
weapons[1] = ["missile","Missile",2000,10,"missile_g"];
weapons[2] = ["bnuke","Small atom bomb",5000,2,"bnuke_g"];
weapons[3] = ["nuke","Atom bomb",13000,1,"nuke_g"];
weapons[4] = ["funky","Volcano bomb",8000,2,"funky_g"];
weapons[5] = ["mirv","Shower",9000,2,"mirv_g"];
weapons[6] = ["death","Hot shower",30000,1,"death_g"];
weapons[7] = ["broller","Small ball",5000,5,"broller_g"];
weapons[8] = ["roller","Ball",6000,2,"roller_g"];
weapons[9] = ["hroller","Large ball",15000,1,"hroller_g"];
weapons[10] = ["broller2","Small ball V2",6500,5,"broller2_g"];
weapons[11] = ["roller2","Ball V2",7500,2,"roller2_g"];
weapons[12] = ["hroller2","Large ball V2",18000,1,"hroller2_g"];
weapons[13] = ["astrike","Air strike",25000,1,"astrike_g"];
specials = new Array();
specials[0] = ["par","Parachutes",5000,5];
specials[1] = ["repair","Repair kit",4000,5];
specials[2] = ["fuel","Fuel",3000,50];
specials[3] = ["sshield","Weak shield",5000,2,"weak_sh"];
specials[4] = ["shield","Shield",10000,1,"shield_sh"];
specials[5] = ["stshield","Strong shield",15000,1,"strong_sh"];
specials[6] = ["spshield","Super shield",20000,1,"super_sh"];
specials[7] = ["teleport","Teleport",15000,1];
specials[8] = ["upenergy","Upgrade energy",5000,1];
specials[9] = ["uparmor","Upgrade armor",10000,1];
specials[10] = ["upmove","Upgrade engine",7000,1];
specials[11] = ["uphill","Upgrade hill move",5000,1];
i = 1;
while(i < pocet_hracu + 1)
{
   _root["tank_" + i] = new Object();
   _root["tank_" + i].guns = new Array();
   _root["tank_" + i].specials = new Array();
   x = 0;
   while(x < weapons.length)
   {
      _root["tank_" + i].guns[x] = 0;
      x++;
   }
   x = 0;
   while(x < specials.length)
   {
      _root["tank_" + i].specials[x] = 0;
      x++;
   }
   _root["tank_" + i].guns[0] = 99;
   _root["tank_" + i].guns[4] = 100;
   _root["tank_" + i].t_num = i;
   _root["tank_" + i].cur_gun = 0;
   _root["tank_" + i].energy = 100;
   _root["tank_" + i].max_energy = 100;
   _root["tank_" + i].shield = 1;
   _root["tank_" + i].specials[0] = 8;
   _root["tank_" + i].specials[1] = 8;
   _root["tank_" + i].specials[3] = 8;
   _root["tank_" + i].specials[4] = 8;
   _root["tank_" + i].specials[5] = 8;
   _root["tank_" + i].specials[6] = 8;
   _root["tank_" + i].specials[2] = 250;
   _root["tank_" + i].specials[7] = 8;
   _root["tank_" + i].fuel = 500;
   _root["tank_" + i].score = 5000;
   _root["tank_" + i].total_score = 0;
   _root["tank_" + i].live = true;
   _root["tank_" + i].kills = 0;
   _root["tank_" + i].col = 3355443;
   _root["tank_" + i].name = "";
   i++;
}
if(krajina == 0)
{
   rand_krajina = true;
}
game = 0;
uk = "Next player";
name = "";
cur = 1;
cislo = "Player " + cur;
firstgame = true;
type = "tank";
released = false;
dif = "normal";
