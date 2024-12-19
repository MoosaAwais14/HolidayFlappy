class Sled {
  /*Initialize public variables here*/
  public float yVal;
  public float xVal = 150;
  public PImage s;
  public float yVel;

  Sled(float yVal, PImage s) {
    //this.xVal = xVal;
    this.yVal = yVal;
    this.s = s;
  }
  
  public void display() {
    image(s, xVal, yVal, 250, 150);
  }

  public void update() {
    yVel += 1;
    yVal += yVel; 
  }
}
