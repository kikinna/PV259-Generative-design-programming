/**
* Lissajous Curves demonstrating what happens when you compute
* the cartesian coordinates of x and y from different angles.
* Created for the PV259 course, inspired by https://www.youtube.com/watch?v=--6eyLO78CY
*
* Created: 2019-10-07
*
* @author  Kristina Zakopcanova
*
* Controls:
* s    save the current frame
* l    loop the draw function
* n    stop looping the draw function
*/

float diameter;
float theta = 0;

int cols = 10;
int rows = 10;
PVector box_size;

color[][] colors = new color[cols][rows];

void setup() {
  //size(1500, 1500);
  fullScreen();

  // Compute the size of boxes
  box_size = new PVector(width/cols, height/rows);
  diameter = box_size.y * 0.8;

  // Set random colors for each box
  colorMode(HSB, 360, 100, 100, 100);
  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < cols; j++) {
      colors[i][j] = color(random(170, 300), random(60, 80), random(60, 80), random(80, 100));
    }
  }

  background(33);
}

void draw() {

  noFill();
  stroke(255);
  strokeWeight(2);

  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < cols; j++) {
      float x, y;
      PVector box_center = new PVector(i * box_size.x + box_size.x/2, j * box_size.y + box_size.y/2);
      
      // First row and column
      if (i == 0 ^ j == 0) {
        // Redraw leading circles each frame
        fill(33);
        noStroke();
        rectMode(CENTER);
        rect(box_center.x, box_center.y, box_size.x, box_size.y);

        // Leading circles
        strokeWeight(0.5);
        stroke(200);
        ellipse(box_center.x, box_center.y, diameter, diameter);

        // Compute position of angle mark for each leading circle
        if (i == 0) {
          x = cos(theta*j) * diameter/2 + box_center.x;
          y = sin(theta*j) * diameter/2 + box_center.y;
        } else {
          x = cos(theta*i) * diameter/2 + box_center.x;
          y = sin(theta*i) * diameter/2 + box_center.y;
        }
        
        fill(200);
        noStroke();
        ellipse(x, y, 10, 10);
      }
      // Rest of the grid where Lissajous curves are drawn
      else {
        // Compute position of current dot given by two leading circles
        x = cos(theta * i) * diameter/2;
        y = sin(theta * j) * diameter/2;

        stroke(colors[i][j]);
        strokeWeight(5);
        point(box_center.x + x, box_center.y + y);
      }
    }
  }

  theta += 0.01;
}

void keyPressed() {
  if (key == 's' || key == 'S') saveFrame("Lissajous_Curve_####.png");
  if (key == 'l') loop();
  if (key == 'n') noLoop();
}
