class Snake {
  constructor(x, y, offset, mySeed) {
    let col = [];
    col.push(10+offset);
    col.push(40+offset);
    col.push(70+offset);
    col.push(100+offset);
    
    this.flowFactor = 20.0;
    
    this.seed = mySeed;
    this.pos = createVector(x, y);
    this.r = floor(random(3) + 3);
    this.vel = createVector(0,0);
    this.theta = 0.0;
    this.speed = 0.5;
    this.scale = 700;
    this.col = col[floor(random(col.length))];
    this.brt = random(255);
    this.sat = random(255);
  }
  
  move() {
    this.theta = this.scale/this.flowFactor*noise(this.pos.x/this.scale+this.seed, this.pos.y/this.scale+this.seed)*TWO_PI;
    this.vel = createVector(this.speed*cos(this.theta),this.speed*sin(this.theta));
    this.pos.add(this.vel);
  }
}
