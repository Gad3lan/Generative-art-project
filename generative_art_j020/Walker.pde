class Walker {
  PVector pos = new PVector(0, 0) ;
  float r = random(5, 20);
  
  Walker(PVector p) {
    pos.set(p);
  }
  
  void run() {
    walk();
    checkStuck();
  }
  
  void walk() {
    pos.add(PVector.random2D().mult(10));
    pos.x = constrain(pos.x, 0, width);
    pos.y = constrain(pos.y, 0, height);
  }
  
  boolean  checkStuck() {
    for (PVector v : tree) {
      float d = PVector.dist(pos, v); 
      if (d < r*2) {
        line(pos.x, pos.y, v.x, v.y);
        return true;
      }
    }
    return false;
  }
}
