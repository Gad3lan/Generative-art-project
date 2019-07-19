void setup() {
  size(700, 700);
  pixelDensity(2);
  rectMode(CENTER);
}

void draw() {
  translate(width/2, height/2);
  for (int n = 0; n < 20; n++) {
    background(255);
    float maxs = random(150, 300);
    int nb = int(random(4, 8));
    for (int i = 0; i < nb; i++) {
      stroke(0);
      float s = map(i, 0, nb, maxs, 0);
      beginShape();
      for (float a = 0; a < TWO_PI; a+= THIRD_PI) {
        vertex(s*cos(a), s*sin(a));
      }
      endShape();
      noStroke();
      float gap = random(s);
      for (int j = 0; j < 3; j++) {
        rect(0, 0, gap, 2*s);
        rotate(THIRD_PI);
      }
      rotate(PI/6);
    }
    save("art" + n + ".jpg");
  }
  exit();
}
