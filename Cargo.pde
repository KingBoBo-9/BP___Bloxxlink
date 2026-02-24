int cargoX, cargoY;


void initCargo() {
  int cargoCol = int(random(getGridColumns()));
  int cargoRow = int(random(getGridRows()));

  cargoX = calculateGridX() + cargoCol * getcellSize();
  cargoY = calculateGridY() + cargoRow * getcellSize();
}


void drawCargo() {
  rectMode(CORNER);
  fill(#17911b);
  square(cargoX, cargoY, getcellSize());
}


int getCargoX() {
  return cargoX;
}

int getCargoY() {
  return cargoY;
}
