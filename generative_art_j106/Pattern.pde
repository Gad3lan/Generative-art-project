class Pattern {
  float x, y, s;
  Pattern(float px, float py, float size) {
    x = px;
    y = py;
    s = size;
  }
  
  void show() {
    if (random(1) > 0.5) {
      line(x+s/2, y, x+s/2, y+s);
    } else {
      line(x, y+s/2, x+s, y+s/2);
    }
  }
}
