class Planet {
  int id;
  int level;
  float len;
  float rotRate;
  float rot;
  ArrayList<Planet> children;
  Planet(int l) {
    id = gid;
    gid++;
    level = l;
    len = map(level, 0, maxLevel, 5, 50) * random(0.75, 1.25);
    rotRate = random(-0.2, 0.2);
    rot = random(TWO_PI);
    children = new ArrayList<Planet>();
    if (level > 0) {
      int childCount = int(random(1, maxChildCount));
      for (int i = 0; i < childCount; i++) {
        children.add(new Planet(level - 1));
      }
    }
  }
}
