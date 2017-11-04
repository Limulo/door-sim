class Door
{
  PVector hinge;
  float w,l;
  float angle;
  
  // maximal excursion of the door
  float aMax = PI/2;
  float aMin = -PI/2;
  
  float m = 8.5; // mass
  float I; // inertia momentum
  
  float Uk; // kinetic potential energy
  float Ue; // elastic potential energy
  float U;  // total potential energy
  
  float aAcceleration;
  float aVelocity;
  
  float losses = 0.03; // losses (0.0 - 1.0)
  
  boolean active = false;
  
  Spring spring;
  
  /*************************************************/
  Door( float x, float y, float _w, float _l)
  {
    w = _w;
    l = _l;
    hinge = new PVector( x, y );  
    spring = new Spring();
    aAcceleration = 0.0;
    aVelocity = 0.0;
    angle = 0.0;
  }
  
  /*************************************************/
  void update()
  {
    if( active )
      {
      aVelocity += aAcceleration;
      angle += aVelocity;
       
      // menage the case we push the door 
      // too hard and make it reach its maximum
      // opening/closing extensions
      if( angle > aMax )
      {
        println("\tSBAAAM !");
        angle = aMax;
        aVelocity = 0.0;      
      }
      else if( angle < aMin )
      {
        println("\tSBAAAM !");
        angle = aMin;
        aVelocity = 0.0;  
      }
      else
      {
        aVelocity *= 1.0-losses;
      }
      
      Ue = spring.getPotential( angle );
      Uk = 0.5 * m * aVelocity * aVelocity;
      U = Ue + Uk;
      
      //println("potential: " + U +";");
      
      if( U < 1E-4 )
      {
        // potential energy is now very little
        // so we can stop the physic simulation an
        // put the door at rest.
        //println("\t REST ");
        active = false;
        aVelocity = 0.0;
        aAcceleration = 0.0;
        angle = 0.0;
      }
      
      aAcceleration = 0.0;  
    }
    else
    {
      // physic simulation now can sleep
      //println("sleeping");
    }
  }
  
  /*************************************************/
  void display()
  {
    pushMatrix();
    pushStyle();
    
    translate( hinge.x, hinge.y );
    
    // draw the frame
    fill(180, 83, 35, 120);
    noStroke();
    rect(0, 0, l, w);
    
    rotate( angle );
    
    // draw the door
    fill(180, 83, 35);
    rect(0, 0, l, w);
    
    // draw the hinge
    fill(120);
    ellipse(0, 0, 5, 5);
    
    popStyle();
    popMatrix();
  } 
  
  /*************************************************/
  // When we calculate torque we take for granted
  // that all forces are applyed perpendicularly
  // to the door so the cross product is simply:
  // M = r*F
  // where r is the lenght of the level arm
  // that is the distance form the hinge and the
  // application point of the force vector.
  // For semplicity sake we are also considering a
  // lever arm of lenght 'l', the same as the door lenght!
  void applySpringForce()
  {
    // do necessary computation only if the door is active
    if( active ) 
    {
      float rSpring = l;
      calculateI();
      aAcceleration += rSpring * spring.getForce( angle ) / I;
    }
  }
  
  /*************************************************/
  void applyForce( float magnitude )
  {
    active = true;
    float rCustom = l;
    calculateI();
    aAcceleration += rCustom * magnitude / I;
  }
  
  /*************************************************/
  // I moved the calculation of the iniertia momentum
  // here in order to calculat it in run time.
  // This gave me the possibility to tweak mass parameter
  // in run time!
  void calculateI()
  {
    I = m * l * l / 3;
  }
  
}