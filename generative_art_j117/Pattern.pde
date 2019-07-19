class Pattern {
  float x, y, s;
  Pattern(float px, float py, float size) {
    s = size/2;
    x = px;
    y = py;
  }
  
  void show() {
    float px;
    float py;
    float p = floor(random(1, 15));
    float q = floor(random(1, 15));
    float phi = random(TWO_PI);
    beginShape();
    for (float t = 0; t < 10; t+= .01) {
      px = s*sin(p*t);
      py = s*sin(q*t+phi);
      curveVertex(px + x, py +y);
    }
    endShape();
    }
}
