ArrayList<Pattern> patterns;
int nb = 0;
float value;
float r;

void setup() {
  size(700, 700);
  background(255);
  pixelDensity(2);
  strokeWeight(.5);
  noFill();
}

void draw() {
  background(255);
  value = random(0.2, 0.4);
  int div = int(random(2, 8));
  float size = random((width-100)/(div+2), (width-100)/(div+1));
  r = random(1);
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
