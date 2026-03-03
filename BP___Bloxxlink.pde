void settings() {
  size(500, 400);
  // fullScreen();
}

void setup() {
  drawMap(width / 2, height / 2);
  initCargo();
  initObstacle();
}

void draw() {
  background(100);
  drawGrid();
  drawScore();
  drawCargo();
  drawPlayer();
  // drawObstacle();

  //cargo above player
  if (cargoCol == playerCol && cargoRow == playerRow -1) {
    print("contact");
  } else {
    println("no-contact");
  }
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

  if (key == RETURN || key == ENTER) {
    togglePullCargoMode();
    print(pullCargoMode);
  }
}
