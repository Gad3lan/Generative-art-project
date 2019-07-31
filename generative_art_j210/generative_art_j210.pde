void setup() {
  size(700, 700);
  pixelDensity(2);
  frameRate(3);
}

void draw() {
  for (int n = 0; n < 20; n++) {
    background(255);
    ArrayList<PVector> ctrs = new ArrayList<PVector>();
    FloatList sizes = new FloatList();
    noFill();
    for (int i = 0; i < 10; i++) {
      ctrs.add(new PVector(random(-width, 2*width), random(-height, 2*height)));
      sizes.append(random(width, 2*width));
      circle(ctrs.get(i).x, ctrs.get(i).y, sizes.get(i));
    }
    fill(255);
    for (int i = 0; i < 10; i++) {
      int nb = int(random(5, 10));
      for (int j = 0; j < nb; j++) {
        float a = random(TWO_PI);
        float dots = random(5, 20);
        circle(ctrs.get(i).x + sizes.get(i)/2*cos(a), ctrs.get(i).y + sizes.get(i)/2*sin(a), dots);
      }
    }
    save("art" + n + ".jpg");
  }
  exit();
}
