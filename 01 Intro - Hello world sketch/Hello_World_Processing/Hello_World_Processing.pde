float g_radius = 500;
String timestamp;

void setup() {
  size(1080, 1080);
  //fullScreen();

  background(255);
  strokeWeight(10);

  timestamp = year() + "-" + minute() + "-" + millis();
}

void draw() {

  float rad = 300;

  background(frameCount % 256);
  //background(33);

  //ellipse(mouseX, mouseY, rad, rad);

  // ellipse(x, y, w, h);
  fill(250, 100, 120, 200);
  ellipse(width/2, height/2 - 200, rad, rad);
  //fill(150, 230, 210, 150);

  noStroke();
  ellipse(width/2, height/2, rad, rad);
  noFill();
  stroke(255);
  ellipse(width/2, height/2 + 200, rad, rad);
}

void keyPressed() {
  if (key == 's' || key == 'S') saveFrame("Desne se nam dari-" + timestamp + "-####.png");
}
