int SCREENX = 500;
int SCREENY = 500;
int NGUYS = 10;
float SPEED = 1;
int BULLETSPEED = 1;
int MAXBULLETS = 100;
int MAXPOWERUPS = 10;
int BULLETSIZE = 5;
int PADDLEWIDTH = 10;
int PADDLEHEIGHT = 10;

// added another comment lol

Bullet bill[];
int current_bullet_idx = 0;
Powerup arsenal[];
int current_powerup_idx = 0;
Invader guys[];
PImage exploded;
PImage bannana, apple, aubergine;
boolean threeway = false;

Player me;

void spawn_powerup(int x, int y)
{
  if (current_powerup_idx >= MAXPOWERUPS) {
    current_powerup_idx = 0;
  }

  arsenal[current_powerup_idx] = new Powerup (x, y);
  current_powerup_idx++;
}

void settings()
{
  size (SCREENX, SCREENY);
}

void setup()
{
  guys = new Invader[NGUYS];
  PImage img = loadImage ("invader.GIF");
  bannana = loadImage ("bannana.png");
  apple = loadImage ("apple.png");
  aubergine = loadImage ("aubergine.png");
  for (int i = 0; i < NGUYS/2; i++) {
    guys[i] = new Invader (50+(i*75), 50, img);
  }
  for (int i = NGUYS/2; i < NGUYS; i++) {
    guys[i] = new Invader (50+((i-5)*75), 100, img);
  }
  bill = new Bullet[MAXBULLETS];
  exploded = loadImage ("exploding.GIF");
  arsenal = new Powerup[MAXPOWERUPS];
  me = new Player (SCREENY-50);
  me.colour = color (0);
}

void mousePressed()
{
  if (current_bullet_idx >= bill.length) {
    current_bullet_idx = 0;
  }
  bill[current_bullet_idx] = new Bullet (BULLETSIZE, BULLETSIZE, me.x, me.y);
  if (threeway) {
    bill[current_bullet_idx+1] = new Bullet (BULLETSIZE, BULLETSIZE, me.x+50, me.y);
    bill[current_bullet_idx+2] = new Bullet (BULLETSIZE, BULLETSIZE, me.x-50, me.y);
  }
  current_bullet_idx++;
  if (threeway) {
    current_bullet_idx+=2;
  }
}

void draw()
{
  background (255);

  for (Invader guy : guys) {
    if (guy.x > SCREENX && guy.y > SCREENY) {
      guy.reset();
    }
    guy.move();
    guy.draw();
  }

  me.move(mouseX);
  me.draw();

  for (Bullet bullet : bill) {
    if (bullet != null) {
      bullet.move();
      bullet.draw();
      bullet.collide(guys);
    }
  }
  for (Powerup thing : arsenal) {
    if (thing != null) {
      thing.move();
      thing.check_activate(me);
      thing.draw();
    }
  }
}
