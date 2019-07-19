float xoff;
ArrayList<Light> lights;
float hue;
int nb = 10;
float high = 300;

void setup() {
  size(600, 600, P3D);
  frameRate(60);
  colorMode(HSB, 360, 100, 100, 100);
  pixelDensity(2);
  strokeWeight(5);
  strokeCap(ROUND);
  boot();
}

void draw() {
  if (lights.get(0).size <= 0) {
    
    save("art" + nb + ".jpg");
    nb++;
    if (nb > 19) exit();
    boot();
  }
  rotateX(PI/8);
  translate(0, 50, 150-frameCount);
  for (Light l : lights) {
    l.move();
  }
}

void boot() { 
  background(random(270, 290), random(50,100), random(10, 15));
  stroke(255);
  strokeWeight(0.5);
  for (int i = 0; i < 2500; i++) {
    point(random(width), random(height));
  }
  hue = random(50, 310);
  int lnb = int(random(4, 8));
  lights = new ArrayList<Light>();
  for (int i = 0; i < lnb; i++) {
    lights.add(new Light());
  }
  frameCount = 0;
}
