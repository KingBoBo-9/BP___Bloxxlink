int playerX, playerY, playerCol, playerRow;

void drawPlayer() {
  playerX = calculateGridX() + playerCol * getCellSize();
  playerY = calculateGridY() + playerRow * getCellSize();
  fill(#FCB824);
  ellipseMode(CORNER);
  circle(playerX, playerY, getCellSize());
}

void movePlayer(String direction) {
  switch(direction) {
  case "UP":
    if (playerRow > 0) {
      playerRow--;
      updateScore();
    }
    break;
  case "DOWN":
    if (playerRow < gridRows - 1) {
      playerRow++;
      updateScore();
    }
    break;
  case "LEFT":
    if (playerCol > 0) {
      playerCol--;
      updateScore();
    }
    break;
  case "RIGHT":
    if (playerCol < gridColumns - 1) {
      playerCol++;
      updateScore();
    }
    break;
  }
}


int getPlayerX() {
  return playerX;
}

int getPlayerY() {
  return playerY;
}
