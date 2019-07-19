int nb = 0;
int maxNb = 19;
int density = 1;
ArrayList<PVector> points;
PVector current;
float factor;
int prev;
int n;


void setup() {
  size(1200, 1200);
  pixelDensity(density);
  colorMode(HSB, 360, 100, 100, 100);
  strokeWeight(0.75);
  stroke(0, 0, 0, 50);
  boot();
}

void draw() {
  for (int i = 0; i < 500000; i++) {
    int r;
    do {
      r = int(random(n));
    } while (prev == r);
    prev = r;
  
  current.x = lerp(current.x, points.get(r).x, factor);
  current.y = lerp(current.y, points.get(r).y, factor);
  point(current.x, current.y);
  }
  saveImg();
}

void boot() {
  background(0, 0, 100);
  n = int(random(3, 12));
  points = new ArrayList<PVector>();
  float len = random(450, 600);
  for (int i = 0; i < n; i++) {
    float angle = i*TWO_PI/n;
    points.add(new PVector(cos(angle)*len+width/2, sin(angle)*len+height/2));
  }
  current = new PVector(random(width), random(height));
  factor = random(0.15, 0.85);
  prev = -1;
}

void saveImg() {
  save("art" + nb + ".jpg");
  nb++;
  if (nb > maxNb) exit();
  boot();
}
