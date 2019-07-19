class Module {
  float size;
  int nb;
  int radius;
  PVector pos;
  float angle;
  float maxAngle;
  float increment;
  color col;
  float alpha;
  float diff[][];
  Module() {
    size = random(5, 15);
    nb = int(random(2, 8));
    alpha = random(5, 20);
    radius = nb * int(size) + int(random(10, 20));
    angle = random(TWO_PI);
    maxAngle = angle + random(3*PI/4, TWO_PI);
    increment = random(0.005, 0.01);
    pos = new PVector(random(100, width - 100), random(height/3, 2*height/3));
    col = color(maxHue + random(-100, 100), random(50, 100), random(50, 100), alpha);
    diff = new float[nb][2];
    for (int i = 0; i < nb; i++) {
      diff[i][0] = random(10);
      diff[i][1] = random(3);
    }
  }
  
  void display() {
    while(angle < maxAngle) {
      fill(col);
      translate(pos.x, pos.y);
      rotate(angle);
      float d = radius;
      for (int i = nb - 1; i > 0; i--) {
        rect(d, diff[i][0], size, 3);
        d -= size - diff[i][1];
      }
      rotate(-angle);
      translate(-pos.x, -pos.y);
      angle += increment;
    }
  }
}
