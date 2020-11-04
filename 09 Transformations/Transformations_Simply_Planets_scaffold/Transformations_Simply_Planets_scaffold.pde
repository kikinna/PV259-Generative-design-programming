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
  
  fill(cyan);
  // rotate cyan planet
  rotate(frameCount*0.01);
  // move planet from center
  translate(100, 100);
  circle(0, 0, 50);
  
  // your work - here you should draw one more planet
  // and also one moon orbiting one of the planets
}

void keyPressed() {
  if (key == 's' || key == 'S') saveFrame("Simply Planets ####.png");
  if (key == 'l') loop();
  if (key == 'n') noLoop();
}
