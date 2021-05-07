float time_step = 0.0;

void setup(){
  size(800, 600);
}

void draw() {
  loadPixels();
  
  float xoff = 0.0;
  
  for (int x = 0; x < width; x++) {
    float yoff = 0.0;
    
    for (int y = 0; y < height; y++) {
      //noiseDetail(4, 0.7);
      float noise_val = noise(xoff + time_step, yoff + time_step);
      color col;
      
      if (noise_val < 0.5) {
        col = color(0, 94, 185);
      } else if (noise_val >= 0.5 && noise_val < 0.7){
        col = color(116, 102, 59);
      } else {
        col = color(0, 154, 23);
      }
      
      pixels[x + y * width] = col;
      
      yoff += 0.05;
    }
    
    xoff += 0.05;
  }
  
  time_step += 0.05;
  
  updatePixels();
}
