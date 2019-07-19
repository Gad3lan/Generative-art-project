int nb = 0;
int maxNb = 19;
int density = 2;
float w, h, xmin, ymin, xmax, ymax, dx, dy;
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
        a = aa - bb + x;
        b = twoab + y;
        // Infinty in our finite world is simple, let's just consider it 16
        if (a*a + b*b > 16.0) {
          break;  // Bail
        }
        n++;
      }

      // We color each pixel based on how long it takes to get to infinity
      // If we never got there, let's pick the color black
      if (n == maxiterations) {
        pixels[i+j*width*density] = color(hue, 90, bri);
      } else {
        // Gosh, we could make fancy colors here if we wanted
        pixels[i+j*width*density] = color(hue, sqrt(float(n) / maxiterations)*80 + 10, map(n, 0, 100, bri, 0));
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
  bri = random(70, 90);
  w = random(1, 4);
  h = (w* height)/width;
  xmin = random(-1.5, -0.5) * w/2;
  ymin = random(-1.5, -0.5) * h/2;
  maxiterations = 100;
  xmax = xmin+w;
  ymax = ymin + h;
  dx = (xmax - xmin)/(width*density);
  dy = (ymax - ymin)/(height*density);
}

void saveImg() {
  save("art" + nb + ".jpg");
  nb++;
  if (nb > maxNb) exit();
  exit();
  boot();
}
