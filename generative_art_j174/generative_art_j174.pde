PImage img;

void setup() {
  size(1400, 1400);
  img = loadImage("img1.jpg");
  img.resize(1400, 1400);
  rectMode(CENTER);
  noStroke();
  noLoop();
}

void draw() {
  for (int i = 0; i < 20000; i++) {
    int x = int(random(width));
    int y = int(random(height));
    float sx = random(100);
    float sy = random(100);
    fill(img.pixels[x + width*y]);
    pushMatrix();
    translate(x, y);
    rotate(random(TWO_PI));
    float corner = min(sx/4, sy/4);
    rect(0, 0, sx, sy, corner, corner, corner, corner);
    popMatrix();
  }
  save("art.jpg");
}
