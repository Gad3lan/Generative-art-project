class Pattern {
  float x, y, s;
  Pattern(float px, float py, float size) {
    s = size;
    x = px+s/2;
    y = py+s/2;
  }
  
  void show() {
    point(x, y);
    if (r > .5) {
      if (random(1) < .75 && x < width - s - 50) {
        line(x, y, x+s, y);
      }
    } else {
      if (random(1) < .75 && y < height - s - 50) {
        line(x, y, x, y+s);
      }
    }
  }
}
