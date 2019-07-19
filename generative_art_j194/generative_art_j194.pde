void setup() {
  size(700, 700);
  pixelDensity(2);
  noFill();
  strokeWeight(0.8);
}

void draw() {
  for (int x = 0; x < 20; x++) {
    background(255);
    int r = int(random(1, 5));
    for (int n = 0; n < r; n++) {
      float s = random(150, 600);
      PVector center = new PVector(random(width), random(height));
      float a = random(TWO_PI);
      for (float i = 0; i < s; i++) {
        arc(center.x, center.y, i, i, random(TWO_PI)+a, random(TWO_PI)+a);
      }
    }
    save("art" + x + ".jpg");
  }
  exit();
}
