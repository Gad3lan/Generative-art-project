class Pattern {
  float x, y, s;
  float div = random(2, 4);
  boolean lastx, lasty;
  Pattern(float px, float py, float size) {
    s = size;
    x = px-s/2;
    y = py-s/2;
  }
  
  void show() {
    for (int i = 0; i < int(s*2); i++) {
      if (random(1) > .5) stroke(0);
      else stroke(255);
      float x1 = random(x, x+s);
      float x2 = constrain(x1+random(-10, 10), x, x+s);
      if (random(1) < .5)
        line(x1, y, x2, y+s);
      else
        line(y, x1, y+s, x2);
    }
  }
}
