float centerX, centerY;
float radius, theta;

void setup() {
  size(1000, 1000);
  background(33);
  
  radius = height/4;
  theta = 0;
  centerX = width/2;
  centerY = height/2;
}


void draw() {
  // fading effect
  fill(13, 13);
  rect(0, 0, width, height);
  
  // this is where the baby circles should run around
  stroke(60);
  noFill();
  ellipse(centerX, centerY, 2*radius, 2*radius);
  
  // cartesian coordinates computed from polar coordinates
  
  /* This is your work. Get the x and y coordinates
  float x, y;
  
  noStroke();
  fill(#FF5A5A);
  ellipse(x, y, 30, 30);
  */
}


void keyPressed() {
  if (key == 's' || key == 'S') saveFrame("Round_around_####.png");
}
