ArrayList<Pattern> patterns;
int nb = 0;

void setup() {
  size(600, 600);
  background(255);
  strokeWeight(2);
  noStroke();
  pixelDensity(2);
  fill(0);
}

void draw() {
  background(255);
  int div = int(random(2, 10));
    float size = (width-100)/(div);
  patterns = new ArrayList<Pattern>();
  for (int i = 0; i < div; i++) {
    for (int j = 0; j < div; j++) {
      patterns.add(new Pattern(50 + i*size, 50 + j*size, size, i == div-1, j==div-1));
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
