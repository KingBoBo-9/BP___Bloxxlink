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
  movePlayer();
  moveCargo();
  checkForCargo();
  togglePullCargoMode();

  //To-do: delete
  //   println("PullCargoMode is now: " + pullCargoMode);
  // println("Game is won = " + checkIfGameIsWon());
}
