class Ball {
  PVector c;
  float s;
  float xspeed = 0;
  float yspeed = 0;

  Ball(PVector c, float s) {
    this.c = c;
    this.s = s;
  }

  void move() {
    c.x += xspeed;
    c.y += yspeed;
  }

  void display() {
    ellipse(c.x, c.y, s, s);
  }

  boolean collides(Ball o) {
    return dist(c.x, c.y, o.c.x, o.c.y) < (s/2 + o.s/2);
  }
}
