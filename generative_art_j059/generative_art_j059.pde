int nb = 0;
int maxNb = 19;
int density = 2;
float hue;
color col1;
color col2;

void setup() {
  size(600, 600);
  pixelDensity(density);
  colorMode(HSB, 360, 100, 100, 100);
  fill(random(360), 100, 100);
  noStroke();
  boot();
}

void draw() {
  noStroke();
  for (int i = 0; i < 14; i++) {
    float x, y, size;
    if (i%2 == 0) x = random(width/4);
    else x = random(3*width/4, width);
    y = height + i*random(10, 15);
    size = random(800, 1100);
    fill(hue, map(i, 0, 14, 90, 10),map(i, 0, 14, 30, 100));
    circle(x, y, size);
  }
  noFill();
  stroke(0, 0, 100);
  strokeWeight(300);
  circle(width/2, height/2, 800); 
  saveImg();
}

void boot() {
  hue = random(360);
  background(hue, 100, 20);
}

void saveImg() {
  save("art" + nb + ".jpg");
  nb++;
  if (nb > maxNb) exit();
  boot();
}
