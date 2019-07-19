PImage img;

void setup() {
  size(1400, 1400);
  img = loadImage("img.png");
  img.resize(1400, 1400);
  rectMode(CENTER);
  noStroke();
  noLoop();
}

void draw() {
  for (int i = 0; i < 10000; i++) {
    int x = int(random(width));
    int y = int(random(height));
    float sx = random(50);
    float sy = random(100);
    fill(img.pixels[x + width*y]);
    rect(x, y, sx, sy);
  }
  save("art.jpg");
}
