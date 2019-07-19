class Circle {
  color col1, col2;
  float angle;
  int circlesNb;
  float size;
  float dist;

  Circle() {
    circlesNb = int(random(40, 72));
    angle = TWO_PI/circlesNb;
    size = random(100, 200);
    dist = random(size, 300-size);
    
    col1 = color(random(360), random(70, 100), random(60, 100), random(5, 10));
    col2 = color(random(360), random(2, 5), random(90, 100), random(50, 70));
  }
  
  void display() {
    fill(col1);
    noStroke();
    for (int i = 0; i < circlesNb; i++) {
      rotate(angle);
      circle(dist, 0, size);
    }
    noFill();
    stroke(col2);
    for (int i = 0; i < circlesNb; i++) {
      rotate(angle);
      circle(dist, 0, size);
    }
  }
}
