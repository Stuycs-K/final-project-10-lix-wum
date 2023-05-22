class Block {
  
public static final int side = 30;
private int[][][] blocks;

public Block() {
  blocks = new int[4][4][4];
  //first array represents the rotation state
  //second and third represent the tetromino
}

//types: T, I, O, S, J, L, Z 
public Block(char type) {
  if(type == 'T') {
    blocks = {
      {
      { 0, 0, 0, 0 },
      { 0, 0, 0, 0 },
      { 0, 1, 0, 0 },
      { 1, 1, 1, 0 },
      },
      {
      { 0, 0, 0, 0 },
      { 1, 0, 0, 0 },
      { 1, 1, 0, 0 },
      { 1, 0, 0, 0 },
      },
      {
      { 0, 0, 0, 0 },
      { 0, 0, 0, 0 },
      { 1, 1, 1, 0 },
      { 0, 1, 0, 0 },
      },
      {
      { 0, 0, 0, 0 },
      { 0, 1, 0, 0 },
      { 1, 1, 0, 0 },
      { 0, 1, 0, 0 },
      }
    }
  } else if(type == 'I') {
    blocks = {
      {
      { 1, 0, 0, 0 },
      { 1, 0, 0, 0 },
      { 1, 0, 0, 0 },
      { 1, 0, 0, 0 },
      },
      {
      { 0, 0, 0, 0 },
      { 0, 0, 0, 0 },
      { 0, 0, 0, 0 },
      { 1, 1, 1, 1 },
      },
      {
      { 1, 0, 0, 0 },
      { 1, 0, 0, 0 },
      { 1, 0, 0, 0 },
      { 1, 0, 0, 0 },
      },
      {
      { 0, 0, 0, 0 },
      { 0, 0, 0, 0 },
      { 0, 0, 0, 0 },
      { 1, 1, 1, 1 },
      }
    }
  }
}

}
