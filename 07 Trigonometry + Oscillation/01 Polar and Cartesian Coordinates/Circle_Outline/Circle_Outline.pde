/**
* Draw a cricle outline from little circles using polar coordinates
* Created for the PV259 course.
*
* Created: 2019-10-07
*
* @author  Kristina Zakopcanova
*
* Controls:
* s    save the current frame
*/

float center_x, center_y;
float radius;
float theta = 0;

void setup() {
  size(1500, 1500);

  background(33);

  center_x = width/2;
  center_y = height/2;

  radius = height/4;
}

void draw() {
  // fading effect
  fill(0, 13);
  rect(0, 0, width, height);

  // cartesian coordinates computed from polar ones
  float x = cos(theta) * radius + center_x;
  float y = sin(theta) * radius + center_y;

  noStroke();
  fill(#5DD9C1);
  ellipse(x, y, 30, 30);

  theta += 0.08;
}

void keyPressed() {
  if (key == 's' || key == 'S') saveFrame("Circle_Outline_####.png");
}
