class Bubble {
  
  float rad = 300;  // Radio de gota
  float x;  // Coordenada X en el vértice
  float y;  // Coordenada Y en el vértice
  int n_points = 300;
  float angle = radians(360) / n_points;
  float factor = 0.2;
  
  PShape shape;
  
  public void draw() {
    translate(width/2, height/2);  // Posición de la mancha (y movimiento en el eje Y)
    shape = createShape();
    shape.beginShape();
    
    generateVertex();

    shape.endShape(CLOSE); 
    
    // shape.scale(1.8);
    shape(shape, 25, 25);
   }
   
   private void generateVertex() {
    for (int i = 0; i < n_points; i++) {
      x = cos(angle * i) * rad;
      y = sin(angle * i) * rad;
      PVector p = new PVector(x, y).normalize(); // normalize() normaliza o valor a tamaño máximo 1
      float n = map(noise(p.x * factor + frameCount * 0.01, p.y * factor + frameCount * 0.01), 0, 1, 10, 200);
      p.mult(n);    
      shape.fill(100 - i / 10 - abs(p.y), (90 + i) - (p.y/4), 220);  // funciona
      shape.vertex(p.x, p.y);    
    }
   }
   
   private void setColor() {
     for (int i = 0; i < shape.getVertexCount(); i++) {
      float amt = map(i, 0, shape.getVertexCount(), 0, 1);
      float random = random(0.8, 1.2);
      shape.setFill(i, lerpColor(color(31, 140, 233), color(40, 230, 200), amt));
    }
   }
}
