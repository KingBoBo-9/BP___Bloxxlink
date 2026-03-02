// void keyPressed() {
//   //initialise player X
//   int nextPlayerX = getPlayerX();
//   int nextPlayerY = getPlayerY();

//   if (key == CODED) {
//     if (keyCode == UP) {
//       nextPlayerY -= getCellSize();
//       if (nextPlayerX == getCargoX() && nextPlayerY == getCargoY()) {
//         cargoY += (nextPlayerY - getPlayerY());
//       }
//       movePlayer("UP");
//     } else if (keyCode == DOWN) {
//       nextPlayerY += getCellSize();
//       if (nextPlayerX == getCargoX() && nextPlayerY == getCargoY()) {
//         cargoY += (nextPlayerY - getPlayerY());
//       }
//       movePlayer("DOWN");
//     } else if (keyCode == LEFT) {
//       nextPlayerX -= getCellSize();
//       if (nextPlayerX == getCargoX() && nextPlayerY == getCargoY()) {
//         cargoX += (nextPlayerX - getPlayerX());
//       }
//       movePlayer("LEFT");
//     } else if (keyCode == RIGHT) {
//       //calculate where player wants to go
//       nextPlayerX += getCellSize();
//       //check if cargo is at this position
//       if (nextPlayerX == getCargoX() && nextPlayerY == getCargoY()) {
//         //move cargo
//         cargoX += (nextPlayerX - getPlayerX());
//       }
//       movePlayer("RIGHT");
//     }
//   }
// }
