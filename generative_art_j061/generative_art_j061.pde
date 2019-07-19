int nb = 0;
int maxNb = 19;
int density = 2;
String phi;
int[] digits;
int max, index;
float s, inc, div;
int[] count;

void setup() {
	size(1200, 1200);
	pixelDensity(density);
	colorMode(HSB, 360, 100, 100, 100);
	phi = loadStrings("phi-1million.txt")[0];
	digits = int(phi.split(""));
	boot();
}

void draw() {
	translate(width/2, height/2);
	for (int i = 0; i < max; i++) {
		int digit = digits[index];
		count[digit]++;
		int nextDigit = digits[++index];
		float a1 = map(digit, 0, 10, 0, TWO_PI) + (i/div)*inc*count[digit];
		float a2 = map(nextDigit, 0, 10, 0, TWO_PI) + (i/div)*inc*count[nextDigit];
		line(s*cos(a1), s*sin(a1), s*cos(a2), s*sin(a2));
	}
	saveImg();
}

void boot() {
  println("Boot: " + nb);
	background(0);
	stroke(0, 0, 100);
	count = new int[10];
	strokeWeight(random(0.1, 0.2));
	div = 2000;//random(300, 510);
	max = 2*int(random(1500, 3000));
	inc = random(0.1);
	index = int(random(0, 989999));
	s = random(275, 500);
}

void saveImg() {
	save("art" + nb + ".jpg");
	nb++;
	if (nb > maxNb) exit();
	boot();
}
