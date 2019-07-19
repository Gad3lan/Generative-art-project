int nbPoints = 11;

float[] x = new float[nbPoints];
float[] y = new float[nbPoints];

float off1 = 0;
float off2 = random(10);

float ty = 0;

boolean end;
int nb = 0;
float angle;

void setup() {
  size(600, 600);
  pixelDensity(2);
  stroke(0);
  noFill();
  strokeWeight(0.1);
  reboot();
}

void draw() {
  ty += 1.5;
  translate(0, ty);
  beginShape();
  curveVertex(x[0], y[0]);
  off1 = random(50);
  end = true;
  for (int i = 0; i < nbPoints; i++) {
    //y[i] += noise(off2) + map(noise(off1), 0, 1, 0, 10);
    y[i] -= map(noise(off1), 0, 1, -10, 10);
    off1 += 2;
    curveVertex(x[i], y[i]);
  }
  println(end);
  curveVertex(x[nbPoints - 1], y[nbPoints - 1]);
  off2 += 0.01;
  endShape();
  if (ty > height) {
    save("art01" + nb + ".jpg");
    nb++;
    if (nb > 9) exit();
    reboot();
  }
}

void reboot() {
  println("Boot!");
  background(255);
  ty = 0;
  beginShape();
  curveVertex(0, map(noise(off2), 0, 1, 0, 10) + map(noise(off1), 0, 1, 0, 1));
  for (int i = 0; i < nbPoints; i++) {
    x[i] = 60 * i;
    y[i] = random(-10, 10);
    off1 += 0.002;
    curveVertex(x[i], y[i]);
  }
  curveVertex(x[nbPoints - 1], y[nbPoints - 1]);
  off2 += 0.001;
  endShape();
}
    
