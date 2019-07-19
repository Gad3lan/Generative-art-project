PImage img;
void setup() {
  size(1400, 1400);
  colorMode(HSB, 360, 100, 100, 100);
  background(0, 0, 100);
  pixelDensity(2);
  img = loadImage("img.jpg");
  img.resize(1400, 1400);
  noLoop();
  noStroke();
}

void draw() {
  for (int i = 0; i < 100000; i++) {
    int x = int(random(width));
    int y = int(random(height));
    color c = img.pixels[x + y  * width];
    float s = map(saturation(c), 0, 100, 7, 75);
    float transparancy = map(s, 7, 75, 80, 20);
    fill(c, transparancy);
    beginShape();
    int res = int(random(3, 10));
    float angle = random(TWO_PI);
    for (float a = angle; a < TWO_PI+angle; a += TWO_PI/float(res)) {
      vertex(x + s*cos(a), y + s*sin(a));
    }
    endShape(CLOSE);
  }
  save("art.jpg");
}
