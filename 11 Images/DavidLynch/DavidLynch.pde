/**
* Example showing basic work with PImage class in Processing.
* Functions: loadImage, createImage, tint, noTint, loadPixels, updatePixels,
* red, green, blue
* Created for the PV259 course.
*
* Created: 2019-11-03
// * Updated: 2020-10-23
*
* @author  Kristina Zakopcanova
*
* Controls:
* m           switch modes (manual, automatic)
* s           save the current frame
* mouseClick  (only in manual mode) defines values for individual color shifts
*/

PImage lynch;
PImage better_lynch;

String timestamp;
boolean manual_mode;

void setup() {
  //size(1500, 1000);
  size(750, 1000);
  
  surface.setTitle("David Lynch");
  //surface.setResizable(true);
  //surface.setSize(750, 1000);
  
  lynch = loadImage("david-lynch.jpg");
  better_lynch = createImage(lynch.width, lynch.height, RGB);

  image(lynch, 0, 0);
  //tint(255, 0, 100);
  //image(lynch, lynch.width, 0);
  //noTint();
}

void draw() {
  // Automatic mode
  if (!manual_mode) shiftImage();
}

void mousePressed() {
  if (manual_mode) shiftImage();
}

void shiftImage() {
  timestamp = year() + nf(month(), 2) + nf(day(), 2) + "-" + nf(hour(), 2) + nf(minute(), 2) + nf(second(), 2);

  better_lynch = createImage(lynch.width, lynch.height, RGB);
  
  int red_shift, blue_shift;
  
  if (manual_mode) { // Manually driven
    red_shift  = int(map(mouseX, 0, width, -100, 100));
    blue_shift = int(map(mouseY, 0, height, -100, 100));
  } else { // Trigonometry driven :)
    red_shift  = (int) map(sin(frameCount * 0.03), -1, 1, -80, 80);
    blue_shift = (int) map(cos(frameCount * 0.01), -1, 1, -80, 80);
  }
  
  lynch.loadPixels();
  better_lynch.loadPixels();
  
  for (int x = 0; x < lynch.width; x++) {
    for (int y = 0; y < lynch.height; y++) {
      
      int loc = x + y * lynch.width;
      
      better_lynch.pixels[loc] = color(
        red  (lynch.pixels[(loc - red_shift + lynch.pixels.length)%lynch.pixels.length]), 
        //green(lynch.pixels[(loc + int(red_shift*lynch.width*0.9) + lynch.pixels.length)%lynch.pixels.length ]),
        green(lynch.pixels[(loc + red_shift*lynch.width + lynch.pixels.length)%lynch.pixels.length ]),
        blue (lynch.pixels[(loc + blue_shift + lynch.pixels.length)%lynch.pixels.length])  
      );
    }
  }
  
  better_lynch.updatePixels();
  image(better_lynch, 0, 0);
}


void keyPressed() {
  if (key == 's' || key == 'S') better_lynch.save("Lynch-" + timestamp + "####.png");
  if (key == 'm' || key == 'M') manual_mode = !manual_mode;
}
