class Point {
  float off = random(10000);
  float add = random(0.004, 0.008);
  PVector pos;
  Point(float x) {
    pos = new PVector(x, map(noise(off), 0, 1, height/2 + 200, height/2 - 200));
    off += add;
  }
  
  void move() {
    pos.y = map(noise(off), 0, 1, height/2 + 200, height/2 - 200);
    off += add;
  }
}
