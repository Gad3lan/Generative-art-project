class Pattern {
  float x, y, s, off, c;
  int div;
  Pattern(float px, float py, float size, int d) {
    s = size/2;
    x = px;
    y = py;
    div = d;
    off = random(TWO_PI); 
    c = random(s);
  }
  
  void show() {
    for (float i = 0; i < TWO_PI; i+=TWO_PI/div) {
      line(x + s*cos(i), y + s*sin(i), x + c*cos(i+off), y + c*sin(i+off));
    }
  }
}
