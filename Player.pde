int playerCol, playerRow;
int playerTargetCol, playerTargetRow;
int cargoTargetCol, cargoTargetRow;


//   int oldPlayerCol = playerCol;
//   int oldPlayerRow = playerRow;

//Main method for moving player
void movePlayer() {
  int directionCol = changeInputToDirectionCol();
  int directionRow = changeInputToDirectionRow();

  calculatePlayerTargetCol(directionCol);
  calculatePlayerTargetRow(directionRow);

  if (isTileWalkable()) {
    movePlayerTo(playerTargetCol, playerTargetRow);
    updateScore();
  }
}

void drawPlayer() {
  int playerX = calculateGridX() + playerCol * getCellSize();
  int playerY = calculateGridY() + playerRow * getCellSize();
  fill(#FCB824);
  ellipseMode(CORNER);
  circle(playerX, playerY, getCellSize());
}

//Change keyboard input to column
int changeInputToDirectionCol() {
  int directionCol = 0;

  if (key == CODED) {
    switch(keyCode) {
    case LEFT:
      directionCol = -1;
      break;
    case RIGHT:
      directionCol = +1;
      break;
    }
  }
  return directionCol;
}

//Change keyboard input to row
int changeInputToDirectionRow() {
  int directionRow = 0;

  if (key == CODED) {
    switch(keyCode) {
    case UP:
      directionRow = -1;
      break;
    case DOWN:
      directionRow = +1;
      break;
    }
  }
  return directionRow;
}

int calculatePlayerTargetCol(int directionCol) {
  int playerTargetCol = calculateTargetCol(playerCol, directionCol);
  return playerTargetCol;
}

int calculatePlayerTargetRow(int directionRow) {
  int playerTargetRow = calculateTargetRow(playerRow, directionRow);
  return playerTargetRow;
}

//Check if player's target is valid
boolean isTileWalkable() {
  if (checkIfWithinGridBoundaries(playerTargetCol, playerTargetRow) == false) {
    return false;
  } else if (isInElectricField(playerTargetCol, playerTargetRow)) {
    return false;
  } else {
    return true;
  }
}

void movePlayerTo(int playerTargetCol, int playerTargetRow) {
  playerCol = playerTargetCol;
  playerRow = playerTargetRow;
}

//   //check pullCargoMode
//   if (pullCargoMode) {
//     int pullCol = oldPlayerCol - directionCol;
//     int pullRow = oldPlayerRow - directionRow;

//     int cargoPullIndex = isTileOccupied(pullCol, pullRow);

//     if (cargoPullIndex != -1) {
//       cargoCol[cargoPullIndex] = oldPlayerCol;
//       cargoRow[cargoPullIndex] = oldPlayerRow;
//     }
//   }
// }

boolean checkIfWithinGridBoundaries(int col, int row) {
  if (col < 0 || col > gridColumns -1 || row < 0 || row > gridRows -1) {
    return false;
  } else {
    return true;
  }
}

int calculateTargetCol(int col, int directionCol) {
  return col + directionCol;
}

int calculateTargetRow(int row, int directionRow) {
  return row + directionRow;
}
