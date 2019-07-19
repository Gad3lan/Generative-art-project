class Branch {
  PVector begin = new PVector(0, 0);
  PVector end = new PVector(0, 0);
  boolean grown = false;
  float r = 50;
  
  Branch(PVector b, PVector e) {
    begin.set(b);
    end.set(e);
    grown = false;
  }
  
  void show() {
    line(begin.x, begin.y, end.x, end.y);
    /**for (Branch other : branches) {
      float d = PVector.dist(begin, other.begin);
      if (d < r) line(begin.x, begin.y, other.begin.x, other.begin.y);
    }**/
  }
  
  Branch branchA() {
    PVector dir = PVector.sub(end, begin);
    dir.rotate(random(PI/3));
    dir.mult(random(0.5, 0.9));
    PVector newEnd = PVector.add(end, dir);
    Branch right = new Branch(end, newEnd);
    return right;
  }
  
  Branch branchB() {
    PVector dir = PVector.sub(end, begin);
    dir.rotate(-random(PI/3));
    dir.mult(random(0.5, 0.9));
    PVector newEnd = PVector.add(end, dir);
    Branch left = new Branch(end, newEnd);
    return left;
  }
} 
