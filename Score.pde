int player1Score = 1000;

void drawScore() {
  fill(0);
  textSize(20);
  text("Player 1: " + player1Score, calculateGridX(), calculateGridY() - 20);
}

void updateScore() {
  player1Score -= 1;
}
