import processing.sound.*;
SoundFile file;

public void backgroundSound() {
  file = new SoundFile(this, "tetris.mp3"); file.play(); 
} 

// DROP SOUNDS
public void hardDropSound() {
  file = new SoundFile(this, "hardDrop.wav"); file.play(); 
}
public void softDropSound() {
  file = new SoundFile(this, "softDrop.wav"); file.play(); 
}

// ROW CLEAR SOUNDS
public void singleSound() {
  file = new SoundFile(this, "single.wav"); file.play(); 
}
public void doubleSound() {
  file = new SoundFile(this, "double.wav"); file.play(); 
}
public void tripleSound() {
  file = new SoundFile(this, "triple.wav"); file.play(); 
}
public void tetrisSound() {
  file = new SoundFile(this, "tetris.wav"); file.play(); 
}

// PIECE MOVE SOUNDS
public void moveSound() {
  file = new SoundFile(this, "move.wav"); file.play(); 
}
public void rotateSound() {
  file = new SoundFile(this, "rotate.wav"); file.play(); 
}
