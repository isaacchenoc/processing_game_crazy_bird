class Bird {
  float y;
  float x;
  float fire;
  
  Bird (float y) {
    x = 120;
    this.y = y;
  }

  void display() {
    fill(0);
    rect(x, y, 50, 40, 10);
    triangle(x+50, y+11, x+50, y+22, x+60, y+17);
    triangle(x+50, y+18, x+50, y+29, x+60, y+23);
    fill(255);
    ellipse(x+37, y+15, 22, 17);
    fill(0);
    ellipse(x+37, y+15, 6, 5);
    wings(x,y);
  }
  
  void wings(float x, float y) {
    strokeWeight(2);
    line(x+22, y, x+16, y-12);
    line(x+22, y, x+7, y-6);
    line(x+22, y, x+11, y-10);
    line(x+22, y+40, x+16, y+52);
    line(x+22, y+40, x+7, y+46);
    line(x+22, y+40, x+11, y+50);
  }
  
  
}