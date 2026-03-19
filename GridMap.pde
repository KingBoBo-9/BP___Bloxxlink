final int GRID_COLUMNS = 20;
final int GRID_ROWS = 16;
final int CELL_SIZE = 30;

int gridTotalWidth = GRID_COLUMNS * CELL_SIZE;
int gridTotalHeight = GRID_ROWS * CELL_SIZE;

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

  for (int i = 0; i < GRID_COLUMNS; i++) {
    for (int j = 0; j < GRID_ROWS; j++) {
      fill(255);
      rectMode(CORNER);
      square(gridX, gridY, CELL_SIZE);
      gridY += CELL_SIZE;
    }
    gridX += CELL_SIZE;
    gridY = height / 2 - gridTotalHeight /2;
  }
}

boolean isTileBlocked(int col, int row) {
  if (isTileOccupied(col, row)) {
    return true;
  }

  if (isInElectricField(col, row)) {
    return true;
  }
  return false;
}

boolean isTileOccupied(int col, int row) {
  //check for cargo
  for (int i = 0; i < cargoCount; i++) {
    if (cargoCol[i] == col && cargoRow[i] == row) {
      return true;
    }
  }

  //check for obstacles
  for (int i = 0; i < numberOfObstacles; i++) {
    if (obstacleCol[i] == col && obstacleRow[i] == row) {
      return true;
    }
  }
  return false;
}

int calculateGridX() {
  return gridX = width / 2 - gridTotalWidth / 2;
}

int calculateGridY() {
  return gridY = height / 2 - gridTotalHeight /2 ;
}

int getCellSize() {
  return CELL_SIZE;
}

int getGridColumns() {
  return GRID_COLUMNS;
}

int getGridRows() {
  return GRID_ROWS;
}
