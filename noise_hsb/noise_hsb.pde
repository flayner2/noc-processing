float time_step = 0.0;

void setup(){
  size(800, 600);
  colorMode(HSB, 360, 100, 100);
}

void draw() {
  loadPixels();
  
  float xoff = 0.0;
  
  for (int x = 0; x < width; x++) {
    float yoff = 0.0;
    
    for (int y = 0; y < height; y++) {
      float noise_val = noise(xoff, yoff, time_step);

      float h = map(noise_val, 0, 1, 0, 300);
      //float h = 241;
      float s = map(noise_val, 0, 1, 0, 100);
      float b = map(noise_val, 0, 1, 0, 100);
      
      color col = color(h, s, b);
      
      pixels[x + y * width] = col;
      
      yoff += 0.01;
    }
    
    xoff += 0.01;
  }
  
  time_step += 0.05;
  
  updatePixels();
}
