float a, b, c, d;
float X = -0.72;
float Y = -0.64;
int nb = 0;

FloatList tinkerbell(float x0, float y0, int iters) {
  float x = x0;
  float y = y0;
  FloatList l = new FloatList();
  l.append(map(x, -1.3, 0.5, 0, width));
  l.append(map(y, -1.75, 1, height, 0));
  
  for (int i = 0; i < iters; i++) {
    float xt = x;
    x = x*x - y*y + a*x + b*y;
    y = 2*xt*y + c*xt + d*y;
    
    l.append(map(x, -1.3, 0.5, 0, width));
    l.append(map(y, -1.75, 1, height, 0));
  }
  return l;
}

void setup() {
  size(600, 600);
  background(0);
  stroke(255);
  pixelDensity(2);
  strokeWeight(0.2);
  noFill();
}

void draw() {
  background(0);
  a = 0.9;//random(0.85, 0.95); //
  b = random(-0.55, -0.65);  //-0.6; //
  c = random(1.95, 2.05); //2.0; //
  d = 0.5; //random(0.45, 0.55); //
  FloatList A = tinkerbell(X, Y, 1000000);
  
  for (int i = 0; i < A.size(); i+=2) {
    point(A.get(i), A.get(i+1));
  } 
  if (nb < 20) {
    save("art" + nb + ".jpg");
    println("n°" + nb + " : Done !");
    nb++;
  } else {
    exit();
  }
}
