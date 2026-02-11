int playerX = 0;
int playerY = 0;
int playerSize = 30;

void drawPlayer() {
  fill(#FCB824);
  square(playerX, playerY, playerSize);
}

void movePlayer() {
}

int getPlayerX() {
  return playerX;
}

int getPlayerY() {
  return playerY;
}

void movePlayer(String direction) {
  if (direction == "UP") {
    if (playerY >= 0 + playerSize) {
      playerY -= playerSize;
    }
  } else if (direction == "DOWN") {
    if (playerY < getGridHeight() - playerSize) {
      playerY += playerSize;
    }
  } else if (direction == "LEFT") {
    if (playerX >= 0 + playerSize) {
      playerX -= playerSize;
    }
  } else if (direction == "RIGHT") {
    if (playerX < getGridWidth() - playerSize) {
      playerX += playerSize;
    }
  }
}
