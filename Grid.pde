int gridWidth = 10;
int gridHeight = 8;
int gridSquareSize = 30;
int numberOfObstacles = 1;

int gridTotalWidth = gridWidth * gridSquareSize;
int gridTotalHeight = gridHeight * gridSquareSize;

void drawMap(int x, int y) {
  rectMode(CENTER);
  rect(x, y, gridTotalWidth, gridTotalHeight);
}

void drawGrid() {
  rectMode(CORNER);
  int squareX = width / 2 - gridTotalWidth / 2;
  int squareY = height / 2 - gridTotalHeight /2 ;

  for (int i = 0; i < gridWidth; i++) {
    for (int j = 0; j < gridHeight; j++) {
      fill(255);
      square(squareX, squareY, gridSquareSize);
      squareY += gridSquareSize;
    }
    squareX += gridSquareSize;
    squareY = height / 2 - gridTotalHeight /2;
  }
}



int getGridWidth() {
  return gridTotalWidth;
}

int getGridHeight() {
  return gridTotalHeight;
}
