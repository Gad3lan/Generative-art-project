ArrayList<PVector> tree;
ArrayList<Walker> walkers;
int r = 5;
int wNb;
int tNb;

int nb = 0;


void setup() {
  size(600, 600);
  pixelDensity(2);
  fill(255);
  stroke(255);
  frameRate(30);
  boot();
}

void draw() {
  //background(255);
  for(int i = 0; i < walkers.size(); i++) {
    walkers.get(i).run();
    if (walkers.get(i).checkStuck()) {
      tree.add(walkers.get(i).pos);
      ellipse(walkers.get(i).pos.x, walkers.get(i).pos.y, walkers.get(i).r/2,  walkers.get(i).r/2);
      walkers.remove(walkers.get(i));
    }
  }
  /**if (walkers.size() < 10) {
    save("art01" + nb + ".jpg");
    nb++;
    if (nb > 9) exit();
    boot();
  }**/
}

void boot() {
  background(0);
  wNb = int(random(200, 400));
  tNb = int(random(4, 10));
  tree = new ArrayList<PVector>();
  walkers = new ArrayList<Walker>();
  for (int i = 0; i < tNb; i++) {
    tree.add(new PVector(random(width), random(height)));
    int s = int(random(1, 5));
    ellipse(tree.get(i).x, tree.get(i).y, s, s);
  }
  for (int i = 0; i < wNb; i++) {
    walkers.add(new Walker(new PVector(random(width), random(height))));
  }
}
