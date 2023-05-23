  Background back;
  void setup() {
    size(800, 800);
    background(40, 40, 40);
    back = new Background(30, 10, 20);
    back.makeBackground();
    //back.game[2][3] = 'T';
  }
  
  void draw() {
    back.isRowFilled(0);
    displayGrid(back);
  }
  
  void displayGrid(Background game) {
    int size = back.size;
    for(int i = 0; i < back.game.length-1; i++) {
      for(int j = 0; j < back.game[i].length-1; j++) {
        if(back.game[i][j] == 'B') {
          color(40);
        } else if(back.game[i][j] == 'T') {
          color(153, 51, 255);
        } else if(back.game[i][j] == 'I') {
          color(51, 204, 255);
        } else if(back.game[i][j] == 'S') {
          color(51, 204, 51);
        } else if(back.game[i][j] == 'Z') {
          color(204, 0, 0);
        } else if(back.game[i][j] == 'J') {
          color(0, 51, 204);
        } else if(back.game[i][j] == 'L') {
          color(255, 153, 51);
        } else if(back.game[i][j] == 'O') {
          color(255, 214, 51);
        } else {
          color(40);
        }
        rect(i*size, j*size, (i+1)*size, (j+1)*size);
      }
    }
  }
