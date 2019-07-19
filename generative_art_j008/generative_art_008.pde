boolean debug = false;

FlowField flowfield;
ArrayList<Agent> agents;

int x = 0;

void setup() {
  size(600, 600);
  background(255);
  pixelDensity(2);
  flowfield = new FlowField(20 + int(random(30)));
  agents = new ArrayList<Agent>();
  for (int i = 0; i < 100; i++) {
    agents.add(new Agent(new PVector(random(width), random(height)), random(0.5, 1), random(0.01, 0.05)));
  }
}

void draw() {
  //background(0);
  if (debug) flowfield.display();
  for (Agent a : agents) {
    a.move(flowfield);
    a.run();
  }
  flowfield.run();
  saveFrame();
  x++;
  if (x > 900) {
    exit();
  }
}

void keyPressed() {
  if (key == ' ') {
    debug = !debug;
  }
}

void mousePressed() {
  flowfield.init();
}
