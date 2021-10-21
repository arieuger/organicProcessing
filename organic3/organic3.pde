void setup() {
  size(800, 800, P2D);
  noStroke();  // No hay línea
  smooth(8);
}

void draw() {
  background(255);

  Bubble bubble = new Bubble();
  bubble.draw();
}
