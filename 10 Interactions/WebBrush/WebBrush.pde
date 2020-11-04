/**
* Example of generative brush I created when I was bored at a seminar.
* It has pretty shitty code and controls (too many of them, all on keyboard), I know.
*
* This code first generates an array of dots that are scattered accros the canvas.
* On mouseDrag lines appear between the mouse's position and dots' position if their
* distance is smaller than defined reach.
*
* Created: 2016-11-04
* Updated: 2020-11-14
*
* @author  Kristina Zakopcanova
*
* Controls:
* up/down key     change hue
* right/left key  change hue range
* +    add more dots
* -    remove dots
* d    display dots
* s    save current frame
* r    turn on/off pdf recording
* 1    decrease the size of dots
* 2    increase the size of dots
* 3    decrease the radius of line reach (distance from mouse to scattered dots) 
* 4    increase the radius of line reach
* i    init dots
*/

import processing.pdf.*;

ArrayList<Dot> dots;
String timestamp;
int dots_count; // = 2500;
boolean displayDots = true;
float reach; // = 200; 

int bckg = 0;
float hue = 175;
float hue_range = 25;
//color[] fills = {}

boolean recording = false;

void setup() {
  //size(1000, 1000);
  fullScreen(2);
  colorMode(HSB, 360, 100, 100, 100);
  timestamp = year() + nf(month(), 2) + nf(day(), 2) + "-"  + nf(hour(), 2) + nf(minute(), 2) + nf(second(), 2);

  frameRate(15);
  dots_count = 500 / 2;
  //reach = 200 / 2;
  dots_count = 150;
  reach = 230;

  dots = new ArrayList<Dot>();

  for (int i = 0; i < dots_count; i++) {
    dots.add(new Dot());
  }
  record();
  background(0);
}

void record() {
  // Saving to pdf

  //colorMode(HSB, 360, 100, 100, 100);

  if (recording) {
    println("end record");
    endRecord();
    saveFrame("Export/Light_web-T-" + timestamp + ".png");
    timestamp = year() + nf(month(), 2) + nf(day(), 2) + "-"  + nf(hour(), 2) + nf(minute(), 2) + nf(second(), 2);
  }
  println("start record");
  recording = true;
  beginRecord(PDF, "Export/Light_web-T-" + timestamp + ".pdf");

  colorMode(HSB, 360, 100, 100, 100);
}

void draw() {

  // TWEAK MODE
  //dots_count = 2500;
  //reach = 200;

  //dots_count = 200;
  //reach = 100;
  //if (frameCount == 10) background(0);  // in order to erase lines from (0, 0)

  noStroke();
  fill(0, 0);
  rect(0, 0, width, height);
  
  showDots();
}

void initDots(int d_count) {
  dots.clear();

  background(color(0, 0, bckg));
  for (int i = 0; i < d_count; i++) {
    dots.add(new Dot());
  }

  showDots();
}

void showDots() {
  if (displayDots) {
    for (Dot d : dots ) {
      d.show();
    }
  }
}

void keyPressed() {
  if (key == '+') {
    for (int i = 0; i < 10; i++) {
      dots.add(new Dot());
      //showDots();
    }
  }

  if (key == '-') {
    if (dots.size() > 10) {
      for (int i = 0; i < 10; i++) {
        dots.remove(0);
      }
    }
  }
  if (key == 'd') {
    displayDots = !displayDots;
    if (displayDots) showDots();
  }
  if (key == 's') saveFrame("Export/LineBrush - " + timestamp + "-####.png");
  if (key == BACKSPACE) {
    //record();
    initDots(dots_count);
    background(color(0, 0, bckg));
  }
  if (key == 'i') initDots(dots_count);

  if (key == 'r') {
    record();
    if (bckg == 0) bckg = 100;
    else { 
      bckg = 0;
    }
    background(color(0, 0, bckg));
  }

  if (keyCode == UP) hue += 5;
  if (keyCode == DOWN) hue -= 5;
  if (keyCode == RIGHT) hue_range++;
  if (keyCode == LEFT) {
    hue_range--;
    if (hue_range < 0) hue_range = 0;
  }
  println(hue, hue_range, ((hue - hue_range + 360) % 360), (hue + hue_range + 360) % 360);

  if (key == '1') {
    dots_count -= 5;
    println("dots_count " + dots_count);
  }
  if (key == '2') {
    dots_count += 5;
    println("dots_count " + dots_count);
  }
  if (key == '4') {
    reach -= 5;
    println("reach " + reach);
  }
  if (key == '5') {
    reach += 5;
    println("reach " + reach);
  }
}

void mouseDragged() {
  //println(hue, hue_range, ((hue - hue_range) % 360), hue + hue_range % 360);
  for (Dot d : dots) {

    float distance = dist(mouseX, mouseY, d.location.x, d.location.y);

    if ( dist(mouseX, mouseY, d.location.x, d.location.y) < reach ) {
      float alpha = map(distance, 0, reach, 100, 0);
      //stroke(random(150, 200), 100, random(80, 100), alpha);
      float min = hue - hue_range; //(hue - hue_range + 360) % 360;
      float max = hue + hue_range; //( + 360) % 360;
      float hue = random(min, max);
      stroke(hue % 360, 100, random(80, 100), alpha);
      strokeWeight(0.75f);
      line(mouseX, mouseY, d.location.x, d.location.y);
    }
  }
}
