int nb = 0;
int maxNb = 19;
int density = 2;
float s;
int mult, occ;

void setup() {
	size(600, 600);
	pixelDensity(density);
	colorMode(HSB, 360, 100, 100, 100);
	noFill();
	boot();
}

void draw() {
	translate(width/2, height/2);
	strokeWeight(1);
	circle(0, 0, s*2);
	strokeWeight(0.2);
	for (int i = 0; i < occ; i++) {
		int digit = (i * mult)%occ;
		float a1 = map(i, 0, occ, 0, TWO_PI);
		float a2 = map(digit, 0, occ, 0, TWO_PI);
		line(s*cos(a1), s*sin(a1), s*cos(a2), s*sin(a2));
	}
	saveImg();
}

void boot() {
	background(0, 0, 100);
	s = random(150, 300);
	mult = int(random(2, 50));
	occ = int(random(400, 600));
}

void saveImg() {
	save("art" + nb + ".jpg");
	nb++;
	if (nb > maxNb) exit();
	boot();
}