int playerCol, playerRow;
int playerTargetCol, playerTargetRow;


void drawPlayer() {
  int playerX = calculateGridX() + playerCol * getCellSize();
  int playerY = calculateGridY() + playerRow * getCellSize();
  fill(#FCB824);
  ellipseMode(CORNER);
  circle(playerX, playerY, getCellSize());
}

void movePlayer(String direction) {
  //change direction to Col/Row
  int directionCol = 0;
  int directionRow = 0;

  switch (direction) {
  case "UP":
    directionRow = -1;
    break;
  case "DOWN":
    directionRow = +1;
    break;
  case "LEFT":
    directionCol = -1;
    break;
  case "RIGHT":
    directionCol = +1;
    break;
  }

  //Calculate player target
  playerTargetCol = playerCol + directionCol;
  playerTargetRow = playerRow + directionRow;

  //check grid boundaries
  //check if cargo
  //if cargo
  //calculate cargo target
  //check if cargo stays in grid
  //move cargo
  //move player
}
