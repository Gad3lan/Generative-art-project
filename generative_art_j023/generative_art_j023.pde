float xoff;
float yoff;
float angle;

int nb = 0;
int nbRect;

void setup() {
  size(600, 600);
  pixelDensity(2);
  noFill();
  rectMode(CENTER);
  strokeWeight(0.1);
  stroke(255, 90);
  boot();
}

void draw() {
  translate(width/2, height/2);
  rotate(angle);
  angle += 0.02;
  int s = 800;
  for (int i = 0; i < nbRect; i++) {
    rect(0, 0, s * sin(angle) * noise(xoff), s * sin(angle)*noise(yoff));
    s *= 0.7;
    xoff += 0.001;
    yoff += 0.001;
  }
  if (angle > PI) {
    save("art1" + nb + ".jpg");
    nb++;
    if (nb > 9) exit();
    boot();
  }
}

void boot() {
  background(0);
  angle = 0;
  xoff = random(10000);
  yoff = random(10000);
  nbRect = int(random(5, 15));
}
