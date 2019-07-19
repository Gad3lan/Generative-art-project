Cell[][] grid;
Cell[][] prev;
int size = 15;
int startx, starty;
int xmin, xmax, ymin, ymax;

float dA = 0.5;
float dB = 0.25;
float feed = 0.072;
float k = 0.062;
float fr = 4;

void setup() {
  size(500, 500);
  frameRate(30);
  smooth();
  noFill();
  grid = new Cell[width][height];
  prev = new Cell[width][height];

  for (int i = 0; i < width; i++) {
    for (int j = 0; j < height; j ++) {
      float a = 1;
      float b = 0;
      grid[i][j] = new Cell(a, b);
      prev[i][j] = new Cell(a, b);
    }
  }

  for (int n = 0; n < 1; n++) {
    startx = width/2;
    starty = height/2;

    for (int i = startx-5; i < startx+5; i++) {
      for (int j = starty-5; j < starty+5; j ++) {
        float a = 0;
        float b = 1;
        grid[i][j] = new Cell(a, b);
        prev[i][j] = new Cell(a, b);
      }
    }
  }
  size = 30;
  xmin = constrain(startx-size, 1, width-1);
  xmax = constrain(startx+size, 1, width-1);
  ymin = constrain(starty-size, 1, height-1);
  ymax = constrain(starty+size, 1, height-1);
}

class Cell {
  float a;
  float b;

  Cell(float a_, float b_) {
    a = a_;
    b = b_;
  }
}


void update() {
  //if (frameCount%50 == 0) size++;
  boolean test = true;
  while (test && xmin > 1) {
    test = false;
    for (int i = ymin; i < ymax; i++) {
      if (prev[xmin][i].b > 0.001) {
        xmin = constrain(xmin-1, 1, width-1);
        test = true;
      }
    }
  }
  test = true;
  while (test && xmax < width-1) {
    test = false;
    for (int i = ymin; i < ymax; i++) {
      if (prev[xmax-1][i].b > 0.001) {
        xmax = constrain(xmax+1, 1, width-1);
        test = true;
      }
    }
  }
  test = true;
  while (test && ymin > 1) {
    test = false;
    for (int i = xmin; i < xmax; i++) {
      if (prev[i][ymin].b > 0.001) {
        test = true;
        ymin = constrain(ymin-1, 1, width-1);
      }
    }
  }
  test = true;
  while (test && ymax < height-1) {
    test = false;
    for (int i = xmin; i < xmax; i++) {
      if (prev[i][ymax-1].b > 0.001) {
        ymax = constrain(ymax+1, 1, width-1);
        test = true;
      }
    }
  }
  for (int i = xmin; i < xmax; i++) {
    for (int j = ymin; j < ymax; j ++) {
      Cell spot = prev[i][j];
      Cell newspot = grid[i][j];

      float a = spot.a;
      float b = spot.b;

      float laplaceA = 0;
      float laplaceAa = 0;
      float laplaceAb = 0;
      laplaceA += a*-1;
      laplaceAa += prev[i+1][j].a;
      laplaceAa += prev[i-1][j].a;
      laplaceAa += prev[i][j+1].a;
      laplaceAa += prev[i][j-1].a;
      laplaceAb += prev[i-1][j-1].a;
      laplaceAb += prev[i+1][j-1].a;
      laplaceAb += prev[i-1][j+1].a;
      laplaceAb += prev[i+1][j+1].a;
      laplaceA += laplaceAa*0.2 + laplaceAb*0.05;

      float laplaceB = 0;
      float laplaceBa = 0;
      float laplaceBb = 0;
      laplaceB += b*-1;
      laplaceBa += prev[i+1][j].b;
      laplaceBa += prev[i-1][j].b;
      laplaceBa += prev[i][j+1].b;
      laplaceBa += prev[i][j-1].b;
      laplaceBb += prev[i-1][j-1].b;
      laplaceBb += prev[i+1][j-1].b;
      laplaceBb += prev[i-1][j+1].b;
      laplaceBb += prev[i+1][j+1].b;
      laplaceB += laplaceBa*0.2 + laplaceBb*0.05;

      newspot.a = a + (dA*laplaceA - a*b*b + feed*(1-a))*1;
      newspot.b = b + (dB*laplaceB + a*b*b - (k+feed)*b)*1;

      newspot.a = constrain(newspot.a, 0, 1);
      newspot.b = constrain(newspot.b, 0, 1);
    }
  }
}

void swap() {
  /**Cell[][] temp = prev;
  prev = grid;
  grid = temp;**/
  grid = prev;
}

void draw() {
  //background(1);
  //println(frameRate);
  
  /**if (frameRate > 24)
    fr = constrain(fr+0.05, 1, 30);
  else if (frameRate < 24)
    fr = constrain(fr-0.05, 1, 30);
  println(fr);**/
  for (int i = 0; i < fr; i++) {
    update();
    swap();
  }

  loadPixels();
  for (int i = 1; i < width-1; i++) {
    for (int j = 1; j < height-1; j ++) {
      Cell spot = grid[i][j];
      float a = spot.a;
      float b = spot.b;
      int pos = i + j * width;
      pixels[pos] = color((a-b)*255);
    }
  }
  updatePixels();
  /**line(xmin, ymin, xmax, ymin);
  line(xmin, ymin, xmin, ymax);
  line(xmax, ymin, xmax, ymax);
  line(xmin, ymax, xmax, ymax);**/
}
