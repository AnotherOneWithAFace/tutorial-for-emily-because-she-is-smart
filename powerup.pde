class Powerup {
  PImage fruit;
  int x, y;
  int width, height;
  int type = 0;
  boolean used = false;

  Powerup(int xpos, int ypos)
  {
    x = xpos;
    y = ypos;
    type = (int)random(1, 4);
    switch (type) {
    case 1:
      {
        fruit = bannana;
        break;
      }
    case 2:
      {
        fruit = apple;
        break;
      }
    case 3:
      {
        fruit = aubergine;
        break;
      }
    default:
    {
      fruit = aubergine;
    }
    }
    width = fruit.width;
    height = fruit.height;
  }

  void move()
  {
    y++;
    //println(y);
  }

  void draw()
  {
    if (used)
      return;
    image(fruit, x, y);
  }

  void check_activate(Player player)
  {
    if (used)
      return;
    //boolean collided = x > player.x && x <= (player.x + PADDLEWIDTH) && y > player.y && y < (player.y + PADDLEHEIGHT) && x > player.x && x < player.x+PADDLEWIDTH && y > player.y && y < player.y+PADDLEHEIGHT;
    boolean collided = ((x > player.x && x <= player.x+PADDLEWIDTH) || x+width > player.x && x+width <= player.x+PADDLEWIDTH) && ((y > player.y && y <= player.y + PADDLEHEIGHT) || y+height > player.y && y+height < player.y+PADDLEHEIGHT);
    if (collided) {
      println("yoink");
      used = true;
      switch (type) {
      case 1:
        {// bannana
          BULLETSPEED++;
          break;
        }
      case 2:
        {// apple
          BULLETSIZE *= 2; // cant get collision to work properly for this, try fix pls
          break;
        }
      case 3:
        {// aubergine
          if (threeway) break;
          threeway = true;
          println("oh baby a triple");
          break;
        }
      }
    }
  }
}
