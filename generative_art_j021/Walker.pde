class Walker {
  PVector dir;
  PVector pos;
  Walker() {
    pos = new PVector(random(width), random(height));
    dir = PVector.random2D().mult(2);
  }
  
  void run() {
    walk();
    borders();
    display();
  }
  
  void walk() {
    pos.add(dir);
  }
  
  void borders() {
    if (pos.x < 0 ||pos.x > width) dir.x *= -1;
    if (pos.y < 0 ||pos.y > height) dir.y *= -1;
  }
  
  void display() {
    stroke(255, 50);
    for (Walker w : walkers) {
      line(pos.x, pos.y, w.pos.x, w.pos.y);
    }
  }
}
