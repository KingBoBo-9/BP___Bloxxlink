int player1Score = 1000;
String winner = "Player 1";

void drawScore() {
  fill(0);
  textSize(20);
  text("Player 1: " + player1Score, calculateGridX(), calculateGridY() - 20);
}

void updateScore() {
  player1Score -= 1;
}

int getPlayer1Score() {
  return player1Score;
}

void setPlayer1Score(int score) {
  player1Score = score;
}
