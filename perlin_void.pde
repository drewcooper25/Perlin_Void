// PERLIN VOID.
// Drew Cooper's 2019 EDGE project; an investigation on geometric hallucinations.

int cols, rows;
int scl = 20;
int w = 3300;
int h = 2500;

float flying = 0;
float[][] terrain;

//PGraphics pg; // need to investigate later...

void setup() {
  size(1285, 755, P3D);
  cols = w / scl;
  rows = h / scl;
  terrain = new float[cols][rows];
  //pg = createGraphics(1285, 755, P3D);
}

void draw() {
  flying -=0.03;
  float yoff = flying;
  for (int y = 0; y < rows; y++) {
    float xoff = 0;
    for (int x = 0; x < cols; x++) {
      terrain[x][y] = map(noise(xoff, yoff), 0, 1, -500, 250);
      xoff+=0.1;
    }
    yoff+=0.033;
  }

  background(0);
  stroke(255);
  strokeWeight(1.3);
  noFill();

  translate(width/2, height/2);
  rotateX(PI/2.5); //3.3
  translate(-w/2, -h/2);

  for (int y = 0; y < rows-1; y++) {
    beginShape(POINTS);
    for (int x = 0; x < cols; x++) {
      vertex(x*scl, y*scl, terrain[x][y]);
      vertex(x*scl, (y+1)*scl, terrain[x][y+1]);
      //rect(x*scl, y*scl, scl, scl);
    }
    endShape();
  }
  saveFrame();
}
