Snake snakes = [];
const SNAKE_COUNT = 1200;

function mousePressed() {
  snakes = [];
  colorMode(RGB);
  background(250);
  
  const off = floor(random(155));
  const mySeed = random(100);
  for(let i=0; i<SNAKE_COUNT; i++) {
    snakes.push(new Snake(random(width), random(height), off, mySeed));
  }
  colorMode(HSB);
}

function setup() {
  createCanvas(windowWidth, windowHeight);
  background(250);
  const off = floor(random(155));
  const mySeed = random(100);
  for(let i=0; i<SNAKE_COUNT; i++) {
    snakes.push(new Snake(random(width), random(height), off, mySeed));
  }
  colorMode(HSB);
  noStroke();
}

function draw() {
  for(const s of snakes) {
    s.move();
    s.display();
  }
}
