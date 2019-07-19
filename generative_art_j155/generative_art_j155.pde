PVector pos;
PImage img;
void setup() {
  size(1400, 1400);
  background(255);
  pos = new PVector(width/2, height/2);
  img = loadImage("img1.jpg");
  img.resize(1400,1400);
  noLoop();
}

void draw() {
  img.loadPixels();
  for (int i = 0; i < 5000000; i++) {
    pos.x += random(-1, 1);
    pos.y += random(-1, 1);
    if (pos.x > width-1)
      pos.x = 0;
    else if (pos.x < 0)
      pos.x = width-1;
    if (pos.y > height-1)
      pos.y = 0;
    else if (pos.y < 0)
      pos.y = height-1;
    stroke(img.pixels[int(pos.x)+width*int(pos.y)]);
    point(pos.x, pos.y);
  }
  save("art.jpg");
}
