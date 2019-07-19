ArrayList<Pattern> patterns;
int div;
int nb = 0;

void setup() {
  size(600, 600);
  pixelDensity(2);
  noFill();
  strokeWeight(1);
  rectMode(CENTER);
}

void draw() {
  background(255);
  patterns = new ArrayList<Pattern>();
  div = int(random(2, 5));
  int n = int(random(10, 20));
  float size = random(height/(div+2), height/(div+1));
  float off = random(size/(n*2));
  for (int i = 0; i < div; i++) {
    for (int j = 0; j < div; j++) {
      patterns.add(new Pattern(map(i, 0, div-1, size, width-size), map(j, 0, div-1, size, height-size), n, size, off));
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
