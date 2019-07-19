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

public class generative_art_j061 extends PApplet {

int nb = 0;
int maxNb = 19;
int density = 2;
String phi;
int[] digits;
int max, index;
float s, inc, div;
int[] count;

public void setup() {
	
	
	colorMode(HSB, 360, 100, 100, 100);
	phi = loadStrings("phi-1million.txt")[0];
	digits = PApplet.parseInt(phi.split(""));
	boot();
}

public void draw() {
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

public void boot() {
	background(0);
	stroke(0, 0, 100);
	count = new int[10];
	strokeWeight(random(0.1f, 0.2f));
	div = random(510, 300);
	max = PApplet.parseInt(random(1500, 3000));
	inc = random(0.1f);
	index = PApplet.parseInt(random(0, 997500));
	s = random(175, 275);
}

public void saveImg() {
	save("art" + nb + ".jpg");
	nb++;
	if (nb > maxNb) exit();
	boot();
}
  public void settings() { 	size(600, 600); 	pixelDensity(density); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "generative_art_j061" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
