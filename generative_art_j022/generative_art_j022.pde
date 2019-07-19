ArrayList<Walker> walkers;
int nb = 0;
int bColor = 255;
int sColor = 0;
void setup() {
  size(600, 600);
  strokeWeight(0.1);
  pixelDensity(2);
  boot();
}

void draw() {
    for (int i = 0; i < walkers.size(); i++) {
      walkers.get(i).run();
      if (walkers.get(i).pos.y < height/4 || walkers.get(i).pos.y > 3*height/4) {
        save("art1" + nb + ".jpg");
        boot();
        nb++;
        if (nb > 9) exit();
      }
      if (walkers.get(i).dead) walkers.remove(i);
    }
}

void boot() {
  background(bColor);
  walkers = new ArrayList<Walker>();
  for (int i = 0; i < 100; i++) {
    walkers.add(new Walker(random(0.5, 3)));
  }
}
  
