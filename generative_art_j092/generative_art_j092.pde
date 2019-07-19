ArrayList<Pattern> patterns;
int nb = 0;

void setup() {
  size(600, 600);
  background(255);
  strokeWeight(2);
  pixelDensity(2);
  noFill();
}

void draw() {
  background(255);
  int div = int(random(4, 20));
  float size = (width-100)/(div);
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
