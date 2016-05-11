class Gameobject                   //Gameobject parent class
{
  PVector pos, forward;            //position and forward vectors
  float speed;                     //speed
  
  float w, h, halfW, halfH;        //sizes
  float theta;                     //rotation variable
  
  color c;                         //color variable
  
  boolean landed;                  //landed bool (only used by bomb, needed here for access in main sketch)
    
  Gameobject(float x, float y)     //Gameobject constructor
  {
    pos = new PVector(x, y);       //declare pos vector
    
    forward = new PVector();       //declare forward vector
  }
  
  void move()    //these methods are overridden with polymorphism
  {
  }
  
  void update()  //these methods are overridden with polymorphism
  {
  }
}