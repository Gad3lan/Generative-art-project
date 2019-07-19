PVector p1, p2;
float v1, v2;
float o1, o2;
float s;
int nb = 0;

void setup() {
  size(600, 600);
  pixelDensity(2);
  strokeWeight(0.2);
  stroke(255);
  noFill();
}

void draw() {
  background(0);
  v1 = random(0.15);
  v2 = random(0.15);
  p1 = new PVector();
  p2 = new PVector();
  o1 = random(TWO_PI);
  o2 = random(TWO_PI);
  s = random(75, 150);
  int n = int(random(200, 500));
  translate(width/2, height/2);
  for (int i = 0; i < n; i++) {
    p1.x = s*cos(i*v1+o1);
    p1.y = s*sin(i*v1+o1);
    p2.x = s*cos(i*v2+o2);
    p2.y = s*sin(i*v2+o2);
    circle(p1.x, p1.y, PVector.dist(p1, p2));
  }
  if (nb < 20) {
    save("art" + nb + ".jpg");
    nb++;
  } else exit();
}
