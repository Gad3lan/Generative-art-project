int nb = 0;

void setup() {
  size(600, 600);
  pixelDensity(2);
  background(255);
  noFill();
  strokeWeight(0.5);
}

void draw() {
  background(255);
  translate(width/2, height/2);
  float a = 100;
  float b = 100;
  float c = 100;
  float d = 100;
  float d1 = random(0.01);
  float d2 = random(0.01);
  float d3 = random(0.01);
  float d4 = random(0.01);
  float p1 = random(PI);
  float p2 = p1 + random(-PI/4, PI/4);
  float p3 = p1 + random(-PI/4, PI/4);
  float p4 = p1 + random(-PI/4, PI/4);
  float f1 = random(10);
  float f2 = f1 + random(-1,1);
  float f3 = f1 + random(-1,1);
  float f4 = f1 + random(-1,1);
  beginShape();
  for (float i = 0; i < 100; i++) {
    float t = i;
    float x = a*sin(t*f1+p1)*exp(-d1*t) + b*sin(t*f2+p2)*exp(-d2*t);
    float y = c*sin(t*f3+p3)*exp(-d3*t) + d*sin(t*f4+p4)*exp(-d4*t);
    curveVertex(x, y);
  }
  endShape();
  if (nb < 20) {
    save("art"+nb+".jpg");
    nb++;
  } else {
    exit();
  }
}
