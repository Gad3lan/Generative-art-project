void setup() {
  size(700, 700);
  pixelDensity(2);
  frameRate(3);
  strokeWeight(0.8);
}

void draw() {
  for (int n = 0; n < 20; n++) {
    background(255);
    float s = random(150, 300);
    int nb = int(random(50, 80));
    float xoff = random(10000);
    float yoff = random(10000);
    float off = 2*s/nb;
    for (int i = 1; i < nb; i++) {
      xoff += nb/120.;
      line(width/2 + s - (off*i), height/2 + s, width/2 + s - (off*i) + map(noise(xoff), 0, 1, -2*off, 2*off), height/2 - s);
    }
    for (int i = 1; i < nb; i++) {
      yoff += nb/120.;
      line(width/2 + s, height/2 + s - (off*i), width/2 - s, height/2 + s - (off*i) + map(noise(yoff), 0, 1, -2*off, 2*off));
    }
    save("art" + n + ".jpg");
  }
  exit();
}
