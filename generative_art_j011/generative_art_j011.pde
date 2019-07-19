int l1, l2, l3;
float d1, d2, d3;
float r1, r2, r3;
float a1, a2, a3;
float angle;

int nb = 0;
void setup() {
  size(600, 600);
  pixelDensity(2);
  strokeWeight(0.1);
  stroke(0);
  noFill();
  boot();
}

void draw() {
  translate(width/2, height/2);
  rotate(angle);
  float x = cos(a1) * l1;
  float y = sin(a1) * l1;
  float x2 = x + cos(a2) * l2;
  float y2 = y + sin(a2) * l2;
  float x3 = x2 + cos(a3) * l3;
  float y3 = y2 + sin(a3) * l3;
  /**line(0, 0, x, y);
  line(x, y, x2, y2);
  line(x2, y2, x3, y3);**/
  beginShape();
  //curveVertex(0, 0);
  curveVertex(0, 0);
  curveVertex(x, y);
  curveVertex(x2, y2);
  curveVertex(x3, y3);
  curveVertex(x3, y3);
  endShape();
  a1 += d1;
  a2 += d2;
  a3 += d3;
  if (a1 > TWO_PI + d1) {
    save("art04" + nb + ".jpg");
    nb++;
    if (nb > 9) exit();
    boot();
  };
}

void boot() {
  background(255);
  angle = random(TWO_PI);
  l1 = 50 + int(random(100));
  l2 = 50 + int(random(100));
  l3 = 50 + int(random(100));
  //mult = random(1);
  r1 = random(1000, 2000);
  r2 = r1 / int(random(2, 10));
  r3 = r2 / int(random(2,5));
  d1 = TWO_PI / r1;
  d2 = TWO_PI / r2;
  d3 = TWO_PI / r3;
  a1 = 0;
  a2 = 0;
  a3 = 0;
}
