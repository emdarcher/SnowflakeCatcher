SnowFlake[] flakes;
int total_flakes_amount = 64;
color drag_color = #348928;

void setup()
{
  //your code here
  size(300,300);

  background(0);
  flakes = new SnowFlake [total_flakes_amount];
  init_flakes();
}
void draw()
{
  //your code here
  flakes_do_stuff();
}
void mouseDragged()
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
  void show()
  {
    //your code here
    fill(255);
    ellipse(x, y, 5, 5);
  }
  void lookDown()
  {
    //your code here
    if((y>=0)&&(y<=height)){
      isMoving = (get(x,y+1)!=#000000) ? false : true; 
    }
  }
  void erase()
  {
    //your code here
    fill(0);
    ellipse(x, y, 7, 7);
  }
  void move()
  {
    //your code here
    if(isMoving==true){y++;}
  }
  void wrap()
  {
    //your code here
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