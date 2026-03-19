int playerCol, playerRow;
int playerTargetCol, playerTargetRow;
int oldPlayerCol, oldPlayerRow;

//Main method for moving player
void movePlayer() {

  int directionCol = changeInputToDirectionCol();
  int directionRow = changeInputToDirectionRow();

  oldPlayerCol = playerCol;
  oldPlayerRow = playerRow;

  playerTargetCol = calculatePlayerTargetCol(playerCol, directionCol);
  playerTargetRow = calculatePlayerTargetRow(playerRow, directionRow);

  if (isCellWalkable(playerTargetCol, playerTargetRow)) {
    movePlayerTo(playerTargetCol, playerTargetRow);
    updateScore();
  }
  pullCargoTo(directionCol, directionRow);
}

//Set initial position of player
void initPlayer() {
  playerCol = int(random(getGridColumns()));
  playerRow = int(random(getGridRows()));

  //Check if selected Col and Row are occupied
  //If occupied -> try new Col and Row
  while (isCellBlocked(playerRow, playerCol)) {
    playerCol = int(random(getGridColumns()));
    playerRow = int(random(getGridRows()));
  }
}

void drawPlayer() {
  int playerX = calculateGridX() + playerCol * getCellSize();
  int playerY = calculateGridY() + playerRow * getCellSize();

  fill(#FCB824);
  ellipseMode(CORNER);
  circle(playerX, playerY, getCellSize());
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

int calculatePlayerTargetCol(int col, int directionCol) {
  return col + directionCol;
}

int calculatePlayerTargetRow(int row, int directionRow) {
  return row + directionRow;
}

//Check if player's target is valid
boolean isCellWalkable(int playerTargetCol, int playerTargetRow) {
  if (checkIfWithinGridBoundaries(playerTargetCol, playerTargetRow) == false) {
    return false;
  } else if (isInElectricField(playerTargetCol, playerTargetRow)) {
    return false;
  } else {
    return true;
  }
}

boolean checkIfWithinGridBoundaries(int col, int row) {
  if (col < 0 || col > GRID_COLUMNS -1 || row < 0 || row > GRID_ROWS -1) {
    return false;
  } else {
    return true;
  }
}

void movePlayerTo(int playerTargetCol, int playerTargetRow) {
  playerCol = playerTargetCol;
  playerRow = playerTargetRow;
}
