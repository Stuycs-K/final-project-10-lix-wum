import java.util.ArrayDeque;
class Block {
  
public static final int side = 30;
private int[][][] blocks;
public static int left = 2;
public static int right = 11;
public static int top = 3;
public static int bottom = 22;
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
  { -2, 1 }
};
public int[][] test1R = {
  { 0, 0 },
  { 0, 1 },
  { 1, 1 },
  { -2, 0 },
  { -2, 1 }
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
  { -2, -1 }
};
public int[][] test3R = {
  { 0, 0 },
  { 0, -1 },
  { 1, -1 },
  { -2, 0 },
  { -2, -1 }
};
public int[][] test0L = {
  { 0, 0 },
  { 0, 1 },
  { -1, 1 },
  { 2, 0 },
  { 2, 1 }
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
    } else if(temp == 1) {
      tests = test1L;
    } else if(temp == 2) {
      tests = test2L;
    } else {
      tests = test3L;
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
  if(rotation == 3) {
    rotation = 0;
  } else {
    rotation++;
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
    System.out.println(blocks[rotation][i][0] + " , " + blocks[rotation][i][1]);
    back.game[3+blocks[rotation][i][0]][blocks[rotation][i][1]+1] = type;
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
