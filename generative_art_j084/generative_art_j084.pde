int nb = 0;
int maxNb = 19;
int density = 2;
float x, y, z;
float a;
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
  for (int i = 0; i < 5000; i++) { 
    float dx = (-a*x - 4*y - 4*z - y*y)*dt;
    float dy = (-a*y - 4*z - 4*x - z*z)*dt;
    float dz = (-a*z - 4*x - 4*y - x*x)*dt;
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
  a = random(1.4, 3);
  x = 0.1;
  y = 0;
  z = 0;
  dt = random(0.005, 0.02);
  scale = random(8, 12);
  strokeWeight(0.5/scale);
}

void saveImg() {
  save("art" + nb + ".jpg");
  nb++;
  if (nb > maxNb) exit();
  boot();
}
