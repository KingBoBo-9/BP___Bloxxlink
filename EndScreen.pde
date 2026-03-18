int rectX, rectY, rectWidth, rectHeight;


void showEndScreen() {
  background(200);
  textAlign(CENTER, CENTER);
  fill(0);
  textSize(width / 20);
  text("Winner: " + winner, width / 2, height / 2);
  text("Score: " + getPlayer1Score(), width / 2, height / 2 + height / 10);
}
