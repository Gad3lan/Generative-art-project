int nb = 0;
int maxNb = 19;
int density = 2;
float x, y, z;
float a, b, c;
float dt;
float scale;

void setup() {
  size(600, 600, P3D);
  pixelDensity(density);
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
  scale(scale);
  beginShape();
  for (int i = 0; i < 1000; i++) { 
    float dx = (- y - z) * dt;
    float dy = (x + a*y) * dt;
    float dz = (b + z*(x - c)) * dt;
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
  a = random(0.1, 0.3);
  b = random(0.1, 0.3);
  c = random(4, 20);
  x = 0.1;
  y = 0.1;
  z = 0.1;
  dt = random(0.005, 0.05);
  scale = random(10, 15);
  strokeWeight(1/scale);
}

void saveImg() {
  save("art" + nb + ".jpg");
  nb++;
  if (nb > maxNb) exit();
  boot();
}
