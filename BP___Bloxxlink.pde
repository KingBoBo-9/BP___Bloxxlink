int gridSquareSize = 30;

void setup() {
  size(500, 400);
}

void draw() {
  drawGrid(10, 8, gridSquareSize);
  drawPlayer();
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      movePlayer("UP");
    } else if (keyCode == DOWN) {
      movePlayer("DOWN");
    } else if (keyCode == LEFT) {
      movePlayer("LEFT");
    } else if (keyCode == RIGHT) {
      movePlayer("RIGHT");
    }
  }
}
