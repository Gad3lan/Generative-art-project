int nb;
float off;
float hue;
int maxNb = 19;
int density = 2;
ArrayList<Orbiter> orbiters;
int oNb;

void setup() {
  size(600, 600);
  nb = 0;
  pixelDensity(density);
  colorMode(HSB, 360, 100, 100, 100);
  noStroke();
  boot();
}

void draw() {
  background(0, 0, 100);
  translate(width/2, height/2);
  for (Orbiter o : orbiters) {
    o.display(); 
  }
  saveImg();
}

void boot() {
  background(0, 0, 100);
  oNb = int(random(10, 20));
  off = random(10000);
  hue = random(40, 320);
  orbiters = new ArrayList<Orbiter>();
  for (int i = 0; i < oNb; i++) {
    orbiters.add(new Orbiter());
  }
}

void saveImg() {
  save("art" + nb + ".jpg");
  nb++;
  if (nb > maxNb) exit();
  boot();
}
