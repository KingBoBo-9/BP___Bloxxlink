int obstacleCount = 15;
int obstacleX, obstacleY;
int[] obstacleCol = new int[obstacleCount];
int[] obstacleRow = new int[obstacleCount];

//Set initial positions of all obstacles
void initObstacles() {
  for (int i = 0; i < obstacleCount; i++) {
    obstacleCol[i] = int(random(getGridColumns()));
    obstacleRow[i] = int(random(getGridRows()));

    //Check if selected Col and Row are occupied
    //If occupied -> try new Col and Row
    while (isTileOccupiedByExistingObstacle(obstacleCol[i], obstacleRow[i], i) ||
      isInElectricFieldOfExistingObstacle(obstacleCol[i], obstacleRow[i], i) ||
      obstacleRow[i] == playerRow && obstacleCol[i] == playerRow ) {

      obstacleCol[i] = int(random(getGridColumns()));
      obstacleRow[i] = int(random(getGridRows()));
    }
  }
}

void drawObstacle() {
  for (int i = 0; i < obstacleCount; i++) {

    obstacleX = calculateGridX() + obstacleCol[i] * getCellSize();
    obstacleY = calculateGridY() + obstacleRow[i] * getCellSize();
    noFill();
    stroke(255, 0, 0);
    // fill(#32a8a8);
    square(obstacleX - getCellSize(), obstacleY - getCellSize(), 3 * getCellSize());

    rectMode(CORNER);
    fill(#62ade3);
    // fill(0, 0, 255, 0);
    square(obstacleX, obstacleY, getCellSize());
    stroke(0);
  }
}

boolean isInElectricField(int col, int row) {
  for (int i = 0; i < obstacleCount; i++) {
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
    //middle
    if (col == obstacleCol[i] && row == obstacleRow[i]) {
      return true;
    }
  }
  return false;
}

boolean isInElectricFieldOfExistingObstacle(int col, int row, int currentIndex) {
  for (int i = 0; i < currentIndex; i++) {
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
    //middle
    if (col == obstacleCol[i] && row == obstacleRow[i]) {
      return true;
    }
  }
  return false;
}

boolean isTileOccupiedByExistingObstacle(int col, int row, int currentIndex) {
  for (int i = 0; i < currentIndex; i++) {
    if (obstacleCol[i] == col && obstacleRow[i] == row) {
      return true;
    }
  }
  return false;
}
