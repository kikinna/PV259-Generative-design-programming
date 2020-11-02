/**
* Demonstration of the PShape function with option to use
* curve vertices.
* Created for the PV259 course.
*
* Created: 2018-12-28
* Updated: 2020-11-01
*
* @author  Kristina Zakopcanova
*
* Controls:
* h       toggle help display
* v       switch between vertex type: regular and curve
* r       randomly shift vertice's position (based on mouseY)
* mouseX  controls number of vertices (3-20)
* mouseY  controls the max_value of the random shift of vertices
* d       turn on/off debug mode (only when isRandomShifted==true) that displays construction rules behind the shifts
* c       toggle closing the regular PShape (the curve is not finished)
* s       save the frame
*
* TODO Finish drawing curve vertex when PShape is not closed.
*/

float radius;
PVector center;

boolean isCurve = false;
boolean isClosed = true;
boolean isRandomShifted = false;
boolean displayHelp = true;
boolean debug = false;

int minVert = 3;
int maxVert = 20;

PVector[] randomShift;
PFont spaceFont;

void setup() {
  size(800, 800, P2D);
  
  // font setup
  spaceFont = createFont("SpaceGrotesk-Regular.otf", 16);
  textFont(spaceFont);
  
  background(#003f5c);
  noFill();
  //stroke(100,182,172);
  stroke(#47BFBD);
  strokeWeight(10);
  center = new PVector(width/2, height/2);
  radius = width/3;
  
  randomShift = new PVector[maxVert - minVert + 2];
  initRandomShift();
}

void draw() {
  //background(254, 233, 225);
  background(#003f5c);
  noFill();
  
  PShape shape;
  
  int verticesCount = int(map(mouseX, 0, width, minVert, maxVert));
  shape = isCurve ? createCurvePolygon(verticesCount) : createPolygon(verticesCount);
  
  // debug / construction mode
  if (isRandomShifted && debug) {
    float x, y;
    noFill();
    strokeWeight(1);
    stroke(#47BFBD, 100);
    ellipse(center.x, center.y, 2*radius, 2*radius);
    
    for (int i = 0; i < verticesCount; i++) {
      x = cos(TWO_PI/verticesCount * i) * radius + center.x;
      y = sin(TWO_PI/verticesCount * i) * radius + center.y;
      line(x, y, x + randomShift[i].x, y + randomShift[i].y);
    } 
    stroke(#47BFBD);
    strokeWeight(10);
  }
  
  shape(shape);
  
  if(displayHelp) { displayHelp(); }
  else { 
    fill(#00628F);
    text("h   display help", 10, 20);
  } 
}

void displayHelp() {
  String[] texts = {
    "h   display help",
    "v   toggle curve vertex",
    "r   shift vertices' position randomly",
    "mouseX   change number of vertices",
    "mouseY   change extent of random shifts",
    "d   turn on/off the construction mode",
    "click   generate new random shift"
  };
  int y = 20;
  fill(255);
  for(String s : texts) {
    text(s, 10, y);
    y += 20;
  }
}

PShape createPolygon(int n) {
  return createPolygon(n, center, radius);
}

PShape createCurvePolygon(int n) {
  return createCurvePolygon(n, center, radius);
}

PShape createPolygon(int n, PVector center, float rad){
  PShape shape = createShape();
  shape.beginShape();
  for (int i = 0; i < n; i++) {
    float x = cos(TWO_PI/n * i) * rad + center.x + randomShift[i % n].x;
    float y = sin(TWO_PI/n * i) * rad + center.y + randomShift[i % n].y;
    shape.vertex(x, y);
  }
  shape.fill(color(255));
  
  if(isClosed) { shape.endShape(CLOSE); } else { shape.endShape(); }
  return shape;
}

PShape createCurvePolygon(int n, PVector center, float rad){
  //float shiftX = noise(map(mouseX, 0, width, 0, 1)) * 100;
  
  PShape shape = createShape();
  shape.beginShape();
  for (int i = 0; i < n + 3; i++) {
    float x = cos(TWO_PI/n * i) * rad + center.x + randomShift[i % n].x;
    float y = sin(TWO_PI/n * i) * rad + center.y + randomShift[i % n].y;
    shape.curveVertex(x, y);
  }
  shape.endShape();
  return shape;
}

void initRandomShift() {
  float divider = map(mouseY, 0, height, height, 2);
  float randomRange = map(mouseY, 0, height, height/30, height/5);
  
  for(int i = 0; i < randomShift.length; i++) {
    randomShift[i] = isRandomShifted
      //? new PVector(random(-width/divider, width/divider), random(-height/divider, height/divider))
      ? new PVector(random(-randomRange, randomRange), random(-randomRange, randomRange))
      : new PVector(0, 0);
  }
}

void mouseClicked() {
  initRandomShift();
}

void keyPressed() {
  if (key == 'h' || key == 'H') displayHelp = !displayHelp;
  if (key == 'v' || key == 'V') isCurve = !isCurve;
  if (key == 'r' || key == 'R') isRandomShifted = !isRandomShifted;
  if (key == 'c' || key == 'C') isClosed = !isClosed;
  if (key == 'd' || key == 'D') debug = !debug;
  if (key == 's' || key == 'S') saveFrame("PShape_Polygon ####.png");
}
