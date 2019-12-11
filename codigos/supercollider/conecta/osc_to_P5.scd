// OSCdef(\verdefa1).clear;
//

q.vermelhodo.data = q.vermelhodo.data ? [];
// q.vermelhodo2.data = q.vermelhodo2.data ? [];
q.laranjare.data = q.laranjare.data ? [];
q.amarelomi.data = q.amarelomi.data ? [];
q.verdefa.data = q.verdefa.data ? [];
// q.verdefa2.data = q.verdefa2.data ? [];
q.verdesol.data = q.verdesol.data ? [];
q.lilassi.data = q.lilassi.data ? [];
(
OSCdef(\do1_to_P5, { |msg|
	var ins = 0;
	var tom = (q.vermelhodo.mktl.elAt(\gyro, \yaw).value * 8 * 3 - 11 ).asInteger;
	var amp = ( msg[3] * 10000 + 10 ).asInteger;
	var cor = (q.vermelhodo.mktl.elAt(\gyro, \roll).value * 360).asInteger;
	// var data = msg[3..];
	q.net.sendMsg( \vermelhodo1, ins, tom, amp, cor );
	q.vermelhodo.data = [ \vermelhodo1, ins, tom, amp, cor ];
}, '/analysisdo');
);
(
OSCdef(\do2_to_P5, { |msg|
	var ins = 0;
	var tom = (q.vermelhodo2.mktl.elAt(\gyro, \yaw).value * 8 * 3 - 11 ).asInteger;
	var amp = ( msg[3] * 10000 + 10 ).asInteger;
	var cor = (q.vermelhodo2.mktl.elAt(\gyro, \roll).value * 360).asInteger;
	// var data = msg[3..];
	q.net.sendMsg( \vermelhodo2, ins, tom, amp, cor );
	q.vermelhodo2.data = [ \vermelhodo2, ins, tom, amp, cor ];
}, '/analysisdo2');
);

OSCdef(\re_to_P5, { |msg|
	var ins = 0;
	var tom = (q.laranjare.mktl.elAt(\gyro, \yaw).value * 8 * 3 - 11 - 7 ).asInteger;
	var amp = ( msg[3] * 10000 + 10 ).asInteger;
	var cor = (q.laranjare.mktl.elAt(\gyro, \roll).value * 360).asInteger;
	// var data = msg[3..];
	q.net.sendMsg( \laranjare, ins, tom, amp, cor );
	q.laranjare.data = [ \laranjare, ins, tom, amp, cor ];
}, '/analysisre');

OSCdef(\mi_to_P5, { |msg|
	var ins = 0;
	var tom = (q.amarelomi.mktl.elAt(\gyro, \yaw).value * 8 * 3 - 11 ).asInteger;
	var amp = ( msg[3] * 10000 + 10 ).asInteger;
	var cor = (q.amarelomi.mktl.elAt(\gyro, \roll).value * 360).asInteger;
	// var data = msg[3..];
	q.net.sendMsg( \amarelomi, ins, tom, amp, cor );
	q.amarelomi.data = [ \amarelomi, ins, tom, amp, cor ];
}, '/analysismi');

OSCdef(\fa1_to_P5, { |msg|
	var ins = 0;
	var tom = (q.verdefa1.mktl.elAt(\gyro, \yaw).value * 8 * 3 - 11 ).asInteger;
	var amp = ( msg[3] * 10000 + 10 ).asInteger;
	var cor = (q.verdefa1.mktl.elAt(\gyro, \roll).value * 360).asInteger;
	// var data = msg[3..];
	q.net.sendMsg( \verdefa1, ins, tom, amp, cor );
	q.verdefa1.data = [ \verdefa1, ins, tom, amp, cor ];
}, '/analysisfa1');

OSCdef(\fa2_to_P5, { |msg|
	var ins = 0;
	var tom = (q.verdefa2.mktl.elAt(\gyro, \yaw).value * 8 * 3 - 11 ).asInteger;
	var amp = ( msg[3] * 10000 + 10 ).asInteger;
	var cor = (q.verdefa2.mktl.elAt(\gyro, \roll).value * 360).asInteger;
	// var data = msg[3..];
	q.net.sendMsg( \verdefa2, ins, tom, amp, cor );
	q.verdefa2.data = [ \verdefa2, ins, tom, amp, cor ];
}, '/analysisfa2');

OSCdef(\sol_to_P5, { |msg|
	var ins = 0;
	var tom = (q.verdesol.mktl.elAt(\gyro, \yaw).value * 8 * 3 - 11 ).asInteger;
	var amp = ( msg[3] * 10000 + 10 ).asInteger;
	var cor = (q.verdesol.mktl.elAt(\gyro, \roll).value * 360).asInteger;
	// var data = msg[3..];
	q.net.sendMsg( \verdesol, ins, tom, amp, cor );
	q.verdesol.data = [ \verdesol, ins, tom, amp, cor ];
}, '/analysissol');

OSCdef(\si_to_P5, { |msg|
	var ins = 0;
	var tom = (q.lilassi.mktl.elAt(\gyro, \yaw).value * 8 * 3 - 11 ).asInteger;
	var amp = ( msg[3] * 10000 + 10 ).asInteger;
	var cor = (q.lilassi.mktl.elAt(\gyro, \roll).value * 360).asInteger;
	// var data = msg[3..];
	q.net.sendMsg( \lilassi, ins, tom, amp, cor );
	q.lilassi.data = [ \lilassi, ins, tom, amp, cor ];
}, '/analysissi');

/*OSCdef(\listener, { |msg|
var data = msg[3..];
// data.postln;

/*if ( (data[0] >= 0.05 ) and: ( lastFreq != data[1].asInteger ) and: ( data[2] >= 0.9 ))
{
/*"amp: % freq: % hasFreq: % ".format(
data[0].round(0.001), data[1].round(4).asInteger, data[2].round(0.001)
).postln;*/
*/
lastFreq = data[1].round(4).asInteger;
amp = ( data[0] * 10000 ).asInteger;
q.net.sendMsg( \amarelosi, amp, true );
q.net.sendMsg( \verdesoltom, lastFreq, true );
// q.net.sendMsg( \verdesolins, lastFreq, true );

/*lastFreq.postln;
amp.postln;*/
/*hasFreq = true;
"poing".postln;
};*/

/*if ( data[2] < 0.9 and: hasFreq == true )
{
lastFreq = data[1].round(4).asInteger;
q.net.sendMsg( \freq, lastFreq, false );
hasFreq = false;
// "nao tem frequencia definida".postln;
};*/

}, '/amarelosi');*/

/*OSCdef(\yawHue, { |msg|
var data = msg[3..];
if ( lastHue != data[0].asInteger )
{
lastHue = data[0].asInteger;
q.net.sendMsg( \hue, lastHue );
};
}, '/yawHue');*/


/*
OSCdef(\listener).free;
OSCdef.freeAll
*/
