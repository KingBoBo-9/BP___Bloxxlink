void settings() {
  size(800, 700);
  // fullScreen();
}

void setup() {
  drawMap(width / 2, height / 2);
  initCargo();
  initObstacle();
}

void draw() {
  background(100);

  drawGrid();
  drawScore();
  drawCargo();
  drawPlayer();
  drawObstacle();
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



  println(checkIfGameIsWon());
}
