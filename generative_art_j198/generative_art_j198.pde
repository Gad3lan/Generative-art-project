float r1, r2, m1, m2, a1, a2, a1v, a2v;
float xoff;
float yoff;
float x = 0;
float g;


void setup() {
  size (600, 600);
  pixelDensity(2);
  run();
}

void draw() {
  translate(width/2, height/2);
  for (int n = 0; n < 20; n++) {
    background(255);
    beginShape();
    int nb = int(random(500, 1000));
    for (int i = 0; i < nb; i++) {
      float num1 = -g * (2 * m1 + m2) * sin(a1);
      float num2 = -m2 * g * sin(a1-2*a2);
      float num3 = -2*sin(a1-a2)*m2;
      float num4 = a2v*a2v*r2+a1v*a1v*r1*cos(a1-a2);
      float den = r1 * (2*m1+m2-m2*cos(2*a1-2*a2));
      float a1a = (num1 + num2 + num3*num4) / den;
    
      num1 = 2 * sin(a1-a2);
      num2 = (a1v*a1v*r1*(m1+m2));
      num3 = g * (m1 + m2) * cos(a1);
      num4 = a2v*a2v*r2*m2*cos(a1-a2);
      den = r2 * (2*m1+m2-m2*cos(2*a1-2*a2));
      float a2a = (num1*(num2+num3+num4)) / den;
        
      float x1 = r1 * sin(a1);
      float y1 = r1 * cos(a1);
    
      float x2 = x1 + r2 * sin(a2);
      float y2 = y1 + r2 * cos(a2);
      
      curveVertex(x2, y2);
     
      a1v += a1a;
      a2v += a2a;
      a1 += a1v;
      a2 += a2v;
    }
    endShape();
    run();
    save("art" + n + ".jpg");
  }
  exit();
}

void run() {
  r1 = random(50, 150);
  r2 = random(50, 150);
  m1 = random(60);
  m2 = random(60);
  a1 = random(TWO_PI);
  a2 = random(TWO_PI);
  a1v = 0;
  a2v = 0;
  
  xoff = 2;
  yoff = 1;
  
  x = 0;

  g = random(2);
}
