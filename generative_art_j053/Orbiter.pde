class Orbiter {
  float angle;
  int nb;
  float size = random(20, 30);
  float r = random(random(50, 100), 275);
  float step = map(r, 100, 300, 0.3, 0.07) *random(0.8, 1.2);
  color col;
  
  Orbiter() {
    angle = random(TWO_PI);
    off += 0.5;
    nb = int(random(5, 20));
    col = color(hue + random(-40, 40), random(40, 80), random(60, 90));
  }
  
  void display() {
    fill(col);
    for (int i = 0; i < nb; i++) {
      float x = cos(angle - step * i) * r;
      float y = sin(angle - step * i) * r;
      circle(x, y, map(i, 0, nb, size, 0));
    }
    angle += step/100;
  }
}
