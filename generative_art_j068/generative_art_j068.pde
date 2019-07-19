int nb = 0;
int maxNb = 19;
int density = 2;
float x, y, z;
float a, b, c, d;
float dt;

void setup() {
  size(1200, 1200);
  pixelDensity(density);
  strokeWeight(0.0025);
  colorMode(HSB, 360, 100, 100, 100);
  noFill();
  boot();
}

void draw() {
  translate(width/2+random(-20, 20), height/2+random(-20, 20));
  scale(100);
  for (int i = 0; i < 500000; i++) {
    float xnew=sin(a*y)+c*cos(a*x);
    float ynew=sin(b*x)+d*cos(b*y);
    x = xnew;
    y = ynew;
    point(x, y);
  }
  saveImg();
} 

void boot() {
  background(0, 0, 2);
  stroke(random(360), 90, 90);
  a = random(-3, 3);
  b = random(-3, 3);
  c = random(-3, 3);
  d = random(-3, 3);
  dt = random(0.5, 1.5);
  x = 0.1;
  y = 0.1;
}

void saveImg() {
  save("art" + nb + ".jpg");
  nb++;
  if (nb > maxNb) exit();
  boot();
}
