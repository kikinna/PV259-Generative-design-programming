class Dot {
  PVector location;
  color fillcolor;
  
  PVector acceleration;
  PVector velocity;
  
  Dot() {
    location = new PVector(random(width), random(height));
    fillcolor = color((int) random(150, 220), 100, (int) random(80, 100));
    
    //velocity = new PVector
  }
  
  void show() {
    noStroke();
    fill(fillcolor);
    ellipse(location.x, location.y, 3, 3);
  }
  
  void update() {
    
  }
  
}
