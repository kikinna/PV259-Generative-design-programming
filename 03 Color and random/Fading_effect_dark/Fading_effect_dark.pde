// Fading effect example
// Made by Kristina Zakopcanova for PV259


String timestamp;
color colorList[] = { #cf1259, #DD7596, #B7C3F3, #41D3BD };


// setup function is run once at the beginning of the program
void setup() {
  size(720, 720);
  background(20);
  frameRate(30);
  
  timestamp = year() + nf(month(), 2) + nf(day(), 2) + "-"  + nf(hour(), 2) + nf(minute(), 2) + nf(second(), 2);
  
  // demo
  fill(90, 255, 200, 50);
  noStroke();
  
}


void draw() {
  // transparent rect drawn over the whole canvas
  fill(20, 5);
  // noStroke();
  rect(0, 0, width, height);
  
  // dont forget to set back the right color of fill
  fill(colorList[int( random(colorList.length) )]);
  ellipse(random(0, width), random(0, height), 50, 50);
}


// function called when any key is pressed by user
void keyPressed() {
  // if 's' key is pressed, save the current frame 
  if (key == 's' || key == 'S') saveFrame("Fade-yeah-" + timestamp + "-####.png");
}
