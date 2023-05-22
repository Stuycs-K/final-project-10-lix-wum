class Block {
  
public static final int side = 30;
private int[][][] blocks;

public Block() {
  blocks = new int[4][4][4];
  //first array represents the rotation state
  //second and third represent the tetromino
}

//types:
//1 = T, 2 = I, 3 = S, 4 = J, 5 = L, 6 = Z, 7 = O
public Block(int type) {
  
}
}
