void showStartScreen() {
  background(#d99029);
}

void drawStartButtons() {
  for (int i = 0; i < BUTTON_COUNT; i++) {
    fill(#F59E34);
    rectMode(CENTER);
    rect(buttonX[i], buttonY[i], buttonW[i], buttonH[i]);

    fill(0);
    textSize(15);
    textAlign(CENTER, CENTER);
    text(buttonText[i], buttonX[i], buttonY[i]);
  }
}
