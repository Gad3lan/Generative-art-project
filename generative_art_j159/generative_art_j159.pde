PImage img;
PImage sorted;

void setup() {
  size(1400, 1400);
  img = loadImage("img.png");
  noLoop();
  sorted = img.get();
  sorted.loadPixels();
  for (int i = 0; i < width; i++) {
    for (int j = 0; j < 669; j++) {
      int start = j;
      int end = 669;//int(random(j, height));
      for (j = start; j < end; j++) {
        if (brightness(sorted.pixels[j*width + i]) > brightness(sorted.pixels[(j+1)*width + i])) {
          int temp = sorted.pixels[j*width + i];
          sorted.pixels[j*width + i] = sorted.pixels[(j+1)*width + i];
          sorted.pixels[(j+1)*width + i] = temp;
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
