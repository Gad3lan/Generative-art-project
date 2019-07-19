PImage img;
PImage sorted;

void setup() {
  size(1400, 1400);
  img = loadImage("img.JPG");
  img.resize(width, height);
  noLoop();
  sorted = img.get();
  sorted.loadPixels();
  for (int i = 0; i < height-1; i++) {
    for (int j = 0; j < width; j++) {
      if (hue(img.pixels[i*width + j]) < 100) {
        int start = j;
        while (j+1 < width &&hue(img.pixels[i*width + j+1]) < 100) {
          j++;
        }
        int end = j;
        for (j = start; j < end; j++) {
          if (hue(sorted.pixels[i*width + j]) < hue(sorted.pixels[i*width + j+1])) {
            int temp = sorted.pixels[i*width + j];
            sorted.pixels[i*width + j] = sorted.pixels[i*width + j+1];
            sorted.pixels[i*width + j+1] = temp;
            j = start;
          }
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
