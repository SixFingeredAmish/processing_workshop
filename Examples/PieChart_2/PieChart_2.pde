float angle;
float chartRadius = 300;
float[] segments = new float[10];
color[] colors = new color[10];
float mouseAngle;
float mouseRad;

void setup() {
  size(1280, 800);
  noStroke();

  generateChart();
}

void draw() {
  background(255);

  getMouseAngle();

  // init start angle in radians (0 to 2x PI)
  angle = 0.0;

  for (int i = 0; i < segments.length; i++) {

    // map percent to degrees
    float percentToDegrees = map(segments[i], 0, 1, 0, 360);

    // set angle in radians
    float endAngle = angle + radians(percentToDegrees);

    // check if mouse in bounds of an arc segment
    if (((mouseAngle > angle) && (mouseAngle < endAngle)) && (mouseRad < chartRadius)) {
      fill(0);
    } else {
      fill(colors[i]);
    }

    // draw arc
    arc(width/2, height/2, chartRadius*2, chartRadius*2, angle, endAngle);

    // set start angle to end angle
    angle = endAngle;
  }
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

void generateChart() {
  float total = 1.0;
  for (int i = 0; i < segments.length; i++) {
    if (i == segments.length - 1) {
      segments[i] = total;
    } else {
      segments[i] = random(total);
      total = total - segments[i];
    }
    colors[i] = color((int) random(255), (int) random(255), (int) random(255));
  }
}

void keyPressed() {
  generateChart();
}

