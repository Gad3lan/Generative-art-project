int nums;
int maxLife = 100;
int noiseScale = 200;
float speed = 0.17;
int fadeFrame = 0;

int top = 100;
int side = 100;
int inSq = 650;

int x = 0;
int nb = 0;
int seed;
ArrayList<Particle> particles;

float bgColor = 0;
float fColor = 255;

void setup() {
  size(750, 1500);
  nums = 75;
  smooth();
  background(bgColor);
  frameRate(200);
  pixelDensity(2);
  noStroke();
  top = 50;
  side = 50;
  boot();
}

void draw() {
  for (int x = 0; x < 1500; x++) {
    fadeFrame++;
    if (fadeFrame % 5 == 0) {
      blendMode(DIFFERENCE);
      fill(0.1);
      rect(0, 0, width, height);
      blendMode(SCREEN);
      fill(bgColor);
      rect(0, 0, width, height);
    }
    blendMode(BLEND);
    
    for (int i = 0; i < nums; i++) {
      int iterations = int(map(i, 0, nums, 10, 3));
      float radius = map(i, 0, nums, 1, 3);
      maxLife = int(map(i, 0, nums, 50, 20));
      particles.get(i).move(iterations);
      particles.get(i).checkEdge();
      int alpha = 255;
      float particle_heading = particles.get(i).vel.heading()/PI;
      if (particle_heading < 0) particle_heading *= -1;
      float fade_ratio = min(particles.get(i).life * 5 / maxLife, 1);
      fade_ratio = min((maxLife - particles.get(i).life) * 5 / maxLife, fade_ratio);
      fill(fColor, alpha*fade_ratio);
      particles.get(i).display(radius);
    }
  }
  save("art2" + nb + ".jpg");
  println(nb);
  nb ++;
  if (nb > 9) exit();
  boot();
}

void boot() {
  background(bgColor);
  seed = int(random(10000));
  noiseSeed(seed);
  particles = new ArrayList<Particle>();
  for (int i = 0; i < nums; i++) {
    particles.add(new Particle());
  }
}
  
