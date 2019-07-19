class Pattern {
  float x, y, s;
  int l, c;
  Pattern(float px, float py, float size, int line, int col) {
    s = size;
    x = px;
    y = py;
    l = line;
    c = col;
  }
  
  void show() {
    if (c % 2 == 0 && l % 2 == 0) {
      square(x, y, s);
    } else if ((c % 2 == 0 && l % 2 != 0) || (c % 2 != 0 && l % 2 == 0)) {
      if (random(1) < value) {
        square(x, y, s);
      }
    }
  }
}
