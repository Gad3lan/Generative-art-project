class Pattern {
  float x, y, s;
  int l, c, max;
  Pattern(float px, float py, float size) {
    s = size;
    x = px ;
    y = py;
  }
  
  void show() {
    if (random(1) < 0.25) {
      triangle(x, y, x+s, y, x+s, y+s);
    }
    if (random(1) < 0.25) {
      triangle(x+s, y, x+s, y+s, x, y+s);
    }
    if (random(1) < 0.25) {
      triangle(x+s, y+s, x, y+s, x, y);
    }
    if (random(1) < 0.25) {
      triangle(x, y+s, x, y, x+s, y);
    }
  }
}
