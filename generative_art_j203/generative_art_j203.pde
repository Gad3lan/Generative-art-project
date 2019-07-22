ArrayList<PVector> points;
float angle;
float off;
PVector prevPoint;

void setup() {
  size(700, 700);
  pixelDensity(2);
  frameRate(3);
}

void draw() {
  for (int n = 0; n < 20; n++) {
    background(255);
    float step = random(5, 10);
    float minDist = step/2;
    float maxDist = step*4;
    off = random(10000);
    angle = noise(off)*TWO_PI;
    prevPoint = new PVector(random(width), random(height));
    points = new ArrayList<PVector>();
    points.add(prevPoint);
    int nb = int(random(500, 1000));
    for (int i = 0; i < nb; i++) {
      float x = prevPoint.x + step*cos(angle);
      float y = prevPoint.y + step*sin(angle);
      if (x < 0)
        x = width-1;
      else if (x > width-1)
        x = 0;
      if (y < 0)
        y = height-1;
      else if (y > height-1)
        y = 0;
      PVector newPoint = new PVector(x, y);
      for (PVector p : points) {
        if (newPoint.dist(p) < minDist) {
          int index = int(random(points.size()));
          newPoint = points.get(index);
          break;
        }
      }
      for (PVector p : points) {
        if (newPoint.dist(p) < maxDist) {
          line(p.x, p.y, newPoint.x, newPoint.y);
        }
      }
      points.add(newPoint);
      prevPoint = newPoint;
      off += 0.01;
      angle = noise(off)*TWO_PI;
    }
    save("art" + n + ".jpg");
  }
  exit();
}
