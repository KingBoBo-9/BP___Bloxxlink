void settings() {
  size(500, 400);
}

void setup() {
  drawMap(width / 2, height / 2);
  initPlayer();
}

void draw() {
  background(100);
  drawGrid();
  drawScore();
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
