void setup() {
  size(700, 700);
  pixelDensity(2);
  noFill();
  frameRate(3);
  strokeWeight(2);
}

void draw() {
  translate(width/2, height/2);
  rotate(QUARTER_PI);
  for (int n = 0; n < 20; n++) {
    background(255);
    int nb = int(random(100, 200));
    float s = floor(random(50, 100));
    for (int i = 0; i < nb; i++) {
      float x = floor(random((8*width)/s));
      x = map(x, 0, (8*width)/s, -width, width);
      float y = floor(random((8*width)/s));
      y = map(y, 0, (8*width)/s, -width, width);
      square(x, y, s);
    }
    save("art" + n + ".jpg");
  }
  exit();
}
