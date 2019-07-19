class Pattern {
  float x, y, s, off, c;
  int div;
  Pattern(float px, float py, float size, int d) {
    s = size;
    x = px;
    y = py;
    div = d;
    off = random(TWO_PI); 
  }
  
  void show() {
    float s1 = random(s);
    float s2 = random(s);
    fill(225);
    circle(x, y, s1);
    fill(0);
    circle(x, y, s2);
  }
}
