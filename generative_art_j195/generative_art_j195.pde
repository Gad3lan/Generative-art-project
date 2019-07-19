void setup() {
  size(700, 700);
  pixelDensity(2);
  frameRate(3);
}

void draw() {
  for (int n = 0; n < 20; n++) {
    background(255);
    int nb = int(random(200, 360));
    float s = random(150, 300);
    for (float a = 0; a < TWO_PI; a += TWO_PI/nb) {
      float x = cos(a)*s + width/2;
      float y = sin(a)*s + height/2;
      strokeWeight(random(2));
      line(width/2, height/2, x, y);
    }
    save("art" + n + ".jpg");
  }
  exit();
}
