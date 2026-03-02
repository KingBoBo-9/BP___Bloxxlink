void settings() {
  size(500, 400);
  // fullScreen();
}

void setup() {
  drawMap(width / 2, height / 2);
  initPlayer();
  initCargo();
  initObstacle();
}



void draw() {
  background(100);
  drawGrid();
  drawScore();
  drawCargo();
  drawPlayer();
  drawObstacle();
}

void keyPressed() {
  if (key == CODED) {
    switch(keyCode) {
    case UP:
      movePlayer("UP");
      break;
    case DOWN:
      movePlayer("DOWN");
      break;
    case LEFT:
      movePlayer("LEFT");
      break;
    case RIGHT:
      movePlayer("RIGHT");
      break;
    }
  }
}
