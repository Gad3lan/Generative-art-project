float off1 = random(1000);
float off2 = random(1000);
float off3 = random(1000);
float x;
float y;

int count = 0;
int nb = 0;

void setup() {
  size(600, 600);
  background(0);
  strokeWeight(0.1);
  stroke(255);
  noFill();
  pixelDensity(2);
}

void draw() {
  translate(width/2, height/2);
  rotate(noise(off3) * TWO_PI);
  float circleSize = noise(off1) * width/1.6;
  int circleResolution = int(noise(off2) * 10) + 2;
  float angle = TWO_PI/circleResolution;
  
  beginShape();
  for (int i = 0; i <= circleResolution; i++) {
    x = cos(angle * i) * circleSize;
    y = sin(angle * i) * circleSize;
    vertex(x, y);
  }
  endShape(CLOSE);
  off1 += 0.02;
  off2 += 0.005;
  off3 += 0.001;
  
  count++;
  if (count > 500) {
    save("art01" + nb + ".jpg");
    nb++;
    count = 0;
    if (nb > 9) exit();
    background(0);
    off1 = random(1000);
    off2 = random(1000);
    off3 = random(1000);
  }
}
