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
      if (random(1) < .5)
        arr[i][j] = int(random(1, 5));
    }
  }
  return arr;
}

int[] neighbors(int row, int col, int[][] grid) {
  int[] sum = new int[5];
  for (int i = -1; i < 2; i++) {
    for (int j = -1; j < 2; j++) {
      int x = (col + i + cols) % cols;
      int y = (row + j + rows) % rows;
      if (grid[y][x] != 0)
        sum[grid[y][x]]++;
    }
  }
  if (grid[row][col] != 0)
    sum[grid[row][col]]--;
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
    if (neighbors == S.get(s) &&  grid[i][j] != 0)
      return true;
  }
  return false;
}

int[][] update() {
  newg = new int[rows][cols];
  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < cols; j++) {
      int[] neighbors = neighbors(i, j, grid);
      if (brule(i, j, neighbors[1] + neighbors[2] + neighbors[3] + neighbors[4])) {
        if (neighbors[1] == 0 && neighbors[2] != 0 && neighbors[3] != 0 && neighbors[4] != 0) {
          newg[i][j] = 1;
        }
        else if (neighbors[1] > 0 && neighbors[2] == 0 && neighbors[3] > 0 && neighbors[4] != 0) {
          newg[i][j] = 2;
        }
        else if (neighbors[1] != 0 && neighbors[2] != 0&&neighbors[3] == 0&&neighbors[4] != 0) {
          newg[i][j] = 3;
        }
        else if (neighbors[1] != 0 && neighbors[2] != 0 && neighbors[3] != 0 && neighbors[4] == 0) {
          newg[i][j] = 4;
        }
        else if (neighbors[1] > neighbors[2] && neighbors[1] > neighbors[3] && neighbors[1] > neighbors[4]) {
          newg[i][j] = 1;
        }
        else if (neighbors[2] > neighbors[1] && neighbors[2] > neighbors[3] && neighbors[2] > neighbors[4]) {
          newg[i][j] = 2;
        }
        else if (neighbors[3] > neighbors[2] && neighbors[3] > neighbors[1] && neighbors[3] > neighbors[4]) {
          newg[i][j] = 3;
        }
        else if (neighbors[4] > neighbors[2] && neighbors[4] > neighbors[3] && neighbors[4] > neighbors[1]) {
          newg[i][j] = 4;
        } else {
          newg[i][j] = int(random(2, 5));
        }
      }
      else if (srule(i, j, neighbors[1] + neighbors[2] + neighbors[3] + neighbors[4]))
        newg[i][j] = grid[i][j];
      else
        newg[i][j] = 0;
    }
  }
  return newg;
}

void draw() {
  fill(#F2E6D8);
  square(0, 0, width);
  float sx = float(width)/cols;
  float sy = float(height)/rows;
  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < cols; j++) {
      if (grid[i][j] == 1) {
        fill(#0A1240);
        rect(j * sx, i * sy, sx, sy, sx/4);
      } else if (grid[i][j] == 2) {
        fill(#0367A6);
        rect(j * sx, i * sy, sx, sy, sx/4);
      } else if (grid[i][j] == 3) {
        fill(#03A688);
        rect(j * sx, i * sy, sx, sy, sx/4);
      } else if (grid[i][j] == 4) {
        fill(#F26363);
        rect(j * sx, i * sy, sx, sy, sx/4);
      }
    }
  }
  grid = update();
  
}
