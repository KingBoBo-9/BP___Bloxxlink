boolean newGame = true;
boolean startGame = false;

void setup() {
  size(800, 700);
  // fullScreen();
  drawMap(width / 2, height / 2);

  initStartScreenButtons();
}

void draw() {
  if (startGame == false) {
    showStartScreen();
    drawStartButtons();
  } else if (startGame == true) {
    background(100);
    drawGrid();
    drawScore();
    drawCargo();
    drawPlayer();
    drawObstacle();
  }
  // if (newGame == true) {

  // } else if (gameOver == true) {
  // showEndScreen();
  // drawButton(width / 2, height - width / 6, width / 6, height /15);
  // } else {
  //
  // }
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
