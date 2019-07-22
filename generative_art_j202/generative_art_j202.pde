void setup() {
  size(700, 700);
  pixelDensity(2);
  frameRate(3);
}

void draw() {
  translate(width/2, height/2);
  for (int n = 0; n < 20; n++) {
    rotate(random(TWO_PI));
    background(255);
    float s = floor(random(150, 300));
    float nb = floor(random(s/20, s/10));
    float space = random(20, 40);
    strokeWeight(15);
    for (float i = 0; i < nb; i++) {
      float x = map(i, 0, nb-1, -s+2, s-2);
      float y = -sqrt(pow(s, 2)-pow(x, 2));
      point(x, y);
      for (float t = 0; t < -2*y ; t++) {
        float add = random(-2*y-t);
        if (y+t+add+space > -y) {
          line(x, y+t, x, -y);
        } else {
          line(x, y+t, x, y+t+add);
        }
        t += add+space;
      }
    }
    save("art" + n + ".jpg");
  }
  exit();
}
