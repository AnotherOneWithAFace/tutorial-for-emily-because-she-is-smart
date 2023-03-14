interface Alien {  
  void explode(PImage wreck);
  void move();
  void draw();
}

// add a comment

class Invader implements Alien {
  final int Rightwards = 1;
  final int Leftwards = 2;
  final int Downwards = 3;
  // this won't let me use an enum for some reason idk why

  int state = 0; // 1 - rightwards movement, 2 - leftwards movement, 3 - downwards movement
  int x, y;
  PImage likeness;
  int width, height;
  int counter = 0;
  boolean dead = false;

  Invader(int initial_x, int initial_y, PImage visage)
  {
    x = initial_x;
    y = initial_y;
    likeness = visage;
    state = Rightwards;
    width = likeness.width;
    height = likeness.height;
  }
  
  void reset()
  {
    x = 10;
    y = 10;
  }

  void explode(PImage wreck)
  {
    dead = true;
    likeness = wreck;
    //SPEED++;
  }

  void move()
  {
    if (dead)
      return;

    boolean condition = (int)random(0,1000) == 1;
    if (condition) {
      spawn_powerup(x, y);
      //println("power!");
    }
    
    switch (state) {
    case Rightwards:
      { // rightwards movement
        x+=SPEED;
        if (x >= SCREENX-50) {
          state = Downwards; // downwards movement
        }
        break;
      }
    case Leftwards:
      { // leftwards movement
        x-=SPEED;
        if (x <= 20) {
          state = Downwards; // downwards movement
        }
        break;
      }
    case Downwards:
      {
        if (counter >= 50) {
          counter = 0;
          if (x <= 100) {
            state = Rightwards; // rightwards movement
          } else {
            state = Leftwards; // leftwards movement
          }
          //break;
        }
        y++;
        counter++;
        break;
      }
    }
  }


  void draw()
  {
    image(likeness, x, y);
  }
}
