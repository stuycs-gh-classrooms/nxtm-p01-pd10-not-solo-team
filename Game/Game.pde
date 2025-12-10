Ball[][] grid;
Ball projectile;

int rows = 3;
int cols = 5;
float ballSize = 40;

void setup() {
  size(400, 500);
  grid = new Ball[rows][cols];
  makeBalls(grid);
  newProjectile(ballSize);
}

void draw() {
  background(0);
  drawGrid(grid);
  projectile.move();
  projectile.display();
  processCollisions(projectile, grid);
}

void keyPressed() {
  if (key == ' ') projectile.yspeed = -1;
  if (keyCode == LEFT) projectile.c.x -= 10;
  if (keyCode == RIGHT) projectile.c.x += 10;
}

void makeBalls(Ball[][] g) {
  for (int r = 0; r < rows; r++) {
    for (int c = 0; c < cols; c++) {
      float x = 80 + c * ballSize;
      float y = 80 + r * ballSize;
      g[r][c] = new Ball(new PVector(x, y), ballSize);
    }
  }
}

void newProjectile(float psize) {
  projectile = new Ball(new PVector(width/2, height - psize), psize);
  projectile.yspeed = 0;
}

void drawGrid(Ball[][] g) {
  for (int r = 0; r < rows; r++) {
    for (int c = 0; c < cols; c++) {
      if (g[r][c] != null) g[r][c].display();
    }
  }
}

void processCollisions(Ball p, Ball[][] g) {
  for (int r = 0; r < rows; r++) {
    for (int c = 0; c < cols; c++) {
      if (g[r][c] != null && p.collides(g[r][c])) {
        g[r][c] = null;
        newProjectile(ballSize);
        return;
      }
    }
  }
}
