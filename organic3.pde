float rad = 300;  // Radio de gota
float x;  // Coordenada X en el vértice
float y;  // Coordenada Y en el vértice
int n_points = 300;
float angle = radians(360) / n_points;
float factor = 0.2;

PShape shape;

void setup() {
  size(800, 800);
  noStroke();  // No hay línea
  smooth(8);
}

void draw() {
  background(1);
  translate(width/2, height/2);  // Posición de la mancha (y movimiento en el eje Y)
  shape = createShape();
  
  shape.beginShape();
  for (int i = 0; i < n_points; i++) {
    x = cos(angle * i) * rad;
    y = sin(angle * i) * rad;
    PVector p = new PVector(x, y).normalize(); // normalize() normaliza o valor a tamaño máximo 1
    float n = map(noise(p.x * factor + frameCount * 0.01, p.y * factor + frameCount * 0.01), 0, 1, 10, 200);
    p.mult(n);
    
    float redVal = 100 - i / 10 - abs(p.y);
    float greenVal = (90 + i) - (p.y/4);
    // println("c1: " + redVal + "\nc2: " + greenVal);
    // stroke(204, 102, 0);
    // fill( lerpColor(int(redVal), int(greenVal), (millis()%5000)/5000.0) );
    // fill(redVal, greenVal, 220);
    
    shape.vertex(p.x, p.y);
    
  }

  println(shape.getVertexCount());
  
  shape.endShape(CLOSE); 
  shape(shape, 25, 25);
}
