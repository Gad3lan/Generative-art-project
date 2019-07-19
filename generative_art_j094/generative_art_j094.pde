ArrayList<Pattern> patterns;
int div;
int nb = 0;

void setup() {
  size(600, 600);
  pixelDensity(2);
  noFill();
}

void draw() {
  background(255);
  patterns = new ArrayList<Pattern>();
  div = int(random(2, 6));
  float xoff = random(10000);
  float yoff = random(10000);
  int res = int(random(10, 20));
  float size = random(height/(div+3), height/(div+1));
  for (int i = 0; i < div; i++) {
    for (int j = 0; j < div; j++) {
      patterns.add(new Pattern(map(i, 0, div-1, size, width-size), map(j, 0, div-1, size, height-size), size, res));
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
