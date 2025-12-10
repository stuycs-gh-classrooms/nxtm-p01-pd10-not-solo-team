Alien[][] grid;
Bullet [] boll;
Player play;

int rows = 5;
int cols = 7;
float alienSize = 40;

void setup() {
  size(600, 800);
  grid = new Alien[rows][cols];
  play = new Player();
  play.x = width/2;
  makeAlien(grid);
  newProjectile(alienSize);
}

void draw() {
  background(0);
  drawGrid(grid);
  play.display();
  //projectile.move();
  //projectile.display();
  //processCollisions(projectile, grid);
  play.move();
}

void keyPressed() {
  //if (key == ' ') projectile.yspeed = -1;
  //if (keyCode == LEFT) projectile.c.x -= 10;
  //if (keyCode == RIGHT) projectile.c.x += 10;
}

void makeAlien(Alien[][] g) {
  for (int r = 0; r < rows; r++) {
    for (int c = 0; c < cols; c++) {
      float x = 80 + c * alienSize;
      float y = 80 + r * alienSize;
      g[r][c] = new Alien(new PVector(x, y), alienSize);
    }
  }
}

void newProjectile(float psize) {
  //projectile = new Alien(new PVector(width/2, height - psize), psize);
  //projectile.yspeed = 0;
}

void drawGrid(Alien[][] g) {
  for (int r = 0; r < rows; r++) {
    for (int c = 0; c < cols; c++) {
      if (g[r][c] != null) g[r][c].display();
    }
  }
}

void processCollisions(Alien p, Alien[][] g) {
  for (int r = 0; r < rows; r++) {
    for (int c = 0; c < cols; c++) {
      if (g[r][c] != null && p.collides(g[r][c])) {
        g[r][c] = null;
        newProjectile(alienSize);
        return;
      }
    }
  }
}
