void setup() {
  size(800, 700);
  // fullScreen();
  drawMap(width / 2, height / 2);

  initCargoes();
  initObstacles();
}

void draw() {
  if (gameIsOver()) {
    showEndScreen();
  } else {
    background(100);
    drawGrid();
    drawScore();
    drawCargo();
    drawPlayer();
    drawObstacle();
  }
}

void keyPressed() {
  movePlayer();
  moveCargo();
  checkForCargo();
  togglePullCargoMode();

  //To-do: delete
  //   println("PullCargoMode is now: " + pullCargoMode);
  // println("Game is won = " + gameIsOver());
}

void showEndScreen() {
  background(200);
  textAlign(CENTER, CENTER);
  fill(0);
  textSize(width / 20);
  text("Winner: " + winner, width / 2, height / 2);
  text("Score: " + getPlayer1Score(), width / 2, height / 2 + height / 10);
}
