ArrayList<Wave> waves;
int wavesNum = 60;
float hue;
float max;
int nb = 0;

void setup() {
  size(600, 600);
  pixelDensity(2);
  colorMode(HSB, 360, 100, 100, 100);
  noStroke();
  boot();
}

void draw() {
  translate(width, 0);
  rotate(PI/2);
  for (Wave w : waves) {
    w.display();
  }
  if (frameCount > 150) {
    save("art" + nb + ".jpg");
    nb++;
    if (nb > 19) exit();
    boot();
  }
}

void boot() {
  noiseSeed(int(random(10000)));
  background(360);
  hue = random(360);
  max = random(2, 6);
  waves = new ArrayList<Wave>();
  for (int i = 0; i < wavesNum; i++) {
    waves.add(new Wave(i));
  }
  frameCount = 0;
}
