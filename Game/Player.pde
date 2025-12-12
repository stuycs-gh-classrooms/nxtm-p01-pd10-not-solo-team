class Player {
  float x, y;
  float speed = 5;

  Player(float x, float y) {
    this.x = x;
    this.y = y;
  }

  void update() {
    if (keyPressed) {
      if (keyCode == LEFT) {
        x -= speed;
      }
      if (keyCode == RIGHT) {
        x += speed;
      }
    }
    if (x < 20){
      x = 20;
    }
    else if (x > width-20){
      x = width - 20;
    }
  }

  void display() {
    fill(0, 200, 255);
    rectMode(CENTER);
    rect(x, y, 40, 20);
  }

  Bullet shoot() {
    return new Bullet(x, y - 15, 7);
  }
}
