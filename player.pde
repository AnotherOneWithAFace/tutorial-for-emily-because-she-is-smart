class Player {
  int x, y;
  color colour = color(255);
  int lives = 3;
  float speed;

  Player(int screen_y)
  {
    x = SCREENX / 2;
    y = screen_y;
  }
  
  void lost()
  {
    lives--;
  }
  
  void reset()
  {
    lives = 3;
  }

  void move(int new_x)
  {
    speed = mouseX - pmouseX;
    if (new_x > SCREENX-PADDLEWIDTH)
      x = SCREENX-PADDLEWIDTH;
    else if (new_x < 0)
      x = 0;
    else
      x = new_x;
  }

  void draw()
  {
    fill(colour);
    rect(x, y, PADDLEWIDTH, PADDLEHEIGHT);
  }
}
