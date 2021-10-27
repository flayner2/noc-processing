Mover[] movers = new Mover[100];
PVector half_window = new PVector(320, 180);

void setup() {
  size(640, 360);
  background(255);
  for (int i = 0; i < movers.length; i++){
    movers[i] = new Mover(random(0.1, 5), width / 2, 100);
  }
}

void draw() {
  background(255);
  
  PVector gravity = new PVector(0, 0.1);
  PVector wind = new PVector(0.01, 0);
    
  for (int i = 0; i < movers.length; i++){
    if (mousePressed) {
      PVector gust = new PVector(-0.3, -0.2);
      movers[i].applyForce(gust);
    }
    
    PVector attractor = PVector.sub(half_window, movers[i].location).normalize();
    attractor.mult(0.3);
        
    movers[i].applyForce(wind);
    movers[i].applyForce(gravity);
    movers[i].applyForce(attractor);
    movers[i].update();
    movers[i].display();
    //movers[i].checkCorners();
  }
}

class Mover {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;
  float diameter;
  float size;
  
  Mover(float m, float x, float y) {
    location = new PVector(x, y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    mass = m;
    diameter = 16;
    size = mass * diameter;
  }
  
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }
  
  void display() {
    stroke(0);
    fill(175);
    ellipse(location.x, location.y, size, size);
  }
  
  void checkCorners() {
    if (location.x <= 0) {
      velocity.x *= -1;
    } else if (location.x >= width) {
      velocity.x *= -1;
    }
    
    if (location.y <= 0) {
      velocity.y *= -1;
    } else if (location.y >= height) {
      velocity.y *= -1;
    }
  }
  
  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }
}
