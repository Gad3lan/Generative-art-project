void setup() {
  size(700, 700);
  pixelDensity(2);
}

void draw() {
  translate(width/2, height/2);
  for (int n = 0; n < 20; n++) {
    background(255);
    int nb = int(random(20, 40));
    float s = random(150, 300);
    float offset = random(THIRD_PI);
    circle(0, 0, 2*s);
    for (int i = 0; i < nb; i++) {
      float a = map(i, 0, nb, 0, TWO_PI);
      float x = s*cos(a);
      float y = s*sin(a);
      line(x, y, x - s*cos(a+offset), y - s*sin(a+offset));
    }
    save("art" + n + ".jpg");
  }
  exit();
}
