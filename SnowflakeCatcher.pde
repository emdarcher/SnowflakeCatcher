SnowFlake[] flakes;
int total_flakes_amount = 64;
color drag_color = #348928;

void setup(){
  size(300,300);

  background(0);
  flakes = new SnowFlake [total_flakes_amount];
  init_flakes();
}
void draw(){
  flakes_do_stuff();
}
void mouseDragged(){
  fill(drag_color);
  ellipse(mouseX,mouseY,8,8); 
}

class SnowFlake {
  int x,y;
  boolean isMoving;
  SnowFlake(){
    x = (int)(Math.random()*width);
    y = (int)(Math.random()*height);
    isMoving = true;
  }
  void show(){
    fill(255);
    ellipse(x, y, 5, 5);
  }
  void lookDown(){
    if((y>=0)&&(y<=height)){
      isMoving = (get(x,y+1)!=#000000) ? false : true; 
    }
  }
  void erase(){
    fill(0);
    ellipse(x, y, 7, 7);
  }
  void move(){
    if(isMoving==true){y++;}
  }
  void wrap(){
    if((y>=height)){
      y=0; x = (int)(Math.random()*width);
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