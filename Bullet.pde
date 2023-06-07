class Bullet {
  float x;
  float y;
  
  Bullet(float x, float y) {
  this.x = x;
  this.y = y;
  }
  
  void display() {
     rect(x,y,10,3);
  }    
  
  void shoot() {
     x+=5;
  }
}