int nb = 0;
int maxNb = 19;
int density = 2;
float x1, y1, x2, y2;
float a, b, c;

void setup() {
  size(600, 600);
  pixelDensity(density);
  colorMode(HSB, 360, 100, 100, 100);
  strokeWeight(0.2);
  stroke(0, 0, 100);
  boot();
}

void draw() {
  translate(width/2, height/2);
  for (int i = 0; i < c; i++) {
    x1 = sin((a*PI*i)/c) * 250;
    y1 = 0.5*cos((b*PI*i)/c) * 250;
    x2 = 0.5*sin((b*PI*i)/c) * 250;
    y2 = cos((a*PI*i)/c) * 250;
    line(x1, y1, x2, y2);
  }
  saveImg();
}

void boot() {
  background(0, 0, 0);
  a = floor(random(5, 25));
  b = floor(random(1, 10));
  c = floor(random(1500, 2500));
}

void saveImg() {
  save("art" + nb + ".jpg");
  nb++;
  if (nb > maxNb) exit();
  boot();
}
