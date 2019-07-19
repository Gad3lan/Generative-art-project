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

public class generative_art_j060 extends PApplet {

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

public void setup() {
  
  colorMode(HSB, 360, 100, 100);
  
  strokeWeight(0.2f);
  pi = loadStrings("pi-1million.txt")[0];
  String[] sdigits = pi.split(""); 
  digits = PApplet.parseInt(sdigits);
  noFill();
  boot();
}

public void draw() {
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
      bezier(s*cos(a1), s*sin(a1), mult*cos(a1+0.5f), mult*sin(a1+0.5f), mult*cos(a2-0.5f), mult*sin(a2-0.5f), s*cos(a2), s*sin(a2)); 
  }
  saveImg();
}

public void boot() {
  background(0);
  count = new int[10];
  index = PApplet.parseInt(random(0, 999500));
  mult = random(50, 150);
  hue = random(360);
  s = random(150, 275);
  max = PApplet.parseInt(random(1000, 1200));
  inc = TWO_PI/(max+random(250, 350));
}

public void saveImg() {
  save("art" + nb + ".jpg");
  nb++;
  if (nb > maxNb) exit();
  boot();
}
  public void settings() {  size(600, 600);  pixelDensity(2); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "generative_art_j060" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
