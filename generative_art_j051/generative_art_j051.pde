int nb = 0;
int maxNb = 19;
int density = 2;
int res;
int repetitions;
float xoff;
float yoff;

void setup() {
  size(600, 600);
  pixelDensity(density);
  strokeWeight(0.3);
  colorMode(HSB, 360, 100, 100, 100);
  boot();
}

void draw() {
  for (int count = 0; count < repetitions; count++) {
    beginShape();
    curveVertex(0, map(noise(xoff,0), 0, 1, height/5, 4*height/5));
    for (int i = 0; i <= res; i++) {
      float x = i * width/res;
      yoff = i;
      float y = map(noise(xoff,yoff), 0, 1, height/5, 4*height/5);
      curveVertex(x, y);
    }
    curveVertex(width, map(noise(xoff,res), 0, 1, height/4, 3*height/4));
    xoff += 0.02;
    endShape();
  }
  saveImg();
}

void boot() {
  background(0, 0, 5);
  repetitions = int(random(60, 100));
  xoff = random(10000);
  res = 5;
  stroke(random(360), random(50, 75), random(75, 100));
  noFill();
}

void saveImg() {
  save("art" + nb + ".jpg");
  nb++;
  if (nb > maxNb) exit();
  boot();
}
