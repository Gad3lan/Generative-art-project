void setup() {
  size(700, 700);
  pixelDensity(2);
  frameRate(3);
}

void draw() {
  translate(width/2, height/2);
  for (int n = 0; n < 20; n++) {
    rotate(random(TWO_PI));
    background(255);
    float s = random(300, 600);
    int nb = int(random(3, 30));
    float step = s/(2*nb);
    for (int i = 0; i < nb; i++) {
      arc(i*step, 0, s-i*(s/nb), s-i*(s/nb), 0, PI);
      arc(-i*step, 0, s-i*(s/nb), s-i*(s/nb), PI, TWO_PI);
    }
    save("art" + n + ".jpg");
  }
  exit();
}
