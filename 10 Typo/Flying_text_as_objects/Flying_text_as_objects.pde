/**
* Extention of Basic_typing program. With each ENTER, store current string
* into a new object of type Text.
* Example of working with classes and ArrayLists
* Created for the PV259 course.
*
* Created: 2018-10-31
* Updated: 2020-11-09
*
* @author  Kristina Zakopcanova
*
* Controls:
* click    save the current frame
* letters + basic chars  types a text   
*/

PFont ibm_bold;

// List storing all text objects
ArrayList<Text> texts;

// Current string typed by a user
String letters = "";
float textSize = 100;

void setup() {
  size(1500, 1500);
  background(33);
  
  // Setup font and leading
  ibm_bold = createFont("IBMPlexSans-Bold.ttf", textSize);
  textFont(ibm_bold);
  textLeading(30);
  
  // initilize ArrayList
  texts = new ArrayList<Text>();
}

void draw() {
  background(33);

  strokeWeight(50);
  fill(#40FFC1, 100);
  
  text(letters, 0, 0, width, height);
  
  // Iterator going through all objects stored in ArrayList texts
  for (Text t : texts) {
    t.display();
    t.update();
  }
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
  // if ENTER is pressed, store current string int new Type object and
  // reset the letters string to an empty string
  // Well, do it for example ten times :D
  else if (key == ENTER) {
    for (int i = 0; i < 10; i++) {
      texts.add(new Text(letters, random(width), random(height)));
    }
    letters = "";
  } 
}


void mousePressed() {
  saveFrame("Flying-words-####.png");
}
