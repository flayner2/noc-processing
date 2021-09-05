Mover mover;
PVector helium;
float noiseX = 0, noiseY = 0;

void setup() {
  size(640, 360);
  background(255);
  mover = new Mover();
  helium = new PVector(0, -0.01);
}

void draw() {
  background(255);
  
  PVector wind = new PVector(map(noise(noiseX), 0, 1, -0.001, 0.001), map(noise(noiseY), 0, 1, -0.03, 0.03));
  
  mover.update();
  mover.checkCorners();
  mover.display();
  mover.applyForce(helium);
  mover.applyForce(wind);
  
  noiseX += 0.001;
  noiseY += 0.001;
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
      //velocity.x = 0;
      //acceleration.x = acceleration.x * -1;
      velocity.x = velocity.x * -1;
    }
    
    if ((location.y - 12.5) <= 0 || (location.y + 12.5) >= height) {
      //velocity.y = 0;
      //acceleration.y = acceleration.y * -1;
      velocity.y = velocity.y * -1;
    }
  }
  
  void applyForce(PVector force) {
    acceleration.add(force);
  }
}
