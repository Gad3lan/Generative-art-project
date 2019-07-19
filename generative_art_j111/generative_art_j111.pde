ArrayList<Pattern> patterns;
int nb = 0;

void setup() {
  size(600, 600);
  background(255);
  strokeWeight(1);
  pixelDensity(2);
  noFill();
}

void draw() {
  background(255);
  int div = int(random(2, 15));
  float size = random((width-100)/(div+1), (width-100)/(div+0.5));
  patterns = new ArrayList<Pattern>();
  for (int i = 0; i < div; i++) {
    for (int j = 0; j < div; j++) {
      patterns.add(new Pattern(map(i, 0, div-1, size, width-size), map(j, 0, div-1, size, width-size), size));
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
