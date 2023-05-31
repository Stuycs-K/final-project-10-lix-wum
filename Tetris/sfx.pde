import processing.sound.*;
SoundFile file;

public void backgroundSound() {
  file = new SoundFile(this, "tetris.mp3"); file.play(); 
} 
public void hardDropSound() {
  file = new SoundFile(this, "hardDrop.wav"); file.play(); 
}
public void softDropSound() {
  file = new SoundFile(this, "softDrop.wav"); file.play(); 
}
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
