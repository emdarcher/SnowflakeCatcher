import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class SnowflakeCatcher extends PApplet {

SnowFlake[] flakes;
int total_flakes_amount = 64;
int drag_color = 0xff348928;

public void setup()
{
  //your code here
  size(300,300);

  background(0);
  flakes = new SnowFlake [total_flakes_amount];
  init_flakes();
}
public void draw()
{
  //your code here
  flakes_do_stuff();
}
public void mouseDragged()
{
  //your code here
  fill(drag_color);
  ellipse(mouseX,mouseY,8,8); 
}

class SnowFlake
{
  //class member variable declarations
  int x,y;
  boolean isMoving;
  SnowFlake(){
    //class member variable initializations
    x = (int)(Math.random()*width);
    y = (int)(Math.random()*height);
    isMoving = true;
  }
  public void show()
  {
    //your code here
    fill(255);
    ellipse(x, y, 5, 5);
  }
  public void lookDown()
  {
    //your code here
    if((y>=0)&&(y<=height)){
      isMoving = (get(x,y+1)!=0xff000000) ? false : true; 
    }
  }
  public void erase()
  {
    //your code here
    fill(0);
    ellipse(x, y, 7, 7);
  }
  public void move()
  {
    //your code here
    if(isMoving==true){y++;}
  }
  public void wrap()
  {
    //your code here
    if((y>=height)){
      y=0; x = (int)(Math.random()*width);
    }
  }
}

public void init_flakes(){
  for(int i=0;i<flakes.length;i++){
    flakes[i] = new SnowFlake();
  }
}
public void flakes_do_stuff(){
  for(int i=0;i<flakes.length;i++){
    flakes[i].erase();
    flakes[i].lookDown();
    flakes[i].move();
    flakes[i].wrap();
    flakes[i].show();
  }
}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "SnowflakeCatcher" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
