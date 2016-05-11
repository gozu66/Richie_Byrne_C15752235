class Bomb extends Gameobject    //bomb class
{
  PVector acc;                    //acceleration
  PVector vel;                    //velocity

  float landingPoint;             //y value for where bomb will land

  float deltaTime;                //time delta

  boolean released, landed;       //bools to keep track of bomb state

  Bomb(float x, float y)          //bomb contstructor
  {
    super(x, y);                  //super constructor
    
    released = false;             //bool to keep track of bomb state
    
    acc = new PVector(0, 9.8f);   //initialize acceleration
    
    vel = new PVector(0, 100);    //initialize velocity
    
    deltaTime = 1.0f / frameRate; //set time delta
    
    c = color(150, 0, 0);         //set color to Red
  }

  void bombDrop()                                        //method for dropping bomb
  {
    landingPoint = random(height * 0.5f, height-100);    //select random y value to land at (-100 to keep off bottom of screen)
    vel = new PVector(0, 100);                           //rest elocity to stop cummulative forces
    released = true;                                     //bool to keep track of bomb state
  }
  
  void bombCollect()                                    //method for collecting bomb
  {
    released = false;                                   //bool to keep track of bomb state
    pos = new PVector(0, 0);                            //set bomb position to 0, 0
    landed = false;                                     //bool to keep track of bomb state
  }

  void update()
  { 
    if(released)                                        //if bomb is dropping or on ground
    {
      drawBomb();                                       
            
      if(pos.y <= landingPoint)                          //if bomb has not yet reaced ground point
      {
        landed = false;                                 //bool to keep track of bomb state
        vel.add(acc);                                   //add acceleration to velocity
        pos.add(PVector.mult(vel, deltaTime));          //add velocity (mutliplied by time delta) to position
      }
      else                                              //if bomb has reaced ground point
      {
        landed = true;                                  //bool to keep track of bomb state
      }
    }
    else                                                //if bomb is NOT YET dropping or on ground
    {
      if(keyPressed && key == ' ' && !keyDown)         //look for key input and check tracking bools         
      {
        pos.x = plane.pos.x;                           //move bomb to plane position
        pos.y = plane.pos.y;
        bomb.bombDrop();                               //call drop bomb method
        keyDown = true;                                //bool to keep track of bomb state
      }
    }
  }
  
  void drawBomb()
  {
    fill(c);                            //color bomb
    rect(pos.x, pos.y, 10, 10);         //draw bomb
  }

}