float d[][] = {{0.02, 0.0315, 0.02, 0.02}, 
               {0.0085, 0, 0.065, 0}, 
               {0.039, 0.006, 0, 0.0045}, 
               {0.004, 0.0065, 0.008, 0.019},
               {random(0.001, 0.05), random(0.001, 0.05), random(0.001, 0.05), random(0.001, 0.05)}};
float f[][] = {{2, 6, 1.002, 3}, 
               {3.001, 2, 3, 2}, 
               {10, 3, 1, 2}, 
               {2.01, 3, 4, 2},
               {floor(random(10)), floor(random(10)), floor(random(10)), floor(random(10))}};
float p[][] = {{PI/16, 3*PI/2, 13*PI/16, PI}, 
               {0, 0, PI/2, 3*PI/2}, 
               {0, 0, PI/2, 0}, 
               {0, 7*PI/16, 0, 0},
               {random(TWO_PI), random(TWO_PI), random(TWO_PI), random(TWO_PI)}};

float E = exp(1);

PVector current_pt;
PVector center;

int nb = 0;

void setup() {
  size(600, 600);
  pixelDensity(2);
  strokeWeight(0.2);
}

float partial(int i, float t, int a, int b, int c) {
  return 100 * sin(t*f[a][i] + p[b][i]) * pow(E, -d[c][i]*t);
}

void drawHarmonograph() {
  stroke(0);
  int a = int(random(4));
  int b = int(random(4));
  int c = int(random(4));
  beginShape();
  for (float t = 0; t < 200; t += 0.01) {    
    current_pt.x = partial(0, t, a, b, c) + partial(1, t, a, b, c);
    current_pt.y = partial(2, t, a, b, c) + partial(3, t, a, b, c);
    curveVertex(current_pt.x, current_pt.y);
    
  }
  translate(width/2, height/2);
  rotate(radians(90));
  endShape();
}

void draw() {
  background(255);
  
  current_pt = new PVector(0,0);
  center = new PVector(width/2, height/2);
  drawHarmonograph();
  if (nb < 20) {
    save("art" + nb + ".jpg");
    nb++;
  } else exit();
}
