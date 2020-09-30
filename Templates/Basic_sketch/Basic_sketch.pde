// Basic template for processing sketches
// drawing an ellipse and also allowing to save
// current frame into raster image.
// Made by Kristina Zakopcanova


// Global variables go here
// these are visible in the whole program

String timestamp;


// setup function is run once at the beginning of the program
void setup() {
  size(720, 720);
  background(33);
  frameRate(30);
  
  timestamp = year() + nf(month(), 2) + nf(day(), 2) + "-"  + nf(hour(), 2) + nf(minute(), 2) + nf(second(), 2);
  
  // demo
  fill(90, 255, 200, 50);
  noStroke();
  
}

// draw function is run every frame
void draw() {
  // background(33);
  
  // demo  
  ellipse(random(0, width), random(0, height), 50, 50);
}


// function called when any key is pressed by user
void keyPressed() {
  // if 's' key is pressed, save the current frame 
  if (key == 's' || key == 'S') saveFrame("IMG-" + timestamp + "-####.png");
}
