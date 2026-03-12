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

void movePlayer() {
  //change direction to Col/Row
  int directionCol = 0;
  int directionRow = 0;
  int oldPlayerCol = playerCol;
  int oldPlayerRow = playerRow;

  if (key == CODED) {
    switch(keyCode) {
    case UP:
      directionRow = -1;
      break;
    case DOWN:
      directionRow = +1;
      break;
    case LEFT:
      directionCol = -1;
      break;
    case RIGHT:
      directionCol = +1;
      break;
    }

    //Calculate player target
    playerTargetCol = calculatePlayerTargetCol(playerCol, directionCol);
    playerTargetRow = calculatePlayerTargetRow(playerRow, directionRow);

    //check grid boundaries
    if (playerTargetCol < 0 || playerTargetCol > gridColumns - 1 || playerTargetRow < 0 || playerTargetRow > gridRows - 1) {
      return;
    }

    //check if player moves into obstacle field
    if (isInElectricField(playerTargetCol, playerTargetRow)) {
      return;
    }

    //check if cargo on player target
    int cargoIndex = isTileOccupied(playerTargetCol, playerTargetRow);

    //if cargo
    //calculate cargo target
    if (cargoIndex != -1) {
      cargoTargetCol = cargoCol[cargoIndex] + directionCol;
      cargoTargetRow = cargoRow[cargoIndex] + directionRow;

      //check if there's cargo at cargoTarget
      for (int i = 0; i < cargoCount; i++) {
        if (cargoTargetCol == cargoCol[i] && cargoTargetRow == cargoRow[i]) {
          return;
        }
      }

      //check if cargo stays in grid
      if (cargoTargetCol < 0 || cargoTargetCol > gridColumns - 1 || cargoTargetRow < 0 || cargoTargetRow > gridRows - 1) {
        return;
      }

      if (isInElectricField(cargoTargetCol, cargoTargetRow)) {
        return;
      }

      //move cargo
      cargoCol[cargoIndex] = cargoTargetCol;
      cargoRow[cargoIndex] = cargoTargetRow;
    }


    //move player
    playerCol = playerTargetCol;
    playerRow = playerTargetRow;

    updateScore();


    //check pullCargoMode
    if (pullCargoMode) {
      int pullCol = oldPlayerCol - directionCol;
      int pullRow = oldPlayerRow - directionRow;

      int cargoPullIndex = isTileOccupied(pullCol, pullRow);

      if (cargoPullIndex != -1) {
        cargoCol[cargoPullIndex] = oldPlayerCol;
        cargoRow[cargoPullIndex] = oldPlayerRow;
      }
    }
  }
}

int calculatePlayerTargetCol(int playerCol, int directionCol) {
  return playerCol + directionCol;
}

int calculatePlayerTargetRow(int playerRow, int directionRow) {
  return playerRow + directionRow;
}
