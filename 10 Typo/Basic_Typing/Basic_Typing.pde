/**
* Code simulating dummy editor functionality
* (ehm, typing and deletion)
* Also, an example of using a font which is not installed on computer
* Created for the PV259 course.
*
* Created: 2018-10-31
* Updated: 2020-10-23
*
* @author  Kristina Zakopcanova
*
* Controls:
* click    save the current frame
* letters + basic chars  types a text   
*/

PFont ibm_bold;

String letters = "";
float textSize = 100;

void setup() {
  size(1500, 1500);
  background(33);
  
  // Use font which is not installed, but stored in sketch's data folder
  // Use the name of the file to initilize the PFont object
  ibm_bold = createFont("IBMPlexSans-Bold.ttf", textSize);
  textFont(ibm_bold);
  
  // textSize overrides textLeading settings, therefore
  // textSize should be set first, then textLeading
  textSize(textSize);
  textLeading(30); 
}

void draw() {
  background(33);

  strokeWeight(50);
  fill(#40FFC1, 100);
  
  text(letters, 0, 0, width, height);
}

void keyPressed() {
  // store given keys as part of letters string
  if (key >= 32 && key <= 127) {
    letters = letters + key;
  } 
  // if BACKSPACE is pressed, delete last character
  else if (key == BACKSPACE && letters.length() > 0) {
    letters = letters.substring(0, letters.length() - 1);
  } 
  // if ENTER is pressed, break a line
  else if (key == ENTER) {
    letters += "\n";
  } 
}

void mousePressed() {
  saveFrame("Typing-101-####.png");
}
