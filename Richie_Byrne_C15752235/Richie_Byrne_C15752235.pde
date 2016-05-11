ArrayList<Gameobject> clouds = new ArrayList<Gameobject>();            //Gameobject arraylist of clouds [polymorphism]
Bomb bomb;                                                             //bomb object
Plane plane;                                                           //Plane object
Man man;                                                               //man object

boolean keyDown = false;                                               //bool to lock out dropping bomb while bomb already being dropped

void setup()
{
  size(500, 500);
  
  int i = 0;
  while(i < 5)                                                                        //While loop for initialising cloud arraylist
  {
    float cloudScreenOffset = 160;                                                     //offset to keep clouds in sky and not offscreen
    float rndX = width + random(width);                                                //random x and y for cloud placement
    float rndY = random(cloudScreenOffset, (height * 0.5f) - cloudScreenOffset);
    clouds.add(new Cloud(rndX, rndY));                                                 //adding cloud to array list
    i++;
  }
  
  PVector planeStartPos = new PVector(-20, 50);                            
  plane = new Plane(planeStartPos.x, planeStartPos.y);              //creating plane at offscreen position
  
  bomb = new Bomb(0, 0);                                            //declaring the bomb
  
  PVector manSpot = new PVector(width * 0.1f, height * 0.9f);
  man = new Man(manSpot.x, manSpot.y);                              //creating man at default position
}

void draw()
{  
  drawBackground();                        //draw the sky and grass
  
  for(int i = 0; i < clouds.size(); i++)   //loop through cloud arraylist
  {
    Gameobject cloud = clouds.get(i);      //clouds as gameobjects [polymorphism]
    cloud.update();                        //update clouds
  } 

  plane.update();   //update plane
  
  bomb.update();    //update bomb
  
  man.update();     //update man
}

void drawBackground()          //draw the sky and grass
{
  noStroke();
  background(100, 200, 255);
  fill(50, 255, 50);
  rect(0, height * 0.5f, width, height * 0.5f);
}

void keyReleased()
{
   keyDown = false;    //bool to lock out dropping bomb while bomb already being dropped
}