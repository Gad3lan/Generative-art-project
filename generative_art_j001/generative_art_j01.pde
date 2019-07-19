int x = 0;

void setup() {
  size(600, 600);
  pixelDensity(2);
}

void draw() {
  background(255);
  float x1 = random(height);
  float x2 = random(height);
  float col = 50;
  for (int i = 0; i < 10000; i++) {
    line(0, x1, width, x2);
    stroke(col + random(-50, 50));
    strokeWeight(0.1);
    x1 += random(-50, 50);
    x2 += random(-50, 50);
  }
  line(0, random(height), width, random(height));
  String name = "art12"+x+".jpg";
  save(name);
  x++;
  if (x > 9) {
    exit();
  }
}
    
