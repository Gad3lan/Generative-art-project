class Pattern {
  float x, y, s;
  Pattern(float px, float py, float size) {
    s = size;
    x = px-s/2;
    y = py-s/2;
  }
  
  void show() {
    if (s > 500)
      strokeWeight(s/140);
    else
      strokeWeight(s/70);
    fill(0);
    square(x, y, s);
    noFill();
    float o = random(10000);
    float xadd = random(0.05, 0.2);
    float yadd = random(1);
    float xoff = o;
    int n = int(random(s/15, s/5));
    if (random(1) > .5) {
      for (int i = 0; i < n; i++) {
        float yoff = o;
        beginShape();
        float off = map(noise(xoff, yoff), 0, 1, -s/2, s/2);
        float px = x + s/n*i + off;
        px = constrain(px, x, x + s);
        curveVertex(px, y);
        for (int j = 0; j <= 5; j++) {
          off = map(noise(xoff, yoff), 0, 1, -s/2, s/2);
          px = x + s/n*i + off;
          px = constrain(px, x, x + s);
          curveVertex(px, y+s/5*j);
          yoff+=yadd;
        }
        curveVertex(px, y+s);
        endShape();
        xoff+=xadd;
      }
    } else {
      for (int i = 0; i < n; i++) {
        float yoff = o;
        beginShape();
        float off = map(noise(xoff, yoff), 0, 1, -s/2, s/2);
        float py = y+s/n*i+off;
        py = constrain(py, y, y + s);
        curveVertex(x, py);
        for (int j = 0; j <= 5; j++) {
          off = map(noise(xoff, yoff), 0, 1, -s/2, s/2);
          py = y+s/n*i+off;
          py = constrain(py, y, y + s);
          curveVertex(x+(s/5)*j, py);
          yoff+=yadd;
        }
        curveVertex(x+s, py);
        endShape();
        xoff+=xadd;
      }
    }
  }
}
