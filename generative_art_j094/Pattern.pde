class Pattern {
  float x;
  float y;
  int n;
  float s;
  float off;
  int res;
  float angle = random(TWO_PI);
  Pattern(float px, float py, float size, int resolution) {
    s = size;
    x = px - s/2;
    y = py - s/2;
    res = resolution;
  }
  
  void show() {
    float cx = random(x, x+s);
    float cy = random(y, y+s);
    strokeWeight(1.2);
    square(x, y, s);
    strokeWeight(0.5);
    for (int i = 0; i < res; i++) {
      float px = x + i*s/res;
      line(px, y, cx, cy);
    }
    for (int i = 0; i < res; i++) {
      float px = x + i*s/res;
      line(px, y+s, cx, cy);
    }
    for (int i = 0; i < res; i++) {
      float py = y + i*s/res;
      line(x, py, cx, cy);
    }
    for (int i = 0; i <= res; i++) {
      float py = y + i*s/res;
      line(x+s, py, cx, cy);
    }
  }
}
