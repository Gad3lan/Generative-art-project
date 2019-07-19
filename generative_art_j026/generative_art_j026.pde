int nums;
int maxLife = 50;
int noiseScale = 200;
float speed = 0.2;
int fadeFrame = 0;

int top = 100;
int side = 100;
int inSq = 500;

int x = 0;
int nb = 2;
int seed;
ArrayList<Particle> particles;

float bgColor = 255;
float fColor = 0.1;

void setup() {
  size(600, 600);
  nums = 100;
  smooth();
  background(bgColor);
  frameRate(200);
  pixelDensity(2);
  noStroke();
  top = (height - inSq)/2;
  side = (width - inSq)/2;
  boot();
}

void draw() {
  fadeFrame++;
  if (fadeFrame % 5 == 0) {
    /**blendMode(DIFFERENCE);
    fill(1);
    rect(0, 0, width, height);**/
    blendMode(MULTIPLY);
    fill(255);
    rect(0, 0, width, height);
  }
  blendMode(BLEND);
  
  for (int i = 0; i < nums; i++) {
    int iterations = int(map(i, 0, nums, 5, 1));
    float radius = map(i, 0, nums, 1, 3);
    maxLife = int(map(i, 0, nums, 20, 10));
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
  
  x++;
  if (x > 5000) {
    save("art2" + nb + ".jpg");
    x = 0;
    println(nb);
    nb ++;
    if (nb > 9) exit();
    boot();
  }
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
  
