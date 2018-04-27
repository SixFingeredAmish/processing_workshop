float angle;
float chartRadius = 300;
float[] segments = { 0.1, 0.3, 0.6 };
color[] colors = { color(255, 0, 0), color(0, 255, 0), color(0, 0, 255) };

void setup() {
  size(1280, 800);
  noStroke();
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
