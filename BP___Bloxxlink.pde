

void settings() {
  size(500, 400);
  // fullScreen();
}

void setup() {
  drawMap(width / 2, height / 2);
  initPlayer();
  initCargo();
}

void draw() {
  background(100);
  drawGrid();
  drawScore();
  drawCargo();
  drawPlayer();
}

void keyPressed() {
  //initialise player X
  int nextPlayerX = getPlayerX();
  int nextPlayerY = getPlayerY();

  if (key == CODED) {
    if (keyCode == UP) {
      nextPlayerY -= getGridSquareSize();
      if (nextPlayerX == getCargoX() && nextPlayerY == getCargoY()) {
        cargoY += (nextPlayerY - getPlayerY());
      }
      movePlayer("UP");
    } else if (keyCode == DOWN) {
      nextPlayerY += getGridSquareSize();
      if (nextPlayerX == getCargoX() && nextPlayerY == getCargoY()) {
        cargoY += (nextPlayerY - getPlayerY());
      }
      movePlayer("DOWN");
    } else if (keyCode == LEFT) {
      nextPlayerX -= getGridSquareSize();
      if (nextPlayerX == getCargoX() && nextPlayerY == getCargoY()) {
        cargoX += (nextPlayerX - getPlayerX());
      }
      movePlayer("LEFT");
    } else if (keyCode == RIGHT) {
      //calculate where player wants to go
      nextPlayerX += getGridSquareSize();
      //check if cargo is at this position
      if (nextPlayerX == getCargoX() && nextPlayerY == getCargoY()) {
        //move cargo
        cargoX += (nextPlayerX - getPlayerX());
      }
      movePlayer("RIGHT");
    }
  }
}
