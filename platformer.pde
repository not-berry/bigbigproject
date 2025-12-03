import fisica.*;

//colours but color
color black = #000000;
color dark = color(24,98,52);
color white = color(255,255,255);
color noStroke = #644949;
color noFill = #5F4444;
color red = #F55454;
color blue = #3896C6;

//images
PImage grass;

//vars
PImage map;
int x = 0;
int y = 0;
int gridsize = 64;

//key variables
boolean upkey, leftkey, rightkey, spacebar;

//position list
FloatList posX = new FloatList(), posY = new FloatList();

//fisica
FWorld world;
FBox p;
FBomb bomb = null;

ArrayList<FBox> boxes;

void setup() {
  size(1400,1000);
  
  Fisica.init(this);
  world = new FWorld();
  makeWorld();
  
  createPlayer();
  
  boxes = new ArrayList();
  
  grass = loadImage("grass.png");
  
  map = loadImage("bigmap.png");
  while(y < map.height) {
    color c = map.get(x,y);
    
    if(c == black) {
      FBox b = new FBox(gridsize, gridsize);
      b.setFillColor(black);
      b.setPosition(x*gridsize,y*gridsize);
      b.setStatic(true);
      b.setGrabbable(false);
      b.attachImage(grass);
      boxes.add(b);
      world.add(b);
    } else if(c == dark) {
      posX.append(x*gridsize);
      posY.append(y*gridsize);
    }
    
    x++;
    
    if(x == map.width) {
      x = 0;
      y++;
    }
  }
}

void draw() {
  background(blue);
  
  movePlayer();
  
  pushMatrix();
  translate(-p.getX()+width/2, -p.getY()+height/2);
  rectMode(CENTER);
  for(int i = 0; i < posX.size(); i++) {
    fill(black);
    square(posX.get(i),posY.get(i), gridsize);
  }
  world.step();
  world.draw();
  popMatrix();
}

void makeWorld() {
  Fisica.init(this);
  world = new FWorld(-100000,-100000, 100000,100000);
  world.setGravity(0, 1600);
}
