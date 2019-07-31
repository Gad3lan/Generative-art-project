void setup() {
  size(700, 700);
  pixelDensity(2);
  frameRate(3);
  noFill();
}

void draw() {
  for (int n = 0; n < 20; n++) {
    background(255);
    float border = random(50, 200);
    int nb = int(random(20, 40));
    int steps = int(random(2, 5));
    float off = (width-2*border)/nb;
    float xoff = random(10000);
    float yoff = random(10000);
    for (int i = 0; i < nb; i++) {
      beginShape();
      float y =  map(i, 0, nb-1, border, height-border);
      vertex(0, y);
      vertex(150, y);
      for (int j = 0; j < steps; j++) {
        float x = map(j, -1, steps, 150, 550);
        vertex(x, y + map(noise(xoff, yoff), 0, 1, -off, off));
        xoff++;
      }
      xoff -= 3;
      vertex(550, y);
      vertex(700, y);
      yoff += 1;
      endShape();
    }
    save("art" + n + ".jpg");
  }
  exit();
}
