int cargoTargetCol, cargoTargetRow;
boolean pullCargoMode = false;


int cargoCount = 3;
int[] cargoCol = new int[cargoCount];
int[] cargoRow = new int[cargoCount];
int[] cargoColCopy = new int[cargoCount];
int[] cargoRowCopy = new int[cargoCount];


//Set initial positions of all cargo
void initCargoes() {
  for (int i = 0; i < cargoCount; i++) {
    cargoCol[i] = int(random(getGridColumns()));
    cargoRow[i] = int(random(getGridRows()));
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

boolean togglePullCargoMode() {
  pullCargoMode = !pullCargoMode;
  return pullCargoMode;
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
boolean checkIfGameIsWon() {
  sortCargoRowsAndCols();

  if ((isCargoConnectedRow() == true && isCargoOnSameRow() == true) || (isCargoConnectedCol() == true && isCargoOnSameCol() == true)) {
    return true;
  } else {
    return false;
  }
}







////////////////            ///////////////               //////////////
// int getCargoIndex() {
//   int cargoIndex = isTileOccupied(playerTargetCol, playerTargetRow);
//   return cargoIndex;
// }

// void handlePushCargo(int cargoIndex, int directionCol, int directionRow) {
//   if (cargoIndex != -1) {
//     cargoTargetCol = cargoCol[cargoIndex] + directionCol;
//     cargoTargetRow = cargoRow[cargoIndex] + directionRow;
//   }
// }

// boolean isTileValidForCargo() {
//   // check if there's cargo at cargoTarget
//   // Then check if cargo moves within grid
//   // Finally check if cargo moves into obstacle field

//   for (int i = 0; i < cargoCount; i++) {
//     if (cargoTargetCol == cargoCol[i] && cargoTargetRow == cargoRow[i]) {
//       return false;
//     } else if (cargoTargetCol < 0 || cargoTargetCol > gridColumns - 1 || cargoTargetRow < 0 || cargoTargetRow > gridRows - 1) {
//       return false;
//     } else if (isInElectricField(cargoTargetCol, cargoTargetRow)) {
//       return false;
//     }
//   }
//   return true;
// }

// void moveCargo(int cargoIndex) {
//   cargoCol[cargoIndex] = cargoTargetCol;
//   cargoRow[cargoIndex] = cargoTargetRow;
// }