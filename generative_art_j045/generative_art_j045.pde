boolean debug = false;


FlowField flowfield;
ArrayList<Vehicle> vehicles;

int x = 0;
int nb = 3;
int maxX;
float hue;

void setup() {
  size(600, 600);
  //fullScreen();
  colorMode(HSB, 255);
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
  /**
  x++;
  if (x > 500 + maxX) {
    save("art01"+nb+".jpg");
    init();
    nb++;
    if (nb >= 10) exit();
  }
  **/
}

void init() {
  background(255);
  hue = random(50, 205);
  x = 0;
  flowfield = new FlowField(100);
  vehicles = new ArrayList<Vehicle>();
  maxX = int(random(1000));
  for (int i = 0; i < 500 + random(200); i++) {
    vehicles.add(new Vehicle(new PVector(random(width), random(height)), random(1, 3), random(0.05, 0.1)));
  }
}

void keyPressed() {
  if (key == ' ') {
    debug = !debug;
  }
}

void mousePressed() {
  save("art" + nb + ".jpg");
  nb++;
  if (nb > 19) exit();
  init();
}
