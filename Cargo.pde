int cargoX, cargoY;


void initCargo() {
  int cargoCol = int(random(getGridColumns()));
  int cargoRow = int(random(getGridRows()));

  cargoX = calculateGridX() + cargoCol * getCellSize();
  cargoY = calculateGridY() + cargoRow * getCellSize();
}


void drawCargo() {
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
