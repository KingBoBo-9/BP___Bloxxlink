
void setup() {
  size(500, 400);
}

void draw() {
  drawGrid();
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
