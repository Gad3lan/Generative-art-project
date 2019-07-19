int nb = 0;
int maxNb = 19;
int density = 2;
float hue, sat, bri;
ArrayList<PVector> centers;
float sizes[];

void setup() {
  size(600, 600);
  pixelDensity(density);
  colorMode(HSB, 360, 100, 100, 100);
  noStroke();
  boot();
}

void draw() {
  for (int i = 0; i < 10; i++) {
    hue += random(-40, 40);
    bri += random(4, 10);
    fill(hue, sat, bri);
    for (int j = 0; j < centers.size(); j++) {
      if (sizes[j] > 10) {
        circle(centers.get(j).x, centers.get(j).y, sizes[j]);
        sizes[j] -= random(20, 70);
      }
    }
  }
  saveImg();
}

void boot() {
  hue = random(360);
  sat = random(25, 75);
  bri = random(10, 30);
  background(0, 0, 7);
  centers = new ArrayList<PVector>();
  int circlesNb = int(random(7, 20));
  sizes = new float[circlesNb];
  for (int i = 0; i < circlesNb; i++) {
     centers.add(new PVector(random(width), random(height)));
     sizes[i] = random(150, 300);
  }
}

void saveImg() {
  save("art" + nb + ".jpg");
  nb++;
  if (nb > maxNb) exit();
  boot();
}
