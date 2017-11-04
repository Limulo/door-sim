import controlP5.*;
ControlP5 cp5;
Accordion accordion;
Slider sA, sB, sC;

Doorway dw;
Door door;

void setup()
{
  size( 360, 200 );
  //frameRate(30);
  dw = new Doorway( width*0.5+40, 0, height, 10, 100 );
  PVector v = dw.getHinge();
  door = new Door (v.x, v.y, 10, 100);
  gui();
}

void draw()
{
  background(255);
  //dw.update();
  door.applySpringForce();
  door.update();
  dw.display();
  door.display();
}

//void mousePressed()
//{
//  door.applyForce( mouseX, mouseY );
//}

void keyPressed()
{
  door.applyForce( 60 );
}

//void mouseDragged()
//{
//  println( frameCount + " - apply force");
//  door.applyForce( 5 );
//}



/* GUI STUFF *************************************************/
void gui()
{
  cp5 = new ControlP5(this);
    
  // group 1 the door
  Group g1 = cp5.addGroup("door")
                .setBackgroundColor(color(0, 64))
                //.setBackgroundHeight(150)
                ;
  
  sA = cp5.addSlider( "mass" );
  sA.setSliderMode(1);
  sA.moveTo(g1);
  sA.setPosition( 10, 10 );
  sA.setRange(0.5, 80);
  sA.setValue( door.m );
  
  sB = cp5.addSlider( "losses" );
  sB.setSliderMode(1);
  sB.moveTo(g1);
  sB.setPosition( 10, 25 );
  sB.setRange(0.01, 0.5);
  sB.setValue(door.losses );
  
  // group 2: the Spring
  Group g2 = cp5.addGroup("spring")
                .setBackgroundColor(color(0, 64))
                //.setBackgroundHeight(150)
                ;
  
  sC = cp5.addSlider( "stiffness" );
  sC.setSliderMode(1);
  sC.moveTo(g2);
  sC.setPosition( 10, 10 );
  sC.setRange(0.001, 10);
  sC.setValue(door.spring.k );
  
  
  // create a new accordion
  accordion = cp5.addAccordion("acc")
                 .setPosition(20,20)
                 .setWidth(160)
                 .addItem(g1)
                 .addItem(g2)
                 .setItemHeight(40);
                 ;
                 
  accordion.open(0, 1);
  
  // select MULTI or SINGLE mode.
  accordion.setCollapseMode(Accordion.MULTI); 
  
  // add callbacks
  sA.addCallback(new CallbackListener() {
    public void controlEvent(CallbackEvent theEvent) {
      if( theEvent.getAction() == ControlP5.ACTION_BROADCAST )
        door.m = sA.getValue();
    }
  });
  
  sB.addCallback(new CallbackListener() {
    public void controlEvent(CallbackEvent theEvent) {
      if( theEvent.getAction() == ControlP5.ACTION_BROADCAST )
        door.losses = sB.getValue();
    }
  });
  
  sC.addCallback(new CallbackListener() {
    public void controlEvent(CallbackEvent theEvent) {
      if( theEvent.getAction() == ControlP5.ACTION_BROADCAST )
        door.spring.k = sC.getValue();
    }
  });
}