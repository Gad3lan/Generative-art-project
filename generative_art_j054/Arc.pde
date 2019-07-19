class Arc {
  float start = random(PI/6);
  float end = start + random(11*PI/6);
  float size = random(400, 500);
  color col;
  float alpha;
  float off = random(10000);
  float off2 = random(10000);
  Arc() {
    alpha = 100;
    col = color(hue, random(70, 90), random(75, 90));
  }
  
  void display() {
    for (int i = 0; alpha > 0; i++) {
      stroke(col, alpha);
      float s = start + map(noise(off), 0, 1, -0.5, 0.5);
      arc(0, 0, size, size, s, s + map(noise(off2), 0, 1, -1, 1)*end + map(i, 0, 50, 0, PI));
      size -= 3 ;
      alpha -= 2;
      off += 0.1;
      off2 += 0.05;
    }
  }
}
