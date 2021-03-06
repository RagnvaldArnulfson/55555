class Keys
{
  boolean[] keys;
  
  Keys()
  {
    keys=new boolean[4];
    keys[0]=false;
    keys[1]=false;
    keys[2]=false;
    keys[3]=false;
  }
}
  
void keyPressed()
{
  if(key==27)
    key=0;
  if(!pause&&!gameFinished)
  {
    if(keyCode==UP)
      keyboard.keys[0]=true;
    if(keyCode==DOWN)
      keyboard.keys[1]=true;
    if(keyCode==LEFT)
      keyboard.keys[2]=true;
    if(keyCode==RIGHT)
      keyboard.keys[3]=true;
    if(keyCode==ENTER&&titleScreen.gameStarted||key==' '&&titleScreen.gameStarted||key==0&&titleScreen.gameStarted)
      menu.trigger();
  }
  else if(!gameFinished)
  {
    if(keyCode==UP)
      menu.selected--;
    else if(keyCode==DOWN)
      menu.selected++;
    else if(menu.show==1&&key!=0&&menu.selected<4) //Settings enable/disabled
      menu.stg[menu.selected]=!menu.stg[menu.selected];
    else if(menu.show==1&&keyCode==ENTER&&menu.selected==4||menu.show==1&&key==' '&&menu.selected==4) //Settings RESET
      menu.resetGame();
    else if(keyCode==ENTER&&menu.show!=3||key==' '&&menu.show!=3||key==0&&menu.show!=0)    
      menu.execute();
    else if(key==0)
      menu.trigger();
  }
}
  
void keyReleased()
{
  if(keyCode==UP)
    keyboard.keys[0]=false;
  if(keyCode==DOWN)
    keyboard.keys[1]=false;
  if(keyCode==LEFT)
    keyboard.keys[2]=false;
  if(keyCode==RIGHT)
    keyboard.keys[3]=false;
}
