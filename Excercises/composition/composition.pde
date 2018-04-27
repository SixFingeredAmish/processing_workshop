void setup() {
  size(1000,1000);
  println("Something's wrong");
}
 
void draw() {
  background(0);
  
  //big circle
  noStroke();
  fill(255, 255, 255, 50);
  ellipse(width/2, height/2, 200, 200);
  
  //small circle
  noStroke();
  fill(255, 255, 255, 50);
  ellipse(width/2, height/2, 100,100);
  
  //track circle
  noStroke();
  fill(255, 54, 101, 170);
  ellipse(mouseX, mouseY, 50,50);
}
