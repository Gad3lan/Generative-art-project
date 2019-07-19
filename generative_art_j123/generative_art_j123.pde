ArrayList<IntList> generations;
IntList generation;
int gen;
int cells;
int cellSize = 5;

void setup() {
  size(700, 700);
  frameRate(30);
  noStroke();
  fill(0);
  generations = new ArrayList<IntList>();
  generation = new IntList();
  gen = 0;
  cells = 5;
  for (int i = 0; i < cells; i++) {
    if (i == 2)
      generation.append(1);
    else
      generation.append(0);
  }
  generations.add(generation);
}

void draw() {
  background(255);
  for (int i = 0; i < generations.size(); i++) {
    for (int j = 0; j < generations.get(i).size(); j++) {
      if (generations.get(i).get(j) == 1) {
        int origin = width/2 - (generations.get(i).size()*cellSize)/2;
        square(origin+j*cellSize, (height-frameCount)+i*cellSize, cellSize);
      }
    }
  }
  if(frameCount%cellSize == 0) {
    gen++;
    cells += 2;
    generation = new IntList();
    generation.append(0);
    generation.append(0);
    for (int i = 2; i < cells - 2; i++) {
      if (    (generations.get(gen-1).get(i-2) == 1 && generations.get(gen-1).get(i-1) == 0 && generations.get(gen-1).get(i) == 0)
           || (generations.get(gen-1).get(i-2) == 0 && generations.get(gen-1).get(i-1) == 1 && generations.get(gen-1).get(i) == 1)
           || (generations.get(gen-1).get(i-2) == 0 && generations.get(gen-1).get(i-1) == 1 && generations.get(gen-1).get(i) == 0)
           || (generations.get(gen-1).get(i-2) == 0 && generations.get(gen-1).get(i-1) == 0 && generations.get(gen-1).get(i) == 1))
        generation.append(1);
      else
        generation.append(0);
    }
    generation.append(0);
    generation.append(0);
    generations.add(generation);
  }
}
