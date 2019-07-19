int res = 100;
float yoff =random(10000);
int nb = 0;

void setup() {
  size(600, 600);
  pixelDensity(2);
  colorMode(HSB, 255);
}

void draw() {
  float hue = random(255);
  int clouds = int(random(5));
  background(hue, 40, 255);
  noStroke();
  fill(random(255), 40, 255);
  circle(random(width), random(50, 300), random(20, 80));
  stroke(0, 0, 255, 100);
  strokeCap(ROUND);
  strokeWeight(random(10, 50));
  for (int i = 0; i < clouds; i++) {
    float y = random(50, 200);
    line(random(width), y, random(width), y);
  }
  noStroke();
  int high = 200;
  for (int x = 0; x < 5; x++) {
    fill((hue + 100) % 255, 30, map(high, 400, 200, 10, 200));
    beginShape();
    float y = high + noise(yoff) * 100;
    curveVertex(0, height);
    curveVertex(0, height);
    for (int i = 0; i <= res; i++) {
      y = high + noise(yoff) * high;
      curveVertex(i*width/res, y);
      yoff += 0.05;
    }
    y = high + noise(yoff) * high;
    curveVertex(width, height);
    curveVertex(width, height);
    endShape(CLOSE);
    high += 10 * x;
  }
  stroke(0, 0, 255);
  strokeWeight(300);
  noFill();
  circle(width/2, height/2, 800);
  save("art" + nb + ".jpg");
  nb++;
  if (nb > 19) exit();
}
