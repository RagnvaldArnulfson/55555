class End
{
  float ending;
  float x;
  float y;
  float alpha;
  boolean clignement;
  String[] lastMessage;
  int dial;
  int frm;
  
  End()
  {
    clignement=false;
    x=0;
    y=0;
    alpha=0;
    ending=0;
    dial=0;
    frm=0;
    lastMessage=new String[17]; #spoil
    lastMessage[0] = "...";
    lastMessage[1] = "...";
    lastMessage[2] = "...";
    lastMessage[3] = "...";
    lastMessage[4] = "...";
    lastMessage[5] = "...";
    lastMessage[6] = "...";
    lastMessage[7] = "...";
    lastMessage[8] = "...";
    lastMessage[9] = "...";
    lastMessage[10] ="...";
    lastMessage[11] = "...";
    lastMessage[12] = "...";
    lastMessage[13] = "...";
    lastMessage[14] = "...";
    lastMessage[15] = "...";
    lastMessage[16] = "...";
  }
  
  void draw()
  {
    textSize(height/25);
    background(0);
    stroke(ending);
    if(frameCount%75<4||frameCount%75<9&&frameCount%75>5)
      clignement=true;
    else
      clignement=false;
    
    pushMatrix();
    translate(width/2, height/2);
    if(random(0,55)<2)
      translate(random(-height/4,height/4), random(-height/4,height/4));
    strokeWeight(height/50);
    fill(ending);
    if(ending>240||dial==16)
    {
      text(lastMessage[dial],0,(ending/255)*2*height/5);
      frm++;
      if(frm%275==0&&dial<16)
      {
        frm=0;
        dial++;
      }
    }
    translate(x,y);
    if(!clignement)
    {
      line(0,0,0,-(ending/255)*2*height/5); 
      rotate((ending/300)*PI/5);
      line(0,0,0,-(ending/255)*height/3);
      line(0,0,0,(ending/255)*height/4);
      rotate(-(ending/300)*2*PI/5);
      line(0,0,0,-(ending/255)*height/3);
      line(0,0,0,(ending/255)*height/4);
    }
    
    fill(55,55,55,ending);
    ellipse(0,0,(height/25)+(ending*height/(3*255)),(height/25)+(ending*height/(3*255)));
    if(!clignement)
    {
      strokeWeight(height/125);
      fill(0,0,0,ending);
      ellipse(0,0,(ending*height/(3*255))-(height/50),(ending*height/(3*255))-(height/50));
    }
    else    
      line((-(height/25)-(ending*height/(3*255)))/2,0,((height/25)+(ending*height/(3*255)))/2,0);
    popMatrix();
    if(ending<255&&dial<16)
      ending+=0.5;
    else if(dial==16&&ending>0)
      ending--; 
    else if(dial==16&&frm>555)
      exit();
    x=(ending/255)*cos(alpha)*height/75;
    y=(ending/255)*sin(alpha)*height/75;
    alpha=(alpha+PI/100)%(2*PI);    
  }
}
