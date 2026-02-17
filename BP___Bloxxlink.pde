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
