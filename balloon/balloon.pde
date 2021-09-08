Mover mover;
PVector helium, gravity;
float noiseX = 0;

void setup() {
  size(640, 360);
  background(255);
  mover = new Mover();
  helium = new PVector(0, -0.001);
  gravity = new PVector(0, -0.0001);
}

void draw() {
  background(255);
  
  PVector wind = new PVector(map(noise(noiseX), 0, 1, -0.001, 0.001), 0);
  
  mover.update();
  mover.checkCorners();
  mover.display();
  mover.applyForce(helium);
  mover.applyForce(wind);
  mover.applyForce(gravity);
  
  noiseX += 0.001;
}

class Mover {
  PVector location;
  PVector velocity;
  PVector acceleration;
  
  Mover() {
    location = new PVector(width / 2, height - 50);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
  }
  
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }
  
  void display() {
    stroke(0);
    fill(175);
    ellipse(location.x, location.y, 17.5, 25);
    noFill();
    bezier(location.x, location.y + 12.5, location.x - 7.5, location.y + 20.5, location.x + 7.5, location.y + 28.5, location.x, location.y + 36.5);
  }
  
  void checkCorners() {
    if ((location.x - 8.75) <= 0 || (location.x + 8.75) >= width) {
      velocity.x = velocity.x * -0.5;
    }
    
    if ((location.y - 12.5) <= 0 || (location.y + 12.5) >= height) {
      velocity.y = velocity.y * -0.5;
    }
  }
  
  void applyForce(PVector force) {
    acceleration.add(force);
  }
}
