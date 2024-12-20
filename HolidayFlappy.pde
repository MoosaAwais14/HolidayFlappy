// declaring the necessary objects
Pipe p1, p2;
Sled sled;

// these arrays are needed for the snow animation
float[] xCoords = new float[500];
float[] yCoords = new float[500];
float[] xMove = new float[500];
float[] yMove = new float[500];

int score = 0; // for the score card

boolean clicked = false;

void setup() {
  size(1600, 800);
  
  sled = new Sled(300, loadImage("sled.png")); // defining the sled object

  for (int i = 0; i < 400; i++) { // initializing pipes
    p1 = new Pipe(random(-300, 200), 1472);
    p2 = new Pipe(random(-300, 200), 1472-700);
  }
  
  smooth(); // smooth edges
  
  for (int i = 0; i < 500; i++) { // for snow animation
    xCoords[i] = random(width);
    yCoords[i] = random(height);
    yMove[i] = random(2, 5);
  }
}

void display() { // the start screen
  background(#86C691); 
  textSize(64);
  fill(#298B3A);
  text("Welcome to Winter Flappy!", 500, 350);
  textSize(32);
  text("Click the space bar to make the sled jump!", 560, 550);

  fill(#1E712C);
  text("Click to start", 750, 450);
}

void gO() { // the game over screen
  background(0);
  textSize(64);
  fill(#E33939);
  text("Game Over", 600, 350);
  textSize(32);
  fill(#D87F7F);
}

void updScore(int score){ // the score card
  fill(#ffffff);
  text("Score: " + score, 750,100);
}

void mouseClicked() { // when the mouse gets clicked, the game begins
  if (clicked == false) {
    clicked = true;
  }
}

void keyPressed() { // the space bar makes the sled jump up 17 pixels
  if (key == ' ') {
    sled.yVel=-17;
  }
}

void draw() {
  if (clicked == false) { // user is still on the start screen
    display();
  }  else {   
    
    rect(-1, -1, width + 1, height + 1);
    fill(255);
    background(#000000);

    for (int i = 0; i < 500; i++) { // snow
      ellipse(xCoords[i], yCoords[i], 5, 5);
      xCoords[i] += xMove[i];
      yCoords[i] += yMove[i];

      xCoords[i] += random(-5, 1);

      if (yCoords[i] > height) {
        yCoords[i] = 0;
      }
      if (xCoords[i] < 0) {
        xCoords[i] = width;
      }
    }


    // checking for collisions with the pipe
    if (sled.xVal + 5 >= p1.pipe_x && sled.xVal <= p1.pipe_x + 27) {
      if (sled.yVal <= p1.pipe_y1 + p1.ran || sled.yVal + 5 >= p2.pipe_y2 + p2.ran) {
        noLoop();
        gO();
      }
    }

    if (sled.xVal + 5 >= p2.pipe_x && sled.xVal <= p2.pipe_x + 27) {
      if (sled.yVal <= p2.pipe_y1 + p2.ran || sled.yVal + 5 > p2.pipe_y2 + p2.ran) {
        noLoop();
        gO();
      }
    }


    // if the sled falls out of bounds
    if (sled.yVal > 800) {
      noLoop();
      gO();
    }


    // updating the score card
    if (sled.xVal > p1.pipe_x + 27 && p1.pipe_x > 0) {
      score++;
      p1.pipe_x = width;
      p1.ran = random(200);
    }

    if (sled.xVal > p2.pipe_x + 27 && p2.pipe_x > 0) {
      score++;
      p2.pipe_x = width;
      p2.ran = random(200);
    }

    updScore(score);

    p1.pipe_x -= 5;
    p2.pipe_x -= 5;

    if (p1.pipe_x < -27) {
      p1.pipe_x = width;
      p1.ran = random(200);
    }
    if (p2.pipe_x < -27) {
      p2.pipe_x = width;
      p2.ran = random(200);
    }


    // updating and displaying sled and pipes
    p1.upd();
    p2.upd();
    sled.update();
    sled.display();
  }
}
