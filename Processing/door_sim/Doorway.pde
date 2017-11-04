class Doorway
{
  PVector pos;
  float w, h;
  
  PVector leftSpace;
  PVector rightSpace;
  PVector sideSpaceSize;
  
  //Door door;
  
  Doorway( float _x, float _y, float _h, float _doorW, float _doorL )
  {
    pos = new PVector( _x, _y );
    h = _h;
    sideSpaceSize = new PVector( _doorL*10/100, _doorW );
    w = _doorL + 2*sideSpaceSize.x;
    
    leftSpace = new PVector( 0, h*0.5 - _doorW*0.5 );
    rightSpace = new PVector( w-sideSpaceSize.x, leftSpace.y);
    
    //door = new Door( sideSpaceSize.x, leftSpace.y, _doorW, _doorL ); 
  }
  
  //void update()
  //{
  //  door.applySpringForce();
  //  door.update();
  //}
  
  void display()
  {
    pushMatrix();
    translate(pos.x, pos.y );
    noStroke();
    fill(200);
    rect(0, 0, w, h);
    translate(leftSpace.x, leftSpace.y);
    fill(255);
    rect(0, 0, sideSpaceSize.x, sideSpaceSize.y);
    pushMatrix();
    translate( rightSpace.x, 0);
    fill(255);
    rect(0, 0, sideSpaceSize.x, sideSpaceSize.y);
    popMatrix();
    //translate( sideSpaceSize.x, 0 );
    //door.display();
    popMatrix();
  }
  
  //void apply()
  //{
  //  door.applyForce();
  //}
  
  PVector getHinge()
  {
    return PVector.add( pos, new PVector( sideSpaceSize.x, leftSpace.y ));
  }
  
}