void setup() {
  size(700, 700);
  pixelDensity(2);
  noFill();
}

void draw() {
  for (int n = 0; n < 20; n++) {
    background(255);
    float s = random(100, 300);
    circle(width/2, height/2, s*2);
    PVector center = new PVector(random(width/2 - s/2, width/2 + s/2), random(height/2 - s/2, height/2 + s/2));
    int nb = int(random(20, 100));
    for (float a = 0; a < TWO_PI; a += TWO_PI/nb) {
      float x = cos(a)*s + width/2;
      float y = sin(a)*s + height/2;
      line(x, y, center.x, center.y);
    }
    save("art" + n + ".jpg");
  }
  exit();
}
