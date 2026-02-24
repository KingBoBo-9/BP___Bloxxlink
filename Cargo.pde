int cargoSize = 30;
int cargoX, cargoY;


void initCargo() {
  int cargoCol = int(random(getGridColumns()));
  int cargoRow = int(random(getGridRows()));

  cargoX = calculateGridX() + cargoCol * cellSize;
  cargoY = calculateGridY() + cargoRow * cellSize;

  println("cargoCol: " + cargoCol);
  println("cargoRow: " + cargoRow);
}


void drawCargo() {
  rectMode(CORNER);
  fill(#17911b);
  square(cargoX, cargoY, cargoSize);
}


int getCargoX() {
  return cargoX;
}

int getCargoY() {
  return cargoY;
}
