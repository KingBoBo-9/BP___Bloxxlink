int gridColumns = 20;
int gridRows = 16;
int cellSize = 30;

int gridTotalWidth = gridColumns * cellSize;
int gridTotalHeight = gridRows * cellSize;

int gridX, gridY, gridXStart, gridYStart;


//Draw the game Map
void drawMap(int mapX, int mapY) {
  rectMode(CENTER);
  rect(mapX, mapY, gridTotalWidth, gridTotalHeight);
}

//Draw grid on top of game Map
void drawGrid() {
  gridX = calculateGridX();
  gridY = calculateGridY();

  for (int i = 0; i < gridColumns; i++) {
    for (int j = 0; j < gridRows; j++) {
      fill(255);
      rectMode(CORNER);
      square(gridX, gridY, cellSize);
      gridY += cellSize;
    }
    gridX += cellSize;
    gridY = height / 2 - gridTotalHeight /2;
  }
}

int isTileOccupied(int col, int row) {
  for (int i = 0; i < cargoCount; i++) {
    if (cargoCol[i] == col && cargoRow[i] == row) {
      return i;
    }
  }
  return -1;
}

int calculateGridX() {
  return gridX = width / 2 - gridTotalWidth / 2;
}

int calculateGridY() {
  return gridY = height / 2 - gridTotalHeight /2 ;
}

int getCellSize() {
  return cellSize;
}

int getGridColumns() {
  return gridColumns;
}

int getGridRows() {
  return gridRows;
}
