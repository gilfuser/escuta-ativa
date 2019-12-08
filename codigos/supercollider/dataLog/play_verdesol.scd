// OPEN IN A NEW SUPERCOLLIDER INSTANCE

q = q ? ();
q.verdesol = q.verdesol ? ();
q.verdesol.dataLog = CSVFilePlayer( "/home/skmecs/sol_2019_12_04-15_09_31.csv", true, true);

/*
"wc -l /home/skmecs/si_2019_12_04-14_42_08.csv".unixCmd; // get lineNum
q.verdefa1.dataLog.readAtLineInterpret(20).size == 6;
*/

q.net = NetAddr("127.0.0.1", 57120);
q.lineNum = 9813;
q.localnet = NetAddr.localAddr;

(
Tdef(\verdesolToca, {
	loop{
		(q.lineNum -1).do{ |i|
			q.net.sendMsg(\verdesol, *(q.verdesol.dataLog.readAtLineInterpret(i % q.lineNum)) );
			25.reciprocal.wait;
		};
		q.verdesol.dataLog.reset;
		"volta ao comeco".postln;
	}
})
);
Tdef(\verdesolToca).gui(1);

/*
// if you need to open a port manually
// thisProcess.openUDPPort(12345);
// test stuff locally
n =
NetAddr.localAddr; // 57122
n.port
g.device.updateSrcAddr(n.hostname, n.port);
n.sendMsg('/lilassi', *[0, 0, 0, -16000, 0, 16000 ]);
*/