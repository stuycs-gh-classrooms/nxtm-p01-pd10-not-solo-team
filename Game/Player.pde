class Player {
  float x;
  
  Player(){
  }
  
  void display(){
    triangle(x, 670, x-30, 720, x+30, 720);
  }
  
  void move(){
    if(keyPressed){
      if(key == LEFT){
        x -= 5;
        display();
      }
      if(key == RIGHT){
        x += 5;
        display();
      }
    }
  }
}
