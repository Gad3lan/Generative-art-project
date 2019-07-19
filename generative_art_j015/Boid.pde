class Boid {
  PVector pos, vel, acc;
  float maxforce, maxspeed;
  float r = 50;
  float sepMultiplier = random(4);
  float aliMultiplier = random(4);
  float cohMultiplier = random(4);
  
  Boid(PVector l, float ms, float mf) {
    pos = l.get();
    maxspeed = ms;
    maxforce = mf;
    acc = new PVector(0, 0);
    vel = new PVector(0, 0);
  }
  
  void run(ArrayList<Boid> boids) {
    flock(boids);
    update();
    borders();
    display(boids);
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
  }
  
  void display(ArrayList<Boid> boids) {
    float dtot = 0;
    for (Boid other : boids) {
      float d = PVector.dist(pos, other.pos);
      if (d < r) {
        dtot += d;
        //stroke(map(d, r/2, r , 0, 255));
        //line(pos.x, pos.y, other.pos.x, other.pos.y);
      }
    }
    dtot /= boids.size();
    float s = map(dtot, 0, 5, 1, 20);
    fill(0, s * 5);
    ellipse(pos.x, pos.y, s, s);
  }
  
  void flock(ArrayList<Boid> boids) {
    PVector sep = separate(boids);
    PVector ali = align(boids);
    PVector coh = cohesion(boids);
    
    sep.mult(1.5);
    ali.mult(1.0);
    coh.mult(1.0);
    
    applyForce(sep);
    applyForce(ali);
    applyForce(coh);
  }
  
  PVector separate(ArrayList<Boid> boids) {
    int count = 0;
    PVector sum = new PVector(0, 0);
    for (Boid other : boids) {
      float d = PVector.dist(pos, other.pos);
      if (d < r/2 && d > 0) {
        PVector diff = PVector.sub(pos, other.pos);
        diff.normalize();
        diff.div(d);
        sum.add(diff);
        count++;
      }
    }
    if (count > 0) {
      sum.div(count);
      sum.normalize();
      sum.mult(maxspeed);
      PVector steer = PVector.sub(sum, vel);
      steer.limit(maxforce);
      return steer;
    } else {
      return new PVector(0, 0);
    }
  }
  
  PVector align(ArrayList<Boid> boids) {
    PVector sum = new PVector(0, 0);
    int count = 0;
    for (Boid other : boids) {
      float d = PVector.dist(pos, other.pos);
      if (d < r && d > 0) {
        sum.add(other.vel);
        count++;
      }
    }
    if (count > 0) {
      sum.div(count);
      sum.normalize();
      sum.mult(maxspeed);
      PVector steer = PVector.sub(sum, vel);
      steer.limit(maxforce);
      return steer;
    } else {
      return new PVector(0, 0);
    }
  }
  
  PVector cohesion(ArrayList<Boid> boids) {
    PVector sum = new PVector(0, 0);
    int count = 0;
    for (Boid other : boids) {
      float d = PVector.dist(pos, other.pos);
      if (d < r && d > 0) {
        sum.add(other.pos);
        count++;
      }
    }
    if (count > 0) {
      sum.div(count);
      return seek(sum);
    } else {
      return new PVector(0, 0);
    }
  }
  
  PVector seek(PVector target) {
    PVector desired = PVector.sub(target, pos);
    desired.setMag(maxspeed);
    PVector steer = PVector.sub(desired, vel);
    steer.limit(maxforce);
    return steer;
  }
    
  
  void applyForce(PVector force) {
    acc.add(force);
  }
}
