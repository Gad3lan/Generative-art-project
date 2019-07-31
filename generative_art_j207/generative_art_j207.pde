void setup() {
  size(700, 700);
  pixelDensity(2);
  frameRate(3);
}

void draw() {
  translate(width/2, 0);
  for (int n = 0; n < 20; n++) {
    background(255);
    float start = random(width/3);
    float step = random(5, 20);
    int nb = int(random(30, 60));
    float a = random(TWO_PI);
    float astep = random(PI/40);
    float x = random(width/2);
    for (int i = 0; i < nb; i++) {
      PVector ctr = new PVector(x, start + i*step);
      line(2*width*cos(a) + ctr.x, 2*height*sin(a) + ctr.y, 2*width*cos(a-PI) + ctr.x, 2*height*sin(a-PI) + ctr.y);
      line(2*width*cos(PI-a) - ctr.x, 2*height*sin(PI-a) + ctr.y, 2*width*cos(TWO_PI-a) - ctr.x, 2*height*sin(TWO_PI-a) + ctr.y);
      a += astep;
    }
    save("art" + n + ".jpg");
  }
  exit();
}
