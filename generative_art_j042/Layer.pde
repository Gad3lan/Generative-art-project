class Layer {
  int x, y;
  color col;
  ArrayList<ArrayList<Point>> layers = new ArrayList<ArrayList<Point>>();
  boolean newLayer;
  
  Layer() {
    layers.add(new ArrayList<Point>());
    layers.get(0).add(points.get(0));
    print(layers.size());
    for (Point p : points) {
      newLayer = true;
      for (int i = 0; i < layers.size(); i++) {
        if (p.col == layers.get(i).get(0).col) {
          layers.get(i).add(p);
          newLayer = false;
          break;
        }
      }
      if (newLayer) {
        layers.add(new ArrayList<Point>());
        layers.get(layers.size() - 1).add(p);
      }
    }
  }
  
  void display() {
    for (ArrayList<Point> l : layers) {
      fill(l.get(0).col + 10);
      beginShape();
      for (Point p : l) {
        vertex(p.x, p.y);
      }
      
      endShape(CLOSE);
    }
  }
}
