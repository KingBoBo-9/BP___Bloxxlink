int obstacleX, obstacleY;

void initObstacle() {
  int ObstacleCol = int(random(getGridColumns()));
  int ObstacleRow = int(random(getGridRows()));

  obstacleX = calculateGridX() + ObstacleCol * getcellSize();
  obstacleY = calculateGridY() + ObstacleRow * getcellSize();
}

void drawObstacle() {
  fill(#25c9db);
  square(obstacleX, obstacleY, getcellSize());
}
