class FlowField {
  PVector[][] field;
  float[][] theta;
  int cols, rows;
  int resolution;
  
  FlowField(int r) {
    resolution = r;
    cols = width / r;
    rows = height / r;
    field = new PVector[cols][rows];
    theta = new float[cols][rows];
    init();
  }
  
  void init() {
    noiseSeed(int(random(10000)));
    randomSeed(int(random(10000)));
    float xoff = 0;
    for (int i = 0; i < cols; i++) {
      float yoff = 0;
      for (int j = 0; j < rows; j++) {
        theta[i][j] = map(noise(xoff, yoff), 0, 1, 0, TWO_PI);
        field[i][j] = new PVector(cos(theta[i][j]), sin(theta[i][j]));
        yoff += 0.2;
      }
      xoff += 0.2;
    }
  }
  
  void display() {
    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        drawVector(field[i][j], i*resolution, j*resolution, resolution+2);
      }
    }
  }
  
  void drawVector(PVector v, float x, float y, float scaly) {
    pushMatrix();
    float arrowSize = 4;
    translate(x, y);
    stroke(255, 100);
    rotate(v.heading2D());
    float len = v.mag()*scaly;
    line(0, 0, len, 0);
    popMatrix();
  }
  
  PVector lookup(PVector lookup) {
    int column = int(constrain(lookup.x/resolution, 0, cols-1));
    int row = int(constrain(lookup.y/resolution, 0, rows-1));
    return field[column][row].get();
  }
  
  void run() {
    float xoff = 0;
    for (int i = 0; i < cols; i++) {
      float yoff = 0;
      for (int j = 0; j < rows; j++) {
        theta[i][j] += map(noise(xoff, yoff), 0, 1, -1, 1) * random(0.001, 0.005);
        field[i][j] = new PVector(cos(theta[i][j]), sin(theta[i][j]));
        yoff += 0.0001;
      }
      xoff += 0.0001;
    }
  }
}
