int tile = 20;
int maxDist = 300;

float xoff = random(10000);
float yoff = random(10000);

void setup() {
  size(600, 600);
  noFill();
  frameRate(30);
  pixelDensity(2);
  strokeWeight(3);
  stroke(255);
  rectMode(CENTER);
}

void draw() {
  background(0);
  for (int i = 0; i < width; i += 25) {
    for (int j = 0; j < height; j += 25) {
      float d = dist(mouseX, mouseY, i, j);
      xoff += 0.005;
      yoff += 0.005;
      d = d/maxDist * 40;
      translate(i, j);
      rect(0, 0, d, d);
      translate(-i, -j);
    }
  }
}
