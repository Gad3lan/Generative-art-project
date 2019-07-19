int res = int(random(5, 10));
int nb = 0;
int x;
int max;

float bCol = 255;
float sCol = 0;

ArrayList<Point> points;

void setup() {
  size(600, 600);
  background(bCol);
  pixelDensity(2);
  strokeWeight(0.1);
  stroke(sCol, 75);
  noFill();
  
  boot();
}

void draw() {
  beginShape();
  curveVertex(points.get(0).pos.x, points.get(0).pos.y);
  for (Point p : points) {
    p.move();
    curveVertex(p.pos.x, p.pos.y);
  }
  endShape();
  x++;
  if (x > max) {
    save("art0" + nb + ".jpg");
    nb++;
    if (nb > 9) exit();
    boot();
  }
}

void boot() {
  background(bCol);
  x = 0;
  max = int(random(200, 600));
  
  points = new ArrayList<Point>();
  for (int i = 0; i < 20; i++) {
    points.add(new Point(i * width/res));
  }
  
}
