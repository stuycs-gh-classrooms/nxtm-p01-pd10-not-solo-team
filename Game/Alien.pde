class Alien {
  float x, y;
  float w = 30;
  float h = 20;

  Alien(float x, float y) {
    this.x = x;
    this.y = y;
  }

  void update(float dx, float dy) {
    x += dx;
    y += dy;
  }

  void display() {
    fill(0, 255, 0);
    rectMode(CENTER);
    rect(x, y, w, h);
  }

  Bullet shoot() {
    return new Bullet(x, y + 15, -6);
  }

  boolean isHit(Bullet b) {
    return abs(b.x - x) < w/2 && abs(b.y - y) < h/2;
  }
}
