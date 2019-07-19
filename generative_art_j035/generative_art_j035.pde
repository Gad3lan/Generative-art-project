int sw = 2;           
int sz = 600;
float diam = 600/1.9;
float start;
int iter;
float step;
int [] ch = { -1, 1 };
int wdt = 65;
int nb = 0;

void setup() {
  size(600, 600);
  pixelDensity(2);
  colorMode(HSB, 100, 100, 100);
  rectMode(CENTER);
  noStroke();
}

void draw() {
  background(0, 0, 100);
  noStroke();
  iter = int(random(8, 12));
  step = diam/iter;
  start = diam + diam/2; 

  float H = random(0, 255);
  float S = random(90, 100);
  float B = 20;

  for (int i = 0; i<iter; ++i) {
    pushMatrix();
    translate(width/2, start-wdt/2);
    rotate(radians(random(7, 22)* ch[(int)random(ch.length)]));
    fill (H, S-i*(100/iter), B+i*((100-8)/iter));
    rect(0, 0, sz, wdt);
    start-= step - random(-step/2, step/2);
    popMatrix();
  }

  stroke(0, 0, 100);
  noFill();
  strokeWeight(300);
  float r = diam+sz/1.5;
  ellipse(width/2-7, height/2, r, r);
  save("art" + nb + ".jpg");
  nb++;
  if (nb > 19) exit();
}
