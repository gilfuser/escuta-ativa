// OPEN IN A NEW SUPERCOLLIDER INSTANCE

q = q ? ();
q.laranjare = q.laranjare ? ();

q.laranjare.dataLog = CSVFilePlayer( "/home/skmecs/re_2019_12_04-15_09_31.csv", true, true);

/*
"wc -l /home/skmecs/re_2019_12_04-15_09_31.csv".unixCmd; // get lineNum
q.laranjare.dataLog.readAtLineInterpret(20).size == 6;
*/

q.net = NetAddr("127.0.0.1", 57120);

q.lineNum = 9813;
q.localnet = NetAddr.localAddr;

(
Tdef(\laranjareToca, {
	loop{
		(q.lineNum -1).do{ |i|
			q.net.sendMsg(\laranjare, *(q.laranjare.dataLog.readAtLineInterpret(i % q.lineNum)) );
			25.reciprocal.wait;
		};
		q.laranjare.dataLog.reset;
		"volta ao comeco".postln;
	}
})
);
Tdef(\laranjareToca).gui(1);

NetAddr.localAddr;
/*
// if you need to open a port manually
// thisProcess.openUDPPort(12345);
// test stuff locally
57125
n.port
g.device.updateSrcAddr(n.hostname, n.port);
n.sendMsg('/lilassi', *[0, 0, 0, -16000, 0, 16000 ]);
*/