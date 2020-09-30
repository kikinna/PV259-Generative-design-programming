// Created for the lecture of PV259 Generative Design programming

String timestamp;

void setup() {
  size(1500, 1500);
  //fullScreen();
  
  background(33);
  colorMode(HSB, 360, 100, 100, 100);
  //frameRate(3);
  timestamp = year() + "-" + minute() + "-" + millis();
}


void draw() {
  noStroke();
  fill(0, 5);
  rect(0, 0, width, height);
  
  //background(33);
  
  stroke(random(152, 212), random(90, 100), random(70, 90), 70);
  strokeWeight(15);
  
  if(random(1) < 0.10) {
    stroke(#FBA38B);
  }
  
  for (int i = 0; i < 5; i++) {
    
    //float y = int(random(0, height/100)) * 100;
    float y = int(random(30)) * height/30;
    float x = int(random(30)) * width/30;
    //float x = random(0, width);
    float length = map(mouseX, 0, width, 0, width/4);
    
    // line(x1, y1, x2, y2);
    line(x, y, x + length, y);
    line(y, x, y, x + length);
    
    line(width - x, height - y, width - x -length, height - y);
    line(height - y, width - x, height - y, width - x -length);
  }
}

void keyPressed() {
  if (key == 's' || key == 'S') saveFrame("Line symmetrys-" + timestamp + "-####.png");
}
