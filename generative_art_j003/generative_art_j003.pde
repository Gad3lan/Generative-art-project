float r1;
float r2;
float m1;
float m2;
float a1;
float a2;
float a1_v;
float a2_v;

float xoff;
float yoff;

float x = 0;

float g;
float nb = 0;

PGraphics drawing;

void setup() {
  size (600, 600);
  pixelDensity(2);
  stroke(0);
  strokeWeight(0.2);
  run();
}

void draw() {
  //background(255);
  //translate(300, 50);
  
  float num1 = -g * (2 * m1 + m2) * sin(a1);
  float num2 = -m2 * g * sin(a1-2*a2);
  float num3 = -2*sin(a1-a2)*m2;
  float num4 = a2_v*a2_v*r2+a1_v*a1_v*r1*cos(a1-a2);
  float den = r1 * (2*m1+m2-m2*cos(2*a1-2*a2));
  float a1_a = (num1 + num2 + num3*num4) / den;

  num1 = 2 * sin(a1-a2);
  num2 = (a1_v*a1_v*r1*(m1+m2));
  num3 = g * (m1 + m2) * cos(a1);
  num4 = a2_v*a2_v*r2*m2*cos(a1-a2);
  den = r2 * (2*m1+m2-m2*cos(2*a1-2*a2));
  float a2_a = (num1*(num2+num3+num4)) / den;
    
  float x1 = r1 * sin(a1);
  float y1 = r1 * cos(a1);

  float x2 = x1 + r2 * sin(a2);
  float y2 = y1 + r2 * cos(a2);
  
  translate(noise(xoff)*width, noise(yoff)*height);
  line(0, 0, x1, y1);
  line(x1, y1, x2, y2);
 
  a1_v += a1_a;
  a2_v += a2_a;
  a1 += a1_v;
  a2 += a2_v;
  
  xoff += 0.01;
  yoff += 0.01;
  
  x++;
  if (x > 2000) {
    if (nb < 10) {
      save("art03" + nb + ".jpg");
      nb++;
      x = 0;
      run();
    } else exit();
  }
}

void run() {
  noiseSeed(int(random(10000)));
  r1 = 100 + random(100);
  r2 = 75 + random(100);
  m1 = random(60);
  m2 = random(60);
  a1 = random(8) * PI/random(2);
  a2 = random(8) * PI/random(2);
  a1_v = 0;
  a2_v = 0;
  
  xoff = 2;
  yoff = 1;
  
  x = 0;

  g = random(1);
  background(255);
}
