int cargoX, cargoY;
boolean pullCargoMode = false;




int cargoCount = 3;
int[] cargoCol = new int[cargoCount];
int[] cargoRow = new int[cargoCount];
int[] cargoColCopy = new int[cargoCount];
int[] cargoRowCopy = new int[cargoCount];


void initCargo() {
  for (int i = 0; i < cargoCount; i++) {
    cargoCol[i] = int(random(getGridColumns()));
    cargoRow[i] = int(random(getGridRows()));
  }
}


void drawCargo() {
  for (int i = 0; i < cargoCount; i++) {
    cargoX = calculateGridX() + cargoCol[i] * getCellSize();
    cargoY = calculateGridY() + cargoRow[i] * getCellSize();

    rectMode(CORNER);
    fill(#17911b);
    square(cargoX, cargoY, getCellSize());
  }
}

boolean togglePullCargoMode() {
  pullCargoMode = !pullCargoMode;
  return pullCargoMode;
}

boolean checkForCargo() {
  //checks if cargo is above, under, left of, or right of player.
  for (int i = 0; i < cargoCount; i++) {
    if (cargoCol[i] == playerCol && cargoRow[i] == playerRow -1) {
      return true;
    }
    if (cargoCol[i] == playerCol && cargoRow[i] == playerRow + 1) {
      return true;
    }
    if (cargoRow[i] == playerRow && cargoCol[i] == playerCol - 1) {
      return true;
    }
    if (cargoRow[i] == playerRow && cargoCol[i] == playerCol + 1) {
      return true;
    }
  }
  return false;
}

int getCargoIndexAt(int col, int row) {
  for (int i = 0; i < cargoCount; i++) {
    if (cargoCol[i] == col && cargoRow[i] == row) {
      return i;
    }
  }
  return -1;
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
  for (int i = 1; i < cargoRow.length - 1; i++) {
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
  for (int i = 1; i < cargoCol.length - 1; i++) {
    if (cargoCol[i] != cargoCol[0]) {
      return false;
    }
  }
  return true;
}