/**
* Short demonstration of the PVector class. 
* Created for the PV259 course.
*
* Created: 2019-10-14
* Updated: 2020-10-23
*
* @author  Kristina Zakopcanova, Vojtech Bruza
*
* Controls:
* i      toggle interactive mode (mouseX: noise_start, mouseY: noise_step)
* s      save the current frame
* click  (when interactive off) set random noise_start and redraw canvas
*/

PVector position;
PVector direction;

float speed = 0.1;
int eSize = 60;

void setup() {
  size(1000, 1000);
  
  position = new PVector();
  direction = new PVector();
  
  noStroke();
}


void draw() {
  background(14,14,82);
  
  fill(255);
  ellipse(mouseX, mouseY, 10, 10);
  
  direction = new PVector(mouseX, mouseY).sub(position);
  position.add(direction.mult(speed));
  
  fill(120,192,224);
  if (PVector.dist(position, new PVector(mouseX, mouseY)) < eSize/2) {
    fill(#FF4D4D);
  }
  ellipse(position.x, position.y, eSize, eSize);
  
}

void keyPressed() {
  if (key == 's' || key == 'S') saveFrame("Catch me ####.png");
}
