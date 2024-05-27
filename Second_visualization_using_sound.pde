import ddf.minim.*;

Minim minim;
AudioPlayer player;

void setup() {
  size(800, 600); 
  minim = new Minim(this);
  player = minim.loadFile("/Users/vasenceto/Downloads/vladi.mp3"); 
  player.play();
}

void draw() {
  float amplitude = player.mix.level(); 
  
 
  background(255,255,255);
  
  // Draw a circle in the center that responds to the amplitude
  float circleSize = map(amplitude, 0, 1, 50, 400);
  
  noFill();
  stroke(255, 100, 150);
  strokeWeight(2);
  ellipse(width / 2, height / 2, circleSize, circleSize);
  
  // Draw a series of bars around the circle
  for (int i = 0; i < 360; i += 5) {
    float angle = radians(i);
    float x = width / 2 + cos(angle) * (circleSize / 2);
    float y = height / 2 + sin(angle) * (circleSize / 2);
    float xEnd = width / 2 + cos(angle) * (circleSize / 2 + amplitude * 50);
    float yEnd = height / 2 + sin(angle) * (circleSize / 2 + amplitude * 50);
    
    stroke(map(i, 0, 360, 0, 255), 100, 150);
    line(x, y, xEnd, yEnd);
  }
  
  // Draw additional dynamic shapes
  pushMatrix();
  translate(width / 2, height / 2);
  rotate(frameCount * 0.01);
  for (int i = 0; i < 8; i++) {
    float size = map(amplitude, 0, 1, 20, 100);
    stroke(100, 150, 255);
    ellipse(100, 0, size, size);
    rotate(PI / 4);
  }
  popMatrix();
}
void mousePressed() {
  saveFrame("screenshot-######.png");
}
