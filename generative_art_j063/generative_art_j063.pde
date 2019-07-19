int nb = 0;
int maxNb = 19;
int density = 2;
float r, a, R;

void setup() {
  size(600, 600);
  pixelDensity(density);
  colorMode(HSB, 360, 100, 100, 100);
  frameRate(120);
  strokeWeight(0.1);
  noFill();
  boot();
}

void draw() {
  translate(width/2, height/2);
  beginShape();
  for (int i = 0; i < 6000; i++) {
    float x = (R-r)*cos((r/R)*i) + a*cos((1-(r/R))*i);
    float y = (R-r)*sin((r/R)*i) - a*sin((1-(r/R))*i);
    curveVertex(x, y);
  }
  endShape();
  saveImg();
}

void boot() {
  background(0, 0, 100);
  r = int(random(50, 150));
  a = int(random(50, 150));
  R = int(random(150, 300));
}

void saveImg() {
  save("art" + nb + ".jpg");
  nb++;
  if (nb > maxNb) exit();
  boot();
}
