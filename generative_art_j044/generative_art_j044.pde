final int N = 300;
final int iter = 2;
final int SCALE = 2;
float t = 0;

Fluid fluid;

void settings() {
  size(N*SCALE, N*SCALE);
}

void setup() {
  fluid = new Fluid(1, 0, 0.00000001);
}

//void mouseDragged() {
//}

void draw() {
  background(0);
  int cx = int(0.5*width/SCALE);
  int cy = int(0.5*height/SCALE);
  for (int i = -1; i <= 1; i++) {
    for (int j = -1; j <= 1; j++) {
      fluid.addDensity(cx+i, cy+j, random(50, 150));
    }
  }
  for (int i = 0; i < 2; i++) {
    float angle = noise(t) * TWO_PI * 2;
    PVector v = PVector.fromAngle(angle);
    v.mult(0.2);
    t += 0.01;
    fluid.addVelocity(cx, cy, v.x, v.y );
  }


  fluid.step();
  fluid.renderD();
  //fluid.renderV();
  //fluid.fadeD();
}

void mouseClicked() {
  save("art09.jpg");
}
