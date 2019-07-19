void setup() {
  size(700, 700);
  pixelDensity(2);
}

void draw() {
  for (int n = 0; n < 20; n++) {
    background(255);
    float s = random(200, 600);
    float maxs = s;
    float maxOff = random(s);
    float a = random(2*TWO_PI);
    int nb = int(random(40, 80));
    for (int i = 0; i < nb; i++) {
      float x = width/2 + (map(i, 0, nb, 0, maxOff)/2)*cos(map(i, 0, nb, 0, a));
      float y = height/2 + (map(i, 0, nb, 0, maxOff)/2)*sin(map(i, 0, nb, 0, a));
      circle(x, y, s);
      s = map(i, 0, nb, maxs, 0);
    }
    save("art" + n + ".jpg");
  }
  exit();
}
