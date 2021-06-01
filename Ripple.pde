class Ripple{
  float x, y, size;
  
  Ripple(float xIn, float yIn, float sizeIn){
    x = xIn;
    y = yIn;
    size = sizeIn;
    
    noFill();
    strokeWeight(2);
    ellipse(x, y, size, size);
    strokeWeight(1);
    ellipse(x, y, size * 1.5, size * 1.5);
  }
  
  void expand(){
    noFill();
    strokeWeight(.5);
    ellipse(x, y, size * 2.5, size * 2.5);
  }
}
