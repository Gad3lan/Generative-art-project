import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class generative_art_j062 extends PApplet {

int nb = 0;
int maxNb = 19;
int density = 2;
float s;
int mult, occ;

public void setup() {
	
	
	colorMode(HSB, 360, 100, 100, 100);
	noFill();
	boot();
}

public void draw() {
	translate(width/2, height/2);
	strokeWeight(1);
	circle(0, 0, s*2);
	strokeWeight(0.2f);
	for (int i = 0; i < occ; i++) {
		int digit = (i * mult)%occ;
		float a1 = map(i, 0, occ, 0, TWO_PI);
		float a2 = map(digit, 0, occ, 0, TWO_PI);
		line(s*cos(a1), s*sin(a1), s*cos(a2), s*sin(a2));
	}
	saveImg();
}

public void boot() {
	background(0, 0, 100);
	s = random(150, 300);
	mult = PApplet.parseInt(random(2, 50));
	occ = PApplet.parseInt(random(400, 600));
}

public void saveImg() {
	save("art" + nb + ".jpg");
	nb++;
	if (nb > maxNb) exit();
	boot();
}
  public void settings() { 	size(600, 600); 	pixelDensity(density); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "generative_art_j062" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
