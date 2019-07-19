class Point {
  PVector pos;
  float r;
  Point() {
    pos = new PVector(random(width),random(height));
    r = 50;
  }
  
  void display() {
    stroke(noise(pos.x/width, pos.y/height)*255, random(150, 200), random(150, 200), 125);
    for (Point p : points) {
      float dist = PVector.dist(pos,p.pos);
      if (dist < r)
        line(pos.x, pos.y, p.pos.x, p.pos.y);
    }
  }
}
