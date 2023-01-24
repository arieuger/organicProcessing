float randX;
float randY;

// test
void setup() {
  size(800, 800, P2D);
  noStroke(); 
  noCursor();
  smooth(8);
  
  randX = random(height/3);
  randY = random(width/3);
}

void draw() {
  background(255);


  Bubble bubble = new Bubble(mouseX, mouseY);
  bubble.draw(); //<>//
  
    
  Bubble bubbleStatic = new Bubble(randX, randY);
  bubbleStatic.draw();
}
