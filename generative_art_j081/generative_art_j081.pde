int nb = 0;
int maxNb = 19;
int density = 2;
float res, mult;
float a, b;

void setup() {
  size(600, 600);
  pixelDensity(density);
  colorMode(HSB, 360, 100, 100, 100);
  strokeWeight(0.2);
  stroke(0, 0, 100);
  noFill();
  boot();
}

void draw() {
  translate(width/2, height/2);
  for (float t = 0; t < TWO_PI; t+= TWO_PI/res) {
    rotate(TWO_PI/res);
    beginShape();
    float x = 7*cos(0)*(sin(0)/(1+pow(2, pow(cos(0), 2)))) * mult * cos(0);
    float y = 7*(sin(0)/(1+pow(2, pow(cos(0), 2)))) * mult * sin(0);
    curveVertex(x, y);
    for (float i = -3; i <= 3; i+=1/res) {
      x = 7*sin(a*i)*(cos(a*i)/(1+pow(2, pow(sin(b*i), 2)))) * mult * sin(i);
      y = 7*(cos(a*i)/(sin(b*i)*pow(2, pow(cos(b*i), 2)))) * mult * cos(i);
      curveVertex(x, y);
    }
    curveVertex(x, y);
    endShape(CLOSE);
  }
  saveImg();
}

void boot() {
  background(0, 0, 0);
  res = int(random(40, 75));
  a = random(0.5, 1.5);
  b = random(1, 3);
  mult = random(50, 100);
}

void saveImg() {
  save("art" + nb + ".jpg");
  nb++;
  if (nb > maxNb) exit();
  boot();
}
