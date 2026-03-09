void settings() {
  size(500, 400);
  // fullScreen();
}

void setup() {
  drawMap(width / 2, height / 2);
  initCargo();
  // initObstacle();
}

void draw() {
  background(100);
  drawGrid();
  drawScore();
  drawCargo();
  drawPlayer();
}


void keyPressed() {
  movePlayer();

  if (key == RETURN || key == ENTER) {

    if (checkForCargo() == true) {
      togglePullCargoMode();
    }
    println("checkForCargo = " + checkForCargo());
    println("togglePullCargoMode = " + pullCargoMode);
  }

  // if (key == TAB) {
  //   println("COL COPY");
  //   printArray(cargoColCopy);
  //   println("ROW COPY");
  //   printArray(cargoRowCopy);
  // }

  sortCargoRowsAndCols();

  if (isCargoConnectedRow() == true && isCargoOnSameRow() == true) {
    println("Big horizontal true");
  }

  if (isCargoConnectedCol() == true && isCargoOnSameCol() == true) {
    println("Big vertical true");
  }
}
