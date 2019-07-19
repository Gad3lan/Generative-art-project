int nb = 0;
int maxNb = 19;
int density = 2;
float hue;
ArrayList<Grass> grass;

void setup() {
  size(600, 600);
  pixelDensity(density);
  colorMode(HSB, 360, 100, 100, 100);
  strokeWeight(3);
  boot();
}

void draw() {
  for (Grass g : grass) {
    g.display();
  }
  saveImg();
}

void boot() {
  hue = random(360);
  grass = new ArrayList<Grass>();
  int num = int(random(75, 150));
  for (int i = 0; i < num; i++) {
    grass.add(new Grass());
  }
  background((hue + 251)%360, 90, 8);
}

void saveImg() {
  save("art" + nb + ".jpg");
  nb++;
  if (nb > maxNb) exit();
  boot();
}
