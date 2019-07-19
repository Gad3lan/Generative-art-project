void setup() {
  size(700, 700);
  smooth();
  pixelDensity(2);
  frameRate(3);
  noFill();
}

void draw() {
  for (int x = 0; x < 20; x++) {
    background(255);
    float s = random(200, 500);
    int steps = int(random(5, 30));
    float corner = (width-s)/2;
    PVector p1 = new PVector(corner, corner);
    PVector p2 = new PVector(corner + s, corner + s);
    PVector a1 = new PVector(corner, corner + s);
    PVector a2 = new PVector(corner + s, corner);
    float s1 = random(6, s/steps);
    float s2 = random(6, s/steps);
    float s3 = random(6, s/steps);
    float s4 = random(6, s/steps);
    for (int i = 0; i < steps; i++) {
      bezier(p1.x + i*s1, p1.y, a1.x, a1.y - i*s2, a2.x, a2.y + i*s3, p2.x - i*s4, p2.y);
    }
    save("art" + x + ".jpg");
  }
  exit();
}
