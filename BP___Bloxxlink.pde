boolean newGame = true;
boolean startGame = false;


void setup() {
  size(800, 700);
  // fullScreen();
  drawMap(width / 2, height / 2);

  initStartScreenButtons();
}

void draw() {
  if (gameOver == true) {
    showEndScreen();
  } else if (game)


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
    } else if (gameOver == true) {
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
