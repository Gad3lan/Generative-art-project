PImage img;
PImage sorted;

void setup() {
  size(2100, 1400);
  noLoop();
  img=loadImage("IMG_2324.JPG");
  sorted = img.get();
  sorted.loadPixels();
  for (int i = 0; i < width; i++) {
    for (int j = 0; j < height-1; j++) {
      float b = blue(sorted.pixels[j*width + i]);
      float r = red(sorted.pixels[j*width + i]);
      if (b <= r+10) {
        int start = j;
        int c = 0;
        do {
          b = blue(sorted.pixels[(j)*width + i]);
          r = red(sorted.pixels[(j)*width + i]);
          c++;
          j++;
        } while(j < height && b <= r+10);
        int end = int(random(c))+start;
        for (j = start; j < end-1; j++) {
          if (brightness(sorted.pixels[j*width + i]) > brightness(sorted.pixels[(j+1)*width + i])) {
            int temp = sorted.pixels[j*width + i];
            sorted.pixels[j*width + i] = sorted.pixels[(j+1)*width + i];
            sorted.pixels[(j+1)*width + i] = temp;
            j = start;
          }
        }
      } else {
        sorted.pixels[j*width + i] = color(5);
      }
    }
    print("Col", i, "sorted");
    println();
  }
  sorted.updatePixels();
}


void draw() {
  image(sorted, 0, 0);
  save("art.jpg");
}
