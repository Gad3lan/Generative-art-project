ArrayList<Module> mod;
int modNb;
int nb = 0;
int nbMax = 19;
int density = 2;
float maxHue;

void setup() {
  size(600, 600);
  colorMode(HSB, 360, 100, 100, 100);
  pixelDensity(density);
  rectMode(CENTER);
  blendMode(BLEND);
  noStroke();
  boot();
}

void draw() {
  for (Module m : mod) {
    m.display();
  }
  saveImg();
}

void boot() {
  background(0, 0, 10);
  maxHue = random(100, 260);
  mod = new ArrayList<Module>();
  modNb = int(random(20, 40));
  for (int i = 0; i < modNb; i++) {
    mod.add(new Module());
  }
}

void saveImg() {
  save("art" + nb + ".jpg");
  nb++;
  if (nb > nbMax) exit();
  boot(); 
}
