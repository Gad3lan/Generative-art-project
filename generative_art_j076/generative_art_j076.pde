float x, y, u, t;
int nb = 0;
int maxNb = 19;
int density = 2;

void setup() {
  size(600, 600);
  pixelDensity(density);
  colorMode(HSB, 360, 100, 100, 100);
  strokeWeight(0.2);
  noFill();
  boot();
}

void draw() {
  translate(width/2, height/2);
  rotate(random(TWO_PI));
  for (int n = 0; n < 1000; n++) {
    x = random(-15, 15);
    y = random(-15, 15);
    stroke(0, 0, 100, random(20, 25));
    beginShape();
    curveVertex(x*50, y*50);
    for (int i = 0; i < 50; i++) {
      t = 0.4 - 6/(1 + x*x + y*y);
      x = 1 + u*(x*cos(t)-y*sin(t));
      y = u*(x*sin(t)+y*cos(t));
      curveVertex(x*50, y*50);
    }
    curveVertex(x*50, y*50);
    endShape();
  }
  saveImg();
}

void boot() {
  background(0, 0, 0);
  u = random(0.6, 0.95);
}

void saveImg() {
  save("art" + nb + ".jpg");
  nb++;
  if (nb > maxNb) exit();
  boot();
}
