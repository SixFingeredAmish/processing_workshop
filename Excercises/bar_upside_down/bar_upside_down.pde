int x = 50;
int y = 50;
int w = 30;

void setup() {
  background(0);
  size(1000, 1000);
  
  for (int i = 0; i < 15; i++) {
    fill(255, 255, 255, 150);
    noStroke();
    rect(x, y, w, random(850));
    x = x + 50;
  }
}

void draw() {
  
}
