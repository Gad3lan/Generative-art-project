class Pattern {
  float x, y, s;
  Pattern(float px, float py, float size) {
    x = px;
    y = py;
    s = size;
  }
  
  void show() {
    if (random(1) > 0.5) {
      //line(x+s/2, y, x+s/2, y+s);
      bezier(x+s/2, y, x+s/2, y+s/4, x+s/4, y+s/2, x, y+s/2);
      bezier(x+s/2, y+s, x+s/2, y+3*s/4, x+3*s/4, y+s/2, x+s, y+s/2);
    } else {
      //line(x, y+s/2, x+s, y+s/2);
      bezier(x+s/2, y, x+s/2, y+s/4, x+3*s/4, y+s/2, x+s, y+s/2);
      bezier(x+s/2, y+s, x+s/2, y+3*s/4, x+s/4, y+s/2, x, y+s/2);
    }
  }
}
