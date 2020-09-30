// Shape ID
//  0  Line
//  1  Circle
//  2  Ellipse
//  3  Rectangle
//  4  Triangle
//  5  Polygon


int shapeId = 0;
int shapeCount = 5;

float radius;

void setup() {
  size(720, 720);
  background(33);

  fill(255, 150);
  //noStroke();
  stroke(255);
  strokeWeight(3);
  
  radius = 360;
}

void draw() {
  float gray = map(mouseY, 0, height, 0, 255);
  background(gray);

  radius = map(mouseX, 0, width, -360, 360);
  
  if (radius < 0) {
    fill(100, 100);
  } else {
    fill(255, 100);
  }

  drawShape();
}



void drawShape() {

  // Line
  if (shapeId == 0) {
    line(width/2 - radius, height/2, width/2 + radius, height/2);
  }

  // Circle
  if (shapeId == 1) {
    ellipse(width/2, height/2, radius, radius);
  }

  // Ellipse
  if (shapeId == 2) {
    ellipse(width/2, height/2, radius, radius * 1.2);
  }

  // Rectangle
  if (shapeId == 3) {
    rectMode(CENTER);
    rect(width/2, height/2, radius, radius);
  }

  // Triangle
  if (shapeId == 4) {
    triangle(width/2 + 0, height/2 - radius, 
      width/2 + radius * sqrt(3)/2, height/2 + radius * 0.5, 
      width/2 - radius * sqrt(3)/2, height/2 + radius * 0.5);
  }

  // Polygon
  if (shapeId == 5) {
    // Set how many vertices the polygon has
    int vertexCount = 7;

    float angle = TWO_PI / vertexCount;
    beginShape();
    for (int i = 0; i < vertexCount; i++) {
      float x = cos(angle * i) * radius + width/2;
      float y = sin(angle * i) * radius + height/2;
      vertex(x, y);
    }
    endShape(CLOSE);
  }
}

void keyPressed() {
  if (key == 's' || key == 'S') saveFrame("Shapes-####.png");
}

void mouseClicked() {
  // Increment the shape id
  shapeId = shapeId + 1;

  // If shapeId is bigger than the num of shapes, go back to zero
  if (shapeId > shapeCount) {
    shapeId = 0;
  }
}