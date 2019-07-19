int nb = 0;
int maxNb = 19;
int density = 1;
float x, y;
float a, b, c, d;
float dt;
float hue;
float bri[];
float lim = 100;
float maxbri;

void setup() {
  size(1200, 1200);
  pixelDensity(density);
  colorMode(HSB, 360, 100, 100, 100);
  noFill();
  boot();
}

void draw() {
  loadPixels();
  for (int i = 0; i < 20000; i++) {
    for (int j = 0; j < 100; j++) {
      float xnew=cos(y*b)+c*cos(x*b);
      float ynew=cos(x*a)+d*cos(y*a); 
      x = xnew;
      y = ynew;
      int affx = int(150 * x + width/2);
      int affy = int(150 * y + height/2);
      if (affx > 0 && affx < width && affy > 0 && affy < height) {
        bri[affx+(affy*width)] += 2.5;
        if (bri[affx+(affy*width)] > maxbri) maxbri = bri[affx+(affy*width)];
      }
    }
  }
  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      pixels[x + y*width] = color(hue, 90, constrain(bri[x+y*width], 0, 90));
    }
  }
  updatePixels();
  saveImg();
} 

void boot() {
  background(360, 0, 0);
  hue = random(360);
  a = random(-3, 3);
  b = random(-3, 3);
  c = random(-3, 3);
  d = random(-3, 3);
  x = 0.1;
  y = 0.1;
  bri = new float[(width+1)*(height+1)];
}

void saveImg() {
  save("art" + nb + ".jpg");
  nb++;
  if (nb > maxNb) exit();
  boot();
}
