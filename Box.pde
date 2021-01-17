
class Box {
  int mX;
  int mY;
  color mColor;
  int mAlpha;
  public Box(int x, int y) {
    mX = x;
    mY = y;
    mColor = color(random(255), random(255), random(255));
    mAlpha = 255;
  }
  
  public Box(color c) {
    mX = int(random(width));
    mY = int (random(height));
    mColor = c;
    mAlpha = 255;
  }
  
  public void draw(PGraphics pg) {
     pg.fill(mColor, mAlpha);
     pg.ellipse(mX, mY, 30, 30);
     mX += random(-2,3);
     mY += 1;
     mAlpha -= 1;
  }
  public boolean isDead() {
     return mAlpha <= 0; 
  }
};
