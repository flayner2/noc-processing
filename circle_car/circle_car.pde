Car car;

void setup() {
  size(640, 360);
  background(255);
  car = new Car();
}

void draw() {
  background(255);
  
  car.update();
  car.checkCorners();
  car.display();
}

class Car {
  PVector location;
  PVector velocity;
  PVector acceleration;
  
  float topspeed;
  
  Car() {
    location = new PVector(width / 2, height / 2);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0.01, 0.01);
    topspeed = 10;
  }
  
  void update() {
    if (keyPressed) {
      if (key == CODED) {
        if (keyCode == UP) {
          velocity.y -= acceleration.y;
        } else if (keyCode == DOWN) {
          velocity.y += acceleration.y;
        } else if (keyCode == LEFT) {
          velocity.x -= acceleration.x;
        } else if (keyCode == RIGHT) {
          velocity.x += acceleration.x;
        }
      }
    }
    
    velocity.limit(topspeed);
    location.add(velocity);
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
}
