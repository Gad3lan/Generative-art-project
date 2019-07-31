void setup() {
  size(700, 700);
  pixelDensity(2);
  strokeWeight(.5);
  noFill();
  frameRate(3);
}

void draw() {
  for (int n = 0; n < 20; n++) {
    background(255);
    PVector ctr = new PVector(width/2, height/2);
    float step = random(2, 4);
    float s = random(20, 50);
    float off = random(10000);
    float wave = random(10, 40);
    float inc = random(1);
    float angle = random(TWO_PI);
    int nb = int(random(20, 40));
    for (int i = 0; i < width; i++) {
      beginShape();
      curveVertex((noise(off)*wave+s+i*step)*cos(angle) + ctr.x, (noise(off)*wave+s+i*step)*sin(angle) + ctr.y);
      for (float a = angle; a < TWO_PI + angle; a += TWO_PI/nb) {
        curveVertex((noise(off+a)*wave+s+i*step)*cos(a) + ctr.x, (noise(off+a)*wave+s+i*step)*sin(a) + ctr.y);
      }
      curveVertex((noise(off)*wave+s+i*step)*cos(angle) + ctr.x, (noise(off)*wave+s+i*step)*sin(angle) + ctr.y);
      endShape(CLOSE);
      off += inc;
    }
    save("art" + n + ".jpg");
    }
  exit();
}
