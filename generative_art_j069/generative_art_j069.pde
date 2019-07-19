int nb = 0;
int maxNb = 19;
int density = 1;
float x, y, z;
float a, b, c, d;
float dt;
int scale = 150;

void setup() {
  size(1200, 1200);
  pixelDensity(density);
  strokeWeight(1/scale);
  colorMode(HSB, 360, 100, 100, 100);
  noFill();
  boot();
}

void draw() {
  translate(width/2+random(-20, 20), height/2+random(-20, 20));
  scale(scale);
  for (int i = 0; i < 20000; i++) {
    for (int j = 0; j < 100; j++) {
      float xnew=cos(y*b)+c*sin(x*b);
      float ynew=cos(x*a)+d*sin(y*a);
      x = xnew;
      y = ynew;
      point(x, y);
    }
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
