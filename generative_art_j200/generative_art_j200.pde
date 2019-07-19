void setup() {
  size(700, 700);
  pixelDensity(2);
  stroke(255);
  fill(0);
  frameRate(2);
}

void draw() {
  translate(width/2, height/2);
  for (int n = 0; n < 20; n++) {
    background(255);
    int rNb = int(random(6, 15));
    int lNb = int(random(20, 40));
    if (lNb%2 == 1) lNb++;
    float s = random(300, 600);
    strokeWeight(random(lNb/4, lNb/2.5));
    circle(0, 0, s);
    for (int i = 0; i < rNb; i++) {
      for (int j = 0; j < lNb; j++) {
        float x = map(j, 0, lNb-1, -width/2, width/2);
        line(x, -height/2, x, height/2);
      }
      rotate(TWO_PI/rNb);
    }
    save("art" + n + ".jpg");
  }
  exit();
}
