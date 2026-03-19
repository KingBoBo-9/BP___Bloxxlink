final int BUTTON_COUNT = 7;

int[] buttonX = new int[BUTTON_COUNT];
int[] buttonY = new int[BUTTON_COUNT];
int[] buttonW = new int[BUTTON_COUNT];
int[] buttonH = new int[BUTTON_COUNT];
String[] buttonText = new String[BUTTON_COUNT];
int[] playAgainButton = new int [4];

void initPlayAgainButton() {
  playAgainButton[0] = width/2;
  playAgainButton[1] = height/2 + width / 5;
  playAgainButton[2] = 100;
  playAgainButton[3] = 60;
}

void initStartScreenButtons() {
  for (int i = 0; i < BUTTON_COUNT; i++) {
    buttonW[i] = 100;
    buttonH[i] = 60;
  }

  buttonX[0] = width/2 - width / 6;
  buttonY[0] = height/3;
  buttonText[0] = "5 cargo";

  buttonX[1] = width/2;
  buttonY[1] = height/3;
  buttonText[1] = "10 cargo";

  buttonX[2] = width/2 + width / 6;
  buttonY[2] = height/3;
  buttonText[2] = "15 cargo";

  buttonX[3] = width/2 - width / 6;
  buttonY[3] = height/3 + width / 6;
  buttonText[3] = "5 obstacles";

  buttonX[4] = width/2;
  buttonY[4] = height/3 + width / 6;
  buttonText[4] = "7 obstacles";

  buttonX[5] = width/2 + width / 6;
  buttonY[5] = height/3 + width / 6;
  buttonText[5] = "9 obstacles";

  buttonX[6] = width/2;
  buttonY[6] = height/2 + width / 5;
  buttonText[6] = "Start";
}

void drawStartButtons() {
  for (int i = 0; i < BUTTON_COUNT; i++) {
    fill(#F59E34);
    rectMode(CENTER);
    rect(buttonX[i], buttonY[i], buttonW[i], buttonH[i]);

    fill(0);
    textSize(15);
    textAlign(CENTER, CENTER);
    text(buttonText[i], buttonX[i], buttonY[i]);
  }
}

int getStartButtonsClicked() {
  for (int i = 0; i < BUTTON_COUNT; i++) {
    //Check if mouse click within button boundaries
    if (mouseX >= buttonX[i] - buttonW[i]/2 &&
      mouseX <= buttonX[i] + buttonW[i]/2 &&
      mouseY >= buttonY[i] - buttonH[i]/2 &&
      mouseY <= buttonY[i] + buttonH[i]/2) {
      //return which button is clicked
      return i;
    }
  }
  //no button is clicked
  return -1;
}

void drawPlayAgainButton() {
  int buttonX = playAgainButton[0];
  int buttonY = playAgainButton[1];
  int buttonW = playAgainButton[2];
  int buttonH = playAgainButton[3];
  String buttonText = "Play Again";

  fill(#F59E34);
  rectMode(CENTER);
  rect(buttonX, buttonY, buttonW, buttonH);

  fill(0);
  textSize(15);
  textAlign(CENTER, CENTER);
  text(buttonText, buttonX, buttonY);
}

boolean playAgainButtonClicked() {
  if (mouseX >= playAgainButton[0] - playAgainButton[2]/2 &&
    mouseX <= playAgainButton[0] + playAgainButton[2]/2 &&
    mouseY >= playAgainButton[1] - playAgainButton[3]/2 &&
    mouseY <= playAgainButton[1] + playAgainButton[3]/2) {

    return true;
  }
  return false;
}

void selectOptions() {
  int pressedButton = getStartButtonsClicked();

  switch(pressedButton) {
  case 0:
    cargoCount = 5;
    break;
  case 1:
    cargoCount = 10;
    break;
  case 2:
    cargoCount = 15;
    break;
  case 3:
    obstacleCount = 5;
    break;
  case 4:
    obstacleCount = 7;
    break;
  case 5:
    obstacleCount = 9;
    break;
  case 6:
    initCargoArrays(cargoCount);
    initObstacles();
    initCargoes();
    initPlayer();
    gameState = 1;
    break;
  }
}
