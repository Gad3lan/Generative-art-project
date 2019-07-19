float r;
float bCol = 255;
float sCol = 0;

int lineNb;
int nb = 0;

void setup() {
  size(600, 600);
  pixelDensity(2);
  background(bCol);
  stroke(sCol);
}

void draw() {
  boot();
  for (int i = 0; i < lineNb; i++) {
    float a1 = random(TWO_PI);
    float a2 = random(TWO_PI);
    drawLine(a1, a2);
  }
  save("art0" + nb + ".jpg");
  nb++;
}

void drawLine(float a1, float a2) {
  float x1 = r * sin(a1) + width/2;
  float y1 = r * cos(a1) + height/2;
  float x2 = r * sin(a2) + width/2;
  float y2 = r * cos(a2) + height/2;
  line(x1, y1, x2, y2);
}

void boot() {
  background(bCol);
  strokeWeight(random(0.1, 5));
  r = random(150, 275);
  lineNb = int(random(20, 100));
}
