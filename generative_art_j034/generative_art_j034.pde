PImage base;
PGraphics mask;

float baseColor;
float colorVariation;

int nb = 0;

void setup() {
  size(600, 600);
  colorMode(HSB, 360, 100, 100, 1.0);
  pixelDensity(2);
  background(0, 0, 100);
  noStroke();
}

void draw() {
  background(0, 0, 100);
  baseColor = random(250);
  colorVariation = random(100, 200);
  for (int i = 0; i < 5000; i++) {
    float y = random(height);
    fill(map(y, 0, height, baseColor, baseColor + colorVariation), 50, random(85, 90));
    float r = random(25, 50);
    circle(random(width), y, r);
  }
  save("base" + nb + ".jpg");
  background(0, 0, 100);
  base = loadImage("base" + nb + ".jpg");
  float radius = 300;
  mask = createGraphics(600, 600);
  mask.beginDraw();
  mask.circle(150, 150, radius);
  mask.endDraw();
  base.mask(mask);
  image(base, 0, 0);
  save("art" + nb + ".jpg");
  nb++;
  if (nb > 9) exit();
}
  
