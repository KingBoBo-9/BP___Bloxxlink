int gameState = 0;


void setup() {
  size(800, 700);
  // fullScreen();
  drawMap(width / 2, height / 2);

  initStartScreenButtons();
}

void draw() {
  if (gameState == 0) { //show start screen
    showStartScreen();
    drawStartButtons();
  } else if (gameState == 1) { //show play screen
    background(100);
    drawGrid();
    drawScore();
    drawCargo();
    drawPlayer();
    drawObstacle();
  } else if (gameState == 2) { //show end screen
    showEndScreen();
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
  selectOptions();


  //end screen button
  // if (buttonIsPressed()) {
  //   startNewGame();
  // }
}

void startNewGame() {
  gameOver = false;
  initCargoes();
  initObstacles();
  drawPlayer();
  setPlayer1Score(1000);
}
