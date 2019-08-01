void setup() {
  size(700, 700);
  pixelDensity(2);
  frameRate(3);
  colorMode(HSB, 360, 100, 100, 100);
}

void tree(int layer, float x, float y) {
  stroke(random(170, 175), random(80, 90), random(15, 25));
  float h = random(100*layer, 200*layer);
  float s = random(50*layer, 100*layer);
  line(x, y-h - random(10), x, y-h);
  for (float i = y-h; i < y; i++) {
    float len = map(i, y-h, y, 10, s);
    line(x, i, x + random(len/2, len), i + random(len));
    line(x, i, x - random(len/2, len), i + random(len));
  }
}

void fog(float inc, float h) {
  float xoff = random(10000);
  float yoff = random(10000);
  for (int i = 0; i < width; i++) {
    for (int j = 0; j < h; j++) {
      float n = noise(xoff, yoff + j * inc)*map(inc, 0.0025, 0.01, 100, 25);
      stroke(0, 0, 100, n);
      point(i, j);
    }
    xoff += inc;
  }
}

void draw() {
  for (int n = 0; n < 20; n++) {
  background(0, 0, 100);
  float h = random(200, 300);
  for (int i = 1; i <= 4; i++) {
    float x = random(10);
    float off = random(10000);
    for (x = random(10); x < width; x += random(2*i, 10*i)) {
      float y = map(noise(off), 0, 1, h, h + i*100);
      tree(i, x, y);
      off += 0.05;
    }
    fog(0.0025*i, h + i*100);
    h += random(100*i, 150*i); 
  }
  save("art" + n + ".jpg");
  }
  exit();
}
