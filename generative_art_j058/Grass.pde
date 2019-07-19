class Grass {
  float angle;
  float segment;
  color col = color(hue, random(50, 75), random(50, 100));
  Grass() {
    angle = random(-0.25, 0.25);
    segment = random(7, 12);
  }
  
  void display() {
    float x = random(width/2 - 25, width/2 + 15);
    float y = height;
    stroke(col, random(40, 60));
    noFill();
    beginShape();
    curveVertex(x, y);
    for (int i = 0; i < 50; i++) {
      x += angle * (i/2);
      y = height - i * segment;
      curveVertex(x, y);
    }
    curveVertex(x, y);
    endShape();
    fill(col, 100);
    circle(x, y, random(5, 10));
  }
}
