void setup() {
  size(700,700);
  pixelDensity(2);
  noFill();
}

void draw() {
  for (int n = 0; n < 20; n++) {
    background(255);
    int iter = int(random(10, 40));
    int nb = int(random(2, 10));
    float sfac = random(2, 10);
    float afac = random(PI);
    for (float a = 0; a < TWO_PI; a += TWO_PI/nb) { 
      beginShape();
      curveVertex(width/2, height/2);
      for (int i = 0; i < iter; i++) {
        float x = width/2 + cos(i*afac+a)*i*sfac;
        float y = height/2 + sin(i*afac+a)*i*sfac;
        curveVertex(x, y);
      }
      endShape();
    }
    save("art" + n + ".jpg");
  }
  exit();
}
