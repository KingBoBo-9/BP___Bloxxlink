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
    playerY -= playerSize;
  } else if (direction == "DOWN") {
    playerY += playerSize;
  } else if (direction == "LEFT") {
    playerX -= playerSize;
  } else if (direction == "RIGHT") {
    playerX += playerSize;
  }
}
