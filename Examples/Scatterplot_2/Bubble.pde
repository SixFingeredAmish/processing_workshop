class Bubble {
  String txt;
  float x, y, r;
  color c;
  boolean isHovered = false;
  Label label;

  Bubble(String txt_, float x_, float y_, float r_, color c_) {
    txt = txt_;
    x = x_;
    y = y_;
    r = r_;
    c = c_;
    
    // initialize label
    label = new Label(txt + ": " + r);
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
