int nb = 0;
int maxNb = 19;
int density = 2;
String pi;
int[] digits;
int index;
float hue;
int count[];
float mult;
float s;
int max;
float inc;

void setup() {
  size(600, 600);
  colorMode(HSB, 360, 100, 100);
  pixelDensity(2);
  strokeWeight(0.2);
  pi = loadStrings("pi-1million.txt")[0];
  String[] sdigits = pi.split(""); 
  digits = int(sdigits);
  noFill();
  boot();
}

void draw() {
  translate(width/2, height/2);
  for (int i = 0; i < max; i++) {
    int digit = digits[index];
    stroke((hue + digit*36)%360, 100, 100);
    int nextDigit = digits[++index];
    count[digit]++;
    float a1 = map(digit, 0, 10, 0, TWO_PI)+ count[digit]*inc;
    float a2 = map(nextDigit, 0, 10, 0, TWO_PI) + count[digit]*inc;
    if (abs(digit - nextDigit) != 5)
      bezier(s*cos(a1), s*sin(a1), mult*cos(a1), mult*sin(a1), mult*cos(a2), mult*sin(a2), s*cos(a2), s*sin(a2));
    else
      bezier(s*cos(a1), s*sin(a1), mult*cos(a1+0.5), mult*sin(a1+0.5), mult*cos(a2-0.5), mult*sin(a2-0.5), s*cos(a2), s*sin(a2)); 
  }
  saveImg();
}

void boot() {
  background(0);
  count = new int[10];
  index = int(random(0, 998000));
  mult = random(50, 150);
  hue = random(360);
  s = random(150, 275);
  max = int(random(1000, 1200));
  inc = TWO_PI/(max+random(250, 350));
}

void saveImg() {
  save("art" + nb + ".jpg");
  nb++;
  if (nb > maxNb) exit();
  boot();
}
