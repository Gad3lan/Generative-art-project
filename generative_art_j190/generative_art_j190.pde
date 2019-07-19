void setup() {
  size(700, 700);
  pixelDensity(2);
}

void draw() {
  translate(width/2, height/2);
  for (int n = 0; n < 20; n++) {
    background(255);
    for (int x = 0; x < 20; x++) {
      float s = random(100, 400);
      int nb = int(random(s/20, s/10));
      rotate(random(TWO_PI));
      float ystart = random(-height/2, height/2);
      rect(-width, ystart, 2*width, s);
      for (int i = 0; i < nb; i++) {
        line(-width, map(i, 0, nb, ystart, ystart+s), width, map(i, 0, nb, ystart, ystart+s));
      }
    }
    save("art" + n + ".jpg");
  }
  exit();
}
