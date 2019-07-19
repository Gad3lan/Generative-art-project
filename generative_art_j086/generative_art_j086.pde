int nb = 0;
void setup() {
  size(600, 600);
  background(255);
  pixelDensity(2);
}

void draw() {
  background(255);
  float a = floor(random(1, 10));
  float b = floor(random(2, 10));
  float c = floor(random(10, 40));
  float s = random(10, 60);
  translate(width/2, height/2);
  beginShape();
  for (float i = 0; i < 6*TWO_PI; i+= 0.1) {
    float r = exp(sin(i)) - a*cos(b*i) + pow(sin((a*i - PI)/c), 5);
    curveVertex(r*cos(i)*s, r*sin(i)*s);
  }
  endShape();
  if (nb < 20) {
    save("art" + nb + ".jpg");
    nb++;
  } else exit();
}
