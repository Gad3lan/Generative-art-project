int nb = 0;
int maxNb = 19;
int density = 2;

void setup() {
  size(1200, 1200);
  pixelDensity(density);
  colorMode(HSB, 360, 100, 100, 100);
  strokeWeight(0.5);
  noStroke();
  boot();
}

void draw() {
  translate(width/2, height/2);
  rotate(random(TWO_PI));
  float div = random(10, 20);
  float u1 = 1;
  float u2 = 1;
  float angle = PI/random(3, 6);
  float list[] = new float[20];
  for (int i = 0; i < 20; i++) {
    float u = u1 + u2;
    u2 = u1;
    u1 = u;
    list[i] = u;
  }
  float hue = random(360);
  float off = random(5, 20);
  for (int i = 19; i >= 0; i--) {
    rotate(angle);
    fill(map(i, 19, 0, hue, (hue + 220)%360), 90, map(i, 19, 0, 90, 50));
    rect(0, off, list[i]/div, list[i]/div);
  }
  saveImg();
}

void boot() {
  background(0, 0, 100);
}

void saveImg() {
  save("art" + nb + ".jpg");
  nb++;
  if (nb > maxNb) exit();
  boot();
}
