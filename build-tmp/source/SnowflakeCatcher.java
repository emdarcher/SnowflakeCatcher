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

public void setup(){
  size(300,300);

  background(0);
  flakes = new SnowFlake [total_flakes_amount];
  init_flakes();
  frameRate(30);
}
public void draw(){
  flakes_do_stuff();
}
public void mouseDragged(){
  fill(drag_color);
  ellipse(mouseX,mouseY,8,8); 
}

class SnowFlake {
  int Sx,Sy,barr;
  boolean isMoving;
  SnowFlake(){
    Sx = (int)(Math.random()*width);
    Sy = (int)(Math.random()*height);
    isMoving = true;
    barr = 6;
  }
  public void show(){
    fill(255);
    ellipse(Sx, Sy, 5, 5);
  }
  public void lookDown(){
    if((Sy>=0)&&(Sy<=(height-barr))){
      isMoving = (get(Sx,Sy+6)!=0xff000000) ? false : true; 
    }
  }
  public void erase(){
    fill(0);
    ellipse(Sx, Sy, 7, 7);
  }
  public void move(){
    if(isMoving==true){Sy++;}
  }
  public void wrap(){
    if((Sy>=(height-barr))){
      Sy=0; Sx = (int)(Math.random()*width);
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
