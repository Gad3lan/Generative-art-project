float increment = 0.003;
int density = 2;
int nb = 0;


ArrayList<Point> points = new ArrayList<Point>();
Layer layers;

void setup() {
  size(1000, 1000);
  pixelDensity(density);
  colorMode(HSB, 255);
  noLoop();
  layers = new Layer();
}

void draw() {
  background(255);
  boot();
  layers.display();
}

void boot() {
  loadPixels();
  float xoff = random(1000); // Start xoff at 0
  noiseDetail(2, 0.2 );
  float hue = random(255);
  float sat = random(50, 200);
  int s = int(random(10, 30));

  // For every x,y coordinate in a 2D space, calculate a noise value and produce a brightness value
  for (int x = 0; x < width*density; x++) {
    xoff += increment;   // Increment xoff 
    float yoff = 0.0;   // For every xoff, start yoff at 0
    for (int y = 0; y < height*density; y++) {
      yoff += increment; // Increment yoff

      // Calculate noise and scale by 255
      float bright = int(map(noise(xoff, yoff), 0, 1, 4, 20)) * 10;

      // Try using this line instead
      //float bright = random(0,255);

      // Set each pixel onscreen to a grayscale value
      int pos = x + y * width * density;
      pixels[pos] = color(hue, sat, bright);
      points.add(new Point(x, y, pixels[pos]));
      if (x > s && pixels[pos] != pixels[pos-1]) {
        if (pixels[pos - 1] > pixels[pos]) {
          for (int i = 0; i < s; i++) {
            pixels[pos-i] = color(hue, sat, bright-2*(i));
          }
        }
      }
    }
  }
  updatePixels();
  save("test" + nb + ".jpg");
  nb++;
  if (nb > 19) exit();
}
