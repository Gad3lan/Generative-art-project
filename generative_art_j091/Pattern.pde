class Pattern {
  float x;
  float y;
  int n;
  float s;
  float off;
  float angle = random(TWO_PI);
  Pattern(float px, float py, int nb, float size, float offset) {
    x = px;
    y = py;
    n = nb;
    s = size;
    off = offset;
  }
  
  void show() {
    for (int i = 0; i < n; i++) {
      circle(x + i*off*cos(angle), y + i*off*sin(angle), map(i, 0, n, s, 1));
    }
  }
}
