 int iterations;
 double a;
 double b;
 double m;
 float s;
 double step = 0.0001;
 int nb = 0;
 
void setup() {
  size(600, 600); 
  pixelDensity(2);
  colorMode(RGB);
  smooth();
  iterations = 100000; 
  strokeWeight(0.5);
  stroke(255);
} 


void draw() {
   double xn, yn;
   double x0, y0;
   x0 = random(-10, 10);
   y0 = random(-10, 10);
   a =  random(-0.0001, 0.0001);
   b =  random(-0.1, 0.1);
   m = random(-1, 1);
   s = random(5, 15);
   m+=step;

   background(0);
   stroke(255);
//   fill(color(0,0,0, 50));
    
   for (int i = 0; i < iterations; i++) {
        xn = y0 + (a * (1.0 - (b * y0 * y0)) * y0) + mira(x0);
        yn = -x0 + mira(xn);
        if (xn > 999999 || yn > 999999) {
                print("x:" + xn + ", " + "y:" + yn);

          break;
        }

       //  print("x:" + xn + ", " + "y:" + yn);

       point((float)(s * xn + 275) , (float)(s * yn + height/2));

       x0 = xn;      
       y0 = yn;
   }
// noLoop();
   if (nb < 20) {
     save("art" + nb + ".jpg");
     nb++;
   } else exit();
}

double mira(double x) {
      double xx = x * x;
      return (m * x) + ((2.0 * (1.0 - m) * xx) / (1.0 + xx));
}
