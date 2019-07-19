class Vehicle {
  PVector position;
  PVector prevposition;
  PVector velocity;
  PVector acceleration;
  float r;
  float maxforce;
  float maxspeed;
  int transparancy;
  float red, g, b;
  
  Vehicle(PVector l, float ms, float mf) {
    position = l.get();
    prevposition = new PVector(position.x, position.y);
    r = 3.0;
    maxspeed = ms;
    maxforce = mf;
    acceleration = new PVector(0, 0);
    velocity = new PVector(0, 0);
    transparancy = 0;
  }
  
  public void run() {
    update();
    borders();
    display();
  }
  
  void follow(FlowField flow) {
    PVector desired = flow.lookup(position);
    desired.mult(maxspeed);
    PVector steer = PVector.sub(desired, velocity);
    steer.limit(maxforce);
    applyForce(steer);
  }
  
  void applyForce(PVector force) {
    acceleration.add(force);
  }
  
  void update() {
    prevposition.set(position);
    velocity.add(acceleration);
    velocity.limit(maxspeed);
    position.add(velocity);
    acceleration.mult(0);
  }
  
  void display() {
    stroke(transparancy);
    if (transparancy < 255) transparancy++;
    strokeWeight(0.2);
    //rotate(map(noise(position.y, position.y), 0, 1, 0, (TWO_PI)));
    line(position.x, position.y, prevposition.x, prevposition.y);
  }
  
  void borders() {
    if (position.x > width) {
      position.x = 0;
      prevposition.set(position);
    }
    if (position.x < 0) {
      position.x = width;
      prevposition.set(position);
    }
    if (position.y > height) {
      position.y = 0;
      prevposition.set(position);
    }
    if (position.y < 0) {
      position.y = height;
      prevposition.set(position);
    }
  }
}
