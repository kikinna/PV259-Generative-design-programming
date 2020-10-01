// Fading effect example
// Made by Kristina Zakopcanova for PV259

String timestamp;

void setup() {
  size(1080, 1080);
  background(240);
  
  timestamp = year() + nf(month(), 2) + nf(day(), 2) + "-"  + nf(hour(), 2) + nf(minute(), 2) + nf(second(), 2);
  
}

void draw() {
  fill(250, 10); // semi-transparent white
  rect(0, 0, width, height);

  fill(#EB4B98);
  ellipse(random(width), random(height), 100, 100);
}

// function called when any key is pressed by user
void keyPressed() {
  // if 's' key is pressed, save the current frame 
  if (key == 's' || key == 'S') saveFrame("Fade-yeah-" + timestamp + "-####.png");
}
