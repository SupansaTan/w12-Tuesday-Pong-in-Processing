Paddle paddle;
Ball ball;
PongGame startGame;

color black;

void setup(){
  size(800,600);
  black = color(0); // set rgb color : black
  background(black);
  paddle = new Paddle();
  ball = new Ball();
  startGame = new PongGame();
}

void draw(){
  background(black);
  startGame.draw();
  ball.draw();
  paddle.draw();
}

class Ball{
  float posX, posY, size, direction;
  int velocity;
  
  Ball(){
    // set ball at center position
    posX = width/2;
    posY = height/2;
    size = 30;
    direction = 1;
    velocity = 1;
  }
  
  void draw(){
    circle(posX, posY, size);
    this.move();
  }
  
  void move(){
    if (this.bounce(this.posX, this.posY) == true){
      // when the ball bounce with the paddle
        direction = -1 * direction; 
    }
    this.posX += 5 * velocity * direction; // increase or decrease of position x 
  }
  
  float getX(){
    return this.posX;
  }
  
  float getY(){
    return this.posY;
  }
  
  boolean bounce(float posX, float posY){
    if (posX-this.size/2 == paddle.pos1X+paddle.sizeWidth && paddle.pos1Y <= posY && posY <= paddle.pos2Y + paddle.sizeHeight){
      // if the ball bounce with paddle left
      return true;
    }
    else if(posX+this.size/2 == paddle.pos2X && paddle.pos2Y <= posY && posY <= paddle.pos2Y + paddle.sizeHeight){
      // if the ball bounce with paddle right
      return true;
    }
    else if(posX == 0 || posX == width || posY == 0 || posY == height){
      // if the ball bounce with the edge of widget
      return true;
    }
    return false;
  }
  
  boolean bounceEdge(){
    if(posX == 0 || posX == width){
      // if the ball bounce with left or right edge of widget
      return true;
    }
    return false;
  }
  
}

class Paddle{
  float pos1X, pos1Y, pos2X, pos2Y, sizeWidth, sizeHeight;
  
  Paddle(){
    sizeWidth = 30;
    sizeHeight = 200;
    pos1X = 0;
    pos1Y = height/2 - sizeHeight/2;
    pos2X = width - sizeWidth;
    pos2Y = height/2 - sizeHeight/2;
  }
  
  void draw(){
    if (mousePressed == true){
      this.move();
    }
    rect(pos1X, pos1Y, sizeWidth, sizeHeight); // paddle left (player1)
    rect(pos2X, pos2Y, sizeWidth, sizeHeight); // paddle right (player2)
  }
  
  void move(){
    float dist1Y = pos1Y+(sizeHeight/2)- mouseY;  // distance between mouseY and center posY of paddle left
    float dist2Y = pos2Y+(sizeHeight/2)- mouseY;  // distance between mouseY and center posY of paddle right
    
    //check the paddle don't beyond the edge
    if (0 <= pos1Y-dist1Y && pos1Y-dist1Y+sizeHeight <= height || 0 <= pos2Y-dist2Y && pos2Y-dist2Y+sizeHeight <= height){
      if (pos1X <= mouseX && mouseX <= pos1X+sizeWidth && pos1Y <= mouseY && mouseY <= pos1Y+sizeHeight){
        // when mouse pressed paddle player1 (paddle left)
        pos1Y -= dist1Y;
      }
      else if(pos2X <= mouseX && mouseX <= pos2X+sizeWidth && pos2Y <= mouseY && mouseY <= pos2Y+sizeHeight){
        // when mouse pressed paddle player2 (paddle right)
        pos2Y -= dist2Y;
      }
    }
  }
  
}

class PongGame {
  int player1, player2; // contain score of each player
  int size; 
  
  PongGame(){
    //set start score
    player1 = 0;
    player2 = 0;
    size = 10; // set width of rectangle at center
  }
  
  void draw(){
    // rectangle at center
    rect(width/2 - size/2,0,size,height);
    
    // show score
    textSize(50);
    text(player1, width/2 - width/4, height/8);
    text(player2, width/2 + width/5, height/8);
    
    this.updateScore();
  }
  
  void updateScore(){
    // when the ball bounce with left or right edge of widget 
    if(ball.bounceEdge() == true){
      if (ball.getX() == 0){
        // player2 get score
        player2 += 1;
      }
      else if (ball.getX() == width){
        // player1 get score
        player1 += 1;
      }
    }
  }
  
}
