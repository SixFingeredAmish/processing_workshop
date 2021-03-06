class Label {
 
  PFont helvetica;
  String txt;

  Label(String txt_) {
    txt = txt_;
    helvetica = createFont("Helvetica-Bold", 14);
  }
  
  void display(float x, float y) {
    
    // get text width
    textFont(helvetica); 
    float labelW = textWidth(txt);
    
    // check if label would go beyond screen dims
    if (x + labelW + 20 > width) {
      x -= labelW + 20;
    }
    
    // draw bg
    fill(0);
    noStroke();
    rectMode(CORNER); // note: this is the default mode. confusing b/c similar to CORNERS (plural)
    rect(x+10, y-30, labelW+10, 22); 
    
    // draw text  
    fill(255);
    text(txt, x+15, y-15);
  }
}
