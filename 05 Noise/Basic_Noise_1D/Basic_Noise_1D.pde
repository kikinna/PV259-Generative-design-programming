float x, y;

float size = 400;
float noise_start = 0;
float noise_step = 0.001;

void setup() {
  size(1200, 1200);
  background(33);
  x = width/2;
  y = height/2;
}

void draw() {
  background(33);
  
  x = noise(noise_start + noise_step * frameCount);
  x = map(x, 0, 1, 0, width);

  fill(#35D3BF);
  ellipse(x, y, size, size);
}
