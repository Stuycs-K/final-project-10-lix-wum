class Background {
   public int size;
   public char[][]game;
   public ArrayDeque<Integer> rows;
   public int left = 2;
   public int right = 12;
   public int top = 3;
   public int bottom = 23;

   Background (int blockSize, int x, int y) {
    rows = new ArrayDeque<Integer>();
    size = blockSize;
    game = new char[x][y];
    for(int i = 0; i < x; i++) {
      for(int j = 0; j < y; j++) {
        game[i][j] = 'B';
        if(i >= 23 || j < 2 || j > 11) {
          game[i][j] = 'W';
        }
      }
    }
  }

  //public void makeBackground () {

  //  //inner lines
  //  stroke(220,220,220);
  //  strokeWeight(1);
  //  for (int x = width/2-size*4; x < width/2+size*5; x+=size) {
  //    line(x, height/2-size*10, x, height/2+size*10);
  //  }
  //  for (int y = height/2-size*9; y < height/2+size*10; y+=size) {
  //    line(width/2-size*5, y, width/2+size*5, y);
  //  }
  
    ////outside box
    //strokeWeight(2);
    //stroke(255);
    //fill(255, 0, 0, 0);
    //rectMode(CENTER);
    //rect(width/2, height/2, 300, 600);
  
  //}
  public void checkRows() {
    for(int i = top; i < bottom; i++) {
      if(isRowFilled(i)) {
        rows.addLast(i);
      }
      if(isRowEmpty(i)) {
        for (int k = i; k > top; k--) {
          for (int l = left; l < right; l++) {
            game[k][l] = game[k-1][l];
          }
        }
      }
    }
    clear(rows);
  }
  
  boolean isRowFilled(int row) {
    
    for (int i = left; i < right; i++) {
      if (game[row][i] == 'B') return false;
    }
    return true;
    
  }
  
   boolean isRowEmpty(int row) {
    
    for (int i = left; i < right; i++) {
      if (game[row][i] != 'B') return false;
    }
    return true;
    
  }
  
  public void clear(ArrayDeque<Integer> rows) {
      
    while(rows.size() > 0) {
      int i = rows.poll();
      for (int j = left; j < right; j++) {
        game[i][j] = 'B';
      }
      for (int k = i; k > top; k--) {
        for (int l = left; l < right; l++) {
          game[k][l] = game[k-1][l];
        }
      }
    }
    
  }
  
  
}
