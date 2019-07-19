int cols;
int rows;

float[][] current;
float[][] previous;

float damping = 0.95;

float xoff = random(10000);
float yoff = random(10000);

void setup() {
  size(600, 600);
  pixelDensity(2);
  cols = width * 2;
  rows = height * 2;
  current = new float[cols][rows];
  previous = new float[cols][rows];
  previous[int(random(cols))][int(random(rows))] = 255;
}


void draw() {
  background(255);
  loadPixels();
  for (int i = 1; i < cols - 1; i++) {
    for (int j = 1; j < rows - 1; j++) {
      current[i][j] = (previous[i-1][j] + previous[i+1][j] + previous[i][j-1]
                     + previous[i][j+1]) / 2 - current[i][j];
      current[i][j] *= damping; 
      int index = i + j * cols;
      pixels[index] = color(255 - current[i][j] * 255);
    }
  }
  updatePixels();
  float[][] temp = previous;
  previous = current;
  current = temp;
  //previous[int(noise(xoff) * cols)][int(noise(yoff) * rows)] = 255;
  int drops = int(noise(xoff) * 5);
  for (int i = 0; i < drops; i++) {
    previous[int(random(cols))][int(random(rows))] = 255;
  }
  xoff += 0.01;
  //yoff += 0.01;
}
