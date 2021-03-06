class Bubble {
  float x, y, r;
  color c;
  boolean isHovered = false;
  Label label;

  Bubble(float x_, float y_, float r_, color c_) {
    x = x_;
    y = y_;
    r = r_;
    c = c_;
    
    // initialize label
    String txt = "Value: " + int(r) + ", x: " + int(x) + ", y: " + int(y);
    label = new Label(txt);
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
      label.display(mouseX, mouseY);
    } else {
      isHovered = false; 
    }
  }
}
