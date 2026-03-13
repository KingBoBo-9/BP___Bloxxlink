int numberOfObstacles = 3;
int obstacleX, obstacleY;
int[] obstacleCol = new int[numberOfObstacles];
int[] obstacleRow = new int[numberOfObstacles];

void initObstacles() {
  for (int i = 0; i < numberOfObstacles; i++) {
    obstacleCol[i] = int(random(getGridColumns()));
    obstacleRow[i] = int(random(getGridRows()));
  }
}

void drawObstacle() {
  for (int i = 0; i < numberOfObstacles; i++) {

    obstacleX = calculateGridX() + obstacleCol[i] * getCellSize();
    obstacleY = calculateGridY() + obstacleRow[i] * getCellSize();

    fill(#32a8a8);
    square(obstacleX - getCellSize(), obstacleY - getCellSize(), 3 * getCellSize());

    rectMode(CORNER);
    fill(#62ade3);
    square(obstacleX, obstacleY, getCellSize());

    fill(255, 0, 0);
  }
}

boolean isInElectricField(int col, int row) {
  for (int i = 0; i < numberOfObstacles; i++) {
    //top left
    if (col == obstacleCol[i] -1 && row == obstacleRow[i] -1) {
      return true;
    }
    //top
    if (row == obstacleRow[i] -1 && col == obstacleCol[i]) {
      return true;
    }
    //top right
    if (row == obstacleRow[i] -1 && col == obstacleCol[i] + 1) {
      return true;
    }
    //left
    if (col == obstacleCol[i] -1 && row == obstacleRow[i]) {
      return true;
    }
    //right
    if (col == obstacleCol[i] +1 && row == obstacleRow[i]) {
      return true;
    }
    //bottom left
    if (col == obstacleCol[i] -1 && row == obstacleRow[i] +1) {
      return true;
    }
    //bottom
    if (col == obstacleCol[i] && row == obstacleRow[i] +1) {
      return true;
    }
    //bottom right
    if (col == obstacleCol[i] +1 && row == obstacleRow[i] +1) {
      return true;
    }
  }
  return false;
}
