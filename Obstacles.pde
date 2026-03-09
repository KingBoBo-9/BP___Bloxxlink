int numberOfObstacles = 3;

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
    int obstacleX = calculateGridX() + obstacleCol[i] * getCellSize();
    int obstacleY = calculateGridY() + obstacleRow[i] * getCellSize();

    rectMode(CORNER);
    fill(#62ade3);
    square(obstacleX, obstacleY, getCellSize());
  }
}
