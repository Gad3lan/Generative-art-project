int[][] grid;
int cols = 400;
int rows  = 400;

IntList B;
IntList S;

void setup() {
  size(700, 700);
  background(255);
  pixelDensity(2);
  noStroke();
  fill(0);
  grid = make2DArray(cols, rows);
  frameRate(10);
  B = new IntList();
  S = new IntList();
  B.append(2);
  B.append(3);
  B.append(4);
  B.append(5);
  S.append(7);
  S.append(5);
  println('B', B, "/S", S);
}

int[][] make2DArray(int cols, int rows) {
  int[][] arr = new int[rows][cols];
  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < cols; j++) {
      if (random(1) < 0.001) {
        arr[i][j] = 1;
      } else {
        arr[i][j] = 0;
      }
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
  sum  -= grid[row][col];
  return sum;
}

boolean brule(int i, int j, int neighbors) {
  for (int b = 0; b < B.size(); b++) {
    if (neighbors == B.get(b) &&  grid[i][j] == 0)
      return true;
  }
  return false;
}

boolean srule(int i, int j, int neighbors) {
  for (int s = 0; s < S.size(); s++) {
    if (neighbors == S.get(s) &&  grid[i][j] == 1)
      return true;
  }
  return false;
}

int[][] update() {
  int[][] newg = new int[rows][cols];
  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < cols; j++) {
      int neighbors = neighbors(i, j);   
      if (brule(i, j, neighbors))
        newg[i][j] = 1;
      else if (srule(i, j, neighbors))
        newg[i][j] = 1;
      else
        newg[i][j] = 0;
    }
  }
  return newg;
}

void draw() {
  fill(255, 150);
  square(0, 0, width);
  float sx = float(width)/cols;
  float sy = float(height)/rows;
  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < cols; j++) {
      if (grid[i][j] == 1) {
        fill(0);
        rect(j * sx, i * sy, sx, sy);
      }
    }
  }
  grid = update();
}
