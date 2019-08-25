/**************** OSC IN ********************/

// Comunica com OSC vindo do sketch espData.ino, do Arduino
// "\espInit" e "\espData" têm que coincidir com
// o que está definido no arquivo do arduino

// inicia a comunicacao. Acontece uma única vez:
OSCdef(\init, {|msg| msg.postln}, \espInit);

// "ouve" os dados recebidos do sensor via Arduino continuamente:
OSCdef(\accel, { |msg| MFdef(\accel).value(msg) }, \espData );
/*
OSCdef(\accel).free;
*/

// ver o fluxo de dados recebidos na Post Window
MFdef(\accel).add(\post, {|msg| msg.postln});

// desliga e religa
/*
MFdef(\accel).disable(\post);
MFdef(\accel).enable(\post);
*/

/************** OSC OUT ********************/

n = NetAddr("192.168.0.18", 12000); // IP e Port do Processing
MFdef(\accel).add(\send, {|msg| n.sendMsg(\test, msg[1], msg[2], msg[3])});
/*
MFdef(\accel).disable(\send);
MFdef(\accel).enable(\send);
n.disconnect;
*/