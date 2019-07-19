int nb = 0;
int maxNb = 19;
int density = 1;
float x, y;
float a, b, c, s;
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
      float xnew;
      if (x - 1 >= 0)
        xnew=y-1-sqrt(abs(b*x-1-c));
      else
        xnew=y-1-sqrt(abs(b*x-1-c))*-1;
      float ynew=a-x-1;
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
  a = random(10);
  b = random(10);
  c = random(10);
  s = random(2, 5);
  n = int(random(40000, 80000));
  x = 0;
  y = 0;
  bri = new float[(width+1)*(height+1)];
}

void saveImg() {
  save("art" + nb + ".jpg");
  nb++;
  if (nb > maxNb) exit();
  boot();
}
