void setup() {
  size(700, 700);
  colorMode(HSB, 360, 100, 100);
}

void draw() {
  background(0, 0, 0);

  branch(width / 2, 0, 90, height / 3.0, 0 );
}

void branch(float x, float y, float angle, float len, int hue) {
  float rad = radians(angle);
  float endX = x + len * cos(rad);
  float endY = y + len * sin(rad);

  if (hue < 0) hue += 360;
  if (hue > 359) hue -= 360;

  stroke(hue, 100, 100);
  line(x, y, endX, endY);
  // 4 inputs: starting x, and y, ending x, and y

  // recursive case (as compared to base case)
  if (len > 2) {
    float chAngle = -(mouseX - width / 2);
    float chLen = mouseY * 0.9 / height;

    float midX = (x + endX) / 2.0;
    float midY = (y + endY) / 2.0;

    branch(endX, endY, angle + chAngle, len * chLen * 0.75, hue - 30);
    branch(midX, midY, angle - chAngle * 1.2, len * chLen, hue + 30);
  }
}