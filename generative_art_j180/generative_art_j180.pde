PImage img;
PImage sorted;

void setup() {
  size(700, 700);
  randomSeed(int(random(10000)));
  img = loadImage("img.jpg");
  img.resize(width, height);
  noLoop();
  sorted = img.get();
  sorted.loadPixels();
  for (int i = 0; i < height-1; i++) {
    for (int j = 0; j < width; j++) {
        int start = j;
        int end = int(random(j, width));
        for (j = start; j < end; j++) {
          if (hue(sorted.pixels[i*width + j]) < hue(sorted.pixels[i*width + j+1])) {
            int temp = sorted.pixels[i*width + j];
            sorted.pixels[i*width + j] = sorted.pixels[i*width + j+1];
            sorted.pixels[i*width + j+1] = temp;
            j = start;
          }
        }
    }
    println(i);
  }
  sorted.updatePixels();
}

void draw() {
   image(sorted, 0, 0);
  save("art.jpg");
}
