import processing.sound.*;
SoundFile file;

public void backgroundSound() {
  file = new SoundFile(this, "tetris.mp3"); file.play(); 
} 
public void hardDropSound() {
  file = new SoundFile(this, "hardDrop.wav"); file.play(); 
}
