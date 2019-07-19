int nb = 0;
int maxNb = 19;
int density = 2;
float x, y, z;
float a, b, c, d, e, f;
float dt;

void setup() {
  size(600, 600, P3D);
  pixelDensity(density);
  strokeWeight(0.007);
  colorMode(HSB, 360, 100, 100, 100);
  noFill();
  boot();
}

void draw() {
  translate(width/2+random(-20, 20), height/2+random(-20, 20));
  scale(100);
  rotateX(random(TWO_PI));
  rotateY(random(TWO_PI));
  rotateZ(random(TWO_PI));
  //beginShape();
  for (int i = 0; i < 100000; i++) { 
    float dx = ((z-b) * x - d * y)*dt;
    float dy = (d * x + (z-b) * y)*dt;
    float dz = (c + a*z - pow(z, 3)/3 - (pow(x, 2) + pow(y, 2))*(1 + e * z) + f * z * pow(x, 3))*dt;
    x += dx;
    y += dy;
    z += dz;
    point(x, y, z);
  }
  //endShape();
  saveImg();
}

void boot() {
  background(0, 0, 0);
  stroke(random(360), 90, 90);
  a = random(0.90, 1);
  b = random(0.6, 0.8);
  c = random(0.5, 0.7);
  d = random(3, 4);
  e = random(0.2, 0.3);
  f = 0.1;
  x = 0.1;
  y = 0;
  z = 0;
  dt = 0.01;
}

void saveImg() {
  save("art" + nb + ".jpg");
  nb++;
  if (nb > maxNb) exit();
  boot();
}
