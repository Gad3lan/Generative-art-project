class Pattern {
  float x, y, s;
  Pattern(float px, float py, float size) {
    x = px;
    y = py;
    s = size;
  }
  
  void show() {
    float r = random(1);
    if (r < 0.25) {
      triangle(x, y, x, y+s, x+s, y+s);
    } else if (r < 0.5) {
      triangle(x, y, x+s, y, x+s, y+s);
    } else if (r < 0.75) {
      triangle(x, y+s, x, y, x+s, y);
    } else {
      triangle(x, y+s, x+s, y+s, x+s, y);
    }
  }
}
