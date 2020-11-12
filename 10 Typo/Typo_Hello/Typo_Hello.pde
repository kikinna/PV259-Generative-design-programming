/**
* Basic functions related to Typography in processing
* and intro to PFont class
* Functions:  PFont.list(), createFont, textFont, textLeading
* Created for the PV259 course.
*
* Created: 2017 ?
* Updated: 2020-11-09
*
* @author  Kristina Zakopcanova
*
* Controls:
* s      save the current frame
* click  change font to a random font installed on your computer
*/

PFont random_font; 

void setup() {
  size(1500, 1500);
  background(33);
  textSize(100);
  
  // print a list of installed fonts into console
  printArray(PFont.list());
  
  initFont();
}

void draw() {
  background(33);

  strokeWeight(50);
  fill(#40FFC1, 100);
  
  text("Hello. Hello. Hello.", width/2, height/2, width/2, height/2);
}

void initFont() {
  // initialize PFont objects
  int random_index = (int) random(PFont.list().length);
  random_font = createFont(PFont.list()[random_index], 200);
  
  // use selected PFont object as a current font
  textFont(random_font);
  
  // set up leading height in px (distance between text lines)
  textLeading(30);
}

void mouseClicked() {
  initFont();
}

void keyPressed() {
  if (key == 's' || key == 'S') saveFrame("Hello-####.png");
}
