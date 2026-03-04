int cargoX, cargoY;
boolean pullCargoMode = false;

int cargoCount = 3;
int[] cargoCol = new int[cargoCount];
int[] cargoRow = new int[cargoCount];





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
