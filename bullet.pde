class Bullet {
  int x, y;
  int width, height;
  color colour = color (0);
  int speed = 1;

  Bullet(int sizex, int sizey, int posx, int posy)
  {
    width = sizex;
    height = sizey;
    x = posx;
    y = posy;
  }

  void collide(Invader colliders[])
  {// y+height >= alien.x && y - height < alien.x+alien.height && x >= alien.x && x <= alien.x + alien.width
    for (Invader alien : colliders) {
      //boolean collided = x > alien.x && x+width < alien.x + alien.width && y > alien.y && y+height < alien.y + alien.height && (x+width) < (alien.x + alien.width) && (y+height) < (alien.y + alien.height);
      boolean collided = ((x > alien.x && x+width <= alien.x+alien.width) || x+width > alien.x && x+width <= alien.x + alien.width) && ((y > alien.y && y <= alien.y+alien.height) || y+height > alien.y && y+height <= alien.y+alien.height);
      //boolean collided = x < alien.x && alien.x < x+width && y > alien.y && alien.y < y+height;
      if (collided) {
        if (!alien.dead) {
          alien.explode(exploded);
          //println("HIT!");
        }
      }
    }
  }

  void move()
  {
    y -= BULLETSPEED*2;
  }

  void draw()
  {
    rect(x, y, width, height);
  }
}
