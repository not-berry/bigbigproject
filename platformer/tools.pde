void c(color s, color f, float sw) {
  stroke(s);
  if(s == noStroke) noStroke();
  fill(f);
  if(f == noFill) noFill();
  strokeWeight(sw);
}

void c(color s, color f, float sw, float opp) {
  stroke(s, opp);
  if(s == noStroke) noStroke();
  fill(f, opp);
  if(f == noFill) noFill();
  strokeWeight(sw);
}
