int gameState = 0;

void setup() {
  size(800, 700);
  // fullScreen();

  drawMap(width / 2, height / 2);
  initStartScreenButtons();
  initPlayAgainButton();
}

void draw() {
  if (gameState == 0) {             //show start screen
    showStartScreen();
    drawStartButtons();
  } else if (gameState == 1) {      //show play screen
    drawGame();
  } else if (gameState == 2) {      //show end screen
    showEndScreen();
    drawPlayAgainButton();
  }
}

void keyPressed() {
  movePlayer();
  moveCargo();
  checkForCargo();
  togglePullCargoMode();
  gameIsWon();
}

void mousePressed() {
  if (gameState == 0) {
    selectOptions();
  } else if (gameState == 2) {
    if (playAgainButtonClicked()) {
      startNewGame();
    }
  }
}

void startNewGame() {
  gameState = 0;
  initCargoes();
  initObstacles();
  drawPlayer();
  setPlayer1Score(1000);
}

void drawGame() {
  background(100);
  drawGrid();
  drawScore();
  drawCargo();
  drawPlayer();
  drawObstacle();
}
