int nb = 0;
int maxNb = 19;
int density = 2;
int hairNb;
float hairLen;
float maxOff;
float offInc;
float off;

void setup() {
  size(600, 600);
  pixelDensity(density);
  colorMode(HSB, 360, 100, 100, 100);
  strokeWeight(0.5);
  noFill();
  boot();
}

void draw() {
  translate(width/2, height/2);
  float increment = TWO_PI/hairNb;
  for (int i = 0; i < hairNb; i++) {
    rotate(increment);
    beginShape();
    curveVertex(0,0);
    for (int j = 0; j < 100; j++) {
      curveVertex(j*hairLen/100, map(noise(off), 0, 1, -maxOff, maxOff));
      off += 0.05;
    }
    endShape();
  }
  saveImg();
}

void boot() {
  background(0, 0, 100);
  stroke(color(random(360), random(50, 80), random(60, 90)));
  hairNb = int(random(200, 360));
  hairLen = random(150, 250);
  maxOff = random(3, 30);
  off = random(10000);
  offInc = random(0.2);
}

void saveImg() {
  save("art" + nb + ".jpg");
  nb++;
  if (nb > maxNb) exit();
  boot();
}
