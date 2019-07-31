void setup() {
  size(700, 700);
  pixelDensity(2);
  frameRate(3);
  strokeWeight(0.5);
  noFill();
}

void draw() {
  translate(width/2, 0);
  for (int n = 0; n < 20; n++) {
    background(255);
    float s = random(50, 100);
    float step = random(2, 8);
    float inc = random(0.007, 0.015); 
    float off = random(10000);
    for (int i = int(-s); i < height+s; i += step) {
      float x = map(noise(off), 0, 1, -width/2, width/2);
      circle(x, i, s);
      circle(-x, i, s);
      off += inc;
    }
    save("art" + n + ".jpg");
  }
  exit();
}
