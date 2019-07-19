class Pattern {
  float x;
  float y;
  int n;
  float s;
  float off;
  float angle = random(TWO_PI);
  Pattern(float px, float py, float size) {
    x = px;
    y = py;
    s = size;
  }
  
  void show() {
    float off = random(s/2);
    float s2 = random(s-off);
    float s1 = random(s/2);
    circle(x, y, s1);
    for (int i = 0; i < 4; i++) {
      float px = x + off*cos(QUARTER_PI + i*HALF_PI);
      float py = y + off*sin(QUARTER_PI + i*HALF_PI);
      circle(px, py, s2);
    }
  }
}
