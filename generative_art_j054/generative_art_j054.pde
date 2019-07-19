int nb = 0;
int maxNb = 19;
int density = 2;
float hue;
Arc arc;

void setup() {
  size(600, 600);
  pixelDensity(density);
  colorMode(HSB, 360, 100, 100, 100);
  noFill();
  strokeWeight(1);
  boot();
}

void draw() {
  translate(width/2, height/2);
  rotate(random(TWO_PI));
  arc.display();
  saveImg();
}

void boot() {
  background(0, 0, 100);
  hue = random(360);
  arc = new Arc();
}

void saveImg() {
  save("art" + nb + ".jpg");
  nb++;
  if (nb > maxNb) exit();
  boot();
}
