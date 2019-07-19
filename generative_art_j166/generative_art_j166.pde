PImage img;
PImage sorted;

void setup() {
  size(1400, 1400);
  img = loadImage("img.jpg");
  img.resize(width, height);
  noLoop();
  sorted = img.get();
  sorted.loadPixels();
  for (int i = 0; i < height-1; i++) {
    for (int j = 0; j < width; j++) {
      if (random(1) > 0.2); {
        int start = int(random(j, width));
        int end = int(random(start, width-1));
        for (j = start; j < end; j++) {
          if (brightness(sorted.pixels[i*width + j]) < brightness(sorted.pixels[i*width + j+1])) {
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
