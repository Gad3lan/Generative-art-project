float x1 = random(width)*10;
float x2 = random(width)*10;
float y1 = random(height)*10;
float y2 = random(height)*10;

float xoff = 0.00;
float yoff = 0.1;

void setup() {
  background(0);
  size(600, 600);
  pixelDensity(2);
  stroke(255, 75);
  strokeWeight(0.1);
}

void draw() {
//for (int i = 0; i < 10; i++) {
    if (x1 < 0 ||x2 < 0) {
      x1 = width - 1;
      x2 = x1;
    }
    if (x1 > width ||x2 > width) {
      x1 = 1;
      x2 = x1;
    }
    if (y1 < 0 ||y2 < 0) {
      y1 = height - 1;
      y2 = x1;
    }
    if (y1 > height ||y2 > height) {
      y1 = 1;
      y2 = x1;
    }
    line(x1 % width, y1 % height, x2 % width, y2 % height);
    xoff += 0.1;
    yoff += 0.1;
    x1 += noise(xoff) * random(-2, 2) * 10;
    x2 += noise(xoff) * random(-2, 2) * 10;
    y1 += noise(yoff) * random(-2, 2) * 10;
    y2 += noise(yoff) * random(-2, 2) * 10;
  //}
}
