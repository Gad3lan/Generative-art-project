class Wave {
  int index;
  float x;
  float y;
  float R;
  float Rs;
  float r;
  float rn;
  float rns;
  float t;
  float tn;
  float tns;
  float tr;
  color c;
  float Rmax = random(100, width);
  Wave(int tmpIndex) {
    x = width / 2;
    y = height / 2;
    index = tmpIndex;
    c = color(hue, random(100), random(100), 50);
    r = 5;
    rn = 0.0;
    rns = random(0.1, 1);
    t = 0;
    tn = 0.0;
    tns = random(0.001, 0.01);
    tr = random(0.00, 360.00);
    R = 0;
    Rs = random(0.5, max);
  }

  void display() {
    t = map(noise(tn + index), 0, 1, 0, 360);
    tn += tns;
    r = 15 * noise(rn + index);
    rn += tns;

    x = R * cos(radians(t)) + width;
    y = R * sin(radians(t)) + height / 2;

    fill(c);
    ellipse(x, y, r, r);

    R += Rs;

    if (R > Rmax) {
      R = 0;
      Rmax = random(100, width);
    }
  }
}
