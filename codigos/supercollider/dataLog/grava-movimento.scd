
q.lilassi.data = [];
q.vermelhodo1.data = [];
q.vermelhodo2.data = [];
q.laranjare.data = [];
q.amarelomi.data = [];
q.verdefa1.data = [];
q.verdefa2.data = [];
q.verdesol.data = [];
/*

q.vermelhodo1.mktl.collectivesDict[\vermelhodo1].value*/


(
f = { |msg, time, addr|
    if(
		(addr.ip != "127.0.0.1")
	) {
        "time: % sender: %\nmessage: %\n".postf(time, addr, msg);
    }
};
thisProcess.addOSCRecvFunc(f);
);

// stop posting.
thisProcess.removeOSCRecvFunc(f);

fork{

	(
		OSCdef( \do1, { | msg |
			q.vermelhodo1.data = msg;
			MFdef(\do1).value(msg);
		}, \vermelhodo1 );
	);
	MFdef(\do1).add(\post, { |data| data.postln });
	MFdef(\do1).disable(\post);
	(
		OSCdef( \re, { | msg |
			q.laranjare.data = msg;
			MFdef(\re).value(msg);
		}, \laranjare );
	);
	MFdef(\re).add(\post, { |data| data.postln });
	MFdef(\re).disable(\post);

	(
		OSCdef( \fa1, { | msg |
			q.verdefa1.data = msg;
			MFdef(\fa1).value(msg);
		},\verdefa1 );
	);
	MFdef(\fa1).add(\post, { |data| data.postln });
	MFdef(\fa1).disable(\post);

	(
		OSCdef( \si, { | msg |
			q.lilassi.data = msg;
			MFdef(\si).value(msg);
		}, \lilassi );
	);
	MFdef(\si).add(\post, { |data| data.postln });
	MFdef(\si).disable(\post);

	(
		OSCdef( \sol, { | msg |
			q.verdesol.data = msg;
			MFdef(\sol).value(msg);
		},\verdesol );
	);
	MFdef(\sol).add(\post, { |data| data.postln });
	MFdef(\sol).disable(\post);

// s.record;

// {
// 	(2 * 60).wait;
// 	"recording data is done".postln;
// }.fork;

Tdef(\grava, {
		q.lilassi.dataFile = CSVFileWriter( "si_%.csv".format(Date.getDate.format("%Y_%m_%d-%H_%M_%S")), "w", stamp: false);
		q.vermelhodo1.dataFile = CSVFileWriter( "do1_%.csv".format(Date.getDate.format("%Y_%m_%d-%H_%M_%S")), "w", stamp: false);
	// q.vermelhodo2.dataFile = CSVFileWriter( "do1_dataLog_%.csv".format(Date.getDate.format("%Y_%m_%d-%H_%M_%S")), "w", stamp: false);
		q.laranjare.dataFile = CSVFileWriter( "re_%.csv".format(Date.getDate.format("%Y_%m_%d-%H_%M_%S")), "w", stamp: false);
		// q.amarelomi.dataFile = CSVFileWriter( "mi_%.csv".format(Date.getDate.format("%Y_%m_%d-%H_%M_%S")), "w", stamp: false);
		q.verdefa1.dataFile = CSVFileWriter( "fa1_%.csv".format(Date.getDate.format("%Y_%m_%d-%H_%M_%S")), "w", stamp: false);
		q.verdesol.dataFile =CSVFileWriter("sol_%.csv".format(Date.getDate.format("%Y_%m_%d-%H_%M_%S")), "w", stamp: false);
	0.2.wait;
	60000.do{ // 40 minutos
			q.lilassi.dataFile.writeLine( q.lilassi.data );
			q.vermelhodo1.dataFile.writeLine(q.vermelhodo1.data);
		// q.vermelhodo2.dataFile.writeLine( q.do1.data );
			q.laranjare.dataFile.writeLine( q.laranjare.data );
		// q.amarelomi.dataFile.writeLine( q.amarelomi.data );
		q.verdefa1.dataFile.writeLine( q.verdefa1.data );
			q.verdesol.dataFile.writeLine( q.verdesol.data );
		25.reciprocal.wait; // 25 vezes por segundo
	};
	"recording data is done".postln;
	// s.stopRecording
});

Tdef(\grava).gui;