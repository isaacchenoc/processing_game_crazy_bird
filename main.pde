

int mode = 0;
int hard = 0;
int cd = 0;
float high = 200;
float t = 0;
float v = 0;
int cur = 0;
int best = 0;
ArrayList<Obst> obsts = new ArrayList<Obst>();
ArrayList<Bullet> bulls = new ArrayList<Bullet>();
// set some initial variables.

void setup() {
  fullScreen();
  reset();
  // necessary to implement a reset method to reset the game
}

void draw() {
  // there are three modes
  // 0 is start, 1 is play, 2 is over
  switch(mode) {
    case(2): {
  background(255);
  fill(0);
  textSize(35);
  text("Game Over!", width/2-100,height/4);
  text("Your Score: ", width/4+30, height/3);
  text(cur/10,width*2/3+30, height/3);
  text("Highest Score: ", width/4-20, height/3+40);
  text(best,width*2/3+30, height/3+40);
  text("Restart ! ", width/2-90, height/2+10);
  stroke(0);
  strokeWeight(2);
  noFill();
  rect(width/2-100, height/2-30,160,60);
  if (best>=150) {
    // reach high enough score to unlock hard mode
      rect(width/2-130, height/2+50,220,60);
      text("Hard Mode! ", width/2-120, height/2+90);
      text("In Hard Mode, gaps are blocked,", width/4 , height/2+200);
      text("but you can press a to shoot them! ", width/4 , height/2+250);
    if (mousePressed && mouseX>width/2-130 && mouseX<width/2+90 && mouseY>height/2+50 && mouseY<height/2+110) {
    mode = 1;
    hard = 1;
    reset();
  }
  }
  else {
      stroke(150);
      rect(width/4, height/2+50,610,60);
      fill(150);
      text("Reach 150 to unlock next difficuty", width/4+10, height/2+90);
  }
  
  if (mousePressed && mouseX>width/2-100 && mouseX<width/2+60 && mouseY>height/2-30 && mouseY<height/2+30) {
    mode = 1;
    hard = 0;
    reset();
  }
  break;
    } 
    
    case(1): {
  textSize(15);
  stroke(0);
  background(255);
  text("Current Score: ", 10, 13);
  cur++;
  text(cur/10, 130, 13);
  text("Highest Score: ", 10, 28);
  if (best<=cur/10) {best=cur/10;}
  text(best, 130, 28);
  //update the current score and highest score
  cd -= 0.01;
  t +=0.01; 
  v += t;

  if (keyPressed && key ==' ') {
    v = -10;  
    t = 0;
  }
  high += v*(t+0.1)+t*t;
  // the bird is in projectile motion
  Bird bird = new Bird(high);
  bird.display();
  
  if (hard==1 && keyPressed && key == 'a' && cd<=0) {
    // in the hard more you can shoot
    bulls.add(new Bullet(175,bird.y+20));
    cd = 10;
  }
  
  if (obsts.get(0).x<-80) {
    // chekc the firt obtacle is off the edge or not
    // if off edge then add a new obstacle
    obsts.remove(0);
    float i = (obsts.get(obsts.size()-1)).h;
    i+=random(-250,120);
    while(i<0) {i+=50;}
    while(i>height-200) {i-=50;}
    float d = obsts.get(obsts.size()-1).x;
    obsts.add(new Obst (i,d+280));
  }
    
  for(Bullet a : bulls) {
    a.shoot();
    a.display();
  }  
    
  for(Obst a : obsts) {
    //first check whether the bullet touches the obstacle or not
    if (bulls.size()>0) {if (bulls.get(0).x>=a.x) {
      if (bulls.get(0).y<a.h||bulls.get(0).y>a.h+a.gap) {
        bulls.remove(0);
      }
      else if (a.block==1) {
        // if the bullet touches the block, then unblock
        a.unblock();
        bulls.remove(0);
        }
      }
    }
    a.move();
    a.display();
    //check whether the bird touches the obstacle or not
    if (a.x<127&&a.x>40&&(bird.y<a.h||bird.y>a.h+160)) {
    mode = 2;
    }
    if (a.x<144&&a.x>47&&(bird.y-10<a.h||bird.y>a.h+145)) {
    mode = 2;
    }
    if (a.x<170&&a.x>64&&(bird.y<a.h||bird.y>a.h+160)) {
    mode = 2;
    }
    if (a.x<180&&a.x>90&&(bird.y+14<a.h||bird.y>a.h+180||a.block==1)) {
    mode = 2;
    }
    if (bird.y+70<0||bird.y-20>height) {mode =2;}
    // check the bird is off edge or not
  }
  break;
    }
    
    case(0): {
  background(255);
  fill(0);
  textSize(35);
  text("Crazy Bird!", width/3,height/5);
  Bird b = new Bird (200);
  b.display();
  text("Press Space to Start", width/2-90, height/3+40);
  text("Press Space to Jump to avoid obstacles", width/6-20, height/2+40);
  if(keyPressed && key==' ') {    
    mode = 1;
    reset();
  }
    }
  }
}

void reset() {
    high = 200;
    t = 0;
    v = 0;
    cur = 0;
    obsts.clear();
    bulls.clear();
    float dif = random(0,height-120);
    int count = width/280;
    for (int i = 0; i<=count+1; i++) {
    dif+=random(-250,120);
    while(dif<0) {dif+=50;}
    while(dif>height-200) {dif-=50;}
    obsts.add(new Obst(dif, width+i*280));
  }
}
