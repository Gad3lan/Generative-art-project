PImage img;

void setup() {
  size(1400, 1400);
  colorMode(HSB, 360, 100, 100, 100);
  background(255);
  pixelDensity(2);
  img = loadImage("img.jpg");
  img.resize(1400, 1400);
  noLoop();
  noStroke();
}

void draw() {
  image(img, 0, 0);
  for (int i = 0; i < 100000; i++) {
    int x = int(random(width));
    int y = int(random(height));
    color c = img.pixels[x + y  * width];
    float s = brightness(c);
    float transparancy = (100-s)*2;
    fill(c, transparancy);
    circle(x, y, s);
  }
  save("art.jpg");
}
