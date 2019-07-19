ArrayList<PVector> points;
PImage img;
float angle;
float off;
PVector prevPoint;
float step = 5;
float minDist = step/2;
float maxDist = step*4;

void setup() {
  size(1400, 1400);
  background(255);
  pixelDensity(2);
  stroke(0);
  colorMode(HSB, 360, 100, 100);
  img = loadImage("img.jpg");
  img.resize(1400,1400);
  off = random(10000);
  angle = noise(off)*TWO_PI;
  prevPoint = new PVector(random(width), random(height));
  points = new ArrayList<PVector>();
  points.add(prevPoint);
  noLoop();
}

void draw() {
  image(img, 0, 0);
  for (int i = 0; i < 40000; i++) {
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
        stroke((hue(img.pixels[int(p.x) + int(p.y)*width])+180)%360, saturation(img.pixels[int(p.x) + int(p.y)*width]), brightness(img.pixels[int(p.x) + int(p.y)*width]));
        line(p.x, p.y, newPoint.x, newPoint.y);
      }
    }
    points.add(newPoint);
    prevPoint = newPoint;
    off += 0.01;
    angle = noise(off)*TWO_PI;
  }
  save("art.jpg");
}
