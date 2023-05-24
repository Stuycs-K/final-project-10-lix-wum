class Block {
  
public static final int side = 30;
private int[][][] blocks;
public int rotation;
public char type;

//do not use this constructor
public Block() {
  type = 'B';
  rotation = 0;
  //first array represents the rotation state
  //second and third represent the tetromino
}

//types: T, I, O, S, J, L, Z 
public Block(char type) {
  this.type = type;
  rotation = 0;
  if(type == 'T') {
    blocks = new int[][][] {
      {
      { 1, 0 },
      { 1, 1 },
      { 1, 2 },
      { 2, 1 }
      },
      {
      { 1, 0 },
      { 1, 1 },
      { 0, 1 },
      { 2, 1 }
      },
      {
      { 2, 0 },
      { 2, 1 },
      { 2, 2 },
      { 1, 1 }
      },
      {
      { 0, 1 },
      { 1, 1 },
      { 1, 2 },
      { 2, 1 }
      }
    };
  } else if(type == 'I') {
    blocks = new int[][][] {
      {
      { 2, 0 },
      { 2, 1 },
      { 2, 2 },
      { 2, 3 }
      },
      {
      { 0, 2 },
      { 1, 2 },
      { 2, 2 },
      { 3, 2 }
      },
      {
      { 2, 0 },
      { 2, 1 },
      { 2, 2 },
      { 2, 3 }
      },
      {
      { 0, 1 },
      { 1, 1 },
      { 2, 1 },
      { 3, 1 }
      }
    };
  } else if(type == 'O') {
    blocks = new int[][][] {
      {
      { 0, 0 },
      { 0, 1 },
      { 1, 0 },
      { 1, 1 }
      },
      {
      { 0, 0 },
      { 0, 1 },
      { 1, 0 },
      { 1, 1 }
      },
      {
      { 0, 0 },
      { 0, 1 },
      { 1, 0 },
      { 1, 1 }
      },
      {
      { 0, 0 },
      { 0, 1 },
      { 1, 0 },
      { 1, 1 }
      }
    };
  } else if(type == 'S') {
    blocks = new int[][][] {
      {
      { 2, 0 },
      { 2, 1 },
      { 1, 1 },
      { 1, 2 }
      },
      {
      { 0, 1 },
      { 1, 1 },
      { 1, 2 },
      { 2, 2 }
      },
      {
      { 2, 0 },
      { 2, 1 },
      { 1, 1 },
      { 1, 2 }
      },
      {
      { 0, 0 },
      { 1, 0 },
      { 1, 1 },
      { 2, 1 }
      }
    };
  } else if(type == 'J') {
    blocks = new int[][][] {
      {
      { 1, 0 },
      { 1, 1 },
      { 1, 2 },
      { 2, 2 }
      },
      {
      { 0, 1 },
      { 1, 1 },
      { 2, 1 },
      { 2, 0 }
      },
      {
      { 2, 0 },
      { 2, 1 },
      { 2, 2 },
      { 1, 0 }
      },
      {
      { 0, 1 },
      { 1, 1 },
      { 2, 1 },
      { 0, 2 }
      }
    };
  } else if(type == 'L') {
    blocks = new int[][][] {
      {
      { 1, 0 },
      { 1, 1 },
      { 1, 2 },
      { 2, 0 }
      },
      {
      { 0, 0 },
      { 0, 1 },
      { 1, 1 },
      { 2, 1 }
      },
      {
      { 2, 0 },
      { 2, 1 },
      { 2, 2 },
      { 1, 2 }
      },
      {
      { 0, 1 },
      { 1, 1 },
      { 2, 1 },
      { 2, 2 }
      }
    };
  } else if(type == 'Z') {
    blocks = new int[][][] {
      {
      { 1, 0 },
      { 1, 1 },
      { 2, 1 },
      { 2, 2 }
      },
      {
      { 0, 2 },
      { 1, 1 },
      { 1, 2 },
      { 2, 1 }
      },
      {
      { 1, 0 },
      { 1, 1 },
      { 2, 1 },
      { 2, 2 }
      },
      {
      { 0, 1 },
      { 1, 1 },
      { 1, 0 },
      { 2, 0 }
      }
    };
  }
}

public void rotateLeft() {
  if(rotation == 0) {
    rotation = 3;
  } else {
    rotation--;
  }
  for(int i = 0; i < blocks[0].length; i++) {
    if(blocks[rotation][i][1] < 0) {
      moveRight();
    } else if(blocks[rotation][i][1] > 9) {
      moveLeft();
    }
  }
  for(int i = 0; i < blocks[0].length; i++) {
    if(blocks[rotation][i][1] < 0) {
      moveRight();
    } else if(blocks[rotation][i][1] > 9) {
      moveLeft();
    }
  }
  for(int i = 0; i < blocks[0].length; i++) {
      if(blocks[rotation][i][0] > 19) {
        moveUp();
      } else if(blocks[rotation][i][0] < 0) {
        moveDown();
      }
    }
}

public void rotateRight() {
  if(rotation == 3) {
    rotation = 0;
  } else {
    rotation++;
  }
  for(int i = 0; i < blocks[0].length; i++) {
    if(blocks[rotation][i][1] < 0) {
      moveRight();
    } else if(blocks[rotation][i][1] > 9) {
      moveLeft();
    }
  }
  for(int i = 0; i < blocks[0].length; i++) {
    if(blocks[rotation][i][1] < 0) {
      moveRight();
    } else if(blocks[rotation][i][1] > 9) {
      moveLeft();
    }
  }
  for(int i = 0; i < blocks[0].length; i++) {
      if(blocks[rotation][i][0] > 19) {
        moveUp();
      } else if(blocks[rotation][i][0] < 0) {
        moveDown();
      }
    }
}

public void moveRight(Background back) {
  boolean movable = true;
  for(int i = 0; i < blocks[0].length; i++) {
    if(blocks[rotation][i][1] == 9 || back.game[blocks[rotation][i][0]][blocks[rotation][i][1]+1] != 'B') {
      movable = false;
    }
  }
  if(movable) {
    for(int i = 0; i < 4; i++) {
      for(int j = 0; j < blocks[0].length; j++) {
        blocks[i][j][1]++;
      }
    }
  }
}

public void moveRight() {
  for(int i = 0; i < 4; i++) {
      for(int j = 0; j < blocks[0].length; j++) {
        blocks[i][j][1]++;
      }
  }
}

public void moveLeft(Background back) {
  boolean movable = true;
  for(int i = 0; i < blocks[0].length; i++) {
    if(blocks[rotation][i][1] == 0 || back.game[blocks[rotation][i][0]][blocks[rotation][i][1]-1] != 'B') {
      movable = false;
    }
  }
  if(movable) {
    for(int i = 0; i < 4; i++) {
      for(int j = 0; j < blocks[0].length; j++) {
        blocks[i][j][1]--;
      }
    }
  }
}

public void moveLeft() {
  for(int i = 0; i < 4; i++) {
      for(int j = 0; j < blocks[0].length; j++) {
        blocks[i][j][1]--;
      }
  }
}

public void moveDown(Background back) {
  boolean movable = true;
  for(int i = 0; i < blocks[0].length; i++) {
    if(blocks[rotation][i][0] == 19 || back.game[blocks[rotation][i][0]+1][blocks[rotation][i][1]] != 'B') {
      movable = false;
    }
  }
  if(movable) {
    for(int i = 0; i < 4; i++) {
      for(int j = 0; j < blocks[0].length; j++) {
        blocks[i][j][0]++;
        System.out.println(blocks[i][j][0]);
      }
    }
  }
}

public void moveDown() {
  for(int i = 0; i < 4; i++) {
      for(int j = 0; j < blocks[0].length; j++) {
        blocks[i][j][0]++;
      }
  }
}

public void moveUp() {
  for(int i = 0; i < 4; i++) {
      for(int j = 0; j < blocks[0].length; j++) {
        blocks[i][j][0]--;
      }
  }
}

}
