int obstacleX, obstacleY, fieldX, fieldY;

void initObstacle() {
  int ObstacleCol = int(random(getGridColumns()));
  int ObstacleRow = int(random(getGridRows()));

  obstacleX = calculateGridX() + ObstacleCol * getCellSize();
  obstacleY = calculateGridY() + ObstacleRow * getCellSize();
}

void drawObstacle() {

  fill(#86f1fc);
  rectMode(CORNERS);
  rect(obstacleX - getCellSize(), obstacleY - getCellSize(), obstacleX + 2 * getCellSize(), obstacleY + 2 * getCellSize());
  rectMode(CORNER);
  fill(#25c9db);
  square(obstacleX, obstacleY, getCellSize());
}

