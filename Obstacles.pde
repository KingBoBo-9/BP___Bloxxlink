int obstacleCount = 3;
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

    //Draws electric field around obstacles
    fill(#32a8a8);
    square(obstacleX - getCellSize(), obstacleY - getCellSize(), 3 * getCellSize());

    //Draws obstacles
    rectMode(CORNER);
    fill(#62ade3);
    square(obstacleX, obstacleY, getCellSize());
  }
}

boolean isInElectricField(int col, int row) {
  for (int i = 0; i < obstacleCount; i++) {
    if (abs(col - obstacleCol[i]) <= 1 && abs(row - obstacleRow[i]) <= 1) {
      return true;
    }
  }
  return false;
}

boolean isInElectricFieldOfExistingObstacle(int col, int row, int currentIndex) {
  for (int i = 0; i < currentIndex; i++) {
    if (abs(col - obstacleCol[i]) <= 1 && abs(row - obstacleRow[i]) <= 1) {
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
