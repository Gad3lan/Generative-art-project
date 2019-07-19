float res = 50;
float xoff, yoff;

void setup() {
  size(700, 700);
  pixelDensity(2);
  background(255);
  xoff = random(10000);
  noFill();
  frameRate(3);
}

void draw() {
  for (int x = 0; x < 20; x++) {
    background(255);
    for (float i = res; i <= 700-res; i += res) {
      beginShape();
      curveVertex(res, i);
      yoff = 0;
      for (float j = res; j <= 700-res; j += res) {
        float n = noise(xoff, yoff);
        float off = map(i, res, 700-res, 0, res);
        curveVertex(j, constrain(i+map(n, 0, 1, -off, off), res, 700-res));
        yoff++;
      }
      curveVertex(700-res, i);
      endShape();
      xoff += 0.4;
    }
    save("art" + x + ".jpg");
  }
  exit();
}
