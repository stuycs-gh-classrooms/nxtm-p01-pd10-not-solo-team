Player player;
BulletList playerBullets;
BulletList alienBullets;
Alien[][] aliens;

int rows = 5;
int cols = 8;
int cooldown = 0;
float alienDX = 1;
float alienDrop = 10;
boolean movingRight = true;
boolean paused = false;

void setup() {
  size(600, 600);
  player = new Player(width/2, height - 40);
  playerBullets = new BulletList();
  alienBullets = new BulletList();
  aliens = new Alien[rows][cols];
  makeAliens();
  frameRate(60);
}

void draw() {
  background(0);
  if (paused) {
    fill(255);
    textAlign(CENTER, CENTER);
    textSize(32);
    text("PAUSED", width/2, height/2);
    return;
  }
  player.update();
  player.display();
  updatePlayerBullets();
  updateAlienBullets();
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

void updatePlayerBullets() {
  for (int i = playerBullets.size() - 1; i >= 0; i--) {
    Bullet b = playerBullets.get(i);
    b.update();
    b.display();
    if (b.isOffScreen()) {
      playerBullets.remove(i);
    }
  }
}

void updateAlienBullets() {
  for (int i = alienBullets.size() - 1; i >= 0; i--) {
    Bullet b = alienBullets.get(i);
    b.update();
    b.display();
    if (b.y > height) {
      alienBullets.remove(i);
    }
    if (abs(b.x - player.x) < 20 && abs(b.y - player.y) < 10) {
      alienBullets.remove(i);
    }
  }
}

void updateAliens() {
  boolean hitEdge = false;
  alienFire();
  for (int r = 0; r < rows; r++) {
    for (int c = 0; c < cols; c++) {
      Alien a = aliens[r][c];
      if (a != null) {
        if ((a.x > width - 40 && movingRight) || (a.x < 20 && !movingRight)) {
          hitEdge = true;
        }
      }
    }
  }
  if (hitEdge) {
    movingRight = !movingRight;
    for (int r = 0; r < rows; r++) {
      for (int c = 0; c < cols; c++) {
        Alien a = aliens[r][c];
        if (a != null) {
          a.y += alienDrop;
        }
      }
    }
  }
  float dx;
  if (movingRight) {
    dx = alienDX;
  } else {
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
  if (key == ' ' && frameCount - cooldown >= 30 && !paused) {
    playerBullets.add(player.shoot());
    cooldown = frameCount;
  }
  if (key == 'p' || key == 'P') {
    paused = !paused;
  }
}

void alienFire() {
  if (random(1) < 0.01) {
    int c = int(random(cols));
    for (int r = rows - 1; r >= 0; r--) {
      if (aliens[r][c] != null) {
        alienBullets.add(aliens[r][c].shoot());
        break;
      }
    }
  }
}
