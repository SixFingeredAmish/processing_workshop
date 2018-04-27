float angle;
float chartRadius = 300;
float[] segments = {};
color[] colors = {};
String[] labels = {};
float mouseAngle;
float mouseRad;
int labelIndex;
PFont font;
Table values;
float totalValues = 0;
String title = "Events";

void setup() {
  size(1280, 800);
  noStroke();
  font = createFont("Helvetica-Bold", 14, true);
  textFont(font);  

  generateChart("events.csv");
}

void draw() {
  background(255);
  
  // title
  fill(0);
  noStroke();
  textSize(24);
  textAlign(CENTER);
  text(title, width/2, 60);

  labelIndex = -1;

  getMouseAngle();

  // init start angle in radians (0 to 2x PI)
  angle = 0.0;

  for (int i = 0; i < segments.length; i++) {

    // map percent to degrees
    float percentToDegrees = map(segments[i], 0, totalValues, 0, 360);

    // set angle in radians
    float endAngle = angle + radians(percentToDegrees);
    
    // check if mouse in bounds of an arc segment
    if (((mouseAngle > angle) && (mouseAngle < endAngle)) && (mouseRad < chartRadius)) {
      labelIndex = i;
      fill(0);
    } else {
      fill(colors[i]);
    }

    // draw arc
    arc(width/2, height/2, chartRadius*2, chartRadius*2, angle, endAngle);

    // set start angle to end angle
    angle = endAngle;
  }

  drawLabel();
}

void getMouseAngle() {
  // get mouse position relative to sketch center
  float translateX = map(mouseX, 0, width, -width/2, width/2);
  float translateY = map(mouseY, 0, height, -height/2, height/2);

  // first, get radius and angle by converting cartesian mouse coordinates to polar coordinates
  mouseRad = sqrt(pow(translateY, 2) + pow(translateX, 2));
  mouseAngle = atan2(translateY, translateX);

  // if is necessary to translate negative into positive values to get the full circle
  if (mouseAngle < 0) {
    mouseAngle = PI + (PI + mouseAngle);
  }
}

void drawLabel() {
  if (labelIndex != -1) {
    textAlign(LEFT);
    textSize(14);

    String txt = labels[labelIndex];
    float labelW = textWidth(txt);

    fill(0);
    rect(mouseX + 5, mouseY - 25, labelW + 10, 22);

    fill(255);
    text(txt, mouseX + 10, mouseY - 10);
  }
}

void generateChart(String url) {

  // initialize arrays
  labels = new String[0];
  segments = new float[0];
  colors = new color[0];
  totalValues = 0;
  
  // read csv
  values = loadTable(url, "header");

  // iterate through table
  for (TableRow row : values.rows ()) {
    String field = row.getString("label");
    float value = parseFloat(row.getString("value"));
    
    totalValues += value;

    // add to arrays
    labels = append(labels, field);
    segments = append(segments, value);
    colors = append(colors, color((int) random(255), (int) random(255), (int) random(255)));
  }
}

void keyPressed() {
  if (key == '1') {
    generateChart("events.csv");
    title = "Events";
  }
  if (key == '2') {
    generateChart("nationalities.csv");
    title = "Nationalities";
  }
  if (key == '3') {
    generateChart("places.csv");
    title = "Places";
  }
  if (key == '4') {
    generateChart("professions.csv");
    title = "Professions";
  }
}

