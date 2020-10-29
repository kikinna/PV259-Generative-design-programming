/**
* Showcase of a translation between polar and cartesean coordinates.
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
float diameter;
float theta = 0;

void setup() {
  size(1500, 1500);
  
  background(33);
  
  center_x = width/2;
  center_y = height/2;
  
  diameter = height/4;
  
  printArray(PFont.list());
  PFont ibm = createFont("IBM Plex Sans Light", 42);
  textFont(ibm);
}

void draw() {
  
  background(33);
  
  noFill();
  stroke(255);
  strokeWeight(2);
  ellipse(center_x, center_y, 2*diameter, 2*diameter);
  
  // Angle mark
  float x = cos(theta) * diameter + center_x;
  float y = sin(theta) * diameter + center_y;
  
  fill(255);
  ellipse(x, y, 15, 15);
  
  // Textual presentation of cosine value
  textAlign(RIGHT);
  stroke(#F76F8E);
  fill(#F76F8E);
  line(x, 0, x, height);
  text("x", x+30, 40);
  text(cos(theta), x + 140, height - 15);
  
  // Textual presentation of sine value
  stroke(#98B9F2);
  fill(#98B9F2);
  line(0, y, width, y);
  text("y", 30, y - 10);
  text(sin(theta), width - 10, y - 10);
  
  // Textual presentation of angle value
  fill(140);
  textAlign(CENTER);
  text("radians", width/2, height/2 - 140);
  text(theta, width/2, height/2 - 80);
  text("degrees", width/2, height/2 + 100);
  text(int(degrees(theta)), width/2, height/2 + 160);

  theta += 0.01;
}

void keyPressed() {
  if (key == 's' || key == 'S') saveFrame("Polar_Coordinates_####.png");
}
