float g_radius = 500;
String timestamp;

void setup() {
  size(1500, 1500);
  //fullScreen();
  
  background(255);
  
  timestamp = year() + "-" + minute() + "-" + millis();
}

void draw() {
  
  float rad = 300;
  
  //background(frameCount % 256);
  background(33);
  
  //ellipse(mouseX, mouseY, rad, rad);
  
  // ellipse(x, y, w, h);
  fill(150, 0, 210, 150);
  ellipse(width/2, height/2 - 200, rad, rad);
  //fill(150, 230, 210, 150);
  stroke(255);
  noStroke();
  ellipse(width/2, height/2, rad, rad);
  //noFill();
  ellipse(width/2, height/2 + 200, rad, rad);
}

void keyPressed() {
  if (key == 's' || key == 'S') saveFrame("Desne se nam dari-" + timestamp + "-####.png");
}
