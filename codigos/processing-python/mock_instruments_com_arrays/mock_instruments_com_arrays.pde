// TECLAS 0 1 2 3 4 5 ou ESPAÇO 

import oscP5.*;
import netP5.*;
import java.io.FileReader;

OscP5 oscP5;
NetAddress myRemoteLocation;
int instrumento_override = -1;
String files[] = {"do.csv", "re.csv", "mi.csv", "fa.csv", "sol.csv", "si.csv"};
BufferedReader readers[] = new BufferedReader[files.length];

void setup() {
  for (int i=0; i < files.length; i++) {
    readers[i] = createReader(files[i]);
  }
  //reader0 = createReader("mi.csv") 
  //reader1 = createReader("re.csv")   
  /* start oscP5, listening for incoming messages at port 12000 */
  oscP5 = new OscP5(this, 12000);
  myRemoteLocation = new NetAddress("127.0.0.1", 12000); // 192.168.1.31 // 127.0.0.1
  // reduce rate
  frameRate(20);  // IMPORTANTE!
}

void draw() {
  background(0);
  //tryReader(reader0);
  //tryReader(reader1);
  for (int i=0; i < readers.length; i++) {
    tryReader(readers[i]);
  }
}

void tryReader(BufferedReader reader) {  
  String line = null;
  try {
    if ((line = reader.readLine()) != null) {
      String[] pieces = split(line, ",");
      if (pieces.length == 5) {
        String device = pieces[0];
        int ins;
        if (instrumento_override < 0)  ins = int(pieces[1]);
        else ins = instrumento_override;
        int tom = int(pieces[2]);
        int amp = int(pieces[3]);
        int cor = int(pieces[4]);
        sendOsc(device, ins, tom, amp, cor);
        println(device, ins, tom, amp, cor);
      } else println("zoado: ", pieces);
    }
  } 
  catch (IOException e) {
    e.printStackTrace();
  }
}

void stop() {
  try {
    for (int i=0; i < readers.length; i++) {
      readers[i].close();
    }
  } 
  catch (IOException e) {
    e.printStackTrace();
  }
}

void sendOsc(String device, int ins, int tom, int amp, int cor) {
  /* in the following different ways of creating osc messages are shown by example */
  OscMessage myMessage = new OscMessage("/"+device);
  myMessage.add(ins); //ins 0 to 5
  myMessage.add(tom); //tom -24 to 24
  myMessage.add(amp); //amp ?
  myMessage.add(cor); //cor 0 to 360
  // Manda!
  oscP5.send(myMessage, myRemoteLocation);
}

void keyPressed() {
  if (key == '0')  instrumento_override = 0;
  if (key == '1')  instrumento_override = 1;
  if (key == '2')  instrumento_override = 2;
  if (key == '3')  instrumento_override = 3;
  if (key == '4')  instrumento_override = 4;
  if (key == '5')  instrumento_override = 5;
  if (key == ' ')  instrumento_override = -1;
}
