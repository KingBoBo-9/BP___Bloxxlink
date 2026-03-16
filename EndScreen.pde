int rectX, rectY, rectWidth, rectHeight;


void showEndScreen() {
  background(200);
  textAlign(CENTER, CENTER);
  fill(0);
  textSize(width / 20);
  text("Winner: " + winner, width / 2, height / 2);
  text("Score: " + getPlayer1Score(), width / 2, height / 2 + height / 10);
}

void drawButton() {
  rectWidth = width / 6;
  rectHeight = height / 15;
  rectX = width / 2;
  rectY = height - rectHeight;

  fill(#F59E34);
  rectMode(CENTER);
  rect(rectX, rectY, rectWidth, rectHeight);
  fill(0);
  textAlign(CENTER, CENTER);
  textSize(width / 30);
  text("Play Again?", rectX, rectY);
}

boolean buttonIsPressed() {
  if (mouseX >= getButtonX1() && mouseX <= getButtonX2() && mouseY >= getButtonY1() && mouseY <= getButtonY2()) {
    return true;
  } else {
    return false;
  }
}



int getButtonX1() {
  return rectX - rectWidth / 2;
}
int getButtonX2() {
  return rectX + rectWidth / 2;
}
int getButtonY1() {
  return rectY - rectHeight / 2;
}
int getButtonY2() {
  return rectY + rectHeight / 2;
}
