Mover[] movers = new Mover[20];
Liquid liquid;

PVector half_window = new PVector(320, 180);

void setup() {
  size(640, 360);
  background(255);

  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(random(0.1, 5), random(10, width - 10), 10);
  }
  
  liquid = new Liquid(0, height/2, width, height/2, 0.1);
}

void draw() {
  background(255);
  
  liquid.display();
    
  for (int i = 0; i < movers.length; i++){
  
    if (movers[i].isInside(liquid)) {
      movers[i].drag(liquid); 
    }
    
    float m = movers[i].mass;
    PVector gravity = new PVector(0, 0.1 * m);
    
    movers[i].applyForce(gravity);   
    
    movers[i].update();
    movers[i].display();
    movers[i].checkCorners();
  }
}
