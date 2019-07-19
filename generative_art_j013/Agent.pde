class Agent {
  PVector pos;
  PVector vel;
  PVector acc;
  float maxforce;
  float maxspeed;
  float r;
  float xoff;
  float yoff;
  
  Agent(PVector l, float ms, float mf) {
    pos = l.get();
    r = random(100) + 50;
    maxspeed = ms;
    maxforce = mf;
    acc = new PVector(0, 0);
    vel = new PVector(0, 0);
    xoff = random(100);
    //xoff = random(-1, 1);
    yoff = random(100);
    //yoff = random(-1, 1);
  }
  
  void move() {
    PVector desired = new PVector(map(noise(xoff), 0, 1, -1, 1), map(noise(yoff), 0, 1, -1, 1));
    //PVector desired = new PVector(xoff, yoff);
    xoff += random(0.001, 0.005);
    yoff += random(0.001, 0.005);
    desired.mult(maxspeed);
    PVector steer = PVector.sub(desired, vel);
    steer.limit(maxforce);
    applyForce(steer);
  }
  
  void applyForce(PVector force) {
    acc.add(force);
  }
  
  public void run() {
    update();
    borders();
    display();
  }
  
  void update() {
    vel.add(acc);
    vel.limit(maxspeed);
    pos.add(vel);
    acc.mult(0);
  }
  
  void borders() {
    if (pos.x < 0) pos.x = width;
    if (pos.x > width) pos.x = 0;
    if (pos.y < 0) pos.y = height;
    if (pos.y > height) pos.y = 0;
    /**
    if (pos.x < 0 ||pos.x > width ||pos.y < 0 ||pos.y > height) {
      pos.x = width/2;
      pos.y = height/2;
      xoff = random(-1, 1);
      yoff = random(-1, 1);
    }
    **/
  }
  void display() {
    noFill();
    //strokeJoin(MITER);
    //ellipse(pos.x, pos.y, 5, 5);
    strokeWeight(0.2);
    for (Agent other : agents) {
      float d = PVector.dist(pos, other.pos);
      stroke(map(d, 0, r, 255, 255), 10);
      //if (d < r) line(pos.x, pos.y, other.pos.x, other.pos.y);
      //if (d > r) line(pos.x, pos.y, other.pos.x, other.pos.y);
      if (d < r) ellipse((pos.x + other.pos.x)/2, (pos.y + other.pos.y)/2, d, d);
    }
  }
}
