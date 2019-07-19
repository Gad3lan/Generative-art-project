void setup() {
  size(700, 700);
  pixelDensity(2);
  noFill();
}

void draw() {
  for (int nb = 0; nb < 20; nb++) {
    background(255);
    int max = int(random(4, 7));
    for (int n = 0; n < max; n++) {
      strokeWeight(random(2, 4));
      float off = random(10000);
      int nbr = int(random(3, 7));
      float start = random(height/3, 2*height/3);
      beginShape();
      float x = -100;
      float y = start + map(noise(off), 0, 1, -200, 200);
      curveVertex(x, y);
      for (int i = 0; i < nbr; i++) {
        x = map(i, 0, nbr-1, -100, width + 100);
        y = start + map(noise(off), 0, 1, -height/2, height/2);
        off++;
        curveVertex(x, y);
      }
      curveVertex(x, y);
      endShape();
    }
    save("art" + nb + ".jpg");
  }
  exit();
}
