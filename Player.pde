int playerCol, playerRow;
int playerTargetCol, playerTargetRow;
int oldPlayerCol, oldPlayerRow;

//Main method for moving player
void movePlayer() {

  int directionCol = changeInputToDirectionCol();
  int directionRow = changeInputToDirectionRow();
  oldPlayerCol = playerCol;
  oldPlayerRow = playerRow;


  playerTargetCol = calculatePlayerTargetCol(directionCol);
  playerTargetRow = calculatePlayerTargetRow(directionRow);

  if (isTileWalkable(playerTargetCol, playerTargetRow)) {
    movePlayerTo(playerTargetCol, playerTargetRow);
    updateScore();
  }
  pullCargoTo(directionCol, directionRow);
}

void drawPlayer() {
  int playerX = calculateGridX() + playerCol * getCellSize();
  int playerY = calculateGridY() + playerRow * getCellSize();
  fill(#FCB824);
  ellipseMode(CORNER);
  circle(playerX, playerY, getCellSize());
}

void initPlayer() {
  playerRow = int(random(getGridColumns()));
  playerCol = int(random(getGridRows()));

  while (isTileBlocked(playerRow, playerCol)) {
    playerCol = int(random(getGridColumns()));
    playerRow = int(random(getGridRows()));
  }
}
//Transforms keyboard input to direction columns
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

//Transforms keyboard input to direction rows
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

int calculateTargetCol(int col, int directionCol) {
  return col + directionCol;
}

int calculateTargetRow(int row, int directionRow) {
  return row + directionRow;
}
//Check if player's target is valid
boolean isTileWalkable(int playerTargetCol, int playerTargetRow) {
  if (checkIfWithinGridBoundaries(playerTargetCol, playerTargetRow) == false) {
    return false;
  } else if (isInElectricField(playerTargetCol, playerTargetRow)) {
    return false;
  } else {
    return true;
  }
}

boolean checkIfWithinGridBoundaries(int col, int row) {
  if (col < 0 || col > gridColumns -1 || row < 0 || row > gridRows -1) {
    return false;
  } else {
    return true;
  }
}

void movePlayerTo(int playerTargetCol, int playerTargetRow) {
  playerCol = playerTargetCol;
  playerRow = playerTargetRow;
}

boolean isCargoOnPlayerTarget(int playerTargetCol, int playerTargetRow) {
  for (int i = 0; i < cargoCount; i++) {
    if (playerTargetCol == cargoCol[i] && playerTargetRow == cargoRow[i]) {
      println("There's cargo there");
      return true;
    }
  }
  return false;
}
