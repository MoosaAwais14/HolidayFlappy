class Sled {
  /*Initialize public variables here*/
  public float yVal;
  public float xVal = 150;
  public PImage s;

  Sled(float yVal, PImage s) {
    //this.xVal = xVal;
    this.yVal = yVal;
    this.s = s;
  }

  public void update(float yVal) {
    image(s, xVal, yVal, 250, 150);
  }
}