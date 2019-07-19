ArrayList<Pattern> patterns;
int div;
int nb = 0;
color c;
float r;
float h, s, b;
color c1, c2, c3;

void setup() {
  size(600, 600);
  colorMode(HSB, 360, 100, 100, 100);
  pixelDensity(2);
  noFill();
  noStroke();
  rectMode(CENTER);
}

void draw() {
  background(0, 0, 100);
  r = random(1);
  h = random(360);
  s = random(60, 80);
  b = random(90, 100);
  c1 = color(h, s, b);
  c3 = color((h+25)%360, s-10, b-30);
  c2 = lerpColor(c1, c3, .5);
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
