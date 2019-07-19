ArrayList<Point> points;
int pointsDensity = 3000;
int nb = 0;
void setup() {
  size(600, 600);
  pixelDensity(2);
  colorMode(HSB, 255);
  strokeWeight(0.1);
}

void draw() {
  if (nb > 19) exit();
  nb++;
  boot();
  for (Point p : points) {
    p.display();
  }
  save("art" + nb + ".jpg");
}

void boot() {
  background(255);
  noiseSeed(int(random(10000)));
  points  = new ArrayList<Point>();
  for (int i = 0; i < pointsDensity; i++) {
    points.add(new Point());
  }
}
