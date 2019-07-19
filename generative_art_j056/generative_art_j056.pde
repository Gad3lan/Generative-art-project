int nb = 0;
int maxNb = 19;
int density = 2;
ArrayList<Circle> circles;

void setup() {
  size(600, 600);
  pixelDensity(density);
  colorMode(HSB, 360, 100, 100, 100);
  boot();
}

void draw() {
  translate(width/2, height/2);
  for (Circle c : circles) {
    c.display();
  }
  saveImg();
}

void boot() {
  background(0,0, 100);
  circles = new ArrayList<Circle>();
  for (int i = 0; i < 2; i++) {
    circles.add(new Circle());
  }
}

void saveImg() {
  save("art" + nb + ".jpg");
  nb++;
  if (nb > maxNb) exit();
  boot();
}
