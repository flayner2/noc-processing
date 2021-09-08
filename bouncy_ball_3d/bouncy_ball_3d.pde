PVector location;
PVector velocity = new PVector(1, 3.3, 2);
int radius = 100;
float rotation = 0;

void setup() {
  size(1080, 720, P3D);
  background(255);
  location = new PVector(width / 2, height / 2, -500);
  fill(175);
}

void draw() {
  background(255);
  
  rotation += 0.01;
  
  pushMatrix();
  noFill();
  stroke(0);
  strokeWeight(2);
  translate(width / 2, height / 2, 0);
  rotateY(rotation);
  box(400);
  popMatrix();
  
  location.add(velocity);
  
  if (location.x + radius >= (width / 2) + 400 || location.x - radius <= (width / 2) - 400) {
    velocity.x = -velocity.x;
  }
  
  if (location.y + radius >= (height / 2) + 400 || location.y - radius <= (height / 2) - 400) {
    velocity.y = -velocity.y;
  }
  
  if (location.z + radius >= 0 || location.z - radius <= -500) {
    velocity.z = -velocity.z;
  }
  
  pushMatrix();
  fill(0);
  strokeWeight(1);
  stroke(255, 100, 0);
  translate(location.x, location.y, location.z);
  rotateY(rotation);
  sphere(radius);
  popMatrix();
}

void mousePressed() {
  location.x = width / 2;
  location.y = height / 2;
  println(location.x, location.y);
}
