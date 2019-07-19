void setup() {
  size(700, 700);
  pixelDensity(2);
}

void draw() {
  for (int x = 0; x < 20; x++) {
    background(255);
    int nb = int(random(5, 20));
    for (int i = 0; i < nb; i++) {
      PVector pos = new PVector(random(width), random(height));
      for (float s = random(50, 300); s > 0; s--) {
        circle(pos.x, pos.y, s);
        s = random(0, s);
      }
    }
    save("art" + x + ".jpg");
  }
  exit();
}
