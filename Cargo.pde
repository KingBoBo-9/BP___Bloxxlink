int cargoCol, cargoRow;
int cargoX, cargoY;
boolean pullCargoMode = false;
boolean checkForCargo = false;

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


int getCargoX() {
  return cargoX;
}

int getCargoY() {
  return cargoY;
}

boolean togglePullCargoMode() {
  return pullCargoMode = !pullCargoMode;
}

// boolean checkForCargo() {
//   return;
//}
