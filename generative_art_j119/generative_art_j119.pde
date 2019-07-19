ArrayList<Pattern> patterns;
int nb = 0;
float value;
float r;

void setup() {
  size(700, 700);
  background(255);
  pixelDensity(2);
  noFill();
}

void draw() {
  background(255);
  value = random(0.2, 0.4);
  int div = int(random(2, 10));
  float size = (width-100)/(div);
  r = random(1);
  strokeWeight(size/2);
  patterns = new ArrayList<Pattern>();
  for (int i = 0; i < div; i++) {
    for (int j = 0; j < div; j++) {
      patterns.add(new Pattern(50 + i*size, 50 + j*size, size));
    }
  }
  for (Pattern p : patterns) {
    p.show();
  }
  if (nb < 20) {
    save("art" + nb + ".jpg");
    nb++;
  } else exit();
}
