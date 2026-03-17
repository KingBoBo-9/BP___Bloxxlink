final int BUTTON_COUNT = 7;

int[] buttonX = new int[BUTTON_COUNT];
int[] buttonY = new int[BUTTON_COUNT];
int[] buttonW = new int[BUTTON_COUNT];
int[] buttonH = new int[BUTTON_COUNT];
String[] buttonText = new String[BUTTON_COUNT];

void initStartScreenButtons() {


  buttonX[0] = width/2 - width / 6;
  buttonY[0] = height/3;
  buttonW[0] = 100;
  buttonH[0] = 60;
  buttonText[0] = "5 blocks";

  buttonX[1] = width/2;
  buttonY[1] = height/3;
  buttonW[1] = 100;
  buttonH[1] = 60;
  buttonText[1] = "10 blocks";

  buttonX[2] = width/2 + width / 6;
  buttonY[2] = height/3;
  buttonW[2] = 100;
  buttonH[2] = 60;
  buttonText[2] = "15 blocks";

  buttonX[3] = width/2 - width / 6;
  buttonY[3] = height/3 + width / 6;
  buttonW[3] = 100;
  buttonH[3] = 60;
  buttonText[3] = "5 obstacles";

  buttonX[4] = width/2;
  buttonY[4] = height/3 + width / 6;
  buttonW[4] = 100;
  buttonH[4] = 60;
  buttonText[4] = "10 obstacles";

  buttonX[5] = width/2 + width / 6;
  buttonY[5] = height/3 + width / 6;
  buttonW[5] = 100;
  buttonH[5] = 60;
  buttonText[5] = "15 obstacles";

  buttonX[6] = width/2;
  buttonY[6] = height/2 + width / 5;
  buttonW[6] = 100;
  buttonH[6] = 60;
  buttonText[6] = "Start";
}
