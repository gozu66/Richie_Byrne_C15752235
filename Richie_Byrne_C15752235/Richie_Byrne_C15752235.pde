ArrayList<Gameobject> clouds = new ArrayList<Gameobject>();
Bomb bomb;
Plane plane;

void setup()
{
  size(500, 500);
  
  int i = 0;
  while(i < 5)
  {
    float rndX = width + random(width);
    float rndY = random(height * 0.5f);
    clouds.add(new Cloud(rndX, rndY));
    
    i++;
  }
  
  plane = new Plane(-20, 50);  
  
  bomb = new Bomb(0, 0);
}

void draw()
{
  drawBackground(); 
  
  for(int i = 0; i < clouds.size(); i++)
  {
    Gameobject cloud = clouds.get(i);
    cloud.update();
  }
  
  plane.update();
  
  bomb.update();
  
  if(keyPressed && key == ' ' && !keyDown)
  {
    //Drop bomb
    bomb.pos.x = plane.pos.x;
    bomb.pos.y = plane.pos.y;
    bomb.bombDropAndCollect();
    keyDown = true;
  }
}

boolean keyDown = false;

void drawBackground()
{
  noStroke();
  background(100, 100, 255);
  fill(100, 255, 150);
  rect(0, height * 0.5f, width, height * 0.5f);
}


void keyReleased()
{
  keyDown = false;
}