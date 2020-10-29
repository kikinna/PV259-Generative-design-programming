/**
* Letter Ridrs.
* Created: Many years ago.
*
* @author  Kristina Zakopcanova
*
* Controls:
* r  show/hide riders
* b  toggle fading artboard
* s  save the current frame
* backspace  redraw background
*/

Ball[] balls;
Ball[] secondsun;
Ball[] thirdsun;
Ball[] fourthsun;
String timestamp;
boolean show = true;
boolean redraw = true;


void setup() {
  size(1200, 1200);  // 900
  //fullScreen(2);
  timestamp = year() + nf(month(), 2) + nf(day(), 2) + "-"  + nf(hour(), 2) + nf(minute(), 2) + nf(second(), 2);

  //frameRate(30);
  colorMode(HSB, 360, 100, 100, 100);
  
  balls = new Ball[150];
  for (int i = 0; i < 150; i++) {
    balls[i] = new Ball();
  }
  
  secondsun = new Ball[100];
  for (int i = 0; i < 100; i++) {
    secondsun[i] = new Ball();
  }
  
  thirdsun = new Ball[150];
  for (int i = 0; i < 150; i++) {
    thirdsun[i] = new Ball();
  }
  
  fourthsun = new Ball[200];
  for (int i = 0; i < 200; i++) {
    fourthsun[i] = new Ball();
  }
  
  background(5);
  fill(200);
}

void draw() {
  
  if (redraw) {
    fill(0, 12);
    rect(0, 0, width, height);
  }
  
  for (Ball b : balls) {
    b.update();
  }
  for (Ball b : secondsun) {
    b.update();
  }
  for (Ball b : thirdsun) {
    b.update();
  }
  for (Ball b : fourthsun) {
    b.update();
  }
  
  if (show) {
    pushMatrix();
    for (Ball b : balls) {
      b.show();
    }
    popMatrix();
  }
  
  
  
}

void keyPressed() {
  if (key == 's') saveFrame("Approaching Balls-" + timestamp + "-###.png");
  if (key == BACKSPACE) background(15);
  if (key == 'r') show = !show;
  if (key == 'b') redraw = !redraw;
}
