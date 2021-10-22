void setup() {
  size(800, 800, P2D);
  noStroke(); 
  noCursor();
  smooth(8);
}

void draw() {
  background(255);

  Bubble bubble = new Bubble(width/2, height/2);
  bubble.draw(); //<>//
}
