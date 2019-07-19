float x1 = random(-200, 200);

float xoff = random(10);
float yoff = random(10);

int x = 0;
int nb = 0;

float col;
float xadd = random(0.004, 0.012);
float yadd = random(0.004, 0.008);

void setup() {
  background(255);
  size(600, 600);
  pixelDensity(2);
  stroke(0);
  strokeWeight(0.1);
}

void draw() {
  xoff += xadd;
  yoff += yadd;
  translate(noise(xoff) * width, noise(yoff) * height);
  //translate(random(width), 0);
  //rotate(random(-10, 10));
  line(0, 0, x1, height);
  x++;
  if (x > 666) {
    save("artj02_05" + nb +".jpg");
    nb++;
    if (nb > 9) {
      exit();
    }
    x = 0;
    xadd = random(0.004, 0.012);
    yadd = random(0.004, 0.008);
    x1 = random(-200, 200);
    background(255);
  }
}
