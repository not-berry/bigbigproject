void createPlayer() {
  p = new FBox(gridsize*0.8,gridsize*1.3);
  p.setPosition(20*gridsize,27*gridsize);
  
  //set visuals
  p.setFillColor(white);
  p.setNoStroke();
  
  //set physical properties
  p.setRestitution(0);
  p.setDensity(10);
  p.setFriction(0);
  p.setGrabbable(false);
  p.setRotatable(false);
  
  //add to world
  world.add(p);
}

void movePlayer() {
  float vx = p.getVelocityX();
  float vy = p.getVelocityY();
  
  //side movement
  if(leftkey && !rightkey) vx = -600;
  if(rightkey && !leftkey) vx = 600;
  
  //slow down
  if(!leftkey && !rightkey || leftkey && rightkey) vx *= 0.9;
  
  //jump
  ArrayList<FContact> contacts = p.getContacts();
  if(upkey && contacts.size() > 0) vy = -1000;
  
  //bomba
  if(spacebar && bomb == null) {
    bomb = new FBomb();
  }
  
  if(bomb != null) bomb.act();
  
  //apply
  p.setVelocity(vx,vy);
}
