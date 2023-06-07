class Obst {
  float h;
  float w;
  float x;
  float gap;
  int block;
  
  Obst (float h, float x){
  this.h = h;
  this.x = x;
  w = 80;
  gap = 200;
  block = 0;
  //if the mode is hard, the obstacle has block
  if (hard == 1) {
    block=1;
  }
  }  
  
  void move() {
  x-=3;
  } 
  
  void unblock() {
  block = 0;
  }

  void display() {
    fill(0);
    rect(x,0,w,h,5);
    rect(x,h+gap,w,height,5);    
    if (block == 1) {
      noFill();
      strokeWeight(2);
      rect(x,h,w,gap);
      fill(0);
    }
  }
}