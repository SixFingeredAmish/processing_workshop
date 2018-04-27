class Bubble {
  float x, y, r;
  color c;
  boolean isHovered = false;
 
  Bubble(float x_, float y_, float r_, color c_) {
    x = x_;
    y = y_;
    r = r_;
    c = c_;
  }
  
  void display() {
        
    // set fill
    if (isHovered) {
      fill(0);
    } else {
      fill(c);
    }
    
    noStroke();
    ellipse(x, y, r*2, r*2);
  }
  
  void onMouseOver() {    
    if (dist(mouseX, mouseY, x, y) <= r) {
      isHovered = true;
    } else {
      isHovered = false; 
    }
  }
}
