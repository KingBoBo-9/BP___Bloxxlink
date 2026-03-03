int cargoCol, cargoRow;
int cargoX, cargoY;
boolean pullCargoMode = false;

void initCargo() {
  cargoCol = int(random(getGridColumns()));
  cargoRow = int(random(getGridRows()));
}


void drawCargo() {
  cargoX = calculateGridX() + cargoCol * getCellSize();
  cargoY = calculateGridY() + cargoRow * getCellSize();

  rectMode(CORNER);
  fill(#17911b);
  square(cargoX, cargoY, getCellSize());
}


boolean togglePullCargoMode() {
  pullCargoMode = !pullCargoMode;
  return pullCargoMode;
}

boolean checkForCargo() {
  //checks if cargo is above, under, left of, or right of player.
  if (cargoCol == playerCol && cargoRow == playerRow -1) {
    return true;
  } else  if (cargoCol == playerCol && cargoRow == playerRow + 1) {
    return true;
  } else if (cargoRow == playerRow && cargoCol == playerCol - 1) {
    return true;
  } else if (cargoRow == playerRow && cargoCol == playerCol + 1) {
    return true;
  } else {
    return false;
  }
}
