Mover[] movers = new Mover[20];
PVector half_window = new PVector(320, 180);

float n = 1;
float c1 = 0.05;
float c2 = 0.01;

// Friction pockets
PVector[] pockets = new PVector[2];
PVector pocket_radius = new PVector(300.0, 300.0);

void setup() {
  size(640, 360);
  background(255);

  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(random(0.1, 5), random(10, width - 10), 10);
  }
  
  // Friction pockets
  pockets[0] = new PVector(random(0, width / 2), 200);
  pockets[1] = new PVector(random(width/2, width), 300);
}

void draw() {
  background(255);
  
  noStroke();
  fill(255, 0, 0, 30);
  circle(pockets[0].x, pockets[0].y, pocket_radius.x / 2);
  
  fill(0, 255, 0, 30);
  circle(pockets[1].x, pockets[1].y, pocket_radius.x / 2);
  
  PVector wind = new PVector(0.01, 0);
    
  for (int i = 0; i < movers.length; i++){
    if (mousePressed) {
      PVector gust = new PVector(-0.3, -0.2);
      movers[i].applyForce(gust);
    }
        
    float m = movers[i].mass;
    PVector gravity = new PVector(0, 0.1 * m);
    
    //PVector attractor = PVector.sub(half_window, movers[i].location).normalize();
    //attractor.mult(0.3);
        
    movers[i].applyForce(wind);
    movers[i].applyForce(gravity);
    
    PVector friction = movers[i].velocity.copy();
 
    for (int j = 0; j < pockets.length; j++) {
      float distance_to_pocket = movers[i].location.dist(PVector.add(pockets[j], PVector.div(pocket_radius, 2)));
                
      if (distance_to_pocket <= pocket_radius.x / 2) {
        println(distance_to_pocket);
        float frictionMag;
        
        if (j == 0) {
          frictionMag = c1 * n;
        } else {
          frictionMag = c2 * n;
        }
        
        // Pockets slow things down
        //friction.mult(-1);
        // Pockets accelerate things 
        friction.mult(0.3);
        friction.normalize();
        friction.mult(frictionMag);
        
        movers[i].applyForce(friction);
      }
    }
    
    //movers[i].applyForce(attractor);
    movers[i].update();
    movers[i].display();
    movers[i].checkCorners();
  }
}
