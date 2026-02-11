int gridWidth = 10;
int gridHeight = 8;
int gridSquareSize = 30;

void drawGrid() {
  int squareX = 0;
  int squareY = 0;

  for (int i = 0; i < gridWidth; i++) {
    for (int j = 0; j < gridHeight; j++) {
      fill(255);
      square(squareX, squareY, gridSquareSize);
      squareY += gridSquareSize;
    }
    squareX += gridSquareSize;
    squareY = 0;
  }
}

void drawObstacles() {
}

int getGridWidth() {
  return gridWidth * gridSquareSize;
}

int getGridHeight() {
  return gridHeight * gridSquareSize;
}
