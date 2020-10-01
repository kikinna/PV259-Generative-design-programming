/* Controls
When color choise is user-driven, then
x position of mouse generates the seed and
y position of mouse generates the range of color

key    setting
0      Random Grayscale mode
1      Random / RGB color mode
2      Interactive / RGB color mode 
3      Random from range / HSB color mode
4      Interactive / HSB color mode
5      Interactive / HSB color mode and various circle size
6      Interactive / HSB color mode and non-uniform ellipse size

*/


int mode;
boolean play = true;

void setup() {
  size(720, 720);
  //fullScreen(2);
  frameRate(3);

  noStroke();
  background(0);
  colorMode(HSB, 360, 100, 100, 100);

  mode = 0;
}

void draw() {

  switch(mode) { 
    // Grayscale
  case 0:
    frameRate(3);
    background(0);
    for (int x = 0; x <= width; x += 40) {
      for (int y = 0; y <= height; y += 40) {

        colorMode(RGB, 255, 255, 255);
        fill(random(255));
        ellipse(x, y, 36, 36);
      }
    }
    break;

    // RGB color mode
  case 1:
    frameRate(3);
    background(0);
    for (int x = 0; x <= width; x += 40) {
      for (int y = 0; y <= height; y += 40) {

        colorMode(RGB, 255, 255, 255);
        fill(random(255), random(255), random(255));
        ellipse(x, y, 36, 36);
      }
    }
    break;
    
    // Interactive RGB color mode 
    case 2:
    frameRate(3);
    background(0);
    for (int x = 0; x <= width; x += 40) {
      for (int y = 0; y <= height; y += 40) {

        colorMode(RGB, 255, 255, 255);
        
        float seed = map(mouseX, 0, width, 0, 255);
        float range = map(mouseY, 0, height, 1, 255);

        fill(random(seed, range), random(seed/2, range/2), random(seed, range));
        fill(random(seed, range), random(seed, range), random(seed, range));
        ellipse(x, y, 36, 36);
      }
    }
    break;


    // HSB color mode
  case 3:
    background(0);
    frameRate(3);
    for (int x = 0; x <= width; x += 40) {
      for (int y = 0; y <= height; y += 40) {

        colorMode(HSB, 360, 100, 100, 100);
        fill(random(160, 240), 80, 80);
        ellipse(x, y, 36, 36);
      }
    }
    break;

    // Interactive HSB color mode
  case 4:
    background(0);
    frameRate(5);
    for (int x = 0; x <= width; x += 40) {
      for (int y = 0; y <= height; y += 40) {

        colorMode(HSB, 360, 100, 100, 100);

        float seed = map(mouseX, 0, width, 0, 360);
        float range = map(mouseY, 0, height, 1, 360);

        fill(random(seed, seed + range) % 360, 80, 80);
        ellipse(x, y, 36, 36);
      }
    }
    break;

    // Interactive / HSB color mode and uniform ellipse size
  case 5:
    background(0);
    frameRate(3);
    for (int x = 0; x <= width; x += 40) {
      for (int y = 0; y <= height; y += 40) {

        colorMode(HSB, 360, 100, 100, 100);

        float seed = map(mouseX, 0, width, 0, 360);
        float range = map(mouseY, 0, height, 1, 360);

        fill(random(seed, seed + range), 80, 60);

        float diameter = random(33, 38);
        ellipse(x, y, diameter, diameter);
      }
    }
    break;

    // Interactive / HSB color mode and non-uniform ellipse size
  case 6:
    background(0);
    frameRate(3);
    for (int x = 0; x <= width; x += 40) {
      for (int y = 0; y <= height; y += 40) {

        colorMode(HSB, 360, 100, 100, 100);

        float seed = map(mouseX, 0, width, 0, 360);
        float range = map(mouseY, 0, height, 1, 360);

        fill(random(seed, seed + range), 80, 80);

        ellipse(x, y, random(30, 38), random(30, 38));
      }
    }
    break;
  }
}

void keyPressed() {
  if (key >= '0' && key < '7') {
    mode = key - 48;
  }
  if (key == 'l') loop();
  if (key == 'n') noLoop();
  if (key == 's') saveFrame("Random and For ####.png");
}

void mousePressed() {
  /*
  if (play) {
    noLoop();
  } else {
    loop();
  }
  play = !play;
  */
}