class Pattern {
  float x, y, s;
  Pattern(float px, float py, float size) {
    s = size/2;
    x = px+size/2;
    y = py+size/2;
  }
  
  void show() {
    float angle = noise(x/r2+r, y/r2+r)*TWO_PI;
    beginShape();
    for (float i = 0; i < TWO_PI; i+=HALF_PI) {
      vertex(x + s*cos(angle+i), y + s*sin(angle+i));
    }
    endShape(CLOSE);
  }
}
