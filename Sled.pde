class Sled {
  /*Initialize public variables here*/
  public float yVal;
  public float xVal = 150;
  public PImage s;
  public float yVel;

  Sled(float yVal, PImage s) {
    this.yVal = yVal;
    this.s = s;
  }
  
  public void display() { // displaying the pipes
    image(s, xVal, yVal, 250, 150);
  }

  public void update() { // updating the pipes and implementing gravity physics
    yVel += 1;
    yVal += yVel; 
  }
}
