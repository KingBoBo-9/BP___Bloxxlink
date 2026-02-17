int cargoSize = 30;
int cargoX, cargoY;

void initCargo() {
  cargoX = width / 2;
  cargoY = height / 2;
}


void drawCargo() {
  fill(#17911b);
  square(cargoX, cargoY, cargoSize);
}

void moveCargo() {
}
