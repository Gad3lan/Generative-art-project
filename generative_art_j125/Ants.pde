class Ant {
  PVector pos;
  int dir;
  Ant (PVector position) {
    dir = int(random(4));
    pos = new PVector(position.x, position.y);
    //pos.set(position);
  }
  
  void run() {
    if (grid[int(pos.y)][int(pos.x)] == 1) {
      grid[int(pos.y)][int(pos.x)] = 0;
      dir++;
      if (dir > 3)
        dir = 0;
    } else {
      grid[int(pos.y)][int(pos.x)] = 1;
      dir--;
      if (dir < 0)
        dir = 3;
    }
    move();
  }
  
  void move() {
    if (dir == 0) {
      pos.x++;
      if (pos.x > cols-1)
        pos.x = 0;
    }
    else if (dir == 1) {
      pos.y++;
      if (pos.y > rows-1)
        pos.y = 0;
    }
    else if (dir == 2) {
      pos.x--;
      if (pos.x < 0)
        pos.x = cols-1;
    }
    else {
      pos.y--;
      if (pos.y < 0)
        pos.y = rows-1;
    }
  }
}
