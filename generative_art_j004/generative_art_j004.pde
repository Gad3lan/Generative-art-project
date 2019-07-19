PVector[] points;
PVector[] off;

int nb = 0;

void restart() {
  points = new PVector[15 + int(random(15))];
  off = new PVector[points.length];
  for (int i = 0; i < points.length; i++) {
    off[i] = new PVector(random(10), random(10));
    points[i] = new PVector(noise(off[i].x)*width, noise(off[i].y)*height);
  }
}

void setup() {
  background(200);
  size(600, 600);
  pixelDensity(2);
  frameRate(24);
  strokeWeight(0.1);
  restart();
}

void draw() {
  noStroke();
  fill(255, 20);
  rect(0, 0, width, height);
  for (int i = 0; i < points.length; i++) {
    off[i].x += random(4)/200;
    off[i].y += random(4)/200;
    points[i].x = noise(off[i].x)*width;
    points[i].y = noise(off[i].y)*height;
  }
  for (int i = 0; i < points.length; i++) {
    for (int j = i; j < points.length; j++) {
      stroke(0);
      line(points[i].x, points[i].y, points[j].x, points[j].y);
    }
  }
}

void keyPressed() {
  if (keyCode == ENTER) {
    save("art02" + nb + ".jpg");
    nb++;
    restart();
  }
  if (keyCode == DELETE) {
    exit();
  }
}
