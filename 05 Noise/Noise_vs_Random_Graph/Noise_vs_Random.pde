/**
* Demonstration of the difference between the sequence of 
* noise and random values which are assigned to y position.
* Created for the PV259 course.
*
* Created: 2019-10-14
* Updated: 2020-10-23
*
* @author  Kristina Zakopcanova, Vojtech Bruza
*
* Controls:
* f    toggle endless fading of the canvas
* s    save the current frame
* l    loop the draw function
* n    stop looping the draw function
*/

// variables controling the Noise function
float x_off;
float x_step;

boolean endless_fading = true;
PFont spaceFont;

void setup() {
  size(1200, 720);
  background(0);
  colorMode(HSB, 360, 100, 100, 100);

  frameRate(20);
  spaceFont = createFont("SpaceGrotesk-Regular.otf", 32);
  textFont(spaceFont);

  x_off = 0;
  x_step = 0.05;
}

void draw() {
  if (endless_fading) {
    fill(0, 100, 0, 2);
    rect(0, 0, width, height);
  }

  // text labels
  fill(150);
  text("Noise function", 10, 40);
  text("Random function", 10, height/2 + 40);

  // divider horizontal line
  stroke(150);
  strokeWeight(2);
  line(0, height/2, width, height/2);
  noStroke();
  
  // Get x position, same for both noise and random strip
  float x_pos = (frameCount * 10) % width;
  
  // --- Noise function strip --- 
  float y_pos = map(noise(x_off), 0, 1, 0, height/2);

  // map noise value to hue as well
  //float hue = map(noise(x_off), 0, 1, 120, 250);
  //fill(hue, 100, 100);
  
  // don't forget to update x_off
  x_off += x_step;
  
  fill(180, 100, 100, 100);
  ellipse(x_pos, y_pos, 10, 10);
  
  
  // --- Random function strip ---
  // uses the same x position as noise, but
  
  y_pos = random(height/2, height);
  ellipse(x_pos, y_pos, 10, 10);
}

void keyPressed() {
  if (key == 'f' || key == 'F') { endless_fading = !endless_fading; }
  if (key == 's' || key == 'S') saveFrame("Noise vs Random ####.png");
  if (key == 'l') loop();
  if (key == 'n') noLoop();
}
