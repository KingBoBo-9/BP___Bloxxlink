int playerX, playerY, playerCol, playerRow;

//Sets player spawn point
void initPlayer() {
  playerX = calculateGridX() + playerCol * getCellSize();
  playerY = calculateGridY() + playerRow * getCellSize();
}

//Hier bezig met player pixels omzetten naar col en Row

void drawPlayer() {
  fill(#FCB824);
  ellipseMode(CORNER);
  circle(playerX, playerY, getCellSize());
}

void movePlayer(String direction) {
  if (direction == "UP") {
    if (playerY >= getGridY() + getCellSize()) {
      playerY -= getCellSize();
      updateScore();
    }
  } else if (direction == "DOWN") {
    if (playerY < getGridHeight() + getGridY() - getCellSize()) {
      playerY += getCellSize();
      updateScore();
    }
  } else if (direction == "LEFT") {
    if (playerX >= getGridX() + getCellSize()) {
      playerX -= getCellSize();
      updateScore();
    }
  } else if (direction == "RIGHT") {
    if (playerX < getGridWidth() + gridX - getCellSize() ) {
      playerX += getCellSize();
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
