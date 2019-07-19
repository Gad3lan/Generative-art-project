PImage img;
ArrayList<px> pxs;
int cellsize = 4;
int cols, rows;
float mult;

void setup() {
  size(600, 600, P3D);
  pixelDensity(2);
  img = loadImage("img.jpg");
  img.resize(600, 600);
  cols = img.width / cellsize;
  rows = img.height / cellsize;
  noStroke();
  rectMode(CENTER);
  pxs = new ArrayList<px>();
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      int x = i*cellsize + cellsize/2;
      int y = j*cellsize + cellsize/2;
      int loc = x + y*img.width;
      color c = img.pixels[loc];
      if (brightness(img.pixels[loc]) > 50)
        pxs.add(new px(x, y, loc, c));
    }
  }
  println(pxs.size());
}

class px {
  int x, y;
  float s;
  int loc;
  color c;
  px(int _x, int _y, int _loc, color _c) {
    x = _x;
    y = _y;
    c = _c;
    loc = _loc;
    s = cellsize/2;
  }
  
  void move() {
    fill(c);
    //if (random(1) < .1)
      s+=0.1;
    circle(x, y, s);
  }
}

void draw() {
  //println(frameRate);
  background(0);
  for (px p : pxs) {
    p.move();
  }
}
