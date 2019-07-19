void setup() {
  size(700, 700);
  pixelDensity(2);
  frameRate(3);
}

void draw() {
  for (int n = 0; n < 20; n++) {
    background(255);
    float s = random(150, 300);
    int div = int(random(5, 20));
    int nb = int(random(3, 10));
    float aoff = random(TWO_PI);
    for (float a = aoff; a < TWO_PI+aoff; a += TWO_PI/nb) {
      for (int i = 0; i < div; i++) {
        float x1 = width/2 + map(i, 0, div-1, 0, s)*cos(a);
        float x2 = width/2 + map(i, 0, div-1, s, 0)*cos(a+TWO_PI/nb);
        float y1 = height/2 + map(i, 0, div-1, 0, s)*sin(a);
        float y2 = height/2 + map(i, 0, div-1, s, 0)*sin(a+TWO_PI/nb);
        line(x1, y1, x2, y2);
      }
    }
    save("art" + n + ".jpg");
  }
  exit();
}
