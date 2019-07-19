int nb = 0;
int maxNb = 19;
int density = 2;
float increment, sizeX, sizeY, hue, colorVariation, maxSize, alpha;
float angle;

void setup() {
  size(600, 600);
  pixelDensity(density);
  colorMode(HSB, 360, 100, 100, 100);
  noStroke();
  boot();
}

void draw() {
  translate(random(width), random(height));
  for (int i = 0; i*sizeX < maxSize; i++) {
    float d = i * sizeX - random(10, 20);
    alpha = increment * d/10 + 10;
    angle = 0;
    while (angle < TWO_PI) {
      rotate(abs(increment));
      fill(hue + random(-colorVariation, colorVariation), random(50, 100), random(50, 75), alpha);
      rect(d + random(10), 0, sizeX + random(-5, 5), sizeY + random(-2, 2));
      angle += abs(increment);
    }
    increment -= 0.001;
  }
  saveImg();
}

void boot() {
  background(0);
  increment = random(0.03, 0.07);
  angle = 0;
  sizeX = random(30, 60);
  sizeY = random(15, 30);
  maxSize = random(400, 700);
  colorVariation = random(40, 60);
  hue = random(colorVariation, 360 - colorVariation);
}

void saveImg() {
  save("art" + nb + ".jpg");
  nb++;
  if (nb > maxNb) exit();
  boot();
}
