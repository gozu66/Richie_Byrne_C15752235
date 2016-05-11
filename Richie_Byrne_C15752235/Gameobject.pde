class Gameobject
{
  PVector pos, forward;
  float speed;
  
  float w, h, halfW, halfH;
  float theta;
  
  color c;
  
  boolean landed;
    
  Gameobject(float x, float y)
  {
    pos = new PVector(x, y);
    
    forward = new PVector();
  }
  
  void move()
  {
  }
  
  void update()
  {
  }
}