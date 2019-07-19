class Agent {
  PVector pos;
  PVector ppos;
  PVector vel;
  PVector acc;
  float maxforce;
  float maxspeed;
  float r;
  int transparancy;
  
  Agent(PVector l, float ms, float mf) {
    pos = l.get();
    ppos = new PVector(pos.x, pos.y);
    r = 100;
    maxspeed = ms;
    maxforce = mf;
    acc = new PVector(0, 0);
    vel = new PVector(0, 0);
  }
  
  void move(FlowField flow) {
    PVector desired = flow.lookup(pos);
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
    ppos.set(pos);
    vel.add(acc);
    vel.limit(maxspeed);
    pos.add(vel);
    acc.mult(0);
  }
  
  void borders() {
    if (pos.x < 0) {
      pos.x = width;
      ppos.set(pos);
    }
    if (pos.x > width) {
      pos.x = 0;
      ppos.set(pos);
    }
    if (pos.y < 0) {
      pos.y = height;
      ppos.set(pos);
    }
    if (pos.y > height) {
      pos.y = 0;
      ppos.set(pos);
    }
  }
  
  void display() {
    stroke(255);
    strokeWeight(0.1);
    //ellipse(pos.x, pos.y, r, r);
    for (Agent other : agents) {
      float d = PVector.dist(pos, other.pos);
      stroke(map(d, r/2, r, 0, 255), 100);
      if (d < r) line(pos.x, pos.y, other.pos.x, other.pos.y);
      //if (d > r) line(pos.x, pos.y, other.pos.x, other.pos.y);
      //if (d < r) ellipse((pos.x + other.pos.x)/2, (pos.y + other.pos.y)/2, d, d);
    }
  }
}
