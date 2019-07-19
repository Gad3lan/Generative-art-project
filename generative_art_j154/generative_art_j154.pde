PImage img;
ArrayList<PVector> points;
int nbPoints;
float dist = 50;

void setup() {
  size(1400, 1400);
  background(255);
  strokeWeight(0.5);
  img = loadImage("img2.jpg");
  img.resize(1400, 1400);
  points = new ArrayList<PVector>();
  nbPoints = 10000;
  float xoff = random(10000);
  float yoff = random(10000);
  for (int i = 0; i < nbPoints; i++) {
    //points.add(new PVector(random(width), random(height)));
    xoff += 0.5;
    yoff += 0.25;
    float xn = noise(xoff) + random(-0.2, 0.2);
    float yn = noise(yoff) + random(-0.2, 0.2);
    xn = constrain(xn, 0, 0.9999);
    yn = constrain(yn, 0, 0.9999);
    points.add(new PVector(xn*width, yn*height));
  }
  noLoop();
}

void draw() {
  /**img.loadPixels();
  fill(img.pixels[int(mouseX) + width*int(mouseY)]);
  rect(1350, 1350, 100, 100);**/
  img.loadPixels();
  for (PVector p1 : points) {
    for (PVector p2 : points) {
      stroke(img.pixels[int(p1.x) + width * int(p1.y)]);
      if (PVector.dist(p1, p2) < dist) {
        line(p1.x, p1.y, p2.x, p2.y);
      }
    }
  }
  save("art.jpg");
}
