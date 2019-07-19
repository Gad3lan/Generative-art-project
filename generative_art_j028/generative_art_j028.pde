int NB_PARTICLES = 150;
ArrayList<Triangle> triangles;
Particle[] parts = new Particle[NB_PARTICLES];
PImage image;
float sCol = 255;
float bCol = 0;

void setup()
{
  size(600, 600);
  frameRate(30);
  pixelDensity(2);
  for (int i = 0; i < NB_PARTICLES; i++)
  {
    parts[i] = new Particle();
  }
}

void draw()
{
  background(bCol);
  triangles = new ArrayList<Triangle>();
  Particle p1, p2;

  for (int i = 0; i < NB_PARTICLES; i++)
  {
    parts[i].move();
    p1 = parts[i];
    p1.neighboors = new ArrayList<Particle>();
    p1.neighboors.add(p1);
    for (int j = i+1; j < NB_PARTICLES; j++)
    {
      p2 = parts[j];
      float d = PVector.dist(p1.pos, p2.pos); 
      if (d > 0 && d < Particle.DIST_MAX)
      {
        p1.neighboors.add(p2);
      }
    }
    if(p1.neighboors.size() > 1)
    {
      addTriangles(p1.neighboors);
    }
  }
  drawTriangles();
  println(frameRate);
}

void drawTriangles(){
  fill(sCol, 13);
  stroke(sCol, 13);
  //noFill();
  beginShape(TRIANGLES);
  for (int i = 0; i < triangles.size(); i ++)
  {
    Triangle t = triangles.get(i);
    t.display();
  }
  endShape();  
}

void addTriangles(ArrayList<Particle> p_neighboors){
  int s = p_neighboors.size();
  if (s > 2)
  {
    for (int i = 1; i < s-1; i ++)
    { 
      for (int j = i+1; j < s; j ++)
      { 
         triangles.add(new Triangle(p_neighboors.get(0).pos, p_neighboors.get(i).pos, p_neighboors.get(j).pos));
      }
    }
  }
}
