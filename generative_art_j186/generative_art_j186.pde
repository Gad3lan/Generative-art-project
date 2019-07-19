void setup() {
  size(700, 700);
  pixelDensity(2);
  frameRate(3);
  noLoop();
}

void draw() {
  for (int n = 0; n < 20; n++) {
    stroke(0);
    background(255);
    float xoff = random(10000);
    for (int i = 0; i < 15; i++) {
      float yoff = 0;
      beginShape();
      curveVertex(0, 700);
      curveVertex(0, 700);
      curveVertex(0, map(i, 0, 14, 100, 600));
      for (int j = 0; j < 11; j++) {
        float s = (1/(1.5*sqrt(2*PI)))*exp(-(pow(j-5, 2)/(2*pow(1.5, 2))))*500;
        float x = map(j, 0, 10, 100, 600);
        float y = map(i, 0, 14, 100, 600) + map(noise(xoff, yoff), 0, 1, -1, 1)*s;
        curveVertex(x, y);
        yoff += 0.5;
      }
      curveVertex(700, map(i, 0, 14, 100, 600));
      curveVertex(700, 700);
      curveVertex(700, 700);
      endShape(CLOSE);
      xoff++;
    }
    noStroke();
    rect(0, 0, 100, 700);
    rect(600, 0, 100, 700);
    save("art" + n + ".jpg");
  }
}
