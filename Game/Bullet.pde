class Bullet {
  float x, y, speed;

  Bullet(float x, float y, float speed) {
    this.x = x;
    this.y = y;
    this.speed = speed;
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
