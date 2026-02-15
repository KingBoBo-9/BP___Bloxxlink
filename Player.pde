int playerX, playerY;
int playerSize = 30;

//Sets player spawn point
void initPlayer() {
  playerX = width / 2;
  playerY = height / 2;
}


void drawPlayer() {
  fill(#FCB824);
  square(playerX, playerY, playerSize);
}

void movePlayer(String direction) {
  if (direction == "UP") {
    if (playerY >= 0 + playerSize) {
      playerY -= playerSize;
      updateScore();
    }
  } else if (direction == "DOWN") {
    if (playerY <= getGridHeight() - playerSize) {
      playerY += playerSize;
      updateScore();
    }
  } else if (direction == "LEFT") {
    if (playerX >= 0 + playerSize) {
      playerX -= playerSize;
      updateScore();
    }
  } else if (direction == "RIGHT") {
    if (playerX < getGridWidth() - playerSize) {
      playerX += playerSize;
      updateScore();
    }
  }
}

int getPlayerX() {
  return playerX;
}

int getPlayerY() {
  return playerY;
}
