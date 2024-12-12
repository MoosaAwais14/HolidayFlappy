//Sled sled;
float yVal;
float xVal;
PImage s;
void setup() {
  size(1600, 800);
  //sled = new Sled(

  yVal = height/2;
  xVal = width/2;
  s = loadImage("sled.png");
  image(s, 100, 300, 250, 150);
  //System.out.println(yVal);
}

void update() {
  /*code to update the y value of the sled on click */
}

void draw() {
}
