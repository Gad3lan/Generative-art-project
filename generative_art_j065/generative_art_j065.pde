int nb = 0;
int maxNb = 19;
int density = 2;
float w, h, xmin, ymin, xmax, ymax, dx, dy, ca, cb;
float hue, bri;
int maxiterations;

void setup() {
  size(600, 600);
  pixelDensity(density);
  colorMode(HSB, 360, 100, 100, 100);
  boot();
}

void draw() {
  loadPixels();
  float y = ymin;
  for (int j = 0; j < height*density; j++) {
    // Start x
    float x = xmin;
    for (int i = 0; i < width*density; i++) {

      // Now we test, as we iterate z = z^2 + cm does z tend towards infinity?
      float a = x;
      float b = y;
      int n = 0;
      while (n < maxiterations) {
        float aa = a * a;
        float bb = b * b;
        float twoab = 2.0 * a * b;
        a = aa - bb + ca;
        b = twoab + cb;
        // Infinty in our finite world is simple, let's just consider it 16
        if (a*a + b*b > 16.0) {
          break;  // Bail
        }
        n++;
      }

      // We color each pixel based on how long it takes to get to infinity
      // If we never got there, let's pick the color black
      if (n == maxiterations) {
        pixels[i+j*width*density] = color(hue, 80, 80);
      } else {
        // Gosh, we could make fancy colors here if we wanted
        pixels[i+j*width*density] = color(hue, sqrt(float(n) / maxiterations)*200, 100 - sqrt(float(n) / maxiterations)*100);
      }
      x += dx;
    }
    y += dy;
  }
  updatePixels();
  saveImg();
}

void boot() {
  background(0, 0, 100);
  hue = random(360);
  bri = random(90, 100);
  w = 5;
  h = (w* height)/width;
  xmin = -1 * w/2;
  ymin = -1 * h/2;
  maxiterations = 100;
  ca = random(-1, 1);
  cb = random(-1, 1);
  xmax = xmin+w;
  ymax = ymin + h;
  dx = (xmax - xmin)/(width*density);
  dy = (ymax - ymin)/(height*density);
}

void saveImg() {
  save("art" + nb + ".jpg");
  nb++;
  if (nb > maxNb) exit();
   boot();
}
