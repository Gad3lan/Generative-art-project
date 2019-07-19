class Particle {
  PVector pos; 
  PVector vel;
  float life;
  int flip;
  Particle() {
    pos = new PVector(random(side, width - side), top);
    vel = new PVector(0, 0);
    life = random(maxLife);
    flip = int(random(2)) * 2 - 1;
  }
  
  void move(int iterations) {
    if ((life -= 0.01666) < 0) respawn();
    while(iterations > 0) {
      float transition = map(pos.x, side, width - side, 0, 1);
      float angle = noise(pos.x/noiseScale, pos.y/noiseScale) * transition * TWO_PI * noiseScale;
      vel.x = cos(angle);
      vel.y = sin(angle);
      vel.mult(speed);
      pos.add(vel);
      iterations--;
    }
  }
  
  void checkEdge() {
    if(pos.x > width - side ||pos.x < side ||pos.y > height - top ||pos.y < top) respawn();
  }
  
  void respawn() {
    pos = new PVector(random(side, width - side), top);
    life = maxLife;
  }
  
  void display(float r) {
    ellipse(pos.x, pos.y, r, r);
  }
}
