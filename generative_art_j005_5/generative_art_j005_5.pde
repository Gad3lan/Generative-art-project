boolean debug = false;
FlowField flowfield;
ArrayList<Vehicle> vehicles;

int x = 0;
int nb = 0;
int maxX;

void setup() {
  size(750, 1500);
  //fullScreen();
  pixelDensity(2);
  init();
}

void draw() {
  //background(0);
  if (debug) flowfield.display();
  for (Vehicle v : vehicles) {
    v.follow(flowfield);
    v.run();
  }
  flowfield.run();
  x++;
  if (x > 500 + maxX) {
    save("art01"+nb+".jpg");
    init();
    nb++;
    if (nb >= 10) exit();
  }
}

void init() {
  background(0);
  x = 0;
  flowfield = new FlowField(20 + int(random(30)));
  vehicles = new ArrayList<Vehicle>();
  maxX = int(random(500));
  for (int i = 0; i < 400 + random(100); i++) {
    vehicles.add(new Vehicle(new PVector(random(width), random(height)), random(2, 5), random(0.05,0.1)));
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
