void setup() {
  size(700, 700);
  pixelDensity(2);
  noFill();
  frameRate(3);
  rectMode(CENTER);
}

void draw() {
  translate(width/2, height/2);
  for (int x = 0; x < 20; x++) {
    background(255);
    rotate(HALF_PI);
    float size = random(200, 500);
    square(0, 0, size);
    int nb = int(random(5, 30));
    for (int j = 0; j <= nb; j++) {
      line(0, -size/2, map(j, 0, nb, -size/2, size/2), size/2);
    }
    for (int j = 0; j <= nb; j++) {
      line(0, size/2, map(j, 0, nb, -size/2, size/2), -size/2);
    }
    save("art" + x + ".jpg");
  }
  exit();
}
