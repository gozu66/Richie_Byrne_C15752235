ArrayList<Gameobject> clouds = new ArrayList<Gameobject>();
Bomb bomb;
Plane plane;
Man man;

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
  
  PVector manSpot = new PVector(width * 0.1f, height * 0.9f);
  man = new Man(manSpot.x, manSpot.y);
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
  
  man.update();  
}

void drawBackground()
{
  noStroke();
  background(100, 200, 255);
  fill(50, 255, 50);
  rect(0, height * 0.5f, width, height * 0.5f);
}

void keyReleased()
{
 keyDown = false;
}