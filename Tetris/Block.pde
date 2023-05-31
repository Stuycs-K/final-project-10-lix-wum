import java.util.ArrayDeque;
class Block {
  
public static final int side = 30;
private int[][][] blocks;
public int left = 3;
public int right = 13;
public int top = 3;
public int bottom = 23;
public int rotation;
public char type;
public int[][] test0R = {
  { 0, 0 },
  { 0, -1},
  { -1, -1 },
  { 2, 0 },
  { 2, -1 }
};
public int[][] test1L = {
  { 0, 0 },
  { 0, 1 },
  { 1, 1 },
  { -2, 0 },
  { -2, 1 },
  { 0, -1 }
};
public int[][] test1R = {
  { 0, 0 },
  { 0, 1 },
  { 1, 1 },
  { -2, 0 },
  { -2, 1 },
  { 0, -1 }
};
public int[][] test2L = {
  { 0, 0 },
  { 0, -1 },
  { -1, -1 },
  { 2, 0 },
  { 2, -1 }
};
public int[][] test2R = {
  { 0, 0 },
  { 0, 1 },
  { -1, 1 },
  { 2, 0 },
  { 2, 1 }
};
public int[][] test3L = {
  { 0, 0 },
  { 0, -1 },
  { 1, -1 },
  { -2, 0 },
  { -2, -1 },
  { 0, 1 }
};
public int[][] test3R = {
  { 0, 0 },
  { 0, -1 },
  { 1, -1 },
  { -2, 0 },
  { -2, -1 },
  { 0, 1 }
};
public int[][] test0L = {
  { 0, 0 },
  { 0, 1 },
  { -1, 1 },
  { 2, 0 },
  { 2, 1 }
};
public int[][] I0R = {
  { 0, 0 },
  { 0, -2 },
  { 0, 1 },
  { 1, -2 },
  { -2, 1 }
};
public int[][] I1L = {
  { 0, 0 },
  { 0, 2 },
  { 0, -1 },
  { -1, 2 },
  { 2, -1 }
};
public int[][] I1R = {
  { 0, 0 },
  { 0, -1 },
  { 0, 2 },
  { -2, -1 },
  { 1, 2 }
};
public int[][] I2L = {
  { 0, 0 },
  { 0, 1 },
  { 0, -2 },
  { 2, 1 },
  { -1, -2 }
};
public int[][] I2R = {
  { 0, 0 },
  { 0, 2 },
  { 0, -1 },
  { -1, 2 },
  { 2, -1 }
};
public int[][] I3L = {
  { 0, 0 },
  { 0, -2 },
  { 0, 1 },
  { 1, -2 },
  { -2, 1 }
};
public int[][] I3R = {
  { 0, 0 },
  { 0, 1 },
  { 0, -2 },
  { 2, 1 },
  { -1, -2 }
};
public int[][] I0L = {
  { 0, 0 },
  { 0, -1 },
  { 0, 2 },
  { -2, -1 },
  { 1, 2 }
};

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

public void rotateLeft(Background back) {
  int temp = rotation;
  boolean flag = true;
  int[][] tests;
  if(rotation == 0) {
    rotation = 3;
  } else {
    rotation--;
  }
  if(hasCollision(back)) {
    if(temp == 0) {
      tests = test0L;
      if(type == 'I') tests = I0L;
    } else if(temp == 1) {
      tests = test1L;
      if(type == 'I') tests = I1L;
    } else if(temp == 2) {
      tests = test2L;
      if(type == 'I') tests = I2L;
    } else {
      tests = test3L;
      if(type == 'I') tests = I3L;
    } 
    for(int i = 0; i < 5; i++) {
      move(tests[i][0], tests[i][1]);
      if(!hasCollision(back)) {
        flag = false;
        break;
      } else {
        move(-1*tests[i][0], -1*tests[i][1]);
      }
    }
    if(/*(type == 'L' || type == 'J') && */(tests == test3R || tests == test3L || tests == test1R || tests == test1L)) {
      move(tests[5][0], tests[5][1]);
      if(!hasCollision(back)) {
        flag = false;
      } else {
        move(-1*tests[5][0], -1*tests[5][1]);
      }
    }
    if(flag) {
      rotateRight();
    }
  }
}

public void rotateLeft() {
  if(rotation == 0) {
    rotation = 3;
  } else {
    rotation--;
  }
}

public void rotateRight(Background back) {
  int temp = rotation;
  boolean flag = true;
  int[][] tests;
  if(rotation == 3) {
    rotation = 0;
  } else {
    rotation++;
  }
  if(hasCollision(back)) {
    if(temp == 0) {
      tests = test0R;
      if(type == 'I') tests = I0R;
    } else if(temp == 1) {
      tests = test1R;
      if(type == 'I') tests = I1R;
    } else if(temp == 2) {
      tests = test2R;
      if(type == 'I') tests = I2R;
    } else {
      tests = test3R;
      if(type == 'I') tests = I3R;
    }
    for(int i = 0; i < 5; i++) {
      move(tests[i][0], tests[i][1]);
      if(!hasCollision(back)) {
        flag = false;
        break;
      } else {
        move(-1*tests[i][0], -1*tests[i][1]);
      }
    }
    if((type == 'L' || type == 'J') && (tests == test3R || tests == test3L || tests == test1R || tests == test1L)) {
      move(tests[5][0], tests[5][1]);
      if(!hasCollision(back)) {
        flag = false;
      } else {
        move(-1*tests[5][0], -1*tests[5][1]);
      }
    }
    if(flag) {
      rotateLeft();
    }
  }
}

public void rotateRight() {
  if(rotation == 3) {
    rotation = 0;
  } else {
    rotation++;
  }
}

public void moveRight(Background back) {
  moveRight();
  if(hasCollision(back)) {
    moveLeft();
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
  moveLeft();
  if(hasCollision(back)) {
    moveRight();
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
  moveDown();
  if(hasCollision(back)) {
    moveUp();
    placeBlock(back);
  }
}

public void fastDrop(Background back) {
  while(!hasCollision(back)) {
    moveDown();
  }
  moveUp();
  placeBlock(back);
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

public boolean hasCollision(Background back) {
  for(int i = 0; i < 4; i++) {
    if(back.game[top+blocks[rotation][i][0]][blocks[rotation][i][1]+left] != 'B') {
      return true;
    }
  }
  return false;
}

public void placeBlock(Background back) {
  Tetris.hasBlock = false;
  for(int i = 0; i < 4; i++) {
    //System.out.println(blocks[rotation][i][0] + " , " + blocks[rotation][i][1]);
    back.game[top+blocks[rotation][i][0]][blocks[rotation][i][1]+left] = type;
  }
}

public void move(int x, int y) {
  for(int i = 0; i < 4; i++) {
      for(int j = 0; j < blocks[0].length; j++) {
        blocks[i][j][0]+=x;
        blocks[i][j][1]+=y;
      }
  }
}

public void printType(Block x) {
  print(x.type);
}
}
