class Pattern {
  float x;
  float y;
  int n;
  float s;
  float off;
  float angle = random(TWO_PI);
  float cx;
  float cy;
  Pattern(float px, float py, int nb, float size, float offset) {
    x = px;
    y = py;
    n = nb;
    s = size;
    off = offset;
    cx = random(x-s/3, x+s/3);
    cy = random(y-s/3, y+s/3);
  }
  
  void show() {
    fill(c2);
    rect(x, y, s, s);
    fill(c1);
    if (r < .25)
      triangle(x-s/2, y-s/2, x-s/2, y+s/2, cx, cy);
    else if (r < .5)
      triangle(x-s/2, y-s/2, x+s/2, y-s/2, cx, cy);
    else if (r < .75)
      triangle(x+s/2, y-s/2, x+s/2, y+s/2, cx, cy);
    else
      triangle(x-s/2, y+s/2, x+s/2, y+s/2, cx, cy);
    fill(c3);
    if (r < .25)
      triangle(x+s/2, y-s/2, x+s/2, y+s/2, cx, cy);
    else if (r < .5)
      triangle(x-s/2, y+s/2, x+s/2, y+s/2, cx, cy);
    else if (r < .75)
      triangle(x-s/2, y-s/2, x-s/2, y+s/2, cx, cy);
    else
      triangle(x-s/2, y-s/2, x+s/2, y-s/2, cx, cy);
  }
}
