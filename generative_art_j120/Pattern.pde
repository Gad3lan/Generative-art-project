class Pattern {
  float x, y, s;
  Pattern(float px, float py, float size) {
    s = size;
    x = px;
    y = py;
  }
  
  void show() {
    float div1 = floor(random(1, 10));
    float div2 = floor(random(1, 10));
    float angle = random(TWO_PI);
    for (float a = 0 ; a < TWO_PI; a+= TWO_PI/(s*2)) {
      float x1 = x + s/4*cos(a);
      float y1 = y + s/4*sin(a);
      float x2 = x1 + s/4*cos(a*div1);
      float y2 = y1 + s/4*sin(a*div2);
      line(x1, y1, x2, y2);
    }
  }
}
