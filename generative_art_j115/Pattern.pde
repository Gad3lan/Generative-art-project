class Pattern {
  float x, y, s;
  float div = random(2, 4);
  boolean lastx, lasty;
  Pattern(float px, float py, float size) {
    s = size;
    x = px += random(-s/8, s/8);
    y = py += random(-s/8, s/8);
  }
  
  void show() {
    int r = int(random(7));
  for (int i = 0; i < r; i++) {
    circle(random(x-s/2, x+s/2), random(y-s/2, y+s/2), random(s/50, s/10));
  }
  for (int i = 0; i < 10; i++) {
    float off = random(10000);
    beginShape();
    for (float a = 0; a <= TWO_PI + QUARTER_PI; a += QUARTER_PI/2) {
      float size = s/div+map(noise(off), 0, 1, -s/20, s/20);;
      curveVertex(x + size*cos(a), y + size*sin(a));
      off += 0.8;
    }
    s-= s/40;
    endShape(CLOSE);
    }
  }
}
