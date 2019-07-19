class Light {
  float xoff = random(10000);
  float loff = random(10000);
  float x;
  float xi;
  float size = 5;
  float wi = 10;
  float alpha;
  float add = random(0.05, 2);
  Light() {
    xi = random(width);
    alpha = 0;
  }
  
  void move() {
    x = map(noise(xoff), 0, 1, xi-200, xi+200);
    xoff += 0.001;
    loff += 0.2;
    if (alpha < 80) alpha+=add;
    strokeWeight(wi);
    for (int i = 0; i < 50; i++) {
      stroke(map(i, 0, 50, hue-50, hue + 50), 90, map(noise(loff), 0, 1, 50, 100), alpha - map(1./(2*(51-i)), 0.5, 1./(102), 0, alpha));
      line(x, size * i, x, size * (i+1));
    }
    size -= 0.003;
    wi -= 0.006;
  }
}
