
boolean isLeft = false;
boolean isRight = false;
boolean isJump = false;
boolean lastjump = false;
int [] myX = new int [5];
int [] myY = new int [5];

Guy bob;
Fly [] joes = new Fly [5];
public void setup() {
  size(500, 500);
  bob = new Guy();

  for (int g = 0; g < 5; g++) {
    myX[g] = 250;
    myY[g] = 250;
    joes[g] = new Fly(myX[g], myY[g], bob.currentX, bob.currentY);
}
}



void keyPressed() {
  if (key == 'a' || key == 'A') isLeft = true;
  if (key == 'd' || key == 'D') isRight = true;
  if (key == ' ') isJump = true;
}

void keyReleased() {
  if (key == 'a' || key == 'A') isLeft = false;
  if (key == 'd' || key == 'D') isRight = false;
  if (key == ' ') isJump = false;
}


public void draw() {
  background(#FFFFFF);
  fill(0);
  for (int i = 0; i < 5; i ++) {
    joes[i].guyX = bob.currentX;
    joes[i].guyY = bob.currentY;
    joes[i].move();
    joes[i].show();
    myX[i] = joes[i].currentX;
    myY[i] = joes[i].currentY;
  }


  bob.show();
  boolean jump = false;
  if (isLeft) {
    bob.moveLeft();
  }
  if (isRight) {
    bob.moveRight();
  }
  if (isJump) {
    jump = true;
  }
  if (jump && !lastjump) {
    bob.jump();
  }

  bob.fall();



  lastjump = jump;
}


class Guy {
  int currentX, currentY, fallRate, jumpHeight;
  float velocityY;
  Guy() {
    jumpHeight = 25;
    currentX = 250;
    currentY= 250;
    fallRate = 1;
    velocityY = 0 ;
  }

  void moveLeft() {
    currentX -= 4;
    if (currentX <= 15) {
      currentX = 15;
    }
  }
  void moveRight() {
    currentX += 4;
    if (currentX >= 485) {
      currentX = 485;
    }
  }
  void fall() {

    velocityY += fallRate;
    currentY += velocityY;
    velocityY *= 0.9;
    if (currentY <= 15) {
      currentY = 15;
    }
    if (currentY >= 485) {
      currentY = 485;
    }
  }
  void jump() {
    velocityY -= jumpHeight;
  }
  void show() {
    ellipse(currentX, currentY, 30, 30);
  }
}
class Fly {
  int currentX, currentY, guyX, guyY;

  Fly (int myX, int myY, int xGuy, int yGuy) {
    currentX = myX;
    currentY = myY;
    guyX = xGuy;
    guyY = yGuy;
  }
  void move() {
    if (guyX > currentX) {
      currentX += (int)(Math.random() * 5 -1);
    } else {
      currentX += (int)(Math.random() * 5 - 4);
    }
    if (guyY > currentY) {
      currentY += (int)(Math.random() * 5 -1);
    } else {
      currentY += (int)(Math.random() * 5 -4);
    }
  }
  void show() {
    ellipse(currentX, currentY, 10, 10);
  }
}//end of fly class



