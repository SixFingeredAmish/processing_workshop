float angle;
float chartRadius = 300;
float[] segments = new float[10];
color[] colors = new color[10];

void setup() {
  size(1280, 800);
  noStroke();
  
  generateChart();
}

void draw() {
  background(240);

  // init start angle in radians (0 to 2x PI)
  angle = 0.0;

  for (int i = 0; i < segments.length; i++) {

    fill(colors[i]);

    // map percent to degrees
    float percentToDegrees = map(segments[i], 0, 1, 0, 360);

    // set angle in radians
    float endAngle = angle + radians(percentToDegrees);

    // draw arc
    arc(width/2, height/2, chartRadius*2, chartRadius*2, angle, endAngle);

    // set start angle to end angle
    angle = endAngle;
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
