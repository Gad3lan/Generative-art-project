class Pattern {
  float x, y, s;
  Pattern(float px, float py, float size) {
    s = size;
    x = px;
    y = py;
  }
  
  void show() {
    float size = s;
    int div = int(random(4, 10));
    int reps = int(random(2, 5));
    fill(0,0,0, (1000./reps)/div);
    circle(x, y, size);
    float angle = random(TWO_PI);
    for (float a = angle; a < TWO_PI + (angle-angle/10); a+= TWO_PI/reps) {
      for(int i = 1; i < div; i++) {
        float s = (div-i)*size/(div);
        float cx = x + cos(a)*((size/div)/2)*i;
        float cy = y + sin(a)*((size/div)/2)*i;
        circle(cx, cy, s);
      }
    }
  }
}
