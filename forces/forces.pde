Mover[] movers = new Mover[20];

void setup() {
  size(640, 360);
  background(255);
  for (int i = 0; i < movers.length; i++){
    movers[i] = new Mover();
  }
}

void draw() {
  background(255);
  
  for (int i = 0; i < movers.length; i++){
    if (mousePressed) {
      PVector wind = new PVector(0.5, 0);
      movers[i].applyForce(wind);
    }
    
    movers[i].update();
    movers[i].checkCorners();
    movers[i].display();
  }
}

class Mover {
  PVector location;
  PVector velocity;
  PVector acceleration;
  
  Mover() {
    location = new PVector(random(width), random(height));
    velocity = new PVector(0, 0);
  }
  
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }
  
  void display() {
    stroke(0);
    fill(175);
    ellipse(location.x, location.y, 25, 25);
  }
  
  void checkCorners() {
    if (location.x < 0) {
      location.x = width;
    } else if (location.x > width) {
      location.x = 0;
    }
    
    if (location.y < 0) {
      location.y = height;
    } else if (location.y > height) {
      location.y = 0;
    }
  }
  
  void applyForce(PVector force) {
    acceleration.add(force);
  }
}
