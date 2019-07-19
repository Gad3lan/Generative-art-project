int maxLevel = 10;
int maxChildCount = 3;

int gid;
int nb = 0;
Planet topPlanet;
float alpha;
float hue;

void setup() {
  size(600, 600);
  pixelDensity(2);
  frameRate(200);
  colorMode(HSB, 255);
  boot();
}

void draw() {
  translate(width/2, height/2);
  movePlanet(topPlanet);
  
  alpha -= 0.5;
  if (alpha < 0) {
    save("art" + nb + ".jpg");
    nb++;
    if (nb > 19) exit();
    boot();
  }
}

void boot() {
  background(0, 0, 255);
  gid = 0;
  hue = random(55, 200);
  alpha = 255;
  topPlanet = new Planet(maxLevel);
  if (gid < 120)
    boot();
}

void movePlanet(Planet p) {
  p.rot += p.rotRate * map(p.level, 0, maxLevel, 1, 0.1);
  rotate(p.rot);
  translate(p.len, 0);
  
  /**if (p.id % 4 == 0) 
    stroke(hue, 200, 255, alpha);
  else if (p.id % 3 == alpha)
    stroke((hue + 40) % 255, 200, 255, alpha);
  else if (p.id % 2 == 0)
    stroke((hue + 127) % 255, 200, 255, alpha);
  else
    stroke((hue + 167) % 255, 200, 255, alpha);**/
    stroke(map(p.id % 4, 0, 3, (hue-55), (hue + 55)), 200, 200, alpha);
    
  float thickness = map(p.level, 0, maxLevel, 0.1, 5);
  float mult = map(alpha, 0, 255, 0, 2);
  strokeWeight(thickness * mult);
  point(0, 0);
  if (p.children.size() > 0) {
    for (int i = 0; i < p.children.size(); i++) {
      movePlanet(p.children.get(i));
    }
  }
}
