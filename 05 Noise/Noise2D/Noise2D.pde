/**
* Demonstration of the 2D noise function.
* Created for the PV259 course.
*
* Created: 2018-10-29
* Updated: 2020-10-23
*
* @author  Kristina Zakopcanova, Vojtech Bruza
*
* Controls:
* i      toggle interactive mode (mouseX: noise_start, mouseY: noise_step)
* s      save the current frame
* click  (when interactive off) set random noise_start and redraw canvas
*/

float eSize = 10;
int rows, cols;

// noise variables
float noise_start = 0;
float noise_step = 0.1;

boolean isInteractive = false;
PFont spaceFont;

void setup() {
  size(1200, 1000);
  background(33);
  
  // font setup
  spaceFont = createFont("SpaceGrotesk-Regular.otf", 24);
  textFont(spaceFont);

  fill(255);
  noStroke();
  
  // get number of columns and rows based on ellipse size
  cols = int(width/eSize);
  rows = int(height/eSize);
}

void draw() {
  background(33);
  
  if (isInteractive) {
    noise_start = map(mouseX, 0, width, 0, 10);
    noise_step = map(mouseY, 0, height, 0.001, 0.8);
  }
  
  // we sample a matrix (of size rows x cols) and display noise values as color of ellipses
  for (int x = 0; x <= cols; x++) {
    for (int y = 0; y <= rows; y++) {
      float noise_value = noise(noise_start + x * noise_step, noise_start + y * noise_step);
      
      fill(map(noise_value, 0, 1, 0, 255), 0, 100);
      
      ellipse(x * eSize, y * eSize, eSize, eSize);
    }
  }
  
  // textual information
  fill(255);
  text("Noise starting position: " + noise_start, 10, 30);
  text("Noise step size: " + noise_step, 10, 60);
}

void keyPressed() {
  if (key == 's' || key == 'S') saveFrame("Noise 2D ####.png");
  if (key == 'i' || key == 'I') isInteractive = !isInteractive;
}

void mouseClicked() {
  noise_start = random(10);
}
