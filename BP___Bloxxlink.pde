boolean newGame = true;

void setup() {
  size(800, 700);
  // fullScreen();
  drawMap(width / 2, height / 2);

  initCargoes();
  initObstacles();
}

void draw() {
  if (newGame == true) {
    showStartScreen();
  } else if (gameOver == true) {
    showEndScreen();
    drawButton(width / 2, height - rectHeight);
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
  if (gameOver == false) {
    movePlayer();
    moveCargo();
    checkForCargo();
    togglePullCargoMode();
    gameIsOver();
  }
}

void mousePressed() {
  if (buttonIsPressed()) {
    startNewGame();
  }
}

void startNewGame() {
  gameOver = false;
  initCargoes();
  initObstacles();
  drawPlayer();
  setPlayer1Score(1000);
}
