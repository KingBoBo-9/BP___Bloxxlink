void setup() {
  size(800, 700);
  // fullScreen();
  drawMap(width / 2, height / 2);

  initCargoes();
  initObstacles();
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
  // movePlayer();
  changeInputToDirectionCol();
  changeInputToDirectionRow();




  //Press enter when next to cargo to pull cargo
  if (key == RETURN || key == ENTER) {
    if (checkForCargo() == true) {
      togglePullCargoMode();
    }
    println("checkForCargo = " + checkForCargo());
    println("togglePullCargoMode = " + pullCargoMode);
  }

  // println(checkIfGameIsWon());
}
