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
    float a1 = noise(x/(width*r1/5000) + r1, y/(height*r1/5000) + r1)*TWO_PI;
    float a2 = a1 + noise(x/(width*r2/5000) + r2, y/(height*r2/5000) + r2)*TWO_PI;
    fill(240);
    noStroke();
    arc(x, y, s, s, a1, a2, PIE);
    noFill();
    stroke(150);
    arc(x, y, s, s, a1, a2);
  }
}
