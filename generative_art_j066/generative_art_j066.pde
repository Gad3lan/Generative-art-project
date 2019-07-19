import peasy.*;
PeasyCam cam;

int nb = 0;
int maxNb = 19;
int density = 2;
float x, y, z;
float a, b, c;
float dt;

void setup() {
  size(600, 600, P3D);
  pixelDensity(density);
  strokeWeight(0.07);
  colorMode(HSB, 360, 100, 100, 100);
  noFill();
  boot();
}

void draw() {
  background(0, 0, 100);
  translate(width/2+random(-20, 20), height/2+random(-20, 20));
  rotateX(random(TWO_PI));
  rotateY(random(TWO_PI));
  rotateZ(random(TWO_PI));
  scale(10);
  beginShape();
  for (int i = 0; i < 1000; i++) { 
    float dx = (a * (y - x)) * dt;
    float dy = (x * (b - z) - y) * dt;
    float dz = (x * y - c * z) * dt;
    x += dx;
    y += dy;
    z += dz;
    curveVertex(x, y, z);
  }
  endShape();
  saveImg();
}

void boot() {
  background(0, 0, 100);
  a = random(5, 15);
  b = random(10, 30);
  c = 8.0/3.0;
  x = 0.1;
  y = 0.1;
  z = 0.1;
  dt = random(0.005, 0.05);
}

void saveImg() {
  save("art" + nb + ".jpg");
  nb++;
  if (nb > maxNb) exit();
  boot();
}
