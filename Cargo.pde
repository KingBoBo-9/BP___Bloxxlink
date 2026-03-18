boolean pullCargoMode = false;
boolean gameOver = false;

int cargoCount = 5;
int[] cargoCol = new int[cargoCount];
int[] cargoRow = new int[cargoCount];
int[] cargoColCopy = new int[cargoCount];
int[] cargoRowCopy = new int[cargoCount];

void initCargoArrays (int cargoCount) {
  cargoCol = new int[cargoCount];
  cargoRow = new int[cargoCount];
  cargoColCopy = new int[cargoCount];
  cargoRowCopy = new int[cargoCount];
}

//Set initial positions of all cargo
void initCargoes() {
  for (int i = 0; i < cargoCount; i++) {
    cargoCol[i] = int(random(getGridColumns()));
    cargoRow[i] = int(random(getGridRows()));

    while (isTileOccupiedByExistingCargo(cargoCol[i], cargoRow[i], i) ||
      isObstacle(cargoCol[i], cargoRow[i]) ||
      isInElectricField(cargoCol[i], cargoRow[i])||
      cargoCol[i] == playerCol && cargoRow[i] == playerRow) {
      cargoCol[i] = int(random(getGridColumns()));
      cargoRow[i] = int(random(getGridRows()));
    }
  }
}

void drawCargo() {
  for (int i = 0; i < cargoCount; i++) {
    int cargoX = calculateGridX() + cargoCol[i] * getCellSize();
    int cargoY = calculateGridY() + cargoRow[i] * getCellSize();

    rectMode(CORNER);
    fill(#17911b);
    square(cargoX, cargoY, getCellSize());
  }
}

//Check if cargo above, under, or next to
boolean checkForCargo() {
  if (key == RETURN || key == ENTER) {
    for (int i = 0; i < cargoCount; i++) {
      int colDifference = abs(cargoCol[i] - playerCol);
      int rowDifference = abs(cargoRow[i] - playerRow);

      if (colDifference + rowDifference == 1) {
        return true;
      }
    }
    return false;
  }
  return false;
}

void togglePullCargoMode() {
  //Enable pullCargoMode when near cargo
  if (checkForCargo()) {
    pullCargoMode = !pullCargoMode;
    return;
  }

  //Disable pullCargoMode when it's already active
  if (pullCargoMode) {
    if (key == RETURN || key == ENTER) {
      pullCargoMode = !pullCargoMode;
      return;
    }
  }
}

void sortCargoRowsAndCols() {
  arrayCopy(cargoCol, cargoColCopy);
  cargoColCopy = sort(cargoColCopy);

  arrayCopy(cargoRow, cargoRowCopy);
  cargoRowCopy = sort(cargoRowCopy);
}

//Check if all cargo is HORIZONTALLY connected
boolean isCargoConnectedRow() {
  for (int i = 0; i < cargoColCopy.length - 1; i++) {
    if (cargoColCopy[i + 1] - cargoColCopy[i] != 1) {
      return false;
    }
  }
  return true;
}

//Check if all cargo is on the same ROW
boolean isCargoOnSameRow() {
  for (int i = 1; i < cargoRow.length; i++) {
    if (cargoRow[i] != cargoRow[0]) {
      return false;
    }
  }
  return true;
}

//Check if all cargo is VERTICALLY connected
boolean isCargoConnectedCol() {
  for (int i = 0; i < cargoRowCopy.length - 1; i++) {
    if (cargoRowCopy[i + 1] - cargoRowCopy[i] != 1) {
      return false;
    }
  }
  return true;
}

//Check if all cargo is on the same COLUMN
boolean isCargoOnSameCol() {
  for (int i = 1; i < cargoCol.length; i++) {
    if (cargoCol[i] != cargoCol[0]) {
      return false;
    }
  }
  return true;
}

//Check if game win condition is met:
boolean gameIsOver() {
  sortCargoRowsAndCols();

  if ((isCargoConnectedRow() == true && isCargoOnSameRow() == true) || (isCargoConnectedCol() == true && isCargoOnSameCol() == true)) {
    //TO-DO: Delete
    println("GAME WON");
    return gameOver = true;
  } else {
    print("gameOver = " + gameOver);
    return gameOver = false;
  }
}


//////////////               ///////////////               ///////////////               ///////////////               ///////////////
void moveCargo() {
  int cargoIndex = getCargoIndex(playerTargetCol, playerTargetRow);

  if (cargoIndex == -1) {
    return;
  }

  int cargoTargetRow = calculateCargoTargetRow(cargoIndex, changeInputToDirectionRow());
  int cargoTargetCol = calculateCargoTargetCol(cargoIndex, changeInputToDirectionCol());

  if (isTileValidForCargo(cargoTargetCol, cargoTargetRow)) {
    moveCargoTo(cargoIndex, cargoTargetCol, cargoTargetRow);
  }
}

int getCargoIndex(int col, int row) {
  for (int i = 0; i < cargoCount; i++) {
    if (cargoCol[i] == col && cargoRow[i] == row) {
      return i;
    }
  }
  return -1;
}

int calculateCargoTargetRow(int cargoIndex, int directionRow) {
  if (cargoIndex != -1) {
    int cargoTargetRow = cargoRow[cargoIndex] + directionRow;
    return cargoTargetRow;
  }
  return 0 ;
}

int calculateCargoTargetCol(int cargoIndex, int directionCol) {
  if (cargoIndex != -1) {
    int cargoTargetCol = cargoCol[cargoIndex] + directionCol;
    return cargoTargetCol;
  }
  return 0;
}
boolean isTileValidForCargo(int cargoTargetCol, int cargoTargetRow) {
  // check if there's cargo at cargoTarget
  // Then check if cargo moves within grid
  // Finally check if cargo moves into obstacle field

  for (int i = 0; i < cargoCount; i++) {
    if (cargoTargetCol == cargoCol[i] && cargoTargetRow == cargoRow[i]) {
      return false;
    } else if (cargoTargetCol < 0 || cargoTargetCol > gridColumns - 1 || cargoTargetRow < 0 || cargoTargetRow > gridRows - 1) {
      return false;
    } else if (isInElectricField(cargoTargetCol, cargoTargetRow)) {
      return false;
    }
  }
  return true;
}

void moveCargoTo(int cargoIndex, int cargoTargetCol, int cargoTargetRow) {
  cargoCol[cargoIndex] = cargoTargetCol;
  cargoRow[cargoIndex] = cargoTargetRow;
}

void pullCargoTo(int directionCol, int directionRow) {
  if (pullCargoMode) {
    int pullCol = oldPlayerCol - directionCol;
    int pullRow = oldPlayerRow - directionRow;

    int cargoPullIndex = getCargoIndex(pullCol, pullRow);

    if (cargoPullIndex != -1) {
      cargoCol[cargoPullIndex] = oldPlayerCol;
      cargoRow[cargoPullIndex] = oldPlayerRow;
    }
  }
}
