Bubble[] bubbles = new Bubble[40];

void setup() {
  size(640, 480);
      
  // plot 5 bubbles
  generateValues();
}

void draw() {
  background(255);
  
  // display bubbles
  for (int i = 0; i < bubbles.length; i++) {
    bubbles[i].display();
  }
  
  // check for mouse over and display label
  for (int i = 0; i < bubbles.length; i++) {
    bubbles[i].onMouseOver();
  }
}

void keyPressed() {
  generateValues();
  saveData();
}

void generateValues() {
  
  for (int i = 0; i < bubbles.length; i++) {
    
    // randomize x y values
    float x = random(width);
    float y = random(height);
            
    color c = color(random(255), random(255), random(255), 200);
    float r = random(10, 60);
    
    bubbles[i] = new Bubble(x, y, r, c);
  }
}

void saveData() {
  
  // create new array to match the number of circle objects
  String data[] = new String[bubbles.length];
  
  // iterate through the array
  for (int i = 0; i < bubbles.length; i++) {
    
    // create each line of the resulting text file
    data[i] = bubbles[i].x + "," + bubbles[i].y + "," + bubbles[i].r + "," + bubbles[i].c;
    
  }
  
  // save to file. NOTE: you need to specify the "data" folder in the URL!
  saveStrings("data/data.txt", data);
  
  println("data has been saved"); 
}
