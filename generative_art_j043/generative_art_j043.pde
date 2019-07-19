ArrayList<Organism> organisms;
int orgNb = int(random(5, 8));

color bCol;

void setup() {
  size(600, 600);
  pixelDensity(2);
  frameRate(30);
  colorMode(HSB, 255);
  bCol = color(random(255), random(50, 75), random(150, 200));
  organisms = new ArrayList<Organism>();
  for (int i = 0; i < orgNb; i++) {
    organisms.add(new Organism());
  }
}

void draw() {
  background(bCol);
  for (Organism o : organisms) {
    o.display();
  }
}
