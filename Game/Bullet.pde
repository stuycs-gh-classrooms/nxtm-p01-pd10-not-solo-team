class Bullet {
  float x, y;
  float speed = 7;

  Bullet(float x, float y) {
    this.x = x;
    this.y = y;
  }

  void update() {
    y -= speed;
  }

  void display() {
    fill(255);
    rectMode(CENTER);
    rect(x, y, 4, 12);
  }

  boolean isOffScreen() {
    return y < 0;
  }
}
