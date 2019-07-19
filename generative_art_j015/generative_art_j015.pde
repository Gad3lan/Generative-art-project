Flock flock;

void setup() {
  size(600, 600);
  background(240);
  strokeWeight(0.1);
  pixelDensity(2);
  flock = new Flock();
  for (int i = 0; i < 100; i++) {
    Boid b = new Boid(new PVector(random(width), random(height)), random(2, 5), random(0.1, 0.5));
    flock.addBoid(b);
  }
}

void draw() {
  noStroke();
  fill(255, 12);
  rect(0, 0, width, height);
  flock.run();
}
