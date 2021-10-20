float rad = 300;  // Radio de gota
float x;  // Coordenada X en el vértice
float y;  // Coordenada Y en el vértice
int n_points = 300;
float angle = radians(360) / n_points;
float factor = 0.2;

PShape shape;

void setup() {
  size(800, 800, P2D);
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
    shape.vertex(p.x, p.y);    
  }
  
  shape.endShape(CLOSE); 
  
  for (int i = 0; i < shape.getVertexCount(); i++) {
    // shape.setFill(i, color(c1,(i <= 255 ? i : 255), c2));  
    // shape.setFill(i, color(map(i, 1, shape.getVertexCount(), 50, 255),map(i, 1, shape.getVertexCount(), 10, 102), 0)); 
    
    float cRed = map(i, 1, shape.getVertexCount(), 50, 255);
    float cGreen = map(i, 1, shape.getVertexCount(), 10, 102);
    // shape.setFill(i, color(cRed,cGreen, 50));
    
    
  }
  
  shape(shape, 25, 25);
}
