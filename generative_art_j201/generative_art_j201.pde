void setup() {
  size(700, 700);
  pixelDensity(2);
  frameRate(3);
  noFill();
  strokeWeight(0.5);
}

void draw() {
  translate(width/2, height/2);
  for (int n = 0; n < 20; n++) {
    background(255);
    float sx = random(50, 200);
    float sy = random(100, 200);
    float off = random(50, 200);
    int nb = int(random(100, 300));
    float rot = random(100, 200);
    float step = random(2);
    for (int i = 0; i < nb; i++) {
      ellipse(0, off, sx, sy);
      rotate(TWO_PI/rot);
      off-=step;
    }
    save("art" + n + ".jpg");
  }
  exit();
}
