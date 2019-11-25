
// resultado global da cor
int r, g, b;

// Paleta B - grupo 1
int coresB [6][3] = {
  {0, 255, 77}, {109, 0, 255}, {255, 0, 255},
  {0, 255, 255}, {255, 0, 71}, {253, 255, 0}
};

// Paleta A - grupo 2
int coresA [6][3] = {
  {255, 82, 0}, {255, 247, 0}, {0, 238, 255},
  {79, 0, 255}, {0, 255, 249}, {255, 255, 255}
};

// Paleta C - grupo 3
int coresC [6][3] = {
  {224, 0, 255}, {255, 245, 0}, {0, 255, 241},
  {255, 0, 95}, {255, 250, 0}, {255, 255, 255}
};

void setup() {
  // put your setup code here, to run once:

}

void loop() {
  // put your main code here, to run repeatedly:
  // update cor
  triangulo(   coresB[0][0], coresB[0][1], coresB[0][2],
               coresB[1][0], coresB[1][1], coresB[1][2],
               coresB[2][0], coresB[2][1], coresB[2][2],
               int(millis() / 100) % 360);
}

void triangulo(int ra, int ga, int ba,
               int rb, int gb, int bb,
               int rc, int gc, int bc,
               int v) {
  if (0 <= v && v < 60 || v == 360) {
    r = ra;
    g = ga;
    b = ba;
  }
  if (60 <= v && v < 120) {
    float t = map(v, 60, 120, 0, 1);
    lerpC(ra, ga, ba, rb, gb, bb, t);
  }
  if (120 <= v && v < 180) {
    r = rb;
    g = gb;
    b = bb;
  }
  if (180 <= v && v < 240) {
    float  t = map(v, 180, 240, 0, 1);
    lerpC(rb, gb, bb, rc, gc, bc, t);
  }
  if (240 <= v && v < 300) {
    r = rc;
    g = gc;
    b = bc;
  }
  if (300 <= v && v < 360) {
    float  t = map(v, 300, 360, 0, 1);
    lerpC(rc, gc, bc, ra, ga, ba, t);
  }
}

void lerpC(int r0, int g0, int b0,
           int r1, int g1, int b1,
           float t) {
  r =  int (map(t, 0, 1, r0, r1));
  g =  int(map(t, 0, 1, g0, g1));
  b =  int(map(t, 0, 1, b0, b1));
}
