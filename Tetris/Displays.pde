  
  public void displayGrid(Background game) {
    stroke(220,220,220);
    strokeWeight(1);
    rectMode(CORNER);
    int size = back.size;
    for(int i = current.top; i < current.bottom; i++) {
      for(int j = current.left; j < current.right; j++) {
        if(back.game[i][j] == 'B') {
          fill(40);
        } else if(back.game[i][j] == 'T') {
          fill(153, 51, 255);
        } else if(back.game[i][j] == 'I') {
          fill(51, 204, 255);
        } else if(back.game[i][j] == 'S') {
          fill(51, 204, 51);
        } else if(back.game[i][j] == 'Z') {
          fill(204, 0, 0);
        } else if(back.game[i][j] == 'J') {
          fill(0, 51, 204);
        } else if(back.game[i][j] == 'L') {
          fill(255, 153, 51);
        } else if(back.game[i][j] == 'O') {
          fill(255, 214, 51);
        } else {
          fill(40);
        }
        rect((width/2 - 5*size) + (j-current.left)*size, (height/2 - 10*size) + (i-current.top)*size, size, size);
      }
    }
    //outside box
    strokeWeight(2);
    stroke(255);
    fill(255, 0, 0, 0);
    rectMode(CENTER);
    rect(width/2, height/2, 300, 600);
  }
  
  public void displayGridElemental(Background game) {
    stroke(220,220,220);
    strokeWeight(1);
    rectMode(CORNER);
    int size = back.size;
    for(int i = current.top; i < current.bottom; i++) {
      for(int j = current.left; j < current.right; j++) {
        if(back.game[i][j] == 'B') {
          fill(40);
        } else if(back.game[i][j] == 'F') {
          fill(252, 73, 3);
        } else if(back.game[i][j] == 'W') {
          fill(3, 103, 252);
        } else if(back.game[i][j] == 'A') {
          fill(3, 252, 11);
        } else if(back.game[i][j] == 'L') {
          fill(177, 3, 252);
        } else if(back.game[i][j] == 'E') {
          fill(122, 73, 27);
        } else {
          fill(40);
        }
        rect((width/2 - 5*size) + (j-current.left)*size, (height/2 - 10*size) + (i-current.top)*size, size, size);
      }
    }
    //outside box
    strokeWeight(2);
    stroke(255);
    fill(255, 0, 0, 0);
    rectMode(CENTER);
    rect(width/2, height/2, 300, 600);
  }
  
  public void displayBlock (Block current, int x, int y) {
    int size = back.size;
    stroke(220,220,220);
    strokeWeight(1);
    rectMode(CORNER);
    for(int a = 0; a < current.blocks[current.rotation].length; a++) {
      int i = current.blocks[current.rotation][a][0];
      int j = current.blocks[current.rotation][a][1];
      if(current.type == 'B') {
          fill(40);
        } else if(current.type == 'T') {
          fill(153, 51, 255);
        } else if(current.type == 'I') {
          fill(51, 204, 255);
        } else if(current.type == 'S') {
          fill(51, 204, 51);
        } else if(current.type == 'Z') {
          fill(204, 0, 0);
        } else if(current.type == 'J') {
          fill(0, 51, 204);
        } else if(current.type == 'L') {
          fill(255, 153, 51);
        } else if(current.type == 'O') {
          fill(255, 214, 51);
        } else {
          fill(40);
        }
       rect(x + j*size, y + i*size, size, size);
    }
  }
  
  public void displayBlockElemental (Block current, int x, int y) {
    int size = back.size;
    stroke(220,220,220);
    strokeWeight(1);
    rectMode(CORNER);
    for(int a = 0; a < current.blocks[current.rotation].length; a++) {
      int i = current.blocks[current.rotation][a][0];
      int j = current.blocks[current.rotation][a][1];
      if(current.type == 'B') {
          fill(40);
        } else if(current.element == 'F') {
          fill(252, 73, 3);
        } else if(current.element == 'W') {
          fill(3, 103, 252);
        } else if(current.element == 'A') {
          fill(3, 252, 11);
        } else if(current.element == 'L') {
          fill(177, 3, 252);
        } else if(current.element == 'E') {
          fill(122, 73, 27);
        } else {
          fill(40);
        }
       rect(x + j*size, y + i*size, size, size);
    }
  }
  
  public void displayBlockCosmetic (Block current, int x, int y) {
    if(current.type == 'O') {
      x += 10;
      y += 30;
    } else if(current.type == 'I') {
      x -= 10;
      y -= 15;
    }
    int size = back.size;
    stroke(220,220,220);
    strokeWeight(1);
    rectMode(CORNER);
    for(int a = 0; a < current.blocks[current.rotation].length; a++) {
      int i = current.blocks[current.rotation][a][0];
      int j = current.blocks[current.rotation][a][1];
      if(current.type == 'B') {
          fill(40);
        } else if(current.type == 'T') {
          fill(153, 51, 255);
        } else if(current.type == 'I') {
          fill(51, 204, 255);
        } else if(current.type == 'S') {
          fill(51, 204, 51);
        } else if(current.type == 'Z') {
          fill(204, 0, 0);
        } else if(current.type == 'J') {
          fill(0, 51, 204);
        } else if(current.type == 'L') {
          fill(255, 153, 51);
        } else if(current.type == 'O') {
          fill(255, 214, 51);
        } else {
          fill(40);
        }
       rect(x + j*size, y + i*size, size, size);
    }
  }
  
  public void displayBlockCosmeticElemental (Block current, int x, int y) {
    if(current.type == 'O') {
      x += 10;
      y += 30;
    } else if(current.type == 'I') {
      x -= 10;
      y -= 15;
    }
    int size = back.size;
    stroke(220,220,220);
    strokeWeight(1);
    rectMode(CORNER);
    for(int a = 0; a < current.blocks[current.rotation].length; a++) {
      int i = current.blocks[current.rotation][a][0];
      int j = current.blocks[current.rotation][a][1];
      if(current.type == 'B') {
          fill(40);
        } else if(current.element == 'F') {
          fill(252, 73, 3);
        } else if(current.element == 'W') {
          fill(3, 103, 252);
        } else if(current.element == 'A') {
          fill(3, 252, 11);
        } else if(current.element == 'L') {
          fill(177, 3, 252);
        } else if(current.element == 'E') {
          fill(122, 73, 27);
        } else {
          fill(40);
        }
       rect(x + j*size, y + i*size, size, size);
    }
  }
  
  public void displayGhost (Block ghost, int x, int y) {
    int size = back.size;
    stroke(220,220,220);
    strokeWeight(1);
    rectMode(CORNER);
    for(int a = 0; a < ghost.blocks[ghost.rotation].length; a++) {
      int i = ghost.blocks[ghost.rotation][a][0];
      int j = ghost.blocks[ghost.rotation][a][1];
      fill(200, 128);
      rect(x + j*size, y + i*size, size, size);
    }
  }
    
    public void updateNext() {
      
      // TAKE NEXT BLOCK
      current = next.remove(0);
      
      // UPDATE NEXT BOX
      strokeWeight(2);
      stroke(255);
      rectMode(CENTER);
      fill(40, 40, 40);
      rect(35.5*width/42, height/2, 160, 400);
      fill(255, 0, 0, 0);
      rect(35.5*width/42, height/2, 160, 400);
      fill(255);
      textSize(20);
      text("NEXT", 600, 595);
      
      if(sevenBag.size() == 6) {
        for (int i = 0; i < 6; i++ ) {
          print(sevenBag.get(i).returnType());
        }
      }
      // DISPLAY NEXT BLOCKS
      if(sevenBag.size() == 0) {
        
        sevenBag.add(new Block(types[(int) (Math.random()*7)]));
        while (sevenBag.size() != 7) {
          Block temp = new Block(types[(int) (Math.random()*7)]);
          boolean x = true;
          for (int j = 0; j < sevenBag.size(); j++) {
            if (temp.returnType() == sevenBag.get(j).returnType()) x = false;
          }
          if (x == true) sevenBag.add(temp);
        }
      }
      next.add(sevenBag.remove(0));
      for (int i = 0; i < 5; i++) {
        int y = 200+i*70;        
        displayBlockCosmetic(next.get(i), 625, y);
      }
    }
    
     public void updateNextElemental() {
      
      // TAKE NEXT BLOCK
      current = next.remove(0);
      
      // UPDATE NEXT BOX
      strokeWeight(2);
      stroke(255);
      rectMode(CENTER);
      fill(40, 40, 40);
      rect(35.5*width/42, height/2, 160, 400);
      fill(255, 0, 0, 0);
      rect(35.5*width/42, height/2, 160, 400);
      fill(255);
      textSize(20);
      text("NEXT", 600, 595);
      
      if(sevenBag.size() == 6) {
        for (int i = 0; i < 6; i++ ) {
          print(sevenBag.get(i).returnType());
        }
      }
      // DISPLAY NEXT BLOCKS
      if(sevenBag.size() == 0) {
        
        sevenBag.add(new Block(types[(int) (Math.random()*7)], elements[(int) (Math.random()*5)]));
        while (sevenBag.size() != 7) {
          Block temp = new Block(types[(int) (Math.random()*7)], elements[(int) (Math.random()*5)]);
          boolean x = true;
          for (int j = 0; j < sevenBag.size(); j++) {
            if (temp.returnType() == sevenBag.get(j).returnType()) x = false;
          }
          if (x == true) sevenBag.add(temp);
        }
      }
      next.add(sevenBag.remove(0));
      for (int i = 0; i < 5; i++) {
        int y = 200+i*70;        
        displayBlockCosmeticElemental(next.get(i), 625, y);
      }
    }
    
    public void hold(Block current) {
    //print("hold");
    if (holdSpace) {
      next.add(0, new Block(heldBlock.type));
      heldBlock = new Block(current.type);
      updateNext();
      // REDRAW HOLD BOX
      strokeWeight(2);
      stroke(255);
      rectMode(CENTER);
      fill(40, 40, 40);
      rect(35.5*width/42/5.5, height/2.86, 160, 160);
      fill(255, 0, 0, 0);
      rect(35.5*width/42/5.5, height/2.86, 160, 160);
      fill(255);
      textSize(20);
      text("HOLD", 150, 220);
      
      displayBlockCosmetic(heldBlock, 80,220);
      //if(current.type != 'O') {
      //  current.moveUp();
      //}
      //current.moveRight();
      //current.moveRight();
      //current.moveRight();
      //hasBlock = true;
    }
    else {
      holdSpace = true;
      heldBlock = new Block(current.type);
      displayBlockCosmetic(heldBlock, 80,220);
      updateNext();
      
    }
    }
    
    public void holdBox() {
       // HOLD BOX
    
    strokeWeight(2);
    stroke(255);
    rectMode(CENTER);
    fill(40, 40, 40);
    rect(35.5*width/42/5.5, height/2.86, 160, 160);
    fill(255, 0, 0, 0);
    rect(35.5*width/42/5.5, height/2.86, 160, 160);
    fill(255);
    textSize(20);
    text("HOLD", 150, 220);
   
    }
    
    public void nextBox() {
       // NEXT BOX
    strokeWeight(2);
    stroke(255);
    rectMode(CENTER);
    fill(40, 40, 40);
    rect(35.5*width/42, height/2, 160, 400);
    fill(255, 0, 0, 0);
    rect(35.5*width/42, height/2, 160, 400);
    fill(255);
    textSize(20);
    text("NEXT", 600, 595);
    }
