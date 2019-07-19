class Pattern {
  float x, y, s;
  Pattern(float px, float py, float size) {
    x = px;
    y = py;
    s = size;
  }
  
  void show() {
    if (random(1) > 0.5) {
      line(x, y, x+s, y+s);
    } else {
      line(x+s, y, x, y+s);
    }
  }
}
