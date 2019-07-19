ArrayList<Pattern> patterns;
int div;
int nb = 0;

void setup() {
  size(600, 600);
  pixelDensity(2);
  noFill();
  strokeWeight(1.2);
  frameRate(2);
}

void draw() {
  background(255);
  patterns = new ArrayList<Pattern>();
  div = int(random(2, 5));
  float size = random(height/(div+3), height/(div+1));
  for (int i = 0; i < div; i++) {
    for (int j = 0; j < div; j++) {
      patterns.add(new Pattern(map(i, 0, div-1, size, width-size), map(j, 0, div-1, size, height-size), size));
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
