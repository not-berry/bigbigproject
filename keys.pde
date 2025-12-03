void keyPressed() {
  if(keyCode == 'w' || keyCode == 'W') upkey = true;
  if(keyCode == 'a' || keyCode == 'A') leftkey = true;
  if(keyCode == 'd' || keyCode == 'D') rightkey = true;
  
  //spacebar
  if(keyCode == ' ') spacebar = true;
}

void keyReleased() {
  //p1 stop movement
  if(keyCode == 'w' || keyCode == 'W') upkey = false;
  if(keyCode == 'a' || keyCode == 'A') leftkey = false;
  if(keyCode == 'd' || keyCode == 'D') rightkey = false;
  
  //spacebar
  if(keyCode == ' ') spacebar = false;
}
