SnowFlake[] flakes;
int total_flakes_amount = 64;
color drag_color = #348928;

void setup(){
  size(300,300);

  background(0);
  flakes = new SnowFlake [total_flakes_amount];
  init_flakes();
  frameRate(30);
}
void draw(){
  flakes_do_stuff();
}
void mouseDragged(){
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
  void show(){
    fill(255);
    ellipse(Sx, Sy, 5, 5);
  }
  void lookDown(){
    if((Sy>=0)&&(Sy<=(height-barr))){
      isMoving = (get(Sx,Sy+6)!=#000000) ? false : true; 
    }
  }
  void erase(){
    fill(0);
    ellipse(Sx, Sy, 7, 7);
  }
  void move(){
    if(isMoving==true){Sy++;}
  }
  void wrap(){
    if((Sy>=(height-barr))){
      Sy=0; Sx = (int)(Math.random()*width);
    }
  }
}

void init_flakes(){
  for(int i=0;i<flakes.length;i++){
    flakes[i] = new SnowFlake();
  }
}
void flakes_do_stuff(){
  for(int i=0;i<flakes.length;i++){
    flakes[i].erase();
    flakes[i].lookDown();
    flakes[i].move();
    flakes[i].wrap();
    flakes[i].show();
  }
}