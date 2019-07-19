class Pattern {
  float x, y, s;
  Pattern(float px, float py, float size) {
    s = size/2;
    x = px;
    y = py;
  }
  
  void show() {
    int nb = int(random(s*0.75, s*2));
    strokeWeight(0.5);
    circle(x, y, s*2);
    strokeWeight(1);
    for (int i = 0; i < nb; i++) {
      float a1 = random(TWO_PI);
      float a2 = random(TWO_PI);
      line(x + s*cos(a1), y + s*sin(a1), x + s*cos(a2), y + s*sin(a2));
    }
  }
}
