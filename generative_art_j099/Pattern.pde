class Pattern {
  float x, y, s, off, c;
  Pattern(float px, float py, float size) {
    s = size/2;
    x = px+size/2;
    y = py+size/2;
    off = s/10; 
    c = random(s/2);
  }
  
  void show() {
    for (int i = 0; i < n; i++) {
      float size = map(i, 0, n, s, c);
      beginShape();
      for (float a = QUARTER_PI; a < TWO_PI+QUARTER_PI; a+=HALF_PI) {
        vertex(random(-off, off) + x + size*cos(a), random(-off, off) + y + size*sin(a));
      }
      endShape(CLOSE);
    }
  }
}
