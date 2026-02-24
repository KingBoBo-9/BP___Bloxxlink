int obstacleX, obstacleY, fieldX, fieldY;

void initObstacle() {
  int ObstacleCol = int(random(getGridColumns()));
  int ObstacleRow = int(random(getGridRows()));

  obstacleX = calculateGridX() + ObstacleCol * getcellSize();
  obstacleY = calculateGridY() + ObstacleRow * getcellSize();
}

void drawObstacle() {

  fill(#86f1fc);
  rectMode(CORNERS);
  rect(obstacleX - getcellSize(), obstacleY - getcellSize(), obstacleX + 2 * getcellSize(), obstacleY + 2 * getcellSize());
  rectMode(CORNER);
  fill(#25c9db);
  square(obstacleX, obstacleY, getcellSize());
}
