void setup() {
  size(700, 700);
  pixelDensity(2);
  noFill();
  frameRate(3);
}

void draw() {
  translate(width/2, height/2);
  for (int n = 0; n < 20; n++) {
    background(255);
    float s = random(150, 300);
    float min = random(50);
    float angle = random(TWO_PI);
    int nb = int(random(10, 20));
    float step = random((TWO_PI/3)/(nb*2));
    for (int j = 0; j < 2; j++) {
      for (int i = 0; i < nb; i++) {
        float size = map(i, 0, nb-1, s, min);
        beginShape();
        for (float a = angle; a < TWO_PI + angle; a += TWO_PI/3) {
          vertex(size*cos(a), size*sin(a));
        }
        endShape(CLOSE);
        angle -= step;
      }
      angle += random(TWO_PI);
    }
    save("art" + n + ".jpg");
  }
  exit();
}
