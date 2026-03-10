int numberOfObstacles = 3;
int obstacleX, obstacleY;



int[] obstacleCol = new int[numberOfObstacles];
int[] obstacleRow = new int[numberOfObstacles];

void initObstacle() {
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



boolean isPlayerInElectricField() {
  for (int i = 0; i < numberOfObstacles; i++) {
    //top left
    if (playerTargetCol == obstacleCol[i] -1 && playerTargetRow == obstacleRow[i] -1) {
      return true;
    }
    //top
    if (playerTargetRow == obstacleRow[i] -1 && playerTargetCol == obstacleCol[i]) {
      return true;
    }
    //top right
    if (playerTargetRow == obstacleRow[i] -1 && playerTargetCol == obstacleCol[i] + 1) {
      return true;
    }
    //left
    if (playerTargetCol == obstacleCol[i] -1 && playerTargetRow == obstacleRow[i]) {
      return true;
    }
    //right
    if (playerTargetCol == obstacleCol[i] +1 && playerTargetRow == obstacleRow[i]) {
      return true;
    }
    //bottom left
    if (playerTargetCol == obstacleCol[i] -1 && playerTargetRow == obstacleRow[i] +1) {
      return true;
    }
    //bottom
    if (playerTargetCol == obstacleCol[i] && playerTargetRow == obstacleRow[i] +1) {
      return true;
    }
    //bottom right
    if (playerTargetCol == obstacleCol[i] +1 && playerTargetRow == obstacleRow[i] +1) {
      return true;
    }
  }
  return false;
}
