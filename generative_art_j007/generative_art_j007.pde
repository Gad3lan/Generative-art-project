ArrayList<Agent> agents;

int x = 0;
int nb = 0;
float max;

void setup() {
  size(600, 600);
  pixelDensity(2);
  boot();
}

void draw() {
  //background(255);
  for (Agent a : agents) {
    a.move();
    a.run();
  }
  x++;
  if (x > 500 + max) {
    save("art01" + nb + ".jpg");
    nb++;
    if (nb > 9) exit();
    boot();
    x = 0;
  }
}

void boot() {
  background(255);
  print("Boot n°" + nb + "... ");
  max = random(1000);
  agents = new ArrayList<Agent>();
  for (int i = 0; i < 25 + random(75); i++) {
    agents.add(new Agent(new PVector(random(width), random(height)), random(2, 5), random(0.1, 0.5)));
    //agents.add(new Agent(new PVector(width/2, height/2), random(2, 5), random(0.1, 0.5)));
  }
  println("Booted");
}
