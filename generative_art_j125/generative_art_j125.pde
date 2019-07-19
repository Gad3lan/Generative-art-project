int[][] grid;
int cols = 350;
int rows  = 350;
ArrayList<Ant> ants;


void setup() {
  size(700, 700);
  background(255);
  pixelDensity(2);
  noStroke();
  fill(0);
  ants = new ArrayList<Ant>();
  int nb = int(random(1, 6));
  for (int i = 0; i < nb; i++) {
    ants.add(new Ant(new PVector(int(random(cols)), int(random(rows)))));
  }
  grid = make2DArray(cols, rows);
  frameRate(30);
}

int[][] make2DArray(int cols, int rows) {
  int[][] arr = new int[rows][cols];
  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < cols; j++) {
        arr[i][j] = 0;
    }
  }
  return arr;
}

void draw() {
  background(255);
  float sx = float(width)/float(cols);
  float sy = float(height)/float(rows);
  for (int i = 0; i < 100; i++) {
    for (Ant ant : ants) {
      ant.run();
    }
  }
  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < cols; j++) {
      if (grid[i][j] == 1)
        rect(j * sx, i * sy, sx, sy);
    }
  }
}
