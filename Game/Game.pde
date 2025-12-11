Player player;
BulletList playerBullets;
Alien[][] aliens;

int rows = 5;
int cols = 8;
int cooldown = 0;
float alienDX = 1;
float alienDrop = 10;
boolean movingRight = true;

void setup() {
  size(600, 600);
  player = new Player(width/2, height - 40);
  playerBullets = new BulletList();
  aliens = new Alien[rows][cols];
  makeAliens();
  frameRate(60);
}

void draw() {
  background(0);
  player.update();
  player.display();
  updateBullets();
  updateAliens();
  checkCollisions();
}

void makeAliens() {
  float startX = 80;
  float startY = 60;
  float spaceX = 50;
  float spaceY = 40;

  for (int r = 0; r < rows; r++) {
    for (int c = 0; c < cols; c++) {
      aliens[r][c] = new Alien(startX + c*spaceX, startY + r*spaceY);
    }
  }
}

void updateBullets() {
  for (int i = playerBullets.size() - 1; i >= 0; i--) {
    Bullet b = playerBullets.get(i);
    b.update();
    b.display();
    if (b.isOffScreen()) {
      playerBullets.remove(i);
    }
  }
}

void updateAliens() {
  boolean hitEdge = false;
  for (int r = 0; r < rows; r++) {
    for (int c = 0; c < cols; c++) {
      Alien a = aliens[r][c];
      if (a != null) {
        if ((a.x > width - 40 && movingRight) || (a.x < 20 && !movingRight)) hitEdge = true;
      }
    }
  }

  if (hitEdge) {
    movingRight = !movingRight;
    for (int r = 0; r < rows; r++) {
      for (int c = 0; c < cols; c++) {
        Alien a = aliens[r][c];
        if (a != null) a.y += alienDrop;
      }
    }
  }

  float dx;
  if (movingRight) {
    dx = alienDX;
  }
  else {
    dx = -alienDX;
  }

  for (int r = 0; r < rows; r++) {
    for (int c = 0; c < cols; c++) {
      Alien a = aliens[r][c];
      if (a != null) {
        a.update(dx, 0);
        a.display();
      }
    }
  }
}

void checkCollisions() {
  for (int i = playerBullets.size() - 1; i >= 0; i--) {
    Bullet b = playerBullets.get(i);
    for (int r = 0; r < rows; r++) {
      for (int c = 0; c < cols; c++) {
        Alien a = aliens[r][c];
        if (a != null && a.isHit(b)) {
          aliens[r][c] = null;
          playerBullets.remove(i);
          return;
        }
      }
    }
  }
}

void keyPressed() {
  if (key == ' ' && frameCount - cooldown >= 30) {
    playerBullets.add(player.shoot());
    cooldown = frameCount;
  }
}
