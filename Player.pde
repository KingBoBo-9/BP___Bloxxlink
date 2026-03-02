int playerX, playerY, playerCol, playerRow;

//Sets player spawn point
void initPlayer() {
  playerX = calculateGridX() + playerCol * getCellSize();
  playerY = calculateGridY() + playerRow * getCellSize();
}

//Hier bezig met player pixels omzetten naar col en Row

void drawPlayer() {
  playerX = calculateGridX() + playerCol * getCellSize();
  playerY = calculateGridY() + playerRow * getCellSize();
  fill(#FCB824);
  ellipseMode(CORNER);
  circle(playerX, playerY, getCellSize());
}

void movePlayer(String direction) {
  if (direction == "UP") {
    if (playerRow > 0) {
      playerRow--;
      updateScore();
    }
  } else if (direction == "DOWN") {
    if (playerRow < gridRows - 1) {
      playerRow++;
      updateScore();
    }
  } else if (direction == "LEFT") {
    if (playerCol > 0) {
      playerCol--;
      updateScore();
    }
  } else if (direction == "RIGHT") {
    if (playerCol < gridColumns - 1) {
      playerCol++;
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
