class Pattern {
  float x, y, s;
  boolean lastx, lasty;
  Pattern(float px, float py, float size) {
    s = size*2;
    x = px;
    y = py;

  }
  
  void show() {
    float r = random(1);
    if (r < .25) {
      arc(x, y, s, s, 0, HALF_PI);
    } else if (r < .5) {
      arc(x+s/2, y, s, s, HALF_PI, PI);
    } else if (r < .75) {
      arc(x+s/2, y+s/2, s, s, PI, 3*HALF_PI);
    } else {
      arc(x, y+s/2, s, s, 3*HALF_PI, TWO_PI);
    }
  }
}
