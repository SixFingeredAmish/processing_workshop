import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class composition extends PApplet {
  public void setup() {

background(0);

//circle1
noStroke();
fill(139,255,219);
ellipse(550,500,200,200);

//circle2
noStroke();
fill(255,54,101, 125);
ellipse(400,500,200,200);

//circle3
noStroke();
fill(255,255,255, 50);
ellipse(450,300,400,400);

//circle4
stroke(255);
noFill();
ellipse(450,500,500,500);
    noLoop();
  }

  public void settings() { size(1000, 1000); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--present", "--window-color=#666666", "--stop-color=#cccccc", "composition" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
