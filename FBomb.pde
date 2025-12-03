class FBomb extends FBox {
  
  int timer;
  FBomb() {
    super(gridsize, gridsize);
    timer = 60;
    this.setFillColor(red);
    this.setPosition(p.getX()+gridsize, p.getY());
    world.add(this);
  }
  
  void act() {
    timer--;
    if(timer == 0) {
      explode();
      world.remove(this);
      bomb = null;
    }
  }
  
  void explode() {
    for(int i = 0; i < boxes.size();i++) {
      FBox b = boxes.get(i);
      if(dist(this.getX(), this.getY(), b.getX(), b.getY()) < 500) {
        float vx = (b.getX() - this.getX()) * 5;
        float vy = (b.getY() - this.getY()) * 5;
        b.setVelocity(vx, vy);
        b.setStatic(false);
      }
    }
  }
}
