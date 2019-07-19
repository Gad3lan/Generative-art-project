int formResolution = 15;
int stepSize = 2;

float xoff;
float yoff;

float posX;
float posY;
float distortionFactor;
float initRadius;
int radius;
float[] x;
float[] y;

boolean filled = false;
boolean freeze = false;

int count = 0;
int nb = 0;
int rdm;

void setup(){
  size(600,600);
  smooth();

  boot();
  
  stroke(255, 50);
  strokeWeight(0.2);
  pixelDensity(2);
}


void draw(){
  translate(width/2, height/2);
  
  xoff += 0.005;
  yoff += 0.005;
  
  /**
  posX = noise(xoff, yoff) * width;
  posY = noise(yoff, xoff) * height;
  **/
  
  radius++;
  
  // calculate new points
  for (int i=0; i<formResolution; i++){
    //x[i] += random(-stepSize,stepSize);
    //y[i] += random(-stepSize,stepSize);
    x[i] *= random(1, 1.01);
    y[i] *= random(1, 1.01);
    x[i] += random(-stepSize,stepSize);
    y[i] += random(-stepSize,stepSize);
    // ellipse(x[i], y[i], 5, 5);
  }

  if (filled) fill(random(255));
  else noFill();

  beginShape();
  // start controlpoint
  //curveVertex(x[formResolution-1] + radius, y[formResolution-1] + radius);

  // only these points are drawn
  for (int i=0; i<formResolution; i++){
    curveVertex(x[i], y[i]);
  }
  curveVertex(x[0], y[0]);

  // end controlpoint
  curveVertex(x[1], y[1]);
  endShape(CLOSE);
  
  if (posX < 0) posX = width;
  if (posX > width) posX = 0;
  if (posY < 0) posY = height;
  if (posY > width) posY = 0;
  
  count++;
  if (count > 400) {
    save("art03" + nb + ".jpg");
    nb++;
    count = 0;
    if (nb > 9) exit();
    boot();
  }
}

void boot() {
  background(0);
  rdm = int(random(500));
  xoff = random(1000);
  yoff = random(1000);

  posX = noise(xoff) * width;
  posY = noise(yoff) * height;
  distortionFactor = 1;
  initRadius = 50 + random(100);
  x = new float[formResolution];
  y = new float[formResolution];
  
  posX = noise(xoff, yoff) * width; 
  posY = noise(yoff, xoff) * height;
  float angle = radians(360/float(formResolution));
  for (int i=0; i<formResolution; i++){
    x[i] = cos(angle*i) * initRadius;
    y[i] = sin(angle*i) * initRadius;  
  }

}
