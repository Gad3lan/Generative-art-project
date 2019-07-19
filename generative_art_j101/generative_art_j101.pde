ArrayList<Pattern> patterns;
int nb = 0;
float r, r2;
int n;

void setup() {
  size(600, 600);
  background(255);
  strokeWeight(1.2);
  pixelDensity(2);
  noFill();
}

void draw() {
  background(255);
  int div = int(random(2, 10));
  float size = random(height/(div+3), height/(div+1));
  patterns = new ArrayList<Pattern>();
  int d = int(random(15, 30));
  for (int i = 0; i < div; i++) {
    for (int j = 0; j < div; j++) {
      patterns.add(new Pattern(map(i, 0, div-1, size, width-size), map(j, 0, div-1, size, height-size), size, d));
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
