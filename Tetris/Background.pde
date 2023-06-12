import java.util.Arrays;
import java.util.Collections;
import java.util.List;

class Background {
   public int size;
   public char[][]game;
   public ArrayDeque<Integer> rows;
   public int left = 3;
   public int right = 13;
   public int top = 3;
   public int bottom = 23;
   public boolean elemental = false;
   Background (int blockSize, int x, int y) {
    rows = new ArrayDeque<Integer>();
    size = blockSize;
    game = new char[x][y];
    for(int i = 0; i < x; i++) {
      for(int j = 0; j < y; j++) {
        game[i][j] = 'B';
        if(i >= 23 || j < 3 || j > 12) {
          game[i][j] = '#';
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
  public int checkRows() {
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
    return clear(rows);
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
  
  public int clear(ArrayDeque<Integer> rows) {
    int rowsCleared = 0;
    while(rows.size() > 0) {
      int i = rows.poll();
      for (int j = left; j < right; j++) {
        rowsCleared++;
        game[i][j] = 'B';
      }
      for (int k = i; k > top; k--) {
        for (int l = left; l < right; l++) {
          game[k][l] = game[k-1][l];
        }
      }
    }
    return rowsCleared;
    
  }
  

  void fireWater(int row, int col) {
    print("\nfireWater");
    for (int i = left; i < right; i++) {
      for (int j = top ; j < bottom; j++) {
        if (game[j][i] != 'B') {
          if(j < bottom) {
            game[j][i] = 'B';
          }
          break;
        }
      }
    }
  }
  
  void fireWind(int row, int col) {
    print("\nfireWind");
    // placeholder for smokescreen imgs
  }
  
  void fireLightning(int row, int col) {
    print("\nfireLightning");
    explosionSound();
    displayReactionImage = "fireLightning";
    delay(200);
    displayReactionImage = "";
    for (int i = -1; i <= 1; i++) {
      for (int j = -1; j <= 1; j++) {
        if (row+i > top && row+i < bottom && col+j > left && col+j < right) game[row+i][col+j] = 'B';
      }
    }
  }
  
  void fireEarth(int row, int col) {
    print("\nfireEarth");
    for (int i = row; i < bottom; i++) {
      game[i][col] = 'B';
    }
  }
  
  void waterWind(int row, int col) {
    print("\nwaterWind");
    for (int i = left; i < right; i++) {
      for (int j = top ; j < bottom; j++) {
        if (game[j][i] != 'B') {
          if(j < bottom) {
            game[j][i] = 'W';
          }
        }
      }
    }
  }
  
  void waterLightning(int row, int col) {
    print("\nwaterLightning");
    for (int i = left; i < right; i++) {
      for (int j = top ; j < bottom; j++) {
        if (game[j][i] != 'B') {
          if((int)(Math.random()*2) == 1) {
            game[j][i] = 'B';
          }
          break;
        }
      }
    }
  }
  
  void waterEarth(int row, int col) {
    print("\nwaterEarth");
    for (int i = left; i < right; i++) {
      for (int j = top ; j < bottom; j++) {
        if (game[j][i] != 'B') {
          if(j < bottom) {
            game[j][i] = 'E';
          }
          break;
        }
      }
    }
  }
  
  void windLightning(int row, int col) {
    print("\nwindLightning");
    // thunderstorm
  }
  
  void windEarth(int row, int col) {
    print("\nwindEarth");
    Integer[]ary = {3, 4, 5, 6, 7, 8, 9, 10, 11, 12};
    // shuffle ary
    List<Integer> aryList = Arrays.asList(ary);
    Collections.shuffle(aryList);
    aryList.toArray(ary);
    
    // unfinished
  }
  
  void lightningEarth(int row, int col) {
    print("\nlightningEarth");
    for (int i = left; i < right; i++) {
      for (int j = top ; j < bottom; j++) {
        if (game[j][i] != 'B') {
          if(j < bottom) {
            game[j][i] = 'B';
          }
        }
      }
    }
  }
  
  
  
}
