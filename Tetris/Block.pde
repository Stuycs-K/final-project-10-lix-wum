import java.util.ArrayDeque;
class Block {
  
public static final int side = 30;
public int centerX = 1;
public int centerY = 1;
private int[][][] blocks;
public int left = 3;
public int right = 13;
public int top = 3;
public int bottom = 23;
public int rotation;
public char type;
public char element;
public char[] elements = {'F', 'W', 'A', 'L', 'E', '0'};
//FIRE = F //WATER = W //WIND = A (like air) //LIGHTNING = L //EARTH = E //NONE = 0
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
  element = '0';
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

public Block(char type, char element) {
  this.element = element;
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
  centerY++;
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
  centerY--;
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
  centerX++;
}

public void moveUp() {
  for(int i = 0; i < 4; i++) {
      for(int j = 0; j < blocks[0].length; j++) {
        blocks[i][j][0]--;
      }
  }
  centerX--;
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
  String reaction = "";
  Tetris.hasBlock = false;
      //ALL REACTIONS OCCUR HERE
      if(element == 'F' && touching(back) == 'W' || element == 'W' && touching(back) == 'F') {
        //water vapor
        reaction = "fireWater";
      } else if(element == 'F' && touching(back) == 'A' || element == 'A' && touching(back) == 'F') {
        //smokescreen
        reaction = "fireWind";
      } else if(element == 'F' && touching(back) == 'L' || element == 'L' && touching(back) == 'F') {
        //explosion
        reaction = "fireLightning";
      } else if(element == 'F' && touching(back) == 'E' || element == 'E' && touching(back) == 'F') {
        //lava
        reaction = "fireEarth";
      } else if(element == 'W' && touching(back) == 'A' || element == 'A' && touching(back) == 'W') {
        //tsunami
        reaction = "waterWind";
      } else if(element == 'W' && touching(back) == 'L' || element == 'L' && touching(back) == 'W') {
        //electrocharged
        reaction = "waterLightning";
      } else if(element == 'W' && touching(back) == 'E' || element == 'E' && touching(back) == 'W') {
        //ocean
        reaction = "waterEarth";
      } else if(element == 'A' && touching(back) == 'L' || element == 'L' && touching(back) == 'A') {
        //thunderstorm
        reaction = "windLightning";
      } else if(element == 'A' && touching(back) == 'E' || element == 'E' && touching(back) == 'A') {
        //hurricane
        reaction = "windEarth";
      } else if(element == 'L' && touching(back) == 'E' || element == 'E' && touching(back) == 'L') {
        //full clear
        reaction = "lightningEarth";
      }
    for(int i = 0; i < 4; i++) {
    //System.out.println(blocks[rotation][i][0] + " , " + blocks[rotation][i][1]);
    back.game[top+blocks[rotation][i][0]][blocks[rotation][i][1]+left] = type;
    if(back.elemental) {
      back.game[top+blocks[rotation][i][0]][blocks[rotation][i][1]+left] = element;
    }
  }
  if(reaction.equals("fireWater")) {
    back.fireWater(centerX, centerY);
  }
  if(reaction.equals("fireWind")) {
  
  }
  if(reaction.equals("fireLightning")) {
    back.fireLightning(centerX, centerY);
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

public char returnType() {
  return this.type;
}

public Block ghost(Background back) {
  Block temp = new Block(this.type);
  temp.rotation = rotation;
  for(int i = 0; i < blocks.length; i++) {
    for(int j = 0; j < blocks[i].length; j++) {
      for(int k = 0; k < blocks[i][j].length; k++) {
        temp.blocks[i][j][k] = blocks[i][j][k];
      }
    }
  }
  while(!temp.hasCollision(back)) {
    temp.moveDown();
  }
  temp.moveUp();
  return temp;
}

public void setElement(char e) {
  this.element = e;
}

public char touching(Background back) {
  for(int i = 0; i < 3; i++) {
    if(back.game[top + centerX + i][left + centerY] != 'B') {
      return back.game[top + centerX + i][left + centerY];
    }
    if(back.game[top + centerX - i][left + centerY] != 'B') {
      return back.game[top + centerX - i][left + centerY];
    }
    if(back.game[top + centerX][left + centerY + i] != 'B') {
      return back.game[top + centerX][left + centerY + i];
    }
    if(back.game[top + centerX][left + centerY - i] != 'B') {
      return back.game[top + centerX][left + centerY - i];
    }
  }
  return '-';
}

}
