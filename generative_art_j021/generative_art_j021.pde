ArrayList<Walker> walkers;

int wNb = int(random(10));

int x;
int nb = 0;

void setup() {
  size(600, 600);
  pixelDensity(2);
  strokeWeight(0.1);
  stroke(255, 50);
  boot();
}

void draw() {
  for (int i = 0; i < x; i++) {
    for (Walker w : walkers) {
      w.run();
    }
  }
  save("art1" + nb + ".jpg");
  nb++;
  if (nb > 9) exit();
  boot();
}

void boot() {
  background(0);
  walkers = new ArrayList<Walker>();
  for (int i = 0; i < wNb; i++) {
    walkers.add(new Walker());
  }
  x = int(random(500, 1000));
}
