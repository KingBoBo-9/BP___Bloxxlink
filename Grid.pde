void drawGrid(int gridWidth, int gridHeight, int squareSize) {
  int squareX = 0;
  int squareY = 0;

  for (int i = 0; i < gridWidth; i++) {
    for (int j = 0; j < gridHeight; j++) {
      square(squareX, squareY, squareSize);
      squareY += squareSize;
    }
    squareX += squareSize;
    squareY = 0;
  }
}

void drawObstacles() {
}
