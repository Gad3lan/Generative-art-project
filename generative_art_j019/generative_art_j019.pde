ArrayList<Branch> branches;

int nb = -1;

void setup() {
  size(600, 600);
  background(255); 
  pixelDensity(2);
  stroke(0);
  strokeWeight(1);
  frameRate(2);
  newTree();
}

void draw() {
  newTree();
  for (Branch b : branches) {
    b.show();
  }
  //if (nb >= 0 && nb < 25) save("artn" + nb + ".jpg");
  //nb++;
  //if (nb > 25) exit();
}

void newTree() {
  background(255);
  branches = new ArrayList<Branch>();
  branches.add(new Branch(new PVector(width/2, height), new PVector(width/2, height - random(100, 200))));
  for (int i = 0; i < pow(2, int(random(4, 10))); i++) {
    if (!branches.get(i).grown) {
      branches.add(branches.get(i).branchA());
      branches.add(branches.get(i).branchB());
      branches.get(i).grown = true;
    }
  }
  for (Branch b : branches) {
    if (!b.grown) {
      float size = random(10, 50);
      fill(0);
      ellipse(b.end.x, b.end.y, size, size);
    }
  }
}

void mousePressed() {
  newTree();
}
