class Pipe {
  float pipe_x;
  float pipe_y1 = 316;
  float pipe_y2 = 592;
  float p1 = 307;
  float p2 = 572;
  float ran;
  
  Pipe(float ran, int x) {
    this.ran = ran;
    this.pipe_x = x;
  }
  public void upd() {
    fill(#47c25e);
    rectangle();
    rectangle();
    rectangle();
    if (pipe_x < 0 || pipe_x > 1600) {
      reset();
    } else {
      pipe_x-=10;
    }
  }
  void rectangle() {
    rect(pipe_x, pipe_y1 + ran, 127, -900);
    rect(pipe_x-7, p1+ran, 140, 46);
    rect(pipe_x, pipe_y2+ran, 127, 900);
    rect(pipe_x-7, p2+ran, 140, 46);
  }
  void reset() {
    pipe_x = 1452;
    pipe_y1 = 366;
    pipe_y2 = 572;
    p1 = 357;
    p2 = 552;
    ran = random(-300, 300);
  }
}
