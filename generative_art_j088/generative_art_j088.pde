int nb = 0;
int maxNb = 19;
int density = 1;
float x, y;
float a, b, s;
int n;
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
  for (int i = 0; i < n; i++) {
    for (int j = 0; j < 100; j++) {
      float xnew=sin(x*y/b)*y+cos(a*x-y);
      float ynew=x+sin(y)/b;
      x = xnew;
      y = ynew;
      int affx = int(s * x + width/2);
      int affy = int(s * y + height/2);
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
  a = random(-1, 1);
  b = random(-1, 1);
  s = random(100, 150);
  n = int(random(20000, 200000));
  x = 1.0;
  y = 1.0;
  bri = new float[(width+1)*(height+1)];
}

void saveImg() {
  save("art" + nb + ".jpg");
  nb++;
  if (nb > maxNb) exit();
  boot();
}
