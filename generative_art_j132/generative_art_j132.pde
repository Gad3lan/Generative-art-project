int[][] grid;
int[][] newg;
int cols = 200;
int rows  = 200;

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
  B.append(3);
  S.append(2);
  S.append(3);
  println('B', B, "/S", S);
}

int[][] make2DArray(int cols, int rows) {
  int[][] arr = new int[rows][cols];
  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < cols; j++) {
      if (random(1) < 0.3) {
        arr[i][j] = 1;
      } else {
        arr[i][j] = 0;
      }
    }
  }
  return arr;
}

int diff(int row, int col) {
  int sum = 0;
  for (int i = -1; i < 2; i++) {
    for (int j = -1; j < 2; j++) {
      int x = (col + i + cols) % cols;
      int y = (row + j + rows) % rows;
      sum += grid[y][x];
      sum -= newg[y][x];
    }
  }
  return sum;
}

int neighbors(int row, int col, int[][] grid) {
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

void update() {
  newg = new int[rows][cols];
  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < cols; j++) {
      int neighbors = neighbors(i, j, grid);   
      if (brule(i, j, neighbors))
        newg[i][j] = 1;
      else if (srule(i, j, neighbors))
        newg[i][j] = 1;
      else
        newg[i][j] = 0;
    }
  }
}

void draw() {
  fill(255, 255);
  update();
  square(0, 0, width);
  float sx = float(width)/cols;
  float sy = float(height)/rows;
  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < cols; j++) {
      int d = diff(i, j);
      if (d < 0) {
        fill(0, 0, map(abs(d), 1, 3, 0, 255));
        rect(j * sx, i * sy, sx, sy);
      } else if (d > 0) {
        fill(map(d, 1, 5, 0, 255), 0, 0);
        rect(j * sx, i * sy, sx, sy);
      }
      //if (newg[i][j] == 1) {
        //fill(0);
        //rect(j * sx, i * sy, sx, sy);
      //}
    }
  }
  grid = newg;
}
