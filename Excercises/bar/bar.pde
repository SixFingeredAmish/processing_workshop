int y = 0;
int w = 30;

void setup() {
  background(0);
  size(1000, 1000);
  
  //right side bar
  y = height;
  
  fill(255, 255, 255, 150);
    noStroke();
  
  for (int x = 0; x < 15; x++) {
    float h = random(10, 500);
    rect(x * w, h, w, y);
  }
}

void draw() {
  
}
