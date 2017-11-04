class Spring
{
  float k = 7; // stiffness
  float Fe;
  
  float Ue; // elastic potential energy
  
  // Because this is a rotational spring
  // all these variables represent angles
  float angle;   // rotational displacement
  float anchor;  // angle which the spring is attached to
  float rest;    // angle where the spring is at its rest position
  
  Spring()
  {
    // we make anchor and rest angle coincide
    anchor = rest = 0.0;
  }
  
  float getForce( float _aCurrent )
  {
    angle = (_aCurrent - anchor) - rest;
    Fe = -1*k*angle;
    Ue = getPotential( angle );
    println("spring: " + Fe);
    return Fe;    
  }
  
  float getPotential( float a )
  {
    return 0.5 * k * a * a;
  }
}