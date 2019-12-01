/* ============================================
  Gil Fuser 2019 based on:
  https://github.com/jrowberg/i2cdevlib/tree/master/Arduino/MPU6050/examples/MPU6050_DMP6_ESPWiFi
  ===============================================
*/

/* This driver reads quaternion data from the MPU6060 and sends
   Open Sound Control messages.

  GY-521  NodeMCU
  MPU6050 devkit 1.0
  board   Lolin         Description
  ======= ==========    ====================================================
  VCC     VU (5V USB)   Not available on all boards so use 3.3V if needed.
  GND     G             Ground
  SCL     D4 (GPIO02)   I2C clock
  SDA     D3 (GPIO00)   I2C data
  XDA     not connected
  XCL     not connected
  AD0     not connected
  INT     D8 (GPIO15)   Interrupt pin

*/

#if defined(ESP8266)
#include <ESP8266WiFi.h>
#else
#include <WiFi.h>
#endif
#include <DNSServer.h>
//#include <WiFiClient.h>
#include <WiFiUdp.h>
#include <OSCMessage.h> // instalar via IDE
#include "I2Cdev.h"   // baixar no repo escuta-ativa
#include "MPU6050_6Axis_MotionApps20.h"
#include "Wire.h"
#include <Adafruit_NeoPixel.h> // instalar via IDE

#define PIN 4
#define N_LEDS 12

MPU6050 mpu;
const int MPU_ADDR = 0x68;

Adafruit_NeoPixel strip = Adafruit_NeoPixel(N_LEDS, PIN, NEO_GRB + NEO_KHZ800);

unsigned int pixelHue = 65535;

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


/* =========================================================================
   NOTE: In addition to connection 5/3.3v, GND, SDA, and SCL, this sketch
   depends on the MPU-6050's INT pin being connected to the ESP8266 GPIO15 (D8)
   pin.
   ========================================================================= */

// MPU control/status vars
bool dmpReady = false;  // set true if DMP init was successful
uint8_t mpuIntStatus;   // holds actual interrupt status byte from MPU
uint8_t devStatus;      // return status after each device operation (0 = success, !0 = error)
uint16_t packetSize;    // expected DMP packet size (default is 42 bytes)
uint16_t fifoCount;     // count of all bytes currently in FIFO
uint8_t fifoBuffer[64]; // FIFO storage buffer

// orientation/motion vars
Quaternion q;           // [w, x, y, z]         quaternion container
VectorInt16 aa;         // [x, y, z]            accel sensor measurements
VectorInt16 aaReal;     // [x, y, z]            gravity-free accel sensor measurements
VectorInt16 aaWorld;    // [x, y, z]            world-frame accel sensor measurements
VectorFloat gravity;    // [x, y, z]            gravity vector

#define OUTPUT_READABLE_YAWPITCHROLL

#define OUTPUT_READABLE_WORLDACCEL

#ifdef OUTPUT_READABLE_YAWPITCHROLL
float ypr[3];           // [yaw, pitch, roll]   yaw/pitch/roll container and gravity vector
#endif

#define INTERRUPT_PIN 15 // use pin 15 on ESP8266

const char DEVICE_NAME[] = "mpu6050";

const char* ssid = "skmecs-rede2"; // VARIÁVEL QUE ARMAZENA O NOME DA REDE SEM FIO
const char* password = "12345678"; // 24378Skmecs VARIÁVEL QUE ARMAZENA A SENHA DA REDE SEM FIO

WiFiUDP Udp;

// MUDE AQUI MUDE AQUI MUDE AQUI MUDE AQUI MUDE AQUI MUDE
//     AQUI MUDE AQUI MUDE AQUI MUDE AQUI MUDE AQUI MU
//          DE AQUI MUDE AQUI MUDE AQUI MUDE AQUI MU
//              DE AQUI MUDE AQUI MUDE AQUI MUDE A
//                  QUI MUDE AQUI MUDE AQUI MUD
//                      E AQUI MUDE AQUI MUD
//                           E AQUI MUDE
//                                AQUI
//                                 V

const IPAddress outIp(192, 168, 0, 101);  // ENDERECO IP DO COMPUTADOR

/////////////////////////////////////////////////////////////////////

const unsigned int outPort = 57120;         // remote port to receive OSC

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////


const unsigned int localPort = 8888;      // local port to listen for OSC packets (actually not used for sending)

//DEFINIÇÃO DE IP FIXO PARA O NODEMCU
IPAddress ip(192,168,0,8); //COLOQUE UMA FAIXA DE IP DISPONÍVEL DO SEU ROTEADOR. EX: 192.168.1.110 **** ISSO VARIA, NO MEU CASO É: 192.168.0.175
IPAddress gateway(192,168,0,1); //GATEWAY DE CONEXÃO (ALTERE PARA O GATEWAY DO SEU ROTEADOR)
IPAddress subnet(255,255,255,0); //MASCARA DE REDE
WiFiServer server(80); //CASO OCORRA PROBLEMAS COM A PORTA 80, UTILIZE OUTRA (EX:8082,8089) E A CHAMADA DA URL FIC


// ================================================================
// ===               INTERRUPT DETECTION ROUTINE                ===
// ================================================================

volatile bool mpuInterrupt = false;     // indicates whether MPU interrupt pin has gone high
void dmpDataReady() {
  mpuInterrupt = true;
}

void mpu_setup()
{
  
  Wire.begin(2, 0);
  Wire.setClock(400000); // 400kHz I2C clock. Comment this line if having compilation difficulties

  // initialize device
  Serial.println(F("Initializing I2C devices..."));
  mpu.initialize();
  pinMode(INTERRUPT_PIN, INPUT);

  // verify connection
  Serial.println(F("Testing device connections..."));
  Serial.println(mpu.testConnection() ? F("MPU6050 connection successful") : F("MPU6050 connection failed"));

  // load and configure the DMP
  Serial.println(F("Initializing DMP..."));
  devStatus = mpu.dmpInitialize();

  // make sure it worked (returns 0 if so)
  if (devStatus == 0) {
    // turn on the DMP, now that it's ready
    Serial.println(F("Enabling DMP..."));
    mpu.setDMPEnabled(true);

    // enable Arduino interrupt detection
    Serial.println(F("Enabling interrupt detection (Arduino external interrupt 0)..."));

    attachInterrupt(digitalPinToInterrupt(INTERRUPT_PIN), dmpDataReady, RISING);
    mpuIntStatus = mpu.getIntStatus();

    // set our DMP Ready flag so the main loop() function knows it's okay to use it
    Serial.println(F("DMP ready! Waiting for first interrupt..."));
    dmpReady = true;

    // get expected DMP packet size for later comparison
    packetSize = mpu.dmpGetFIFOPacketSize();
  } else {
    // ERROR!
    // 1 = initial memory load failed
    // 2 = DMP configuration updates failed
    // (if it's going to break, usually the code will be 1)
    Serial.print(F("DMP Initialization failed (code "));
    Serial.print(devStatus);
    Serial.println(F(")"));
  }
}

void setup(void)
{
  Serial.begin(115200);

  // Connect to WiFi network
  WiFi.mode(WIFI_STA);
  WiFi.hostname("esposc");
  Serial.println();
  Serial.println();
  Serial.print("Connecting to ");
  Serial.println(ssid);
  WiFi.begin(ssid, password);

  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }

  //Udp.begin(localPort);
  //Serial.print("Local port: ");
  //Serial.println(Udp.localPort());

  Serial.print(F("WiFi connected! IP address: "));
  Serial.println(WiFi.localIP());

  mpu_setup();

  strip.begin();
}

void neopx_loop()
{
  int r = int( (ypr[2] * 180 / M_PI) + 180);

  triangulo(   coresB[0][0], coresB[1][0], coresB[2][0],
               coresB[0][1], coresB[1][1], coresB[2][1],
               coresB[0][2], coresB[1][2], coresB[2][2],
               r);
  //serial.println(r);
  //pixelHue = map (r, -180, 180, 0, 65535);
  int cor = strip.Color(r, g, b);

  for (int i = 0; i < 12 ; i++) {
    strip.setPixelColor(i  , cor);
    // strip.setPixelColor(i, strip.gamma32(strip.ColorHSV(pixelHue)));
  }
  strip.show();
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
  r =  int(map(t, 0, 1, r0, r1));
  g =  int(map(t, 0, 1, g0, g1));
  b =  int(map(t, 0, 1, b0, b1));
}

void mpu_loop()
{
  // if programming failed, don't try to do anything
  if (!dmpReady) return;

  // wait for MPU interrupt or extra packet(s) available
  if (!mpuInterrupt && fifoCount < packetSize) return;

  // reset interrupt flag and get INT_STATUS byte
  mpuInterrupt = false;
  mpuIntStatus = mpu.getIntStatus();

  // get current FIFO count
  fifoCount = mpu.getFIFOCount();

  // check for overflow (this should never happen unless our code is too inefficient)
  if ((mpuIntStatus & 0x10) || fifoCount == 1024) {
    // reset so we can continue cleanly
    mpu.resetFIFO();
    Serial.println(F("FIFO overflow!"));

    // otherwise, check for DMP data ready interrupt (this should happen frequently)
  } else if (mpuIntStatus & 0x02) {
    // wait for correct available data length, should be a VERY short wait
    while (fifoCount < packetSize) fifoCount = mpu.getFIFOCount();

    // read a packet from FIFO
    mpu.getFIFOBytes(fifoBuffer, packetSize);

    // track FIFO count here in case there is > 1 packet available
    // (this lets us immediately read more without waiting for an interrupt)
    fifoCount -= packetSize;

    // display Euler angles in degrees (???)
    mpu.dmpGetQuaternion(&q, fifoBuffer);
    mpu.dmpGetGravity(&gravity, &q);
    mpu.dmpGetYawPitchRoll(ypr, &q, &gravity);
    
    OSCMessage msg("/verdefa1");
    msg.add(ypr[0] * 180 / M_PI);
    msg.add(ypr[1] * 180 / M_PI);
    msg.add(ypr[2] * 180 / M_PI);
     
    // display initial world-frame acceleration, adjusted to remove gravity
    // and rotated based on known orientation from quaternion
    mpu.dmpGetQuaternion(&q, fifoBuffer);
    mpu.dmpGetAccel(&aa, fifoBuffer);
    mpu.dmpGetGravity(&gravity, &q);
    mpu.dmpGetLinearAccel(&aaReal, &aa, &gravity);
    mpu.dmpGetLinearAccelInWorld(&aaWorld, &aaReal, &q);

    //OSCMessage accel("/lilassi/accel");
    msg.add(aaWorld.x);
    msg.add(aaWorld.y);
    msg.add(aaWorld.z);

    Udp.beginPacket(outIp, outPort);
    msg.send(Udp);
    Udp.endPacket();
    // Udp.beginPacket(outIp, outPort);
    // accel.send(Udp);
    //Udp.endPacket();
    msg.empty();
  }
}

/**************************************************************************/
/*
    Arduino loop function, called once 'setup' is complete (your own code
    should go here)
*/
/**************************************************************************/
void loop(void)
{
  if (WiFi.status() != WL_CONNECTED) {
    Serial.println();
    Serial.println("*** Disconnected from AP so rebooting ***");
    Serial.println();
    ESP.reset();
  }

  mpu_loop();

  neopx_loop();
  /*
   * OSCMessage msg("/imu");
    msg.add(0);

    Udp.beginPacket(outIp, outPort);
    msg.send(Udp);
    Udp.endPacket();

    msg.empty();
    delay(500);
    Serial.println("asdfasf");
   */
}
