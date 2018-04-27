Bubble[] bubbles = new Bubble[193];

void setup() {
  size(640, 480);

  // read text file
  String[] data = loadStrings("drinks.csv");

  // initialize circle objects
  for (int i = 1; i < data.length; i++) {
    
    // convert string into array of floats
    String[] row = split(data[i], ',');
    
    // assign values from data file to variables
    String country = row[0];
    float beer = float(row[1]);
    float wine = float(row[2]);
    float alcohol = float(row[3]);
    
    float x = map(beer, 0, 376, 30, width-60);
    float y = map(wine, 0, 370, height-60, 30);
    float r = map(alcohol, 0, 14.4, 1, 30);
    
    color c = color(random(255), random(255), random(255), 200);
        
    bubbles[i-1] = new Bubble(country, x, y, r, c);
  }
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
