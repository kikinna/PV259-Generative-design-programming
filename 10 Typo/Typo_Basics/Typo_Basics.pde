/**
* Basic functions related to Typography in processing
* Functions: text, textSize, textAlign
* Created for the PV259 course.
*
* Created: 2018-10-29
*
* @author  Kristina Zakopcanova
*
* Controls:
* s    save the current frame
*/

void setup() {
  size(1500, 1500);
  //fullScreen();
  background(33);

  // Size of typeface in pixels 
  textSize(300);
  // Alignment of text. Options: LEFT, CENTER, RIGHT 
  textAlign(CENTER);
}

void draw() {
  background(33);
  
  // Compute the width of given string given actual typeface and size
  float textW = textWidth("Oh yeah!");
  // Offset from canvas edges
  float x_off = (width-textW) / 2;
  
  strokeWeight(50);
  stroke(#40FFC1, 150);
  
  // Type of line cap. Options: ROUND, SQUARE, PROJECT
  strokeCap(SQUARE);
  line(x_off, height/2, width - x_off, height/2);
  
  // Draw given string at position x, y
  // text(string, position_x, position_y);
  text("Oh yeah!", width/2, height/2);
}

void keyPressed() {
  if (key == 's' || key == 'S') saveFrame("Oh yeah.png");
}
