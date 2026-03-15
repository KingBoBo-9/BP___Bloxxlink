int playerCol, playerRow;
int playerTargetCol, playerTargetRow;
int cargoTargetCol, cargoTargetRow;



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

// void movePlayer() {

//   int oldPlayerCol = playerCol;
//   int oldPlayerRow = playerRow;


//   //Calculate player target
//   playerTargetCol = calculateTargetCol(playerCol, directionCol);
//   playerTargetRow = calculateTargetRow(playerRow, directionRow);

//   //check if player target is within playfield  boundaries
//   if (checkIfWithinGridBoundaries(playerTargetCol, playerTargetRow) == false) {
//     return;
//   }
//   //check if player moves into obstacle field
//   if (isInElectricField(playerTargetCol, playerTargetRow)) {
//     return;
//   }

//   // check if cargo on player target
//   int cargoIndex = isTileOccupied(playerTargetCol, playerTargetRow);

//   //if cargo
//   //calculate cargo target
//   if (cargoIndex != -1) {
//     cargoTargetCol = cargoCol[cargoIndex] + directionCol;
//     cargoTargetRow = cargoRow[cargoIndex] + directionRow;

//     //check if there's cargo at cargoTarget
//     for (int i = 0; i < cargoCount; i++) {
//       if (cargoTargetCol == cargoCol[i] && cargoTargetRow == cargoRow[i]) {
//         return;
//       }
//     }

//     //check if cargo stays in grid
//     if (cargoTargetCol < 0 || cargoTargetCol > gridColumns - 1 || cargoTargetRow < 0 || cargoTargetRow > gridRows - 1) {
//       return;
//     }

//     if (isInElectricField(cargoTargetCol, cargoTargetRow)) {
//       return;
//     }

//     //move cargo
//     cargoCol[cargoIndex] = cargoTargetCol;
//     cargoRow[cargoIndex] = cargoTargetRow;
//   }


//   //move player
//   if (canMove = true) {
//     playerCol = playerTargetCol;
//     playerRow = playerTargetRow;

//     updateScore();
//   }



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


void moveCargo() {
}


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
