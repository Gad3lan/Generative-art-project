int[][] grid;
int cols = 150;
int rows  = 150;
void setup() {
  size(700, 700);
  background(255);
  pixelDensity(2);
  //noStroke();
  fill(0);
  grid = make2DArray(cols, rows);
  println(int(random(2)));
  frameRate(10);
}

int[][] make2DArray(int cols, int rows) {
  int[][] arr = new int[rows][cols];
  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < cols; j++) {
        arr[i][j] = int(random(2));
    }
  }
  return arr;
}

int neighbors(int row, int col) {
  int sum = 0;
  for (int i = -1; i < 2; i++) {
    for (int j = -1; j < 2; j++) {
      int x = (col + i + cols) % cols;
      int y = (row + j + rows) % rows;
      sum += grid[y][x];
    }
  }
  sum -= grid[row][col];
  return sum;
}

int[][] update() {
  int[][] newg = new int[rows][cols];
  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < cols; j++) {
      int neighbors = neighbors(i, j);   
      if (neighbors < 2)
        newg[i][j] = 0;
      else if (neighbors > 3)
        newg[i][j] = 0;
      else if ((neighbors == 3 || neighbors == 6) && grid[i][j] == 0)
        newg[i][j] = 1;
      else if ((neighbors == 2 || neighbors == 3) && grid[i][j] == 1)
        newg[i][j] = 1;
    }
  }
  return newg;
}

void draw() {
  background(255);
  float sx = float(width)/cols;
  float sy = float(height)/rows;
  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < cols; j++) {
      if (grid[i][j] == 1)
        rect(j * sx, i * sy, sx, sy);
    }
  }
  grid = update();
}
