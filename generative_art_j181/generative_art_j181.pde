PImage img;

void setup() {
  size(1400, 1400);
  img = loadImage("img.jpg");
  img.resize(1400, 1400);
  rectMode(CENTER);
  noStroke();
  noLoop();
}

void draw() {
  for (int i = 0; i < 20000; i++) {
    int x = int(random(width));
    int y = int(random(height));
    color c = img.pixels[x + width*y];
    float sx = map(saturation(c), 0, 100, 100, 10);
    float sy = map(brightness(c), 0, 100, 100, 10);
    fill(c);
    pushMatrix();
    translate(x, y);
    rotate(random(hue(c)));
    float corner =    min(sx/4, sy/4);
    rect(0, 0, sx, sy, corner, corner, corner, corner);
    popMatrix();
  }
  save("art.jpg");
}
