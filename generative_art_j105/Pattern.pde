class Pattern {
  float x, y, s, off, c;
  int div;
  Pattern(float px, float py, float size, int d) {
    s = size/2;
    x = px;
    y = py;
    div = d;
    off = random(TWO_PI); 
  }
  
  void show() {
    float r = random(1);
    if (r < .25) {
      arc(x-s, y-s, s*4, s*4, 0, HALF_PI);
    } else if (r < .5) {
      arc(x+s, y-s, s*4, s*4, HALF_PI, PI);
    } else if (r < .75) {
      arc(x+s, y+s, s*4, s*4, PI, 3*HALF_PI);
    } else {
      arc(x-s, y+s, s*4, s*4, 3*HALF_PI, TWO_PI);
    }
  }
}
