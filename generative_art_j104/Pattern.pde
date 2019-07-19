class Pattern {
  float x, y, s, off, c;
  int div;
  Pattern(float px, float py, float size, int d) {
    s = size/2;
    x = px;
    y = py;
    div = d;
    off = random(TWO_PI); 
  }
  
  void show() {
    float angle = random(TWO_PI);
    if (random(1) > .5) {
      for (int i = 0; i < div; i++) {
        float size = map(i, 0, div, s, 0);
        beginShape();
        for (float a = angle; a < TWO_PI + angle; a += PI/2) {
          vertex(x + size*cos(a+(off*i)), y + size*sin(a+(off*i)));
        }
        endShape(CLOSE);
      }
    } else {
      for (int i = 0; i < div; i++) {
        float size = map(i, 0, div, s, 0);
        beginShape();
        for (float a = angle + TWO_PI; a > angle; a -= PI/2) {
          vertex(x + size*cos(a+(off*i)), y + size*sin(a+(off*i)));
        }
        endShape(CLOSE);
      }
    }
  }
}
