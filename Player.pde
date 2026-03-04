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
  if (playerTargetCol < 0 || playerTargetCol > gridColumns - 1 || playerTargetRow < 0 || playerTargetRow > gridRows - 1) {
    return;
  }

  //check if cargo
  int cargoIndex = -1;
  for (int i = 0; i < cargoCount; i++) {
    if (playerTargetCol == cargoCol[i] && playerTargetRow == cargoRow[i]) {
      cargoIndex = i;
      break;
    }
  }

  //if cargo
  //calculate cargo target
  if (cargoIndex != -1) {
    int cargoTargetCol = cargoCol[cargoIndex] + directionCol;
    int cargoTargetRow = cargoRow[cargoIndex] + directionRow;

    //check if cargo stays in grid
    if (cargoTargetCol < 0 || cargoTargetCol > gridColumns - 1 || cargoTargetRow < 0 || cargoTargetRow > gridRows - 1) {
      return;
    }

    //move cargo
    cargoCol[cargoIndex] = cargoTargetCol;
    cargoRow[cargoIndex] = cargoTargetRow;
  }

  //move player
  playerCol = playerTargetCol;
  playerRow = playerTargetRow;
}
