class Bubble {
  
  float rad = 300;  // Radio de gota
  float x;  // Coordenada X en el vértice
  float y;  // Coordenada Y en el vértice
  int n_points = 300;
  float angle = radians(360) / n_points;
  float factor = 0.2;
  
  PShape shape;
  float positionX, positionY;
  
  Bubble(float positionX, float positionY) {
    this.positionX = positionX;
    this.positionY = positionY;
  }
  
  public void draw() {
    translate(positionX, positionY);  // Posición de la mancha (y movimiento en el eje Y)
    shape = createShape();
    generateVertex();
    shape(shape, 25, 25);
  }
   
  private void generateVertex() {
    shape.beginShape();
    
    for (int i = 0; i < n_points; i++) {
      x = cos(angle * i) * rad;
      y = sin(angle * i) * rad;
      PVector p = new PVector(x, y).normalize(); // normalize() normaliza o valor a tamaño máximo 1
      float maxSize = map(mouseY, 0, height, 50, 200);
      float n = map(noise(p.x * factor + frameCount * 0.01, p.y * factor + frameCount * 0.01), 0, 1, 10, maxSize);
      p.mult(n);    
      // shape.fill(100 - i / 10 - abs(p.y), (90 + i) - (p.y/4), 220);  // funciona
      shape.vertex(p.x, p.y);    
    }
    
    shape.endShape(CLOSE); 
    setColor();
  }
   
  private void setColor() {
    
    color blue1 = color(31, 140, 233);
    color blue2 = color(40, 230, 200);
    color orange1 = color(255,74,123);
    color orange2 = color(255,220,21);
    
    for (int i = 0; i < shape.getVertexCount(); i++) {
      float amtBlueRed = (mouseX + mouseY) / ((float) width + (float) height);      
      float amt = map(i, 0, shape.getVertexCount(), 0, 1);
      // shape.setFill(i, lerpColor(blue1, blue2, amt));
      shape.setFill(i, lerpColor(lerpColor(blue1, blue2, amt), lerpColor(orange1, orange2, amt), amtBlueRed));
    }
  }
}
