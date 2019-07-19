class Pattern {
  float x, y, s;
  Pattern(float px, float py, float size) {
    s = size/2;
    x = px+s;
    y = py+s;
  }
  
  void show() {
    float angle = random(TWO_PI);
    float d = random(s/2, s);
    float dot = random(s/20, s/10);
    float off1 = random(10000);
    float off2 = random(10000);
    for (float a = angle; a < TWO_PI + angle; a+=0.01) {
      strokeWeight(dot);
      point(x + d*cos(a), y + d*sin(a));
      d += map(noise(off1), 0, 1, -0.1, 0.1);
      d = constrain(d, s/4, s*1.2);
      off1 += 0.01;
      dot += map(noise(off2), 0, 1, -0.2, 0.2);
      dot = constrain(dot, s/20, s/5); 
      off2 += 0.01;
    }
  }
}
