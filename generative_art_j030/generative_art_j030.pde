float bCol = 255;
float sCol = 0;
float off;

int arcsNb;
int nb = 0;

void setup() {
  size(600, 600);
  pixelDensity(2);
  background(bCol);
  noFill();
  strokeWeight(6);
  stroke(sCol);
}

void draw() {
  background(bCol);
  translate(width/2, height/2);
  arcsNb = int(random(10, 20));
  off = random(50, 150);
  for (int i = 0; i < arcsNb; i++) {
    float l1 = random(TWO_PI);
    float l2 = random(TWO_PI);
    float s = off + 24 * i;
    rotate(random(TWO_PI));
    arc(0, 0, s, s, min(l1, l2), max(l1, l2));
  }
  save("art0" + nb + ".jpg");
  nb++;
  if (nb > 9) exit();
}
