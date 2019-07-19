System s;  // system with ball that bounces inside of the external circle

int countFrames;  // variable used to count frames 
static final int MAX_FRAMES = 6000;  // maximum of frames to finish drawing 

int nb = 0;
float rot;

/*========================*/


void setup() {
  size(600, 600);
  pixelDensity(2);
  
  colorMode(HSB, 360, 100, 100, 255);  
  background(0, 0, 100);  // white background
   
  noStroke();
    
  s = new System();
  
  countFrames = 0;
  rot = random(360);
}


/*========================*/


void draw() {
  s.move();
  s.checkEdges();
  
  s.showBorder();

  countFrames += 1;
  if (countFrames > 300) {
    countFrames = 0;
    save("art" + nb + ".jpg");
    nb++;
    if (nb > 9) exit();
    background(0, 0, 100);  // white background
    s = new System();
    rot = random(360);
  }
}


/*========================*/


void mousePressed() {
  background(0, 0, 100);  // clean screen (white background)
  s = new System();  // new sistem
  countFrames = 0;  // reset frame counter
  loop();  // restart drawing
}


/*========================*/


class System {
  PVector pos, vel;  // position and velocity of internal circle
  color col;  // color of the internal circle
  int intRadius;  // radius of the internal circle
  int extRadius;  // radius of the external circle
  PVector center;  // center of the external circle
  
  /*-------*/
  
  System() {
    col = color(0, 0, 80);  // light gray
    intRadius = 30;
    
    extRadius = int(random(100, 150)); 
    center = new PVector(width/2, height/2);
    
    // random position inside of the external circle
    pos = PVector.random2D();
    pos.mult(random(extRadius - intRadius));
    pos.add(center);
    
    // random velocity
    vel = PVector.random2D();
    vel.mult(100);
  }
  
  /*-------*/
  
  void move() {
    pos.add(vel);
  }
  
  /*-------*/
  
  void checkEdges() {
    // distance bewtween center and position minus diference of radius
    float d = ceil(pos.dist(center) - (extRadius - intRadius));
    
    if (d > 0) {  // if internal circle is outside of the external circle
      // go back to inside of the borders
      PVector back = PVector.fromAngle(vel.heading());
      back.mult(d);
      pos.sub(back);
      
      // reflect velocity
      float angle = PVector.sub(center, this.pos).heading();
      vel.mult(-1);
      vel.rotate(-angle);
      vel.y *= -1;
      vel.rotate(angle);
      
      float h = (360 + degrees(-angle))%360;  // hue according to angle
      showSplash(h, pos);
      
      col = color(h, 80, 80);  // color according to angle when touching the edge
    } else {
      col = color(0, 0, 80);  // light gray otherwise
    }
  }
  
  /*-------*/
  
  void showSplash(float theta, PVector pos) {
    float diam, alpha;
    
    // colorful circle (random size, the smaller the stronger)
    diam = random(2*intRadius, 2*extRadius);
    alpha = map(diam, 2*intRadius, 2*extRadius, 50, 0);
    fill((theta + rot) % 360, 100, 100, jitter(alpha, 5));
    ellipse(jitter(pos.x, 50), jitter(pos.y, 50), diam, diam);
    
    // white circle (random size, the smaller the stronger)
    diam = random(2*intRadius, 2*extRadius);
    alpha = map(diam, 2*intRadius, 2*extRadius, 40, 10);
    fill((theta + rot) % 360, 0, 100, jitter(alpha, 5));
    ellipse(jitter(pos.x, 50), jitter(pos.y, 50), diam, diam);
    
    // small circle
    fill((theta + rot) % 360, 100, 100, 30);
    ellipse(jitter(pos.x, 100), jitter(pos.y, 100), 30, 30);
    
    // smaller circle
    fill((theta + rot) % 360, 100, 100, 40);
    ellipse(jitter(pos.x, 100), jitter(pos.y, 150), 10, 10);
  }
  
  /*-------*/
  
  void showBorder() {  // Display external circle
    fill(0, 0, 100); // white
    ellipse(center.x, center.y, 2*extRadius, 2*extRadius);
  }
}


/*========================*/


float jitter(float num, float j) {
  return num + random(-j, j);
}
