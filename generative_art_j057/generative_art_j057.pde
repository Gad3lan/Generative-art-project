int nb = 0;
int maxNb = 19;
int density = 2;

void setup() {
  size(600, 600);
  pixelDensity(density);
  colorMode(HSB, 360, 100, 100, 100);
  stroke(0, 0, 100);
  strokeWeight(3);
  strokeCap(ROUND);
  boot();
}

void draw() {
  translate(width/2, height/2);
  int a1 = int(random(1, 10));
  int a2 = int(random(1, 10));
  int linesNb = int(random(75, 150));
  float linesLen = random(40, 80);
  float dist = random(100, 200);
  for (int i = 0; i <= linesNb; i++) {
    rotate(TWO_PI/linesNb);
    line(dist - linesLen*sin(i*TWO_PI/a1), -linesLen*cos(i*TWO_PI/a2), dist + linesLen*sin(i*TWO_PI/a1), linesLen*cos(i*TWO_PI/a2));
  }
  saveImg();
}

void boot() {
  background(random(360), random(50, 90), random(70, 90));
}

void saveImg() {
  save("art" + nb + ".jpg");
  nb++;
  if (nb > maxNb) exit();
  boot();
}
