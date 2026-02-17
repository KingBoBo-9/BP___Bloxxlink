int playerX, playerY;
int playerSize = getGridSquareSize();

//Sets player spawn point
void initPlayer() {
  playerX = width / 2;
  playerY = height / 2;
}


void drawPlayer() {
  fill(#FCB824);
  ellipseMode(CORNER);
  circle(playerX, playerY, playerSize);
}

void movePlayer(String direction) {
  if (direction == "UP") {
    if (playerY >= getGridY() + playerSize) {
      playerY -= playerSize;
      updateScore();
    }
  } else if (direction == "DOWN") {
    if (playerY < getGridHeight() + getGridY() - playerSize) {
      playerY += playerSize;
      updateScore();
    }
  } else if (direction == "LEFT") {
    if (playerX >= getGridX() + playerSize) {
      playerX -= playerSize;
      updateScore();
    }
  } else if (direction == "RIGHT") {
    if (playerX < getGridWidth() + gridX - playerSize ) {
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
