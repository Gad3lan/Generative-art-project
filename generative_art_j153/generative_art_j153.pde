PImage img;
float s;
void setup() {
  img = loadImage("IMG_5676.JPG");
  size(1400, 1400);
  img.resize(1400, 1400);
  background(255);
  s = 25;
  noStroke();
  noLoop();
}

void draw() {
  img.loadPixels();
  for (int i = 0; i < 2000; i++) {
    s = map(i, 0, 2000, 125, 25);
    int x = int(random(width));
    int y = int(random(height));
    fill(img.pixels[x+y*width]);
    circle(x, y, s);
  }
  save("art.jpg");
}
