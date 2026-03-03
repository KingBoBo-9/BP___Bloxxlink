int playerX, playerY, playerCol, playerRow;
int playerTargetCol, playerTargetRow;


void drawPlayer() {
  playerX = calculateGridX() + playerCol * getCellSize();
  playerY = calculateGridY() + playerRow * getCellSize();
  fill(#FCB824);
  ellipseMode(CORNER);
  circle(playerX, playerY, getCellSize());
}

void movePlayer(String direction) {
  playerTargetCol = playerCol;
  playerTargetRow = playerRow;

  switch(direction) {
  case "UP":
    playerTargetCol = playerCol;
    playerTargetRow = playerRow - 1;
    //Check if player stays within grid
    if (playerTargetRow < 0) {
      break;
    }
    //Check if there is cargo at player's target position
    if (playerTargetCol == cargoCol && playerTargetRow == cargoRow) {
      //Check where cargo should go
      int cargoTargetRow = cargoRow - 1;
      //Check if cargo stays within grid
      if (cargoTargetRow < 0) {
        break;
      }

      cargoRow = cargoTargetRow;
      playerRow = playerTargetRow;
    } else {
      playerRow = playerTargetRow;
    }

    updateScore();
    break;

  case "DOWN":
    playerTargetCol = playerCol;
    playerTargetRow = playerRow + 1;
    //Check if player stays within grid
    if (playerTargetRow > gridRows - 1) {
      break;
    }
    //Check if there is cargo at player's target position
    if (playerTargetCol == cargoCol && playerTargetRow == cargoRow) {
      //Check where cargo should go
      int cargoTargetRow = cargoRow + 1;
      //Check if cargo stays within grid
      if (cargoTargetRow > gridRows - 1) {
        break;
      }

      cargoRow = cargoTargetRow;
      playerRow = playerTargetRow;
    } else {
      playerRow = playerTargetRow;
    }

    updateScore();
    break;



  case "LEFT":
    playerTargetCol = playerCol - 1;
    playerTargetRow = playerRow;

    if (playerTargetCol < 0) {
      break;
    }

    if (playerTargetCol == cargoCol && playerTargetRow == cargoRow) {

      int cargoTargetCol = cargoCol - 1;

      if (cargoTargetCol < 0) {
        break;
      }

      cargoCol = cargoTargetCol;
      playerCol = playerTargetCol;
    } else {
      playerCol = playerTargetCol;
    }

    updateScore();
    break;


  case "RIGHT":
    playerTargetCol = playerCol + 1;
    playerTargetRow = playerRow;
    if (playerTargetCol > gridColumns - 1) {
      break;
    }
    if (playerTargetCol == cargoCol && playerTargetRow == cargoRow) {
      int cargoTargetCol = cargoCol + 1;
      if (cargoTargetCol > gridColumns - 1) {
        break;
      }

      cargoCol = cargoTargetCol;
      playerCol = playerTargetCol;
    } else {
      playerCol = playerTargetCol;
    }

    updateScore();
    break;
  }
}


int getPlayerX() {
  return playerX;
}

int getPlayerY() {
  return playerY;
}
