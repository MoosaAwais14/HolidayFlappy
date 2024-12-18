Pipe p1, p2;
Sled sled;
Start start;
GameOver go;

float[] xCoords = new float[500];
float[] yCoords = new float[500];
float[] xMove = new float[500];
float[] yMove = new float[500];

float sledY;
boolean clicked = false;

void setup() {
  size(1600, 800);
  sledY = 300;
  sled = new Sled(sledY, loadImage("sled.png"));

  for (int i = 0; i < 400; i++) {
    p1 = new Pipe(random(-300, 200), 1472);
    p2 = new Pipe(random(-300, 200), 1472-700);
  }
  smooth();
  for (int i = 0; i < 500; i++) {
    xCoords[i] = random(width);
    yCoords[i] = random(height);
    yMove[i] = random(2, 5);
  }

  start = new Start();
  go = new GameOver();
}

void mouseClicked() {
  if (clicked == false) {
    clicked = true;
  }
}

void keyPressed() {
  if (key == ' ') {
    sledY-=70;
  }
}

void draw() {

  if (clicked == false) {
    start.display();
  } else {
    rect(-1, -1, width + 1, height + 1);
    fill(255);
    background(#000000);
    for (int i = 0; i < 500; i++) {
      ellipse(xCoords[i], yCoords[i], 5, 5);
      xCoords[i] +=xMove[i];
      yCoords[i] +=yMove[i];


      xCoords[i] += random(-5, 1);

      if (yCoords[i] > height) {
        yCoords[i] = 0;
      }
      if (xCoords[i] < 0) {
        xCoords[i] = width;
      }
      if (sled.xVal + 100 > p1.pipe_x && sled.xVal < p1.pipe_x + 27 &&
        sledY + 50 > p1.p1 + p1.ran && sledY < p1.p1 + p1.ran + 26) {
        go.gO();
        noLoop();
      }

      // Check for collision with the second pipe (p2)
      if (sled.xVal + 100 > p2.pipe_x && sled.xVal < p2.pipe_x + 27 &&
        sledY + 50 > p2.p1 + p2.ran && sledY < p2.p1 + p2.ran + 26) {
        go.gO();
        noLoop();
      }

      if (sledY > height) {
        go.gO();
        noLoop();
      }
    }
    p1.upd();
    p2.upd();

    sledY+=5;
    sled.update(sledY);
  }
}
