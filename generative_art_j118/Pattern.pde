class Pattern {
  float x, y, s;
  Pattern(float px, float py, float size) {
    s = size;
    x = px+s/2;
    y = py+s/2;
  }
  
  void show() {
    float off = random(10000);
    for (int i = 0; i < int(s/2); i++) {
      circle(x, y, noise(off) * s);
      off += .1;
    }
  }
}
