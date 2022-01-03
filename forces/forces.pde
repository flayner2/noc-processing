Mover[] movers = new Mover[20];
PVector half_window = new PVector(320, 180);

void setup() {
  size(640, 360);
  background(255);
  for (int i = 0; i < movers.length; i++){
    movers[i] = new Mover(random(0.1, 5), random(10, width - 10), 10);
  }
}

void draw() {
  background(255);
  
  PVector wind = new PVector(0.001, 0);
    
  for (int i = 0; i < movers.length; i++){
    if (mousePressed) {
      PVector gust = new PVector(-0.3, -0.2);
      movers[i].applyForce(gust);
    }
    
    float c = 0.01;
    float n = 1;
    float frictionMag = c * n;
    PVector friction = movers[i].velocity.copy();
    
    friction.mult(-1);
    friction.normalize();
    friction.mult(frictionMag);
    
    float m = movers[i].mass;
    PVector gravity = new PVector(0, 0.1 * m);
    
    //PVector attractor = PVector.sub(half_window, movers[i].location).normalize();
    //attractor.mult(0.3);
        
    movers[i].applyForce(wind);
    movers[i].applyForce(gravity);
    movers[i].applyForce(friction);
    //movers[i].applyForce(attractor);
    movers[i].update();
    movers[i].display();
    movers[i].checkCorners();
  }
}
