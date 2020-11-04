/**
* Demonstration of the basic transformations (scale, translate and rotate).
* Created for the PV259 course.
*
* Created: 2019
* Updated: 2020-11-02
*
* @author  Kristina Zakopcanova, Vojtech Bruza
*
* Controls:
* s    save the current frame
* l    loop the draw function
* n    stop looping the draw function
*/

color orange = #FFA007;
color cyan = #1FAAC0;
color grey = #DDDBDA;

void setup() {
  size(720, 720);
  background(33);
  rectMode(CENTER);
  noStroke();
}

void draw() {
  background(33);
  
  fill(orange);
  // move to center to draw the sun
  translate(width/2, height/2);
  circle(0, 0, 100);
  
  pushMatrix();
  fill(cyan);
  // rotate cyan planet
  rotate(frameCount*0.01);
  // move planet from center
  translate(100, 100);
  circle(0, 0, 50);
  
  fill(grey);
  //rotate grey moon
  rotate(frameCount*0.01);
  // make moon smaller
  scale(1.5);
  // move moon from planet
  translate(30, 30);
  circle(0, 0, 20);
  popMatrix();
  
  fill(grey);
  // rotate grey planet
  rotate(-frameCount*0.015);
  // move from center
  translate(180, 180);
  circle(0, 0, 50);
}

void keyPressed() {
  if (key == 's' || key == 'S') saveFrame("Simply Planets ####.png");
  if (key == 'l') loop();
  if (key == 'n') noLoop();
}
