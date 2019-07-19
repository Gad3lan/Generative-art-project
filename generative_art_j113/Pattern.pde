class Pattern {
  float x, y, s;
  boolean lastx, lasty;
  Pattern(float px, float py, float size, boolean ly, boolean lx) {
    s = size;
    x = px+s/2;
    y = py + s/2;
    lastx = lx;
    lasty = ly;
  }
  
  void show() {
    circle(x, y, s/2);
    float r = random(1);
    if (r < .25 && !lasty) {
      for(int i = 0; i < s; i+=5) {
        float size = s/2-abs(sin((i)*PI/s))*s/4;
        circle(x+i, y, size);
      }
    } else if(r < .5 && !lastx) {
      for(int i = 0; i < s; i+=5) {
        float size = s/2-abs(sin((i)*PI/s))*s/4;
        circle(x, i+y, size);
      }
    }
  }
}
