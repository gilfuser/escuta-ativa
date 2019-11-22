int r, g, b;

void setup() {
  // put your setup code here, to run once:

}

void loop() {
  // put your main code here, to run repeatedly:

}

void lerpC(int r0, int g0, int b0,
           int r1, int g1, int b1,
           int t) {
  r =  int (map(t, 0, 1, r0, r1));
  g =  int(map(t, 0, 1, g0, g1));
  b =  int(map(t, 0, 1, b0, b1));
}
