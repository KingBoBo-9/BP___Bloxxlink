void setup() {
  size(800, 700);
  // fullScreen();
  drawMap(width / 2, height / 2);

  initCargoes();
  initObstacles();
}

void draw() {
  if (gameOver == true) {
    showEndScreen();
    drawButton();
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
  gameIsOver();


  //To-do: delete
  //   println("PullCargoMode is now: " + pullCargoMode);
  // println("Game is won = " + gameIsOver());
}

void mousePressed() {
  if (buttonIsPressed()) {
    gameOver = false;
  }
}
