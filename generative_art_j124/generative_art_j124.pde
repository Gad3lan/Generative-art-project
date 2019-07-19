int[][] grid;
int cols = 200;
int rows  = 200;
void setup() {
  size(700, 700);
  background(255);
  pixelDensity(2);
  noStroke();
  fill(0);
  grid = make2DArray(cols, rows);
  println(int(random(2)));
  frameRate(10);
}

int[][] make2DArray(int cols, int rows) {
  int[][] arr = new int[rows][cols];
  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < cols; j++) {
        if (random(1) < 0.005)
          arr[i][j] = 2;
        else 
          arr[i][j] = 0;
        //arr[i][j] = int(random(3));
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
      if (grid[y][x] == 2) sum++;
    }
  }
  if (grid[row][col] == 2)
    sum--;
  return sum;
}

int[][] update() {
  int[][] newg = new int[rows][cols];
  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < cols; j++) {
      int neighbors = neighbors(i, j);   
      if (grid[i][j] == 1)
        newg[i][j] = 0;
      else if (grid[i][j] == 2)
        newg[i][j] = 1;
      else if (neighbors == 2  && grid[i][j] == 0)
        newg[i][j] = 2;
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
      if (grid[i][j] == 1) {
        fill(120);
        rect(j * sx, i * sy, sx, sy);
      } else if (grid[i][j] == 2) {
        fill(0);
        rect(j * sx, i * sy, sx, sy);
      }
    }
  }
  grid = update();
}
