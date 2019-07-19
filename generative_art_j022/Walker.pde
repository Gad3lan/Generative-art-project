class Walker {
  PVector dir;
  PVector pos;
  float r = 100;
  boolean dead;
  
  Walker(float s) {
    pos = new PVector(random(width), height/2);
    if (random(1) < 0.5) {
      dir = new PVector(0, s);
    } else {
      dir = new PVector(0, -s);
    }
    dir.rotate(random(-PI/3, PI/3));
    dead = false;
    
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
    if (pos.x < 0 ||pos.x > width || pos.y < 0 ||pos.y > height) dead = true;
  }
  
  void display() {
    for (Walker w : walkers) {
      float d = PVector.dist(pos, w.pos);
      if (d < r) {
        stroke(map(d, r/2, r, sColor, bColor), 80);
        strokeWeight(0.1);
        line(pos.x, pos.y, w.pos.x, w.pos.y);
      }
    }
  }
}
