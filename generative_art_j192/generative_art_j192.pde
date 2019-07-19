void setup() {
  size(700, 700);
  frameRate(3);
}

void draw() {
  translate(width/2, height/3);
  for (int n = 0; n < 20; n++) {
    background(255);
    float s = floor(random(150, 200));
    float nb = floor(random(s/4, s/2));
    for (float i = 0; i < nb; i++) {
      float x = map(i, 0, nb, -s, s);
      float y = sqrt(pow(s, 2)-pow(x, 2));
      line(x, y+random(s), x, -y);
    }
    save("art" + n + ".jpg");
  }
  exit();
}
