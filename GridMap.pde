int gridWidth = 14;
int gridHeight = 8;
int gridSquareSize = 30;

int gridTotalWidth = gridWidth * gridSquareSize;
int gridTotalHeight = gridHeight * gridSquareSize;

int gridX, gridY;

//Draw the game Map
void drawMap(int mapX, int mapY) {
  rectMode(CENTER);
  rect(mapX, mapY, gridTotalWidth, gridTotalHeight);
}

//Draw grid on top of game Map
void drawGrid() {
  gridX = calculateGridX();
  gridY = calculateGridY();

  for (int i = 0; i < gridWidth; i++) {
    for (int j = 0; j < gridHeight; j++) {
      fill(255);
      rectMode(CORNER);
      square(gridX, gridY, gridSquareSize);
      gridY += gridSquareSize;
    }
    gridX += gridSquareSize;
    gridY = height / 2 - gridTotalHeight /2;
  }
}

//Getters
int calculateGridX() {
  return gridX = width / 2 - gridTotalWidth / 2;
}

int calculateGridY() {
  return gridY = height / 2 - gridTotalHeight /2 ;
}

int getGridWidth() {
  return gridTotalWidth;
}

int getGridHeight() {
  return gridTotalHeight;
}

int getGridX() {
  return gridX;
}

int getGridY() {
  return gridY;
}

int getGridSquareSize() {
  return gridSquareSize;
}
