float x = width/2;
float y = 0;
float speed = 0.1;
float accel = 1.05;

void setup() {
  size(1024,768);
  //background(0);
  
  //font setup
  PFont font = createFont("Comic Sans MS", 18);
  textFont(font);
}

void draw() {
  background(0);
  //stroke(255);
  //strokeWeight(2);
  //line(mouseX, mouseY, pmouseX, pmouseY);
  fill(255,54,101, 150);
  //text("Oh no!", x, y);
  ellipse(500, y, 100, 100);
  y = y + speed;
  speed = speed + accel;
  
  if(y > height) {
    speed = -speed;
    //accel = -accel;
  }
  
}

void mouseDragged() {
  //stroke(255, 255, 255, 50);
  //strokeWeight(2);
  //line(mouseX, mouseY, pmouseX, pmouseY);
  
  fill(255,54,101);
  text("Oh no!", mouseX, mouseY);
}
