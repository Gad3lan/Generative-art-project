PImage img;
ArrayList<Point> points;
int nbPoints;
float dist = 50;

class Point {
  float x, y, s;
  Point(float _x, float _y, float _s) {
    x = _x;
    y = _y;
    s = _s;
  }
}

void setup() {
  size(1400, 1400);
  background(255);
  strokeWeight(0.5);
  img = loadImage("img.jpg");
  img.resize(1400, 1400);
  points = new ArrayList<Point>();
  nbPoints = 1000;
  float xoff = random(10000);
  float yoff = random(10000);
  for (int i = 0; i < nbPoints; i++) {
    //points.add(new PVector(random(width), random(height)));
    points.add(new Point(random(width), random(height), random(50, 100)));
  }
  noLoop();
}

void draw() {
  /**img.loadPixels();
  fill(img.pixels[int(mouseX) + width*int(mouseY)]);
  rect(1350, 1350, 100, 100);**/
  img.loadPixels();
  for (int i = 0; i < 100; i++) {
    for (Point p1 : points) {
      for (Point p2 : points) {
        stroke(img.pixels[int(p1.x) + width * int(p1.y)]);
        if (dist(p1.x, p1.y, p2.x, p2.y) < p1.s) {
          line(p1.x, p1.y, p2.x, p2.y);
        }
      }
      p1.x += random(-10, 10);
      p1.y += random(-10, 10);
      if (p1.x < 0)
        p1.x = width - 1;
      else if (p1.x > width)
        p1.x = 0;
      if (p1.y < 0)
        p1.y = height - 1;
      else if (p1.y > height)
        p1.y = 0;
    }
  }
  save("art.jpg");
}
