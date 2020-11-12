class Text {
  String text;
  color text_color;
  PVector position;
  PVector speed;
  float twidth;  // width of the text in current font setup
  
  // constructor
  Text(String s, float mx, float my) {
    text = s;
    position = new PVector(mx, my);
    
    // random grayscale value 
    text_color = color(random(255));
    
    // PVector.random2D() generates a normalized vector in a random direction
    // vector.mult(m) multiplies each component by m 
    speed = PVector.random2D().mult(random(5));
    twidth = textWidth(text);
  }
  
  void display() {
    fill(text_color);
    text(text, position.x, position.y);
  }
  
  void update() {
    // change position by the size of the speed vector
    position.add(speed);
    
    // boundary conditions making sure the object stays in canvas
    if (position.x + twidth < 0) position.x = width;
    if (position.x > width) position.x = - twidth;
    if (position.y < 0) position.y = height + textSize;
    if (position.y - textSize> height) position.y = 0;
  }
  
  
}
