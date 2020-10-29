float topspeed = 8;  // 8
float ballsize = 7;  // 3

class Ball {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float accelerationRatio;
  
  Ball() {
    position = new PVector(random(width), random(height)); // random2D();
    velocity = new PVector(random(-1, 1), random(-1, 1));
    acceleration = new PVector(0, 0);
    accelerationRatio = random(0.3, 1);
  }
  
  void update() {
    PVector mouse = new PVector(mouseX, mouseY);
    PVector dir = PVector.sub(mouse, position);
    
    dir.normalize();
    dir.mult(accelerationRatio);
    
    acceleration = dir;
    
    velocity.add(acceleration);
    velocity.limit(topspeed);
    position.add(velocity);
  }
  
  void show() {
    fill(random(150, 190), 100, 100, 25);
    noStroke();
    ellipse(position.x, position.y, ballsize, ballsize);
  }
  
}
