class Organism {
  PVector pos;
  int legsNb;
  float legsLen;
  float div;
  float mult;
  float size;
  int i;
  float d;
  Organism() {
    colorMode(HSB, 255);
    legsNb = int(random(20, 30));
    size = random(20, 40);
    legsLen = random(20, 30);
    pos = new PVector(random(legsLen, width-legsLen), random(legsLen, height-legsLen));
    div = int(random(100, 200));
    mult = int(random(2, 10)); 
    stroke(255);
  }
  
  void display() {
    strokeWeight(1);
    fill(bCol);
    for (int i = 0; i < legsNb; i++) {
      float t = frameCount / div * TWO_PI;
      float angle = i * TWO_PI/legsNb;
      d = map(sin(t + angle * mult), -1, 1, 1, 2) * legsLen;
      float x = pos.x + cos(angle) * d;
      float y = pos.y + sin(angle) * d;
      line(pos.x, pos.y, x, y);
      circle(x, y, 5);
      circle(pos.x, pos.y, size);
    }
  }
}
