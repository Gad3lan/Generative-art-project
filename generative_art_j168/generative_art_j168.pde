PImage img;
ArrayList<Point> points;
int nbPoints;
float dist = 50;

class Point {
  float x, y, s;
  float speed = random(1, 3);
  float angle = random(TWO_PI);
  Point(float _x, float _y, float _s) {
    x = _x;
    y = _y;
    s = _s;
  }
  
  void move() {
    angle += random(-0.1, 0.1);
    x += cos(angle)*speed;
    y += sin(angle)*speed;
    if (x > width || x < 0 || y > height ||y < 0) {
      speed = random(1, 3);
      s = random(100, 150);
      angle = random(TWO_PI);
      x = width/2;
      y = height/2;
    }
  }
}

void setup() {
  size(700, 700);
  frameRate(24);
  pixelDensity(2);
  background(255);
  strokeWeight(0.5);
  img = loadImage("img.jpg");
  img.resize(700, 700);
  points = new ArrayList<Point>();
  nbPoints = 10;
  for (int i = 0; i < nbPoints; i++) {
    //points.add(new PVector(random(width), random(height)));
    points.add(new Point(width/2, height/2, random(100, 150)));
  }
}

void draw() {
  if (nbPoints < 60) {
    if (frameCount % 10 == 0) {
      nbPoints++;
      points.add(new Point(width/2, height/2, random(50, 100)));
    }
  }
  for (Point p1 : points) {
    p1.move();
    for (Point p2 : points) {
      stroke(img.pixels[int(p2.x) + width * int(p2.y)]);
      if (dist(p1.x, p1.y, p2.x, p2.y) < p1.s) {
        line(p1.x, p1.y, p2.x, p2.y);
      }
    }
  }
}
