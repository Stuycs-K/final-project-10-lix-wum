class Background {
   public int size;
   public int[][]game;

   Background (int blockSize, int x, int y) {
    size = blockSize;
    game = new int[x][y];
  }

  public void makeBackground () {

    //inner lines
    stroke(220,220,220);
    strokeWeight(1);
    for (int x = width/2-size*4; x < width/2+size*5; x+=size) {
      line(x, height/2-size*10, x, height/2+size*10);
    }
    for (int y = height/2-size*9; y < height/2+size*10; y+=size) {
      line(width/2-size*5, y, width/2+size*5, y);
    }
  
    //outside box
    strokeWeight(2);
    stroke(255);
    fill(255, 0, 0, 0);
    rectMode(CENTER);
    rect(width/2, height/2, 300, 600);
  
  }
  
  boolean isRowFilled(int row) {
    return true;
  }
  
  
}
