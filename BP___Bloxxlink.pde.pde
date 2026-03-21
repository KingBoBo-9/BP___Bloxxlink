boolean runTests = false;

int gameState = 0;

void setup() {
  size(800, 700);

  drawMap(width / 2, height / 2);
  initStartScreenButtons();
  initPlayAgainButton();

  //For testing
  if (runTests) {
    ;
  }
}

void draw() {
  if (gameState == 0) {             //show start screen
    showStartScreen();
    drawStartButtons();
  } else if (gameState == 1) {      //show play screen
    drawGame();
  } else if (gameState == 2) {      //Game-Over: show end screen
    showEndScreen();
    drawPlayAgainButton();
  }
}

void keyPressed() {
  if (gameState == 1) {
    movePlayer();
    moveCargo();
    checkForCargo();
    togglePullCargoMode();
    gameIsWon();
  }
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

void showStartScreen() {
  background(#d99029);
}

void showEndScreen() {
  background(200);
  textAlign(CENTER, CENTER);
  fill(0);
  textSize(width / 20);
  text("Winner: " + winner, width / 2, height / 2);
  text("Score: " + getPlayer1Score(), width / 2, height / 2 + height / 10);
}

void setGameState(int state) {
  gameState = state;
}
